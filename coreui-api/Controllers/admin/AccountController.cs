using CoreuiApi.Lib;              
using CoreuiApi.Models;  
using System;                      
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using System.Web.Http;
using CoreuiApi.Security;
using CoreuiApi.Filters;
using System.Web.Http.Cors;
using System.IdentityModel.Tokens.Jwt;
using Newtonsoft.Json;

namespace CoreuiApi.Controllers
{
    [System.Web.Http.RoutePrefix("api/v1/accounts")]
    [HandleError]
    public class AccountController : ApiController
    {     
        // POST: /Account/Login
        [System.Web.Http.HttpPost]
        [System.Web.Http.AllowAnonymous]
        [System.Web.Http.Route("")]
        public IHttpActionResult Login(LoginViewModel model)
        {
            try
            {
                if (!ModelState.IsValid) return Ok(new { success = false, token = new TokenModel { }, message = "Thông tin không hợp lệ" });
                
                var identity = PTIdentity.GetPTIdentity(model.UserName, model.Password);
                switch (PTIdentity.Status)
                {
                    case LoginStatus.Success:
                        {
                            if (identity.Roles != null)
                                foreach (var info in identity.Roles) model.Roles += info + ",";
                            else if (string.IsNullOrEmpty(model.Roles)) model.Roles = ",";
                            FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(
                                                    1,
                                                    model.UserName,
                                                    DateTime.Now,
                                                    DateTime.Now.AddHours(FormsAuthentication.Timeout.Minutes),
                                                    model.RememberMe,
                                                    model.Roles,
                                                    FormsAuthentication.FormsCookiePath);

                            string encryptedTicket = FormsAuthentication.Encrypt(ticket);
                            MemoryCacher.Add(model.UserName, encryptedTicket, DateTime.Now.AddDays(1));
                            //Response.Cookies.Add(new HttpCookie(FormsAuthentication.FormsCookieName, encryptedTicket));                            
                            var token = new TokenModel
                            {
                                Token = JwtManager.GenerateToken(model.UserName, 60),
                                Expiration = DateTime.UtcNow.AddMinutes(60)
                            };
                            if (model.ReturnUrl.Length > 1 && model.ReturnUrl.StartsWith("/")
                                        && !model.ReturnUrl.StartsWith("//") && !model.ReturnUrl.StartsWith("/\\"))
                                return Json(new { success = true, token = token, message = "" });
                            else
                                return Json(new { success = true, token = token, message = "" });
                        }
                    case LoginStatus.IsNotApproved:
                        return Json(new { success = false, token = new TokenModel { }, message = "Tài khoản chưa được xác nhận." });
                    case LoginStatus.LockedOut:
                        return Json(new { success = false, token = new TokenModel { }, message = "Tài khoản đã bị khóa." });
                    case LoginStatus.RequiresVerification:
                        return Json(new { success = false, token = new TokenModel { }, message = "Tài khoản chưa kích hoạt tài khoản." });
                    case LoginStatus.Failure:
                    default:
                        return Json(new { success = false, token = new TokenModel { }, message = "Tên đăng nhập hoặc mật khẩu không đúng." });
                }
            }
            catch (Exception ex)
            {
                return Json(new { success = false, token = new TokenModel { }, message = ex.Message });
            }
        }

        [System.Web.Http.AllowAnonymous]
        [System.Web.Http.HttpGet]
        [System.Web.Http.Route("logout")]
        public IHttpActionResult LogOff()
        {
            var re = Request;
            var authorization = re.Headers.Authorization;
            if (authorization != null && authorization.Scheme == "Bearer")
            {
                if (string.IsNullOrEmpty(authorization.Parameter))
                {

                } else
                {
                    var token = new JwtSecurityToken(jwtEncodedString: authorization.Parameter);
                    foreach (var item in token.Claims)
                    {
                        if (item.Type == "unique_name")
                        {
                            MemoryCacher.Delete(item.Value);
                            break;
                        }
                    }
                }                
            }            
            FormsAuthentication.SignOut();            
            return Ok(new { success = true, message = "Đăng xuất thành công!" });
        }
    }
}
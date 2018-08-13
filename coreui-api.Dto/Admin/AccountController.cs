using Consultation.Bus;
using Consultation.Utilities;
using Consultation.Web.Models;
using Consultation.Web.Security;
using Csla;
using Microsoft.AspNet.Identity;
using Microsoft.Owin.Security;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Security.Principal;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace Consultation.Web.Controllers
{
    [HandleError]
    public class AccountController : Controller
    {
        //
        // GET: /Account/Login
        [HttpGet]
        public ActionResult Login(string returnUrl)
        {
            var model = new LoginViewModel();
            model.ReturnUrl = returnUrl;
            return View(model);
        }

        //
        // POST: /Account/Login
        [HttpPost]   
        public JsonResult Login(LoginViewModel model)
        {
            try
            {
                if (!ModelState.IsValid) return Json(new { success = false });
                
                var identity = PTIdentity.GetPTIdentity(model.UserName, model.Password);
                switch (PTIdentity.Status)
                {
                    case LoginStatus.Success:
                        {
                            if (!string.IsNullOrEmpty(PTIdentity.PatientCode)) model.Roles = Consultation.Utilities.Constants.B_Patient_Get + ",";
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
                            Response.Cookies.Add(new HttpCookie(FormsAuthentication.FormsCookieName, encryptedTicket));
                            //if(!string.IsNullOrEmpty(PTIdentity.PatientCode)) model.ReturnUrl = "/benh-nhan-xem/" + PTIdentity.PatientCode + ".html";
                            if (Url.IsLocalUrl(model.ReturnUrl) && model.ReturnUrl.Length > 1 && model.ReturnUrl.StartsWith("/")
                                        && !model.ReturnUrl.StartsWith("//") && !model.ReturnUrl.StartsWith("/\\"))
                            {
                                return Json(new { success = true, url = model.ReturnUrl });
                            }
                            else return Json(new { success = true, url = string.Empty });
                        }
                    case LoginStatus.LockedOut:
                        return Json(new { success = false, messageError = "Tài khoản đã bị khóa." });
                    case LoginStatus.RequiresVerification:
                        return Json(new { success = false, messageError = "Tài khoản chưa kích hoạt tài khoản." });
                    case LoginStatus.Failure:
                    default:
                        return Json(new { success = false, messageError = "Tên đăng nhập hoặc mật khẩu không đúng." });
                }
            }
            catch (Exception ex)
            {
                ViewBag.StatusMessage = ex.Message;                
                return Json(new { success = false, error = ex.Message });
            }
        }

        public ActionResult LogOff()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Login", "Account", new { returnUrl = string.Empty });
        }
    }
}
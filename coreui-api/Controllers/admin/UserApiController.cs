using CoreuiApi.Filters;
using CoreuiApi.Lib;
using CoreuiApi.Models;
using CoreuiApi.Security;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Results;
using System.Web.Mvc;
using System.Web.Security;

namespace CoreuiApi.Controllers
{
    [System.Web.Http.RoutePrefix("api/v1/users")]
    public class UserApiController : ApiController
    {
        [JwtAuthentication]
        [System.Web.Http.HttpGet]        
        [System.Web.Http.Route("")]
        public IHttpActionResult GetAll()
        {
            try
            {
                var user = new UserModel();
                var result = CoreuiApi.Lib.UserColl.GetUserColl();
                var users = new List<UserModel>();
                foreach (var item in result)
                {
                    users.Add(user.Map(item));
                }

                int totalPage = users.Count();
                return Ok(new
                {
                    users = users
                });
            }
            catch(Exception ex)
            {
                return Ok(new
                {
                    error = ex.Message,
                    users = ""
                });
            }            
        }

        [JwtAuthentication]
        [System.Web.Http.HttpGet]
        [System.Web.Http.Route("filter")]
        public IHttpActionResult GetPage([FromUri]int pageIndex, [FromUri]int pageSize, [FromUri]string fullname, 
            [FromUri]string user_name, [FromUri]string tel, [FromUri]string email)
        {
            try
            {
                var user = new UserModel();
                var result = CoreuiApi.Lib.UserColl.GetUserColl(pageIndex, pageSize, fullname, user_name, tel, email);
                var users = new List<UserModel>();
                foreach (var item in result)
                {
                    users.Add(user.Map(item));
                }

                int totalPage = users.Count();
                return Ok(new
                {
                    success = true,
                    totalSize = result.TotalRow,
                    page = pageIndex,
                    sizePerPage = pageSize,
                    users = users
                });
            }
            catch (Exception ex)
            {
                return Ok(new
                {
                    success = false,
                    error_code = "510", // error not defined
                    message_error = ex.Message
                });
            }
        }

        [JwtAuthentication]
        [System.Web.Http.HttpGet]
        [System.Web.Http.Route("{id:long}")]
        public IHttpActionResult Users(long id)
        {
            try
            {
                var user = new UserEditModel();
                var result = CoreuiApi.Lib.User.GetUser(id);
                user = user.Map(result);
                return Ok(new
                {
                    success = true,
                    user = user
                });
            }
            catch (Exception ex)
            {
                return Ok(new
                {
                    success = false,
                    error_code = "510", // error not defined
                    message_error = ex.Message
                });
            }
        }

        [JwtAuthentication]
        [System.Web.Http.HttpPost]
        [System.Web.Http.Route("")]
        public IHttpActionResult Users(UserEditModel userModel)
        {
            try
            {
                CoreuiApi.Lib.User user = CoreuiApi.Lib.User.NewUser();
                user.Id = userModel.Id;
                user.Fullname = userModel.Fullname;
                user.User_name = userModel.User_name;
                user.Password_question = userModel.Password_question;
                user.Password_answer = userModel.Password_answer;
                user.Tel = userModel.Tel;
                user.Email = userModel.Email;
                user.Birthday = userModel.Birthday;
                user.Is_approved = userModel.Is_approved;
                user.Is_lock = userModel.Is_lock;
                user.Last_username = Csla.ApplicationContext.User.Identity.Name;
                var temp = user.Clone();
                user = temp.Save();
                return Ok(new
                {
                    success = true,
                    user = userModel.Map(user)
                });
            }
            catch (Exception ex)
            {
                return Ok(new
                {
                    success = false,
                    error_code = "510", // error not defined
                    message_error = ex.Message
                });
            }
        }

        [JwtAuthentication]
        [System.Web.Http.HttpPut]
        [System.Web.Http.Route("{id:long}")]
        public IHttpActionResult UserEdit([FromBody]UserEditModel userModel)
        {
            try
            {
                if (userModel.Id == 0)
                    return Ok(new
                    {
                        success = false,
                        error_code = "410", // error not defined
                        message_error = "Dữ liệu không được tìm thấy"
                    });
                CoreuiApi.Lib.User user = CoreuiApi.Lib.User.GetUser(userModel.Id);                
                user.Fullname = userModel.Fullname;
                user.User_name = userModel.User_name;
                user.Password_question = userModel.Password_question;
                user.Password_answer = userModel.Password_answer;
                user.Tel = userModel.Tel;
                user.Email = userModel.Email;
                user.Birthday = userModel.Birthday;
                user.Is_approved = userModel.Is_approved;
                user.Is_lock = userModel.Is_lock;
                user.Last_username = Csla.ApplicationContext.User.Identity.Name;
                var temp = user.Clone();
                user = temp.Save();
                return Ok(new
                {
                    success = true,
                    user = userModel.Map(user)
                });
            }
            catch(Exception ex)
            {
                return Ok(new
                {
                    success = false, 
                    error_code = "510", // error not defined
                    message_error = ex.Message
                });
            }
        }

        [JwtAuthentication]
        [System.Web.Http.HttpDelete]
        [System.Web.Http.Route("{id:long}")]
        public IHttpActionResult UserDelete(long id)
        {
            try
            {
                CoreuiApi.Lib.User.DeleteUser(id);
                return Ok(new
                {
                    success = true
                });
            }
            catch (Exception ex)
            {
                return Ok(new
                {
                    success = false,
                    error_code = "510", // error not defined
                    message_error = ex.Message
                });
            }
        }
    }
}

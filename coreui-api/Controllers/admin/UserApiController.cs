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
                    error = ex.Message,
                    users = ""
                });
            }
        }

        [JwtAuthentication]
        [System.Web.Http.HttpGet]
        [System.Web.Http.Route("{id:long}")]
        public IHttpActionResult Users(long id)
        {
            var user = new UserEditModel();
            var result = CoreuiApi.Lib.User.GetUser(id);
            user = user.Map(result);
            return Ok(new
            {
                user = user
            });
        }

        [JwtAuthentication]
        [System.Web.Http.HttpPost]
        [System.Web.Http.Route("")]
        public IHttpActionResult Users(UserEditModel userModel)
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

        [JwtAuthentication]
        [System.Web.Http.HttpPut]
        [System.Web.Http.Route("{id:long}")]
        public IHttpActionResult UserEdit(UserEditModel userModel)
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

        [JwtAuthentication]
        [System.Web.Http.HttpDelete]
        [System.Web.Http.Route("{id:long}")]
        public IHttpActionResult UserDelete(long id)
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
    }
}

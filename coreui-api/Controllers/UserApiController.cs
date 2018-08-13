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
    public class UserApiController : ApiController
    {
        [JwtAuthentication]
        [System.Web.Http.HttpGet]        
        [System.Web.Http.Route("api/v1/users")]
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
        [System.Web.Http.Route("api/v1/users/{id:long}")]
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
        [System.Web.Http.Route("api/v1/users")]
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
        [System.Web.Http.Route("api/v1/users/{id:long}")]
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
        [System.Web.Http.Route("api/v1/users/{id:long}")]
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

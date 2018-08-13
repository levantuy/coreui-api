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
        [System.Web.Mvc.HttpGet]
        [Csla.Web.Mvc.HasPermission(Csla.Rules.AuthorizationActions.GetObject, typeof(UserColl))]
        public IHttpActionResult GetAll()
        {
            var a = Csla.ApplicationContext.User.Identity;

            FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(MemoryCacher.GetValue(Csla.ApplicationContext.User.Identity.Name).ToString());
            FormsIdentity id = new FormsIdentity(ticket);
            var principal = new CoreuiApi.Security.Principal(id.Name, id.Ticket.UserData);
            Csla.ApplicationContext.User = principal;

            var user = new UserModel();                
            var result = CoreuiApi.Lib.UserColl.GetUserColl();
            var users = new List<UserModel>();
            foreach(var item in result)
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
        [System.Web.Mvc.HttpGet]
        public IHttpActionResult Users(long id)
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
        [System.Web.Mvc.HttpPost]
        public IHttpActionResult Users(UserModel userModel)
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

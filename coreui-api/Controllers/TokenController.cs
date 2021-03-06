﻿using CoreuiApi.Models;
using System;
using System.Net;
using System.Web.Http;

namespace CoreuiApi
{
    public class TokenController : ApiController
    {
        // THis is naive endpoint for demo, it should use Basic authentication to provide token or POST request
        [AllowAnonymous]
        public IHttpActionResult Get(string username, string password)
        {
            if (CheckUser(username, password))
            {
                var token = new TokenModel
                {
                    Token = JwtManager.GenerateToken(username, 100),
                    Expiration = DateTime.UtcNow.AddMinutes(100)
                };

                return Ok(token);
            }

            throw new HttpResponseException(HttpStatusCode.Unauthorized);
        }

        public bool CheckUser(string username, string password)
        {            
            // should check in the database
            return true;
        }
    }
}

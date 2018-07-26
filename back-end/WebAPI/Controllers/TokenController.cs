﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Http;
using WebAPI.Common;

namespace WebAPI.Controllers
{
    public class TokenController : ApiController
    {
        // This is naive endpoint for demo, it should use Basic authentication to provide token or POST request
        [AllowAnonymous]
        public string Get(string username, string password)
        {
            if (CheckUser(username, password))
            {
                return JwtManager.GenerateToken(username);
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
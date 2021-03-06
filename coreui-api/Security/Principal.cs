﻿using Csla.Security;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Web;

namespace CoreuiApi.Security
{
    [Serializable]
    public class Principal : CslaPrincipal
    {
        private IIdentity identity;
        private string[] roles;

        internal Principal(string username, string roles)
        {
            if (!string.IsNullOrEmpty(roles))
            {
                var rolelist = roles.Split(',');
                this.roles = (from r in rolelist
                              select r.Trim()).ToArray();
            }

            identity = new GenericIdentity(username);
        }

        public override IIdentity Identity
        {
            get { return identity; }
        }

        public override bool IsInRole(string role)
        {
            return roles.Contains(role, StringComparer.InvariantCultureIgnoreCase);
        }
    }
}
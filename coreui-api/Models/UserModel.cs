using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CoreuiApi.Models
{
    public class UserModel
    {
        public long Id
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the Group Name.
        /// </summary>
        /// <value>The Group Name.</value>
        public string User_name
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the Description.
        /// </summary>
        /// <value>The Description.</value>
        public string Fullname
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the Parent Id.
        /// </summary>
        /// <value>The Parent Id.</value>
        public string Email
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the Parent Id.
        /// </summary>
        /// <value>The Parent Id.</value>
        public string Tel
        {
            get;
            set;
        }

        public UserModel Map(CoreuiApi.Lib.UserInfo info)
        {
            var model = new UserModel
            {
                Id = info.Id,
                Email = info.Email,
                Fullname = info.Fullname,
                Tel = info.Tel,
                User_name = User_name
            };

            return model;
        }
    }
}
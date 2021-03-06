﻿using CoreuiApi.Lib;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CoreuiApi.Models
{
    public class UserModel
    {
        public long Id { get; set; }

        /// <summary>
        /// Gets or sets the Group Name.
        /// </summary>
        /// <value>The Group Name.</value>
        public string User_name { get;set; }

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
        public bool Is_lock { get; set; }

        public List<string> Roles { get; set; }

        public UserModel Map(CoreuiApi.Lib.UserInfo info)
        {
            var model = new UserModel
            {
                Id = info.Id,
                Email = info.Email,
                Fullname = info.Fullname,
                Tel = info.Tel,
                User_name = info.User_name,
                Roles = null,
                Is_lock = info.Is_lock
            };

            return model;
        }
    }

    public class UserEditModel
    {
        /// <summary>
        /// Gets or sets the id.
        /// </summary>
        /// <value>The id.</value>
        public Int64 Id { get; set; }

        /// <summary>
        /// Gets or sets the user_name.
        /// </summary>
        /// <value>The user_name.</value>
        public string User_name { get; set; }

        /// <summary>
        /// Gets or sets the password.
        /// </summary>
        /// <value>The password.</value>
        public string Password { get; set; }

        /// <summary>
        /// Gets or sets the password_salt.
        /// </summary>
        /// <value>The password_salt.</value>
        public string Password_salt { get; set; }

        /// <summary>
        /// Gets or sets the password_question.
        /// </summary>
        /// <value>The password_question.</value>
        public string Password_question { get; set; }

        /// <summary>
        /// Gets or sets the password_answer.
        /// </summary>
        /// <value>The password_answer.</value>
        public string Password_answer { get; set; }

        /// <summary>
        /// Gets or sets the is_approved.
        /// </summary>
        /// <value><c>true</c> if is_approved; otherwise, <c>false</c>.</value>
        public bool Is_approved { get; set; }

        /// <summary>
        /// Gets or sets the fullname.
        /// </summary>
        /// <value>The fullname.</value>
        public string Fullname { get; set; }

        /// <summary>
        /// Gets or sets the email.
        /// </summary>
        /// <value>The email.</value>
        public string Email { get; set; }

        /// <summary>
        /// Gets or sets the tel.
        /// </summary>
        /// <value>The tel.</value>
        public string Tel { get; set; }

        /// <summary>
        /// Gets or sets the last_login_date.
        /// </summary>
        /// <value>The last_login_date.</value>
        public DateTime Last_login_date { get; set; }

        /// <summary>
        /// Gets or sets the last_password_changed_date.
        /// </summary>
        /// <value>The last_password_changed_date.</value>
        public DateTime Last_password_changed_date { get; set; }

        /// <summary>
        /// Gets or sets the last_lockout_date.
        /// </summary>
        /// <value>The last_lockout_date.</value>
        public DateTime Last_lockout_date { get; set; }

        /// <summary>
        /// Gets or sets the failed_password_attempt_count.
        /// </summary>
        /// <value>The failed_password_attempt_count.</value>
        public Int64 Failed_password_attempt_count { get; set; }

        /// <summary>
        /// Gets or sets the failed_password_attempt_window_start.
        /// </summary>
        /// <value>The failed_password_attempt_window_start.</value>
        public DateTime Failed_password_attempt_window_start { get; set; }

        /// <summary>
        /// Gets or sets the failed_password_answer_attempt_count.
        /// </summary>
        /// <value>The failed_password_answer_attempt_count.</value>
        public Int64 Failed_password_answer_attempt_count { get; set; }

        /// <summary>
        /// Gets or sets the failed_password_answer_attempt_window_start.
        /// </summary>
        /// <value>The failed_password_answer_attempt_window_start.</value>
        public DateTime Failed_password_answer_attempt_window_start { get; set; }

        /// <summary>
        /// Gets or sets the birthday.
        /// </summary>
        /// <value>The birthday.</value>
        public DateTime Birthday { get; set; }

        /// <summary>
        /// Gets or sets the address.
        /// </summary>
        /// <value>The address.</value>
        public string Address { get; set; }

        /// <summary>
        /// Gets or sets the website.
        /// </summary>
        /// <value>The website.</value>
        public string Website { get; set; }

        /// <summary>
        /// Gets or sets the avatar.
        /// </summary>
        /// <value>The avatar.</value>
        public string Avatar { get; set; }

        /// <summary>
        /// Gets or sets the is_lock.
        /// </summary>
        /// <value><c>true</c> if is_lock; otherwise, <c>false</c>.</value>
        public bool Is_lock { get; set; }

        /// <summary>
        /// Gets or sets the user_type.
        /// </summary>
        /// <value>The user_type.</value>
        public Int64? User_type { get; set; }

        /// <summary>
        /// Gets or sets the last_modified.
        /// </summary>
        /// <value>The last_modified.</value>
        public DateTime Last_modified { get; set; }

        /// <summary>
        /// Gets or sets the last_user_id.
        /// </summary>
        /// <value>The last_user_id.</value>
        public string Last_username { get; set; }
        public List<string> Roles { get; set; }
        public UserEditModel Map(User user)
        {
            return new UserEditModel
            {
                Address = user.Address,
                Roles = user.Roles,
                Avatar = user.Avatar,
                Birthday = user.Birthday,
                Email = user.Email,
                Failed_password_answer_attempt_count = user.Failed_password_answer_attempt_count,
                Failed_password_answer_attempt_window_start = user.Failed_password_answer_attempt_window_start,
                Failed_password_attempt_count = user.Failed_password_attempt_count,
                Failed_password_attempt_window_start = user.Failed_password_attempt_window_start,
                Fullname = user.Fullname,
                Id = user.Id,
                Is_approved = user.Is_approved,
                User_name = user.User_name,
                Is_lock = user.Is_lock,
                Last_lockout_date = user.Last_lockout_date,
                Last_login_date = user.Last_login_date,
                Last_modified = user.Last_modified,
                Last_password_changed_date = user.Last_password_changed_date,
                Last_username = user.Last_username,
                Password = user.Password,
                Password_answer = user.Password_answer,
                Password_question = user.Password_question,
                Password_salt = user.Password_salt,
                Tel = user.Tel,
                User_type = user.User_type,
                Website = user.Website
            };
        }
    }
}
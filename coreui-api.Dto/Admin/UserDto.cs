//  This file was generated by CSLA Object Generator - CslaGenFork v4.3.0
//
// Filename:    UserDto
// ObjectType:  DTO for User
// CSLAType:    EditableRoot

using System;
using System.Collections.Generic;
using Csla;

namespace CoreuiApi.Dto
{
    /// <summary>
    /// DTO for User type
    /// </summary>
    public partial class UserDto
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
        public SmartDate Last_login_date { get; set; }

        /// <summary>
        /// Gets or sets the last_password_changed_date.
        /// </summary>
        /// <value>The last_password_changed_date.</value>
        public SmartDate Last_password_changed_date { get; set; }

        /// <summary>
        /// Gets or sets the last_lockout_date.
        /// </summary>
        /// <value>The last_lockout_date.</value>
        public SmartDate Last_lockout_date { get; set; }

        /// <summary>
        /// Gets or sets the failed_password_attempt_count.
        /// </summary>
        /// <value>The failed_password_attempt_count.</value>
        public Int64 Failed_password_attempt_count { get; set; }

        /// <summary>
        /// Gets or sets the failed_password_attempt_window_start.
        /// </summary>
        /// <value>The failed_password_attempt_window_start.</value>
        public SmartDate Failed_password_attempt_window_start { get; set; }

        /// <summary>
        /// Gets or sets the failed_password_answer_attempt_count.
        /// </summary>
        /// <value>The failed_password_answer_attempt_count.</value>
        public Int64 Failed_password_answer_attempt_count { get; set; }

        /// <summary>
        /// Gets or sets the failed_password_answer_attempt_window_start.
        /// </summary>
        /// <value>The failed_password_answer_attempt_window_start.</value>
        public SmartDate Failed_password_answer_attempt_window_start { get; set; }

        /// <summary>
        /// Gets or sets the birthday.
        /// </summary>
        /// <value>The birthday.</value>
        public SmartDate Birthday { get; set; }

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
        public SmartDate Last_modified { get; set; }

        /// <summary>
        /// Gets or sets the last_user_id.
        /// </summary>
        /// <value>The last_user_id.</value>
        public string Last_username { get; set; }
        public List<string> Roles { get; set; }
    }
}

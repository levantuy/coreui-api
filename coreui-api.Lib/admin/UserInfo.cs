//  This file was generated by CSLA Object Generator - CslaGenFork v4.3.0
//
// Filename:    UserInfo
// ObjectType:  UserInfo
// CSLAType:    ReadOnlyObject

using System;
using Csla;
using CoreuiApi.Dto;

namespace CoreuiApi.Lib
{

    /// <summary>
    /// UserInfo (read only object).<br/>
    /// This is a generated base class of <see cref="UserInfo"/> business object.
    /// </summary>
    /// <remarks>
    /// This class is an item of <see cref="UserColl"/> collection.
    /// </remarks>
    [Serializable]
    public partial class UserInfo : ReadOnlyBase<UserInfo>
    {

        #region Business Properties

        /// <summary>
        /// Gets the id.
        /// </summary>
        /// <value>The id.</value>
        public Int64 Id { get; private set; }

        /// <summary>
        /// Gets the user_name.
        /// </summary>
        /// <value>The user_name.</value>
        public string User_name { get; private set; }

        /// <summary>
        /// Gets the password.
        /// </summary>
        /// <value>The password.</value>
        public string Password { get; private set; }

        /// <summary>
        /// Gets the password_salt.
        /// </summary>
        /// <value>The password_salt.</value>
        public string Password_salt { get; private set; }

        /// <summary>
        /// Gets the password_question.
        /// </summary>
        /// <value>The password_question.</value>
        public string Password_question { get; private set; }

        /// <summary>
        /// Gets the password_answer.
        /// </summary>
        /// <value>The password_answer.</value>
        public string Password_answer { get; private set; }

        /// <summary>
        /// Gets the is_approved.
        /// </summary>
        /// <value><c>true</c> if is_approved; otherwise, <c>false</c>.</value>
        public bool Is_approved { get; private set; }

        /// <summary>
        /// Gets the fullname.
        /// </summary>
        /// <value>The fullname.</value>
        public string Fullname { get; private set; }

        /// <summary>
        /// Gets the email.
        /// </summary>
        /// <value>The email.</value>
        public string Email { get; private set; }

        /// <summary>
        /// Gets the tel.
        /// </summary>
        /// <value>The tel.</value>
        public string Tel { get; private set; }

        /// <summary>
        /// Maintains metadata about <see cref="last_login_date"/> property.
        /// </summary>
        private static readonly PropertyInfo<SmartDate> Last_login_dateProperty = RegisterProperty<SmartDate>(p => p.Last_login_date, "last_login_date");
        /// <summary>
        /// Gets the last_login_date.
        /// </summary>
        /// <value>The last_login_date.</value>
        public string Last_login_date
        {
            get { return GetPropertyConvert<SmartDate, String>(Last_login_dateProperty); }
        }

        /// <summary>
        /// Maintains metadata about <see cref="last_password_changed_date"/> property.
        /// </summary>
        private static readonly PropertyInfo<SmartDate> Last_password_changed_dateProperty = RegisterProperty<SmartDate>(p => p.Last_password_changed_date, "last_password_changed_date");
        /// <summary>
        /// Gets the last_password_changed_date.
        /// </summary>
        /// <value>The last_password_changed_date.</value>
        public string Last_password_changed_date
        {
            get { return GetPropertyConvert<SmartDate, String>(Last_password_changed_dateProperty); }
        }

        /// <summary>
        /// Maintains metadata about <see cref="last_lockout_date"/> property.
        /// </summary>
        private static readonly PropertyInfo<SmartDate> Last_lockout_dateProperty = RegisterProperty<SmartDate>(p => p.Last_lockout_date, "last_lockout_date");
        /// <summary>
        /// Gets the last_lockout_date.
        /// </summary>
        /// <value>The last_lockout_date.</value>
        public string Last_lockout_date
        {
            get { return GetPropertyConvert<SmartDate, String>(Last_lockout_dateProperty); }
        }

        /// <summary>
        /// Gets the failed_password_attempt_count.
        /// </summary>
        /// <value>The failed_password_attempt_count.</value>
        public Int64 Failed_password_attempt_count { get; private set; }

        /// <summary>
        /// Maintains metadata about <see cref="failed_password_attempt_window_start"/> property.
        /// </summary>
        private static readonly PropertyInfo<SmartDate> Failed_password_attempt_window_startProperty = RegisterProperty<SmartDate>(p => p.Failed_password_attempt_window_start, "failed_password_attempt_window_start");
        /// <summary>
        /// Gets the failed_password_attempt_window_start.
        /// </summary>
        /// <value>The failed_password_attempt_window_start.</value>
        public string Failed_password_attempt_window_start
        {
            get { return GetPropertyConvert<SmartDate, String>(Failed_password_attempt_window_startProperty); }
        }

        /// <summary>
        /// Gets the failed_password_answer_attempt_count.
        /// </summary>
        /// <value>The failed_password_answer_attempt_count.</value>
        public Int64 Failed_password_answer_attempt_count { get; private set; }

        /// <summary>
        /// Maintains metadata about <see cref="failed_password_answer_attempt_window_start"/> property.
        /// </summary>
        private static readonly PropertyInfo<SmartDate> Failed_password_answer_attempt_window_startProperty = RegisterProperty<SmartDate>(p => p.Failed_password_answer_attempt_window_start, "failed_password_answer_attempt_window_start");
        /// <summary>
        /// Gets the failed_password_answer_attempt_window_start.
        /// </summary>
        /// <value>The failed_password_answer_attempt_window_start.</value>
        public string Failed_password_answer_attempt_window_start
        {
            get { return GetPropertyConvert<SmartDate, String>(Failed_password_answer_attempt_window_startProperty); }
        }

        /// <summary>
        /// Maintains metadata about <see cref="birthday"/> property.
        /// </summary>
        private static readonly PropertyInfo<SmartDate> BirthdayProperty = RegisterProperty<SmartDate>(p => p.Birthday, "birthday", null);
        /// <summary>
        /// Gets the birthday.
        /// </summary>
        /// <value>The birthday.</value>
        public string Birthday
        {
            get { return GetPropertyConvert<SmartDate, String>(BirthdayProperty); }
        }

        /// <summary>
        /// Gets the address.
        /// </summary>
        /// <value>The address.</value>
        public string Address { get; private set; }

        /// <summary>
        /// Gets the website.
        /// </summary>
        /// <value>The website.</value>
        public string Website { get; private set; }

        /// <summary>
        /// Gets the avatar.
        /// </summary>
        /// <value>The avatar.</value>
        public string Avatar { get; private set; }

        /// <summary>
        /// Gets the is_lock.
        /// </summary>
        /// <value><c>true</c> if is_lock; otherwise, <c>false</c>.</value>
        public bool Is_lock { get; private set; }

        /// <summary>
        /// Gets the user_type.
        /// </summary>
        /// <value>The user_type.</value>
        public Int64? User_type { get; private set; }

        /// <summary>
        /// Maintains metadata about <see cref="last_modified"/> property.
        /// </summary>
        private static readonly PropertyInfo<SmartDate> Last_modifiedProperty = RegisterProperty<SmartDate>(p => p.Last_modified, "last_modified");
        /// <summary>
        /// Gets the last_modified.
        /// </summary>
        /// <value>The last_modified.</value>
        public string Last_modified
        {
            get { return GetPropertyConvert<SmartDate, String>(Last_modifiedProperty); }
        }

        /// <summary>
        /// Gets the last_user_id.
        /// </summary>
        /// <value>The last_user_id.</value>
        public string Last_username { get; private set; }

        #endregion

        #region Factory Methods

        /// <summary>
        /// Factory method. Loads a <see cref="UserInfo"/> object from the given UserDto.
        /// </summary>
        /// <param name="data">The <see cref="UserDto"/>.</param>
        /// <returns>A reference to the fetched <see cref="UserInfo"/> object.</returns>
        internal static UserInfo GetUserInfo(UserDto data)
        {
            UserInfo obj = new UserInfo();
            obj.Fetch(data);
            return obj;
        }

        #endregion

        #region Constructor

        /// <summary>
        /// Initializes a new instance of the <see cref="UserInfo"/> class.
        /// </summary>
        /// <remarks> Do not use to create a Csla object. Use factory methods instead.</remarks>
        private UserInfo()
        {
            // Prevent direct creation
        }

        #endregion

        #region Data Access

        /// <summary>
        /// Loads a <see cref="UserInfo"/> object from the given <see cref="UserDto"/>.
        /// </summary>
        /// <param name="data">The UserDto to use.</param>
        private void Fetch(UserDto data)
        {
            // Value properties
            Id = data.Id;
            User_name = data.User_name;
            Password = data.Password;
            Password_salt = data.Password_salt;
            Password_question = data.Password_question;
            Password_answer = data.Password_answer;
            Is_approved = data.Is_approved;
            Fullname = data.Fullname;
            Email = data.Email;
            Tel = data.Tel;
            LoadProperty(Last_login_dateProperty, data.Last_login_date);
            LoadProperty(Last_password_changed_dateProperty, data.Last_password_changed_date);
            LoadProperty(Last_lockout_dateProperty, data.Last_lockout_date);
            Failed_password_attempt_count = data.Failed_password_attempt_count;
            LoadProperty(Failed_password_attempt_window_startProperty, data.Failed_password_attempt_window_start);
            Failed_password_answer_attempt_count = data.Failed_password_answer_attempt_count;
            LoadProperty(Failed_password_answer_attempt_window_startProperty, data.Failed_password_answer_attempt_window_start);
            LoadProperty(BirthdayProperty, data.Birthday);
            Address = data.Address;
            Website = data.Website;
            Avatar = data.Avatar;
            Is_lock = data.Is_lock;
            User_type = data.User_type;
            LoadProperty(Last_modifiedProperty, data.Last_modified);
            Last_username = data.Last_username;
            var args = new DataPortalHookArgs(data);
            OnFetchRead(args);
        }

        #endregion

        #region Pseudo Events

        /// <summary>
        /// Occurs after the low level fetch operation, before the data reader is destroyed.
        /// </summary>
        partial void OnFetchRead(DataPortalHookArgs args);

        #endregion

    }
}

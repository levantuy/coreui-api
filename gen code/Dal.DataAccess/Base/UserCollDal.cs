//  This file was generated by CSLA Object Generator - CslaGenFork v4.3.0
//
// Filename:    UserCollDal
// ObjectType:  SQL Server implementation of IUserCollDal (UserColl)
// CSLAType:    ReadOnlyCollection

using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using Csla;
using Csla.Data;
using Dal;

namespace Dal.DataAccess
{
    /// <summary>
    /// DAL SQL Server implementation of <see cref="IUserCollDal"/>
    /// </summary>
    public partial class UserCollDal : IUserCollDal
    {
        /// <summary>
        /// Loads a UserColl collection from the database.
        /// </summary>
        /// <returns>A list of <see cref="UserInfoDto"/>.</returns>
        public List<UserInfoDto> Fetch()
        {
            using (var ctx = ContextManager<Connection>.GetManager("Connection"))
            {
                using (var cmd = new SqlCommand("dbo.UserColl_Get", ctx.Connection))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    var dr = cmd.ExecuteReader();
                    return LoadCollection(dr);
                }
            }
        }

        private List<UserInfoDto> LoadCollection(IDataReader data)
        {
            var userColl = new List<UserInfoDto>();
            using (var dr = new SafeDataReader(data))
            {
                while (dr.Read())
                {
                    userColl.Add(Fetch(dr));
                }
            }
            return userColl;
        }

        private UserInfoDto Fetch(SafeDataReader dr)
        {
            var userInfo = new UserInfoDto();
            // Value properties
            userInfo.Id = dr.GetInt64("id");
            userInfo.User_name = dr.GetString("user_name");
            userInfo.Password = dr.GetString("password");
            userInfo.Password_salt = dr.GetString("password_salt");
            userInfo.Password_question = !dr.IsDBNull("password_question") ? dr.GetString("password_question") : null;
            userInfo.Password_answer = !dr.IsDBNull("password_answer") ? dr.GetString("password_answer") : null;
            userInfo.Is_approved = dr.GetBoolean("is_approved");
            userInfo.Fullname = dr.GetString("fullname");
            userInfo.Email = dr.GetString("email");
            userInfo.Tel = !dr.IsDBNull("tel") ? dr.GetString("tel") : null;
            userInfo.Last_login_date = dr.GetSmartDate("last_login_date", true);
            userInfo.Last_password_changed_date = dr.GetSmartDate("last_password_changed_date", true);
            userInfo.Last_lockout_date = dr.GetSmartDate("last_lockout_date", true);
            userInfo.Failed_password_attempt_count = dr.GetInt64("failed_password_attempt_count");
            userInfo.Failed_password_attempt_window_start = dr.GetSmartDate("failed_password_attempt_window_start", true);
            userInfo.Failed_password_answer_attempt_count = dr.GetInt64("failed_password_answer_attempt_count");
            userInfo.Failed_password_answer_attempt_window_start = dr.GetSmartDate("failed_password_answer_attempt_window_start", true);
            userInfo.Birthday = !dr.IsDBNull("birthday") ? dr.GetSmartDate("birthday", true) : null;
            userInfo.Address = !dr.IsDBNull("address") ? dr.GetString("address") : null;
            userInfo.Website = !dr.IsDBNull("website") ? dr.GetString("website") : null;
            userInfo.Avatar = !dr.IsDBNull("avatar") ? dr.GetString("avatar") : null;
            userInfo.Is_lock = dr.GetBoolean("is_lock");
            userInfo.User_type = (Int64?)dr.GetValue("user_type");
            userInfo.Last_modified = dr.GetSmartDate("last_modified", true);
            userInfo.Last_user_id = dr.GetInt64("last_user_id");

            return userInfo;
        }
    }
}

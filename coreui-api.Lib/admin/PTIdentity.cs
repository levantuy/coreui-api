using System;
using Csla;
using Csla.Security;
using CoreuiApi.Dto;
using CoreuiApi.Util;

namespace CoreuiApi.Lib
{
    [Serializable]
    //
    // Summary:
    //     Possible results from a sign in attempt
    public enum LoginStatus
    {
        //
        // Summary:
        //     Sign in was successful
        Success = 0,
        //
        // Summary:
        //     User is locked out
        LockedOut = 1,
        //
        // Summary:
        //     Sign in requires addition verification (i.e. two factor)
        RequiresVerification = 2,
        //
        // Summary:
        //     Sign in failed
        Failure = 3,
        IsNotApproved = 4
    }
    public class PTIdentity:CslaIdentity
    {

#if !SILVERLIGHT && !WINDOWS_PHONE && !NETFX_CORE

        private static LoginStatus status = LoginStatus.Failure;
        public static LoginStatus Status {
            get { return status; }
            set { status = value; }
        }

        public static string PatientCode { get; set; }

        public static PTIdentity GetPTIdentity(string username,string password) {
            return DataPortal.Fetch<PTIdentity>(new UsernameCriteria(username,password));
        }

        internal static PTIdentity GetPTIdentity(string username) {
            return DataPortal.Fetch<PTIdentity>(username);
        }

        private void DataPortal_Fetch(string username) {
            CoreuiApi.Dto.UserDto data = null;
            using(var ctx = DalFactoryGetManager.GetManager())
            {
                var dal = ctx.GetProvider<IUserDal>();
                try
                {
                    data = dal.Fetch(username);
                } catch
                {
                    data = null;
                }
                LoadUser(data);
            }
        }

        private void DataPortal_Fetch(UsernameCriteria criteria) {
            UserDto data = null;
            using(var ctx = DalFactoryGetManager.GetManager())
            {
                var dal = ctx.GetProvider<IUserDal>();
                try
                {
                    data = dal.Fetch(criteria.Username);
                    if(data.Id == 0)
                    {                     
                        status = LoginStatus.Failure;
                        return;
                    }

                    if(data.Is_lock)
                    {
                        status = LoginStatus.LockedOut;
                        return;
                    }

                    if(!data.Is_approved)
                    {
                        status = LoginStatus.IsNotApproved;
                        return;
                    }
                    var salt = data.Password_salt;
                    var hash = StringUtils.Encode(criteria.Password,salt);
                    var passwordMatches = hash == data.Password;
                    if(!passwordMatches)
                    {                   
                        status = LoginStatus.Failure;
                        return;
                    }
                } catch(Exception ex)
                {
                    data = null;
                    status = LoginStatus.Failure;
                    return;
                }
                LoadUser(data);
                status = LoginStatus.Success;
            }
        }

        private void LoadUser(UserDto data) {
            if(data != null)
            {
                base.Name = data.User_name;
                base.IsAuthenticated = true;
                base.AuthenticationType = "Membership";
                if(data.Roles != null && data.Roles.Count > 0)
                    base.Roles = new Csla.Core.MobileList<string>(data.Roles);
            } else
            {
                base.Name = string.Empty;
                base.IsAuthenticated = false;
                base.AuthenticationType = string.Empty;
                base.Roles = new Csla.Core.MobileList<string>();
            }
        }
#endif
    }
}

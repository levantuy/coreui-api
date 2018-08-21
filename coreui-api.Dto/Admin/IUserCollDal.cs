//  This file was generated by CSLA Object Generator - CslaGenFork v4.3.0
//
// Filename:    IUserCollDal
// ObjectType:  DAL interface for UserColl
// CSLAType:    ReadOnlyCollection

using System;
using System.Collections.Generic;
using Csla;

namespace CoreuiApi.Dto
{
    /// <summary>
    /// DAL Interface for UserColl type
    /// </summary>
    public partial interface IUserCollDal
    {
        /// <summary>
        /// Loads a UserColl collection from the database.
        /// </summary>
        /// <returns>A list of <see cref="UserInfoDto"/>.</returns>
        List<UserDto> Fetch();
        List<UserDto> Fetch(int pageIndex, int pageZise, string fullname, string user_name, string tel, string email, ref int totalRow);
    }
}

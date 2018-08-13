//-----------------------------------------------------------------------
// <copyright file="IDalManagerGetManager.cs" company="Marimer LLC">
//     Copyright (c) Marimer LLC. All rights reserved.
//     Website: http://www.lhotka.net/cslanet/
// </copyright>
//-----------------------------------------------------------------------

using System;

namespace Dal
{
    /// <summary>
    /// Defines the GetManager DAL manager interface for DAL providers.
    /// </summary>
    public interface IDalManagerGetManager : IDisposable
    {
        /// <summary>
        /// Gets the DAL provider for a given object Type.
        /// </summary>
        /// <typeparam name="T">Object Type that requires a GetManager DAL provider.</typeparam>
        /// <returns>A new GetManager DAL instance for the given Type.</returns>
        T GetProvider<T>() where T : class;
    }
}

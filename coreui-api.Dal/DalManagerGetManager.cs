using System;
using Csla.Data;
using System.Data.SqlClient;

namespace CoreuiApi.Dal
{
    public class DalManagerGetManager: CoreuiApi.Dto.IDalManagerGetManager
    {
        private static readonly string TypeMask = typeof (DalManagerGetManager).FullName.Replace("DalManagerGetManager", @"{0}");
        private const string BaseNamespace = "CoreuiApi.Dto";

        /// <summary>
        /// Initializes a new instance of the <see cref="DalManagerGetManager"/> class.
        /// </summary>
        public DalManagerGetManager()
        {
            ConnectionManager = ConnectionManager<SqlConnection>.GetManager("Connection");
        }

        /// <summary>
        /// Gets the ADO ConnectionManager object.
        /// </summary>
        /// <value>The ConnectionManager object</value>
        public ConnectionManager<SqlConnection> ConnectionManager { get; private set; }

        #region IDalManagerGetManager Members

        /// <summary>
        /// Gets the GetManager DAL provider for a given object Type.
        /// </summary>
        /// <typeparam name="T">Object Type that requires a GetManager DAL provider.</typeparam>
        /// <returns>A new GetManager DAL instance for the given Type.</returns>
        public T GetProvider<T>() where T : class
        {
            string typeName;
            var namespaceDiff = typeof(T).Namespace.Length - BaseNamespace.Length;
            if (namespaceDiff > 0)
                typeName = string.Format(TypeMask, typeof(T).Namespace.Substring(BaseNamespace.Length + 1,
                    namespaceDiff - 1)) + "." + typeof(T).Name.Substring(1);
            else
                typeName = string.Format(TypeMask, typeof(T).Name.Substring(1));

            var type = Type.GetType(typeName);
            if (type != null)
                return Activator.CreateInstance(type) as T;

            throw new NotImplementedException(typeName);
        }

        /// <summary>
        /// Disposes the ConnectionManager.
        /// </summary>
        public void Dispose()
        {
            ConnectionManager.Dispose();
            ConnectionManager = null;
        }

        #endregion

    }
}

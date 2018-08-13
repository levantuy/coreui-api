using System;

namespace CoreuiApi.Dto
{
    public interface IDalManagerGetManager: IDisposable
    {
        T GetProvider<T> ( ) where T: class;
    }
}

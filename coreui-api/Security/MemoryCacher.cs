using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Runtime.Caching;

namespace CoreuiApi.Security
{
    public class CacheRespone
    {
        public bool IsSuccess { get; set; }
        public object Respone { get; set; }
    }
    public class MemoryCacher
    {
        public static CacheRespone GetValue(string key)
        {
            MemoryCache memoryCache = MemoryCache.Default;            
            CacheRespone cacheRespone = new CacheRespone();            
            if(memoryCache.Contains(key)) { cacheRespone.IsSuccess = true; cacheRespone.Respone = memoryCache.Get(key); }
            else { cacheRespone.IsSuccess = false; }
            return cacheRespone;
        }

        public static bool Add(string key, object value, DateTimeOffset absExpiration)
        {            
            MemoryCache memoryCache = MemoryCache.Default;            
            return memoryCache.Add(key, value, absExpiration);
        }

        public static void Delete(string key)
        {
            MemoryCache memoryCache = MemoryCache.Default;
            if (memoryCache.Contains(key))
            {
                memoryCache.Remove(key);
            }
        }
    }
}
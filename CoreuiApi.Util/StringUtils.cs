using System.Globalization;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;

namespace CoreuiApi.Util
{
    public static class StringUtils
    {
        private const int SaltSize = 24;
        /// <summary>
        /// Create a salt for the password hash (just makes it a bit more complex)
        /// </summary>
        /// <param name="size"></param>
        /// <returns></returns>
        private static string _CreateSalt(int size)
        {
            // Generate a cryptographic random number.
            var rng = new RNGCryptoServiceProvider();
            var buff = new byte[size];
            rng.GetBytes(buff);

            // Return a Base64 string representation of the random number.
            return Convert.ToBase64String(buff);
        }

        public static string CreateSalt()
        {
            return _CreateSalt(SaltSize);
        }
        /// <summary>
        /// Generate a hash for a password, adding a salt value
        /// </summary>
        /// <param name="plainText"></param>
        /// <param name="salt"></param>
        /// <returns></returns>
        private static string GenerateSaltedHash(string plainText, string salt)
        {
            // http://stackoverflow.com/questions/2138429/hash-and-salt-passwords-in-c-sharp

            var plainTextBytes = Encoding.UTF8.GetBytes(plainText);
            var saltBytes = Encoding.UTF8.GetBytes(salt);

            // Combine the two lists
            var plainTextWithSaltBytes = new List<byte>(plainTextBytes.Length + saltBytes.Length);
            plainTextWithSaltBytes.AddRange(plainTextBytes);
            plainTextWithSaltBytes.AddRange(saltBytes);

            // Produce 256-bit hashed value i.e. 32 bytes
            HashAlgorithm algorithm = new SHA256Managed();
            var byteHash = algorithm.ComputeHash(plainTextWithSaltBytes.ToArray());
            return Convert.ToBase64String(byteHash);
        }

        /// <summary>
        /// Hàm mã hoá mật khẩu
        /// </summary>
        /// <returns></returns>
        public static string Encode(string plainText, string salt)
        {
            return GenerateSaltedHash(plainText, salt);
        }

        public static string StringToHtml(string input)
        {
            var strs = input.Split().ToList();
            const string sformat = "<span>{0}</span>";
            var output = string.Empty;
            foreach (var str in strs)
                output = string.Format(sformat, str);
            return output;
        }

        private const string UniChars = "àáảãạâầấẩẫậăằắẳẵặèéẻẽẹêềếểễệđìíỉĩịòóỏõọôồốổỗộơờớởỡợùúủũụưừứửữựỳýỷỹỵÀÁẢÃẠÂẦẤẨẪẬĂẰẮẲẴẶÈÉẺẼẸÊỀẾỂỄỆĐÌÍỈĨỊÒÓỎÕỌÔỒỐỔỖỘƠỜỚỞỠỢÙÚỦŨỤƯỪỨỬỮỰỲÝỶỸỴÂĂĐÔƠƯ";
        private const string KoDauChars = "aaaaaaaaaaaaaaaaaeeeeeeeeeeediiiiiooooooooooooooooouuuuuuuuuuuyyyyyAAAAAAAAAAAAAAAAAEEEEEEEEEEEDIIIOOOOOOOOOOOOOOOOOOOUUUUUUUUUUUYYYYYAADOOU";
        public static string UnicodeToKoDauAndGach(string s)
        {
            var retVal = String.Empty;
            for (var i = 0; i < s.Length; i++)
            {
                var pos = UniChars.IndexOf(s[i].ToString(CultureInfo.InvariantCulture), StringComparison.Ordinal);
                if (pos >= 0)
                    retVal += KoDauChars[pos];
                else
                    retVal += s[i];
            }
            retVal = retVal.Replace("–", "");
            retVal = retVal.Replace("-", "");
            retVal = retVal.Replace("  ", "");
            retVal = retVal.Replace(" ", "-");
            retVal = retVal.Replace("--", "-");
            retVal = retVal.Replace(":", "");
            retVal = retVal.Replace(";", "");
            retVal = retVal.Replace("+", "");
            retVal = retVal.Replace("@", "");
            retVal = retVal.Replace(">", "");
            retVal = retVal.Replace("<", "");
            retVal = retVal.Replace("*", "");
            retVal = retVal.Replace("{", "");
            retVal = retVal.Replace("}", "");
            retVal = retVal.Replace("|", "");
            retVal = retVal.Replace("^", "");
            retVal = retVal.Replace("~", "");
            retVal = retVal.Replace("]", "");
            retVal = retVal.Replace("[", "");
            retVal = retVal.Replace("`", "");
            retVal = retVal.Replace(".", "");
            retVal = retVal.Replace("'", "");
            retVal = retVal.Replace("(", "");
            retVal = retVal.Replace(")", "");
            retVal = retVal.Replace(",", "");
            retVal = retVal.Replace("”", "");
            retVal = retVal.Replace("“", "");
            retVal = retVal.Replace("?", "");
            retVal = retVal.Replace("\"", "");
            retVal = retVal.Replace("&", "");
            retVal = retVal.Replace("$", "");
            retVal = retVal.Replace("#", "");
            retVal = retVal.Replace("_", "");
            retVal = retVal.Replace("=", "");
            retVal = retVal.Replace("%", "");
            retVal = retVal.Replace("…", "");
            retVal = retVal.Replace("/", "");
            retVal = retVal.Replace("\\", "");
            retVal = retVal.Replace(" ", "-");
            retVal = retVal.Replace("--", "-");
            retVal = retVal.Replace("---", "-");
            retVal = retVal.Replace("----", "-");
            retVal = retVal.Replace("-----", "-");
            return retVal.ToLower().TrimEnd('-').TrimStart('-');
        }

        public static string SubString(object input, int sotu)
        {
            if (input == null) return "";
            var arr = input.ToString().Split(' ');
            return arr.Length <= sotu ? input.ToString() : (String.Join(" ", arr, 0, sotu - 1) + " ...").Replace("'", "&#39;");
        }
    }
}

using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Encryption_Decryption
{
    public partial class Encryption : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void OnEncryption(object sender, EventArgs e)
        {
            string originalText = txtEncryption.Text;
            string encryptedText = CryptoHelper.Encrypt(originalText);
            txtDecryption.Text = encryptedText;
        }
        protected void OnDecryption(object sender, EventArgs e)
        {
            string encryptedText = txtDecryption.Text;
            string decryptedText = CryptoHelper.Decrypt(encryptedText);
            txtEncryption.Text = decryptedText;
        }
        public class CryptoHelper
        {
            private static readonly string key = GenerateRandomString(16); // 16 bytes for a 128-bit key
            private static readonly string iv = GenerateRandomString(16); // 16 bytes for a 128-bit IV

            public static string Encrypt(string input)
            {
                using (AesCryptoServiceProvider aesAlg = new AesCryptoServiceProvider())
                {
                    aesAlg.Key = Encoding.UTF8.GetBytes(key);
                    aesAlg.IV = Encoding.UTF8.GetBytes(iv);
                    aesAlg.Padding = PaddingMode.PKCS7; // Set the padding mode

                    ICryptoTransform encryptor = aesAlg.CreateEncryptor(aesAlg.Key, aesAlg.IV);

                    using (MemoryStream msEncrypt = new MemoryStream())
                    {
                        using (CryptoStream csEncrypt = new CryptoStream(msEncrypt, encryptor, CryptoStreamMode.Write))
                        using (StreamWriter swEncrypt = new StreamWriter(csEncrypt, Encoding.UTF8)) // Specify encoding
                        {
                            swEncrypt.Write(input);
                        }

                        return Convert.ToBase64String(msEncrypt.ToArray());
                    }
                }
            }

            public static string Decrypt(string input)
            {
                using (AesCryptoServiceProvider aesAlg = new AesCryptoServiceProvider())
                {
                    aesAlg.Key = Encoding.UTF8.GetBytes(key);
                    aesAlg.IV = Encoding.UTF8.GetBytes(iv);
                    aesAlg.Padding = PaddingMode.PKCS7; // Set the padding mode

                    ICryptoTransform decryptor = aesAlg.CreateDecryptor(aesAlg.Key, aesAlg.IV);

                    using (MemoryStream msDecrypt = new MemoryStream(Convert.FromBase64String(input)))
                    using (CryptoStream csDecrypt = new CryptoStream(msDecrypt, decryptor, CryptoStreamMode.Read))
                    using (StreamReader srDecrypt = new StreamReader(csDecrypt, Encoding.UTF8)) // Specify encoding
                    {
                        return srDecrypt.ReadToEnd();
                    }
                }
            }

            private static string GenerateRandomString(int length)
            {
                const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
                var random = new Random();
                return new string(Enumerable.Repeat(chars, length)
                  .Select(s => s[random.Next(s.Length)]).ToArray());
            }
        }

    }
}

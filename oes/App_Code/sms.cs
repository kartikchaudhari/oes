using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Net;
using System.IO;

namespace oes.App_Code
{
    public class sms
    {
        public string APIKey { get; set; }
        public string UserName { get; set; }
        public string PassWord { get; set; }
        public string Message { get; set; }
        public string Receiver { get; set; }

        public sms(string api,string username,string password) {
            this.APIKey = api;
            this.UserName = username;
            this.PassWord = password;
            
        }
        public bool SendSms(string msg,string receiver) {
            this.Message = HttpContext.Current.Server.UrlEncode(msg);
            this.Receiver = receiver;
            string URL = "https://smsapi.engineeringtgr.com/send/?Mobile=" + UserName + "&Password=" + PassWord + "&Message=" + Message+ "&To=" + Receiver + "&Key=" + APIKey + "";
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(URL);
            request.Method = "GET";
            request.ContentType = "application/json";
            request.ContentLength = 0;// DATA.Length;

            try
            {
                WebResponse webResponse = request.GetResponse();
                Stream webStream = webResponse.GetResponseStream();
                StreamReader responseReader = new StreamReader(webStream);
                string response = responseReader.ReadToEnd();
                Console.Out.WriteLine(response);
                responseReader.Close();
                
            }
            catch (Exception xe)
            {
                Console.Out.WriteLine("-----------------");
                Console.Out.WriteLine(xe.Message);
            }
            return true;
        }
    }


}
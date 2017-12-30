using System;
using System.Collections.Generic;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace oes.admin
{
    /// <summary>
    /// Summary description for SendBase64
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    //To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class SendBase64 : System.Web.Services.WebService
    {

        [WebMethod]
        public void CreateImage(string b64)
        {
            byte[] imageBytes = Convert.FromBase64String(b64);
            MemoryStream ms = new MemoryStream(imageBytes, 0, imageBytes.Length);
            ms.Write(imageBytes, 0, imageBytes.Length);
            System.Drawing.Image image = System.Drawing.Image.FromStream(ms, true);
            if (File.Exists(Server.MapPath("~/admin/ThumbData/probe.bmp")))
            {
                File.Delete(Server.MapPath("~/admin/ThumbData/probe.bmp"));
                image.Save(Server.MapPath("~/admin/ThumbData/probe.bmp"), ImageFormat.Bmp);
                //HttpContext.Current.Response.Write("Image Created");
            }
            else
            {
                image.Save(Server.MapPath("~/admin/ThumbData/probe.bmp"), ImageFormat.Bmp);
                //HttpContext.Current.Response.Write("Image Created");
            }
        }

        
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//namespaces for bitmap image formation
using System.Drawing;
using System.Drawing.Imaging;


//namespace for memory management 
using System.IO;

namespace oes
{
    public partial class ThumTest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {}

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string base64StringValue = img_val.Value;

            byte[] imageBytes = Convert.FromBase64String(base64StringValue);
            MemoryStream ms = new MemoryStream(imageBytes, 0, imageBytes.Length);

            // Convert byte[] to Image

            try
            {
                ms.Write(imageBytes, 0, imageBytes.Length);
                System.Drawing.Image image = System.Drawing.Image.FromStream(ms, true);
                image.Save(Server.MapPath("~/admin/ThumbData/"+Session.SessionID.ToString()+".bmp"), ImageFormat.Bmp); //save the image as bmp
                Label1.Text = "Thumb Image Uploaded";
                Label1.ForeColor = System.Drawing.Color.Green;
            }
            catch (IOException ext)
            {
                Label1.Text = ext.ToString();
            }
        }

        public void CreateImage(string b64)
        {
            byte[] imageBytes = Convert.FromBase64String(b64);
            MemoryStream ms = new MemoryStream(imageBytes, 0, imageBytes.Length);
            ms.Write(imageBytes, 0, imageBytes.Length);
            System.Drawing.Image image = System.Drawing.Image.FromStream(ms, true);
            if (File.Exists(Server.MapPath("~/student/ThumbData/probe.bmp")))
            {
                File.Delete(Server.MapPath("~/student/ThumbData/probe.bmp"));
                image.Save(Server.MapPath("~/student/ThumbData/probe.bmp"), ImageFormat.Bmp);
                HttpContext.Current.Response.Write("Image Created");
            }
            else
            {
                image.Save(Server.MapPath("~/student/ThumbData/probe.bmp"), ImageFormat.Bmp);
                HttpContext.Current.Response.Write("Image Created");
            }
        }
    }
}
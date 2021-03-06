﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Xml;
using System.Xml.Linq;
using System.Xml.Serialization;
using SourceAFIS.Simple;

using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
namespace oes.admin
{
    public partial class Login : System.Web.UI.Page
    {
        Person probe;
        AfisEngine sfis;
        Person candidate;
        Fingerprint fp;
        protected void Page_Load(object sender, EventArgs e)
        {
                probe = new Person();
                probe = Des();
                sfis = new AfisEngine();
                candidate = new Person();
                fp = new Fingerprint();
                //sfis.Threshold = 11;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            byte[] imageBytes = Convert.FromBase64String(img_val.Value);

            fp.AsBitmap = CreateBmpImage(imageBytes);
                //fp.AsBitmap = new System.Drawing.Bitmap(System.Drawing.Bitmap.FromFile(Server.MapPath("~/admin/ThumbData/probe.bmp")));
                candidate.Fingerprints.Add(fp);
                sfis.Extract(candidate);
                int score = (int)Math.Ceiling(sfis.Verify(candidate, probe));
                Label1.Text = score.ToString();
                if (score > 0)
                {
                    Session["id"] = probe.Id.ToString();
                    Session["type"] = 1;
                    Response.Redirect("Dashboard.aspx");
                }
                else
                {
                    Response.Redirect("Login.aspx?eid=3");
                }
            
        }

        static public Person Des()
        {
            XmlSerializer deserializer = new XmlSerializer(typeof(Person));
            TextReader reader = new StreamReader(System.Web.Hosting.HostingEnvironment.MapPath("~/admin/ThumbData/users.xml"));
            object obj = deserializer.Deserialize(reader);
            Person XmlData = (Person)obj;
            reader.Close();
            return XmlData;
        }

        public Bitmap CreateBmpImage(byte[] ImageDateByte)
        {
            using (MemoryStream ms = new MemoryStream(ImageDateByte))
            {
                Bitmap img = (Bitmap)System.Drawing.Image.FromStream(ms);
                return img;
            }
        }

    }
}
using SourceAFIS.Simple;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Serialization;

namespace oes.admin
{
    public partial class EnrollThumb : System.Web.UI.Page
    {
        AfisEngine sfis;
        Person kartik;
        Fingerprint fp;

        protected void Page_Load(object sender, EventArgs e)
        {
            sfis = new AfisEngine();
            kartik = new Person();
            fp = new Fingerprint();

        }

        protected void btnXml_Click(object sender, EventArgs e)
        {
            fp.AsBitmap = new System.Drawing.Bitmap(System.Drawing.Bitmap.FromFile(HttpContext.Current.Server.MapPath("~/admin/ThumbData/probe.bmp")));
            kartik.Fingerprints.Add(fp);
            sfis.Extract(kartik);
            Serialize(kartik);
        }

        static public void Serialize(Person details)
        {
            XmlSerializer serializer = new XmlSerializer(typeof(Person));
            using (TextWriter writer = new StreamWriter(System.Web.Hosting.HostingEnvironment.MapPath("~/admin/ThumbData/users.xml")))
            {
                serializer.Serialize(writer, details);
            }
        }
    }
}
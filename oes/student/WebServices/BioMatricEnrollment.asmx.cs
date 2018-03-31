using System;
using System.Collections.Generic;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;

using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data.SqlTypes;

using SourceAFIS.Simple;

using oes.App_Code;
using System.Drawing;
namespace oes.student.WebServices
{
   
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class BioMatricEnrollment : System.Web.Services.WebService
    {

        [WebMethod]
        public void RegisterUser(string b64, string UserId)
        {

            AfisEngine afis = new AfisEngine();
            Database Db = new Database();
            Person probe = new Person();
            Fingerprint fp = new Fingerprint();

            int Uid = Convert.ToInt16(UserId);

            //create image on harddrive
            byte[] imageBytes = Convert.FromBase64String(b64);
            fp.AsBitmap = CreateBmpImage(imageBytes);

            probe.Fingerprints.Add(fp);
            afis.Extract(probe);
            byte[] template = fp.Template;


            using (SqlCommand cmd = new SqlCommand("EnrollStudent", Db.ConnectFingerDb()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@FingerImage", imageBytes);
                cmd.Parameters.AddWithValue("@FingerTemplate", template);
                cmd.Parameters.AddWithValue("@UserId", Uid);
                cmd.ExecuteNonQuery();

            }
        }

        public Bitmap CreateBmpImage(byte[] ImageDateByte)
        {
            using (MemoryStream ms = new MemoryStream(ImageDateByte))
            {
                Bitmap img = (Bitmap)Image.FromStream(ms);
                return img;
            }
        }
    }
}

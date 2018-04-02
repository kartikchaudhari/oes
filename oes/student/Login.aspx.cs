using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data.SqlTypes;

using SourceAFIS.Simple;
using oes.App_Code;
using System.Drawing;
using System.IO;
namespace oes.student
{
    public partial class Login : System.Web.UI.Page
    {
        Person probe;
        Fingerprint fp;

        AfisEngine afis = new AfisEngine();
        Database db = new Database();
        List<Person> users = new List<Person>();

        protected void Page_Load(object sender, EventArgs e)
        {
            probe = new Person();
            fp = new Fingerprint();
            LoadDatatoList();
            afis.Threshold = 11;
        }

        public void LoadDatatoList()
        {
            Person p = new Person();
            Fingerprint fp = new Fingerprint();
            using (SqlCommand cmd = new SqlCommand("FetchAllStudents", db.ConnectFingerDb()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    p.Id = Convert.ToInt16(rdr["user_id"]);
                    fp.Template = (byte[])rdr["Template"];
                    p.Fingerprints.Add(fp);
                    users.Add(p);
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            byte[] imageBytes = Convert.FromBase64String(img_val.Value);
            
            fp.AsBitmap = CreateBmpImage(imageBytes);
            probe.Fingerprints.Add(fp);
            afis.Extract(probe);
            Person matchingCandidate = afis.Identify(probe, users).FirstOrDefault() as Person;
            bool match = (matchingCandidate != null);
            if (match == true)
            {
                float score = afis.Verify(probe, matchingCandidate);
               //Response.Write("<br><br>Score=" + score.ToString() + "<br><br>ID=" + matchingCandidate.Id.ToString());
               CheckAccountStatus(matchingCandidate.Id);

            }
            else
            {
                Response.Write("No user Found");

            }
        }

        public Bitmap CreateBmpImage(byte[] ImageDateByte)
        {
            using (MemoryStream ms = new MemoryStream(ImageDateByte))
            {
                Bitmap img = (Bitmap)System.Drawing.Image.FromStream(ms);
                return img;
            }
        }

        public void CheckAccountStatus(int StudentId) {
            using (SqlCommand cmd=new SqlCommand("FetchStudentData",db.DbConnect()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id",StudentId);
                SqlDataReader rdr=cmd.ExecuteReader();
                while (rdr.Read())
                {
                    if (Convert.ToInt16(rdr["account_status"]) == 1)
                    {
                        Session["id"] = StudentId;
                        Session["type"] = 3;
                        Response.Redirect("Dashboard.aspx");
                    }
                    else
                    {
                        Response.Redirect("Login.aspx?eid=3");
                    }
                }
            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.ComponentModel;

//namespaces for bitmap image formation
using System.Drawing;
using System.Drawing.Imaging;

//namespace for memory management 
using System.IO;

//these two namespaces are for DataTables, DataSet and DataSource(Database)
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;


//oes namespaces for custom functions and database functions
using oes.App_Code;

namespace oes.student
{
    public partial class EnrollThumb : System.Web.UI.Page
    {
        string FullName;
        string ThumbFileFullPath;
        protected void Page_Load(object sender, EventArgs e)
        {
            Database db = new Database();

            if (Session["username"] != null)
            {
                String username = Session["username"].ToString();
                //Session.Abandon(); //destroy the session
                lbl_welcome.Text = username;
            }
            else
            {
                Response.Redirect("Register.aspx");
            }

            using (db.DbConnect())
            {
                try
                {
                    if (Session["username"] != null)
                    {
                        String uname = Session["username"].ToString();
                        
                        SqlCommand FetchNameCmd = new SqlCommand("SELECT student_id,first_name,last_name FROM student WHERE username='" + uname.ToString() + "'", db.DbConnect());
                        
                        DataTable EnrollThumbDt = new DataTable();
                        
                        SqlDataAdapter adpt = new SqlDataAdapter(FetchNameCmd);
                        
                        adpt.Fill(EnrollThumbDt);
                        if (EnrollThumbDt.Rows.Count > 0)
                        {
                            lbl_welcome.Text = EnrollThumbDt.Rows[0]["first_name"].ToString() + " " + EnrollThumbDt.Rows[0]["last_name"].ToString();
                            FullName = lbl_welcome.Text;
                            userid.Value = EnrollThumbDt.Rows[0]["student_id"].ToString();
                            Session["id"] = EnrollThumbDt.Rows[0]["student_id"].ToString();
                        }
                        else
                        {
                            Label1.Text = "No user found";
                        }
                    }
                    else
                    {
                        lbl_welcome.Text = "No body";

                        Label1.Text = "Session is not set";
                        Label1.ForeColor = System.Drawing.Color.Red;
                    }
                }
                catch (Exception ex)
                {
                    Label1.Text = ex.ToString();
                    Label1.ForeColor = System.Drawing.Color.Red;
                }
            }
        
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string base64StringValue = img_val.Value;

            if (Session["username"] != null)
            {
                byte[] imageBytes = Convert.FromBase64String(base64StringValue);
                MemoryStream ms = new MemoryStream(imageBytes, 0, imageBytes.Length);

                try
                {
                    ms.Write(imageBytes, 0, imageBytes.Length);
                    System.Drawing.Image image = System.Drawing.Image.FromStream(ms,true);
                    image.Save(Server.MapPath("~/student/ThumbData/" + Session["username"] + ".bmp"), ImageFormat.Bmp); //save the image as bmp
                    
                    ThumbFileFullPath="/student/ThumbData/"+Session["username"]+".bmp";
                    

                    //stores the fullname for greeting message on congratulations.aspx page
                    Session["fullname"] = FullName;
                    
                    /* Session["UserType"] is used to determine the user is faculty or student,
                     * to show apppropriate  greeting message.                  
                     * 
                     *  user type: user type are fauculty and students 
                     *  value for student="Student"
                     *  value for faculty="Faculty"
                     */
                    Session["UserType"] = "Student";
                    
                    //update thumb image to student table
                    UpdateThumbFilePath(ThumbFileFullPath, Convert.ToInt16(userid.Value.ToString()));
                    
                    Response.Redirect("UploadAvatar.aspx");
                    
                    
                }
                catch (IOException ext)
                {
                    Label1.Text = ext.ToString();
                }
            }
            else
            {
                Label1.Text = "Session not Set\nPage: EnrollThumb.";
            }

        }

        public void UpdateThumbFilePath(string FilePath,int StudentId) {
            Database db = new Database();
            using (SqlCommand cmd = new SqlCommand("AddStudentThumbImageFile", db.DbConnect()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id",StudentId);
                cmd.Parameters.AddWithValue("@ThumbPath", FilePath);
                cmd.ExecuteNonQuery();
            }
        }
    }
}
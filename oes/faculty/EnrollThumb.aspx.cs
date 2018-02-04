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

using oes.App_Code;

namespace oes.faculty
{
    public partial class EnrollThumb : System.Web.UI.Page
    {
        Database db = new Database();
        string FullName;
        protected void Page_Load(object sender, EventArgs e)
        {
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

            using(db.DbConnect())
            {
                try
                {
                    if (Session["username"] != null)
                    {
                        String uname = Session["username"].ToString();
                       
                        SqlCommand FetchNameCmd = new SqlCommand("SELECT first_name,last_name FROM faculty WHERE username='"+uname.ToString()+"'",db.DbConnect());
                        
                        DataTable EnrollThumbDt = new DataTable();
                        
                        SqlDataAdapter adpt = new SqlDataAdapter(FetchNameCmd);
                        
                        adpt.Fill(EnrollThumbDt);
                        if (EnrollThumbDt.Rows.Count > 0)
                        {
                            lbl_welcome.Text = EnrollThumbDt.Rows[0]["first_name"].ToString() + " " + EnrollThumbDt.Rows[0]["last_name"].ToString();
                            FullName = EnrollThumbDt.Rows[0]["first_name"].ToString() + " " + EnrollThumbDt.Rows[0]["last_name"].ToString();
                        }
                        else
                        {
                            Label1.Text = "No user found";
                        }
                    }
                    else
                    {
                        //message.Attributes.Add("class", "alert alert-success alert-dismissable fade in");
                        //message.Attributes.Add("onload", "close();");
                        //message.InnerHtml = "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><strong>Success!</strong> This alert box could indicate a successful or positive action.";
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

        public void btnSubmit_Click(object sender, EventArgs e)
        {
            string base64StringValue=img_val.Value;
            if (Session["username"] != null)
            {
                byte[] imageBytes = Convert.FromBase64String(base64StringValue);
                MemoryStream ms = new MemoryStream(imageBytes, 0, imageBytes.Length);


                try
                {
                    ms.Write(imageBytes, 0, imageBytes.Length);
                    System.Drawing.Image image = System.Drawing.Image.FromStream(ms, true);
                    image.Save(Server.MapPath("~/faculty/ThumbData/"+Session["username"]+".bmp"), ImageFormat.Bmp); //save the image as bmp
                    
                    //update figerprint image file location to database

                    //stores the fullname for greeting message on congratulations.aspx page
                    Session["fullname"] = FullName;

                    /* Session["UserType"] is used to determine the user is faculty or student,
                     * to show apppropriate  greeting message.                  
                     * 
                     *  user type: user type are fauculty and students 
                     *  value for student="Student"
                     *  value for faculty="Faculty"
                     */

                    Session["UserType"] = "Faculty";
                    Response.Redirect("../Congratulations.aspx");
                    //Label1.Text = "Thumb Image Uploaded";
                    //Label1.ForeColor = System.Drawing.Color.Green;
                }
                catch (IOException ext)
                {
                    Label1.Text = ext.ToString();
                }
            }
            else {
                Label1.Text = "Session not Set\nPage: EnrollThumb.";
            }

        }
    }
}
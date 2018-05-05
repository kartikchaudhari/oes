using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//drawing relataed operatoions and rectangle shape 
using System.Drawing;

//file I/O operations
using System.IO;

using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data.SqlTypes;

using oes.App_Code;


namespace oes.student
{
    public partial class UploadAvatar : System.Web.UI.Page
    {
        Database Db = new Database();
        int StudentId;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null)
            {
                Response.Redirect("Register.aspx");
            }
            else
            {
                StudentId = Convert.ToInt16(Session["id"].ToString());
            }
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            string UploadFileName = "";
            string UploadFilePath = "";

            if (FileUpload1.HasFile)
            {
                string ext = Path.GetExtension(FileUpload1.FileName).ToLower();
                if (ext == ".jpg" || ext == ".jpeg" || ext == ".gif" || ext == ".png")
                {
                    UploadFileName = Guid.NewGuid().ToString() + ext;
                    UploadFilePath = Path.Combine(Server.MapPath("~/student/Avatar"), UploadFileName);
                    try
                    {
                        FileUpload1.SaveAs(UploadFilePath);
                        imgUpload.ImageUrl = "~/student/Avatar/" + UploadFileName;
                        Panel1.Visible = true;
                    }
                    catch (Exception ex)
                    {
                        throw;
                    }
                }
                else
                {
                    lblMsg.Text = "Only Image Files are allowed";
                }

            }
            else
            {
                lblMsg.Text = "Plese Select a File";
            }

        }
        

        protected void btnCrop_Click(object sender, EventArgs e)
        {
            string fileName = Path.GetFileName(imgUpload.ImageUrl);
            string filePath = Path.Combine(Server.MapPath("~/student/Avatar"), fileName);
            string cropFileName = "";
            string cropFilePath = "";
            if (File.Exists(filePath))
            {
                System.Drawing.Image orgImge = System.Drawing.Image.FromFile(filePath);
                Rectangle CropArea = new Rectangle(
                        Convert.ToInt32(X.Value),
                        Convert.ToInt32(Y.Value),
                        Convert.ToInt32(W.Value),
                        Convert.ToInt32(H.Value));
                try
                {
                    Bitmap bitMap = new Bitmap(CropArea.Width, CropArea.Height);
                    using (Graphics g = Graphics.FromImage(bitMap))
                    {
                        g.DrawImage(orgImge, new Rectangle(0, 0, bitMap.Width, bitMap.Height), CropArea, GraphicsUnit.Pixel);
                    }

                    cropFileName = "crop_" + fileName;
                    cropFilePath = Path.Combine(Server.MapPath("~/student/Avatar"), cropFileName);
                    bitMap.Save(cropFilePath);
                    //Response.Write(cropFilePath);
                    //Response.Redirect("~/student/Avatar/" + cropFileName, false);
                    string SaveFilePath = "/student/Avatar/" + cropFileName;

                    //update to database
                    UpdateStudentAvatar(StudentId,SaveFilePath);
                    Response.Redirect("../Congratulations.aspx");
                }

                catch (Exception ex)
                {
                    throw;
                }
            }
        }

        public void UpdateStudentAvatar(int Student_Id, string AvatarPath) {
            using (SqlCommand cmd=new SqlCommand("UpdateStudentAvatar",Db.DbConnect()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id",Student_Id);
                cmd.Parameters.AddWithValue("@Avatar",AvatarPath);
                cmd.ExecuteNonQuery();
            }
        }
    }
}
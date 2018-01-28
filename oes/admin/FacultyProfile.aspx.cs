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
using oes.App_Code;
using oes.admin.Class;
namespace oes.admin
{
    public partial class FacultyProfile : System.Web.UI.Page
    {
        Database db = new Database();
        FacultyClass fc = new FacultyClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString.Count > 0)
            {
                BindProfile(Convert.ToInt16(Request.QueryString[0]));
                if (Request.QueryString[1] == "edit") {
                    //view panel visibility
                    ProfiePicturePanelView.Visible = false;
                    BiometricThumbView.Visible = false;
                    ProfileInfoView.Visible = false;

                    //edit panel visibility
                    ProfilePicturePanelEdit.Visible = true;
                    ProfileInfoEdit.Visible = true;
                }
                else if (Request.QueryString[1] == "view") {
                    
                    ProfiePicturePanelView.Visible =true;
                    BiometricThumbView.Visible = true;
                    ProfileInfoView.Visible = true;

                    ProfilePicturePanelEdit.Visible = false;
                    ProfileInfoEdit.Visible = false;
                }
            }
        }

        protected void BindProfile(int id) {
            using (SqlCommand cmd = new SqlCommand("FetchFacultyData", db.DbConnect()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", id);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                if (ds != null && ds.Tables[0].Rows.Count > 0)
                {
                    UserAvatar.ImageUrl = ds.Tables[0].Rows[0]["avatar"].ToString();
                    UserAvatarEdit.ImageUrl = ds.Tables[0].Rows[0]["avatar"].ToString();
                    if (ds.Tables[0].Rows[0]["thumb_img"].ToString()==null)
                    {
                        Response.Write("No Biometric Thumb Impression Registeres yet");
                    }
                    else 
                    {
                        UserThumb.ImageUrl = ds.Tables[0].Rows[0]["thumb_img"].ToString();
                    }
                    UserThumb.ImageUrl = ds.Tables[0].Rows[0]["thumb_img"].ToString();
                    
                    LblFname.Text = ds.Tables[0].Rows[0]["first_name"].ToString();
                    tbFname.Text = ds.Tables[0].Rows[0]["first_name"].ToString();

                    LblLname.Text = ds.Tables[0].Rows[0]["last_name"].ToString();
                    tbLname.Text = ds.Tables[0].Rows[0]["last_name"].ToString();

                    LblEmail.Text = ds.Tables[0].Rows[0]["email"].ToString();
                    tbEmail.Text = ds.Tables[0].Rows[0]["email"].ToString();

                    LblUname.Text = ds.Tables[0].Rows[0]["username"].ToString();
                    tbUserName.Text = ds.Tables[0].Rows[0]["username"].ToString();

                    LblPass.Text = ds.Tables[0].Rows[0]["password"].ToString();
                    tbPass.Text = ds.Tables[0].Rows[0]["password"].ToString();

                    LblContact.Text = ds.Tables[0].Rows[0]["contact_no"].ToString();
                    tbContact.Text= ds.Tables[0].Rows[0]["contact_no"].ToString();
                    LblDept.Text = fc.FetchDeptById(ds.Tables[0].Rows[0]["dept_id"].ToString());
                    if (ds.Tables[0].Rows[0]["account_status"].ToString() == "1") {
                        LblStatus.Text = "Active";
                        LblStatus.ForeColor = System.Drawing.Color.Green;
                        //BindAccountStatus(ds.Tables[0].Rows[0]["account_status"].ToString());
                    }
                    else if (ds.Tables[0].Rows[0]["account_status"].ToString() == "0")
                    {   
                        LblStatus.Text = "Not Activted Yet";
                        LblStatus.ForeColor = System.Drawing.Color.BlueViolet;
                        //BindAccountStatus(ds.Tables[0].Rows[0]["account_status"].ToString());
                    }
                    else if (ds.Tables[0].Rows[0]["account_status"].ToString() == "3") {
                        LblStatus.Text = "Banned";
                        LblStatus.ForeColor = System.Drawing.Color.Red;
                        //BindAccountStatus(ds.Tables[0].Rows[0]["account_status"].ToString());
                    }
                }   
            }
        }

        protected void BindAccountStatus(string StatusValue) { 
            if (DdlAccStatus.SelectedItem.Value.ToString() == "1")
                {
                    DdlAccStatus.SelectedItem.Selected = true;
                }
            else if (DdlAccStatus.SelectedItem.Value.ToString() == "0")
                {
                   DdlAccStatus.SelectedItem.Selected = true;
                }
             else if (DdlAccStatus.SelectedItem.Value.ToString() == "3")
                {
                    DdlAccStatus.SelectedItem.Selected = true;
                }
            }
        
        
    }
}
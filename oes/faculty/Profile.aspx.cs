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

namespace oes.faculty
{
    public partial class Profile : System.Web.UI.Page
    {
        Database db = new Database();
        FacultyClass faculty = new FacultyClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            BindProfile(Convert.ToInt16(Session["id"]));
        }

        public void BindProfile(int id) {
            using (SqlCommand cmd = new SqlCommand("FetchFacultyData", db.DbConnect())) 
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", id);

                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read()) {
                    UserAvatar.ImageUrl = rdr["avatar"].ToString();
                    UserThumb.ImageUrl = rdr["thumb_img"].ToString();
                    LblFname.Text = rdr["first_name"].ToString();
                    LblLname.Text = rdr["last_name"].ToString();
                    LblEmail.Text = rdr["email"].ToString(); 
                    LblUname.Text = rdr["username"].ToString(); 
                    LblPass.Text = rdr["password"].ToString();
                    lblContactNo.Text = rdr["contact_no"].ToString();
                    lblDept.Text = faculty.FetchDeptById(rdr["dept_id"].ToString());

                    if (rdr["account_status"].ToString() == "1")
                    {
                        lblAccountStatus.Text = "Active";
                        lblAccountStatus.ForeColor = System.Drawing.Color.Green;
                    }
                    else if (rdr["account_status"].ToString() == "0")
                    {
                        lblAccountStatus.Text = "Not Activted Yet";
                        lblAccountStatus.ForeColor = System.Drawing.Color.BlueViolet;
                    }
                    else if (rdr["account_status"].ToString() == "3")
                    {
                        lblAccountStatus.Text = "Banned";
                        lblAccountStatus.ForeColor = System.Drawing.Color.Red;
                    }
                }
            }
        }
    }
}
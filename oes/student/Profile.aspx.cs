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

namespace oes.student
{
    public partial class Profile : System.Web.UI.Page
    {
        Database db = new Database();

        protected void Page_Load(object sender, EventArgs e)
        {
            BindProfile(Convert.ToInt16(Session["id"]));
        }

        protected void BindProfile(int id) {
            using (SqlCommand cmd = new SqlCommand("FetchStudentData", db.DbConnect()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", id);
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    UserAvatar.ImageUrl = rdr["avatar"].ToString();
                    UserThumb.ImageUrl = rdr["thumb_img"].ToString();
                    LblFname.Text = rdr["first_name"].ToString();
                    LblLname.Text = rdr["last_name"].ToString();
                    LblEmail.Text = rdr["email"].ToString();
                    LblUname.Text = rdr["username"].ToString();
                    LblPass.Text =rdr["password"].ToString();
                }
               
            }
        }
    }
}
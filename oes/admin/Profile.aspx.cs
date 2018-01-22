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

namespace oes.admin
{
    public partial class Profile : System.Web.UI.Page
    {
        Database db = new Database();

        protected void Page_Load(object sender, EventArgs e)
        {
            BindProfile(Convert.ToInt16(Session["id"]));
        }

        protected void BindProfile(int id) {
            using (SqlCommand cmd = new SqlCommand("FetchAdminData", db.DbConnect()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", id);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                if (ds != null && ds.Tables[0].Rows.Count > 0)
                {
                    UserAvatar.ImageUrl = ds.Tables[0].Rows[0]["avatar"].ToString();
                    UserThumb.ImageUrl = ds.Tables[0].Rows[0]["thumb_img"].ToString();
                    LblFname.Text = ds.Tables[0].Rows[0]["first_name"].ToString();
                    LblLname.Text = ds.Tables[0].Rows[0]["last_name"].ToString();
                    LblEmail.Text = ds.Tables[0].Rows[0]["email"].ToString();
                    LblUname.Text = ds.Tables[0].Rows[0]["username"].ToString();
                    LblPass.Text = ds.Tables[0].Rows[0]["password"].ToString();
                }
            }
        }
    }
}
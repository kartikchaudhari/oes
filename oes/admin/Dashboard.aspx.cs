using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;

using oes.App_Code;

namespace oes.admin
{
    public partial class Dashboard : System.Web.UI.Page
    {
        Database db = new Database();
        protected void Page_Load(object sender, EventArgs e)
        {
            //block the page from getting cached
            //Response.Cache.SetNoStore();

            //if (Session["id"] == null || Response.Cookies["admin_id"] == null)
            //    {
            //        Response.Redirect("Login.aspx?eid=1&msg=cookie_sess");
            //    }
            //else
            //{
            //    if (Request.Cookies["admin_id"] != null)
            //    {
            //        Response.Write("<script>alert(" + Request.Cookies["admin_id"].Value + ");</script>");
            //        LoadAdminData(Convert.ToInt16(Request.Cookies["admin_id"].Value));
            //    }
            //    else 
            //    else {
            //        Response.Redirect("Login.aspx?eid=1&msg=cookie_sess&inner_loop");
            //    }

            //}
            int UserType=Convert.ToInt16(Session["type"]);
            if (Session["id"] != null && UserType==1)
            {
                LoadAdminData(Convert.ToInt16(Session["id"]));
            }
            else 
            {
                Response.Redirect("Login.aspx?eid=1");
            }
         
        }

        private void LoadAdminData(int id)
        {
            using (SqlCommand cmd = new SqlCommand("FetchAdminData", db.DbConnect()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", id);

                SqlDataReader rdr=cmd.ExecuteReader();
                while(rdr.Read()){
                    user.ImageUrl = rdr["avatar"].ToString();
                    admin_name.Text = rdr["first_name"].ToString() + " " + rdr["last_name"].ToString();
                }
            }
        }
    }
}
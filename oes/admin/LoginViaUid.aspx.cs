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
    public partial class LoginViaUid : System.Web.UI.Page
    {
        Database db = new Database();
        protected void Page_Load(object sender, EventArgs e)
        {


            //if (Request.Cookies["admin_id"] != null && Session["id"] != null)
            //{
            //    Session["id"] = Request.Cookies["admin_id"].Value;
            //    Response.Redirect("Dashboard.aspx");
            //}
            
            //if the user is already logged in 
            //then redirect him/her to dashboard page

            if (Session["id"] != null)
            {
                Response.Redirect("Dashboard.aspx");
            }

        }

        protected void btn_login_Click(object sender, EventArgs e)
        {
            using(SqlCommand cmd=new SqlCommand("LoginAdmin",db.DbConnect())){
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@user_name",tbUsername.Text.Trim().ToString());
                cmd.Parameters.AddWithValue("@pass_word",tbPass.Text.Trim().ToString());

                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    //remember me function
                    //if (cbRemember.Checked)
                    //{
                    //    //Response.Cookies["admin_id"].Value = dt.Rows[0]["admin_id"].ToString();
                        
                    //    Session["id"] = dt.Rows[0]["admin_id"];
                    //    Response.Redirect("Dashboard.aspx");
                    //}
                    ////else
                    //{   
                        Session["id"] = dt.Rows[0]["admin_id"];
                        Response.Redirect("Dashboard.aspx");
                    //}
                }
                else {
                    Response.Redirect("LoginViaUid.aspx?eid=2");
                }
            
            }
        }
    }
}
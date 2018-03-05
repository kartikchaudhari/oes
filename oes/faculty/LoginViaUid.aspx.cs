﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;

using oes.App_Code;

namespace oes.faculty
{
    public partial class LoginViaUid : System.Web.UI.Page
    {
        Database db = new Database();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_login_Click(object sender, EventArgs e)
        {
            using (SqlCommand cmd = new SqlCommand("LoginFaculty", db.DbConnect()))
            {
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@user_name", tbUsername.Text.Trim().ToString());
                cmd.Parameters.AddWithValue("@pass_word", tbPass.Text.Trim().ToString());

                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    Session["id"] = dt.Rows[0]["faculty_id"];
                    Session["type"] = 2;
                    //Label1.Text = dt.Rows[0]["admin_id"].ToString();
                    Response.Redirect("Dashboard.aspx");
                }
                else
                {
                    Response.Redirect("LoginViaUid.aspx?eid=2");
                }

            }
        }
    }
}
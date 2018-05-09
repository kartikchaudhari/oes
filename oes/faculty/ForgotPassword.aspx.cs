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

namespace oes.faculty
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        Database Db = new Database();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            using (SqlCommand cmd = new SqlCommand("RecoverFacultyPassword", Db.DbConnect()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@EmailId", tbEmail.Text.ToString().Trim());
                cmd.Parameters.AddWithValue("@UserName", tbUserName.Text.ToString().Trim());

                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    DataFund.InnerHtml = "<div class='panel panel-psg'><div class='panel-heading'><h3 class='panel-title'><strong>Account Found</strong></h3></div>";
                    DataFund.InnerHtml += "<div class='panel-body'><div class='table-responsive'><table class='table table-bordered'><thead>";
                    DataFund.InnerHtml += "<tr class='active'><th>Firstname</th><th>Lastname</th><th>Email ID</th><th>Username</th><th>Passsword</th></tr>";
                    while (rdr.Read())
                    {
                        DataFund.InnerHtml += "<td>" + rdr["first_name"].ToString() + "</td><td>" + rdr["last_name"].ToString() + "</td><td>" + rdr["email"].ToString() + "</td><td>" + rdr["username"].ToString() + "</td><td>" + rdr["password"].ToString() + "</td>";
                    }
                    DataFund.InnerHtml += "</tr></tbody></table></div></div></div>";
                }
                else
                {
                    DataFund.InnerHtml = "<div class='panel panel-info'><div class='panel-heading'><h3 class='panel-title'><strong>No Account found with given Credentials</strong></h3></div>";
                    DataFund.InnerHtml += "<div class='panel-body' style='padding:8px;'><strong>Possible reasons for this Cause are below:</strong></h5><hr style='margin-top:3px;'><li style='margin-left:4%;'>Given enrollment no. and username are may wrong. </li><li style='margin-left:4%;'>The account of the given credentials are not activated or banned.</li></div>";
                    DataFund.InnerHtml += "</div></div>";
                }

            }
        }

    }
}
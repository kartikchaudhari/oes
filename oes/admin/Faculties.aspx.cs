using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.Sql;
using System.Data.SqlClient;

using System.Web.Script;
using System.Web.Services;
//un-comment below if you change your mind
//using System.Data.SqlTypes;

using oes.App_Code;
using System.Data;

namespace oes.admin
{
    
    public partial class Faculties : System.Web.UI.Page
    {
        //database object
        Database db = new Database();

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["id"] == null)
            //{
            //    Response.Redirect("Login.aspx?eid=1");
            //}
            //else {
            if (!IsPostBack)
            {
                BindRepeater();
            }
            //}
            
        }


        [System.Web.Services.WebMethod]
        public void ConfirmRequest(string UserId)
        {
            //int fact_id = int.Parse(((sender as Button).NamingContainer.FindControl("hf_fact_id") as HiddenField).Value);
            using (SqlCommand cmd = new SqlCommand("UPDATE faculty SET account_status=1 WHERE faculty_id=" +UserId+ "", db.DbConnect()))
            {
                if (cmd.ExecuteNonQuery() != 0)
                {
                    Response.Write("<script>alerrt('Updated');</script>");
                }
                else
                {
                    Response.Write("<script>alerrt('Error while Updation');</script>");
                }
            }
            //Response.Write("<script>alert('kartik')</script>");
        }

        private void BindRepeater()
        {
            using (SqlCommand cmd = new SqlCommand("SELECT * FROM faculty WHERE account_status=0", db.DbConnect()))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtFacultyRequestsRepeater = new DataTable();
                    sda.Fill(dtFacultyRequestsRepeater);
                    FacultyRequestsRepeater.DataSource = dtFacultyRequestsRepeater;
                    FacultyRequestsRepeater.DataBind();
                }
            }
        }

       
    }
}
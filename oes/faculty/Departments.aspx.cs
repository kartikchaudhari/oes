using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services; //webmethod namespace

using System.Data;
using System.Data.SqlClient;
using oes.App_Code;

namespace oes.faculty
{
    public partial class Departments : System.Web.UI.Page
    {
        public Database db = new Database();
        public Functions fn = new Functions();
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["id"] == null)
            //{
            //    Response.Redirect("Login.aspx?eid=1");
            //}
            //else {
            if (!IsPostBack)
            {
                BindDeptRepeater();
            }
            //}
        }
        private void BindDeptRepeater()
        {
            using (SqlCommand cmd = new SqlCommand("FetchAllDepartment", db.DbConnect()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtDept = new DataTable();
                    sda.Fill(dtDept);
                    DeptRepeater.DataSource = dtDept;
                    DeptRepeater.DataBind();
                }
            }
        }
    }
}
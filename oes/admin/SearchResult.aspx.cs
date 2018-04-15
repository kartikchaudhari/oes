using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data.SqlTypes;

using oes.App_Code;
namespace oes.admin
{
    public partial class SearchResult : System.Web.UI.Page
    {
        Database Db = new Database();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridData();        
            }
        }
        private void GridData()
        {
            
            SqlCommand sqlcmd;
            SqlDataAdapter da;
            DataTable dt = new DataTable();
            String query;

            if (TextBox1.Text=="")
            {
                query = "select * from result";
            }
            else
            {
                query = "select * from result where enrollment_no like '" + TextBox1.Text.ToString().Trim() + "%'";
            }
            sqlcmd = new SqlCommand(query, Db.DbConnect());
            da = new SqlDataAdapter(sqlcmd);
            dt.Clear(); 
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                Label1.Text = "";
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            else
            {
                GridView1.DataBind();
                Label1.Text = "No Records Found";
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            GridData();
        }
    }
}
using System.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.Sql;
using System.Data.SqlClient;
using System.Data.SqlTypes;


using oes.App_Code;
using System.Web.UI.DataVisualization.Charting;


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
                GetChart();
            }
            //}
            
        }

        protected void BindRepeater()
        {
            using (SqlCommand cmd = new SqlCommand("FetchPendingFaculty", db.DbConnect()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtFacultyRequestsRepeater = new DataTable();
                    sda.Fill(dtFacultyRequestsRepeater);
                    FacultyRequestsRepeater.DataSource = dtFacultyRequestsRepeater;
                    FacultyRequestsRepeater.DataBind();
                }
            }
        }

        protected void GetChart() {
            //using (SqlCommand cmd = new SqlCommand("ChartsFaculty", db.DbConnect()))
            //{
            //    Series series = FacultyChart.Series["FacultyChartSeries"];
            //    cmd.CommandType = CommandType.StoredProcedure;
 
            //    SqlDataReader rdr = cmd.ExecuteReader();
            //    while (rdr.Read()) {
            //        series.Points.AddXY(rdr[0], rdr[1]);
            //    }
            //  }

            DataTable dt = new DataTable();
            SqlCommand cmd = new SqlCommand("ChartsFaculty", db.DbConnect());
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

            string[] x = new string[dt.Rows.Count];
            int[] y = new int[dt.Rows.Count];
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                x[i] = dt.Rows[i][0].ToString();
                y[i] = Convert.ToInt32(dt.Rows[i][1]);
            }
            //FacultyChart.Series["FacultyChartSeries"]["PieLabelStyle"] = "Disabled";
            FacultyChart.Series[0].Points.DataBindXY(x, y);
        }
       
    }
}
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
using System.Web.UI.DataVisualization.Charting;

namespace oes.admin
{
    public partial class Students : System.Web.UI.Page
    { 
        //database object
        Database db = new Database();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindRepeater();
                //BindDeptList();
                GetChart();
                //CreatePdf(31);
            }
        }

        protected void BindRepeater()
        {
            using (SqlCommand cmd = new SqlCommand("FetchPendingStudent", db.DbConnect()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtFacultyRequestsRepeater = new DataTable();
                    sda.Fill(dtFacultyRequestsRepeater);
                    if (dtFacultyRequestsRepeater.Rows.Count > 0)
                    {
                        StudentRequestsRepeater.DataSource = dtFacultyRequestsRepeater;
                        StudentRequestsRepeater.DataBind();
                    }
                    else
                    {
                        NoRecordsMsg.Visible = true;
                    }
                }
            }
        }
        protected void GetChart()
        {
            using (SqlCommand cmd = new SqlCommand("ChartsStudent", db.DbConnect()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataReader rdr = cmd.ExecuteReader();
                Series series = StudentChart.Series[0];
                while (rdr.Read())
                {
                    series.Points.AddXY(rdr["DepartmentName"].ToString(), rdr["NoofStudents"].ToString());
                }
                StudentChart.Legends.Add(new Legend("StudentChartLegend"));
                StudentChart.Legends[0].TableStyle = LegendTableStyle.Auto;
                StudentChart.Legends[0].Docking = Docking.Bottom;
                StudentChart.Legends[0].Alignment = System.Drawing.StringAlignment.Center;
                StudentChart.Series[0].Label = "#VALY";
                StudentChart.Series[0].Legend = "StudentChartLegend";
                StudentChart.Series[0].LegendText = "#VALX";
            }
        }

    }
}
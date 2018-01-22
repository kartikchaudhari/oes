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
                BindDeptList();
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
                    if (dtFacultyRequestsRepeater.Rows.Count > 0)
                    {
                        FacultyRequestsRepeater.DataSource = dtFacultyRequestsRepeater;
                        FacultyRequestsRepeater.DataBind();
                     }
                     else
                    {
                        NoRecordsMsg.Visible = true;
                    }
                }
            }
        }

        protected void GetChart(){
            using (SqlCommand cmd = new SqlCommand("ChartsFaculty", db.DbConnect()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataReader rdr = cmd.ExecuteReader();
                Series series = FacultyChart.Series[0];
                while (rdr.Read())
                {
                    series.Points.AddXY(rdr["DepartmentName"].ToString(), rdr["NoofEmployees"].ToString());
                }
                FacultyChart.Legends.Add(new Legend("FacultyChartLegend"));
                FacultyChart.Legends[0].TableStyle = LegendTableStyle.Auto;
                FacultyChart.Legends[0].Docking = Docking.Bottom;
                FacultyChart.Legends[0].Alignment = System.Drawing.StringAlignment.Center;
                FacultyChart.Series[0].Label = "#VALY";
                FacultyChart.Series[0].Legend = "FacultyChartLegend";
                FacultyChart.Series[0].LegendText = "#VALX";
            }
        }

        protected void BindDeptList()
        {
            using (SqlCommand cmd = new SqlCommand("FetchAllDepartment", db.DbConnect()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                ddl_dept.DataSource = cmd.ExecuteReader();
                ddl_dept.DataTextField = "dept_name";
                ddl_dept.DataValueField = "dept_id";
                ddl_dept.DataBind();
            }
        }

    }
}
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


        protected void btnAddStudent_Click(object sender, EventArgs e)
        {
            using (SqlCommand cmd=new SqlCommand("AddNewStudent",db.DbConnect()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Fname", tbFname.Text.ToString().Trim());
                cmd.Parameters.AddWithValue("@Lname", tbLName.Text.ToString().Trim());
                cmd.Parameters.AddWithValue("@EnrollmentNo", tbEnroll.Text.ToString().Trim());

                cmd.Parameters.AddWithValue("@Uname", tbUname.Text.ToString().Trim());
                cmd.Parameters.AddWithValue("@Email",tbEmail.Text.ToString().Trim());
                cmd.Parameters.AddWithValue("@Password", tbPass.Text.ToString().Trim());
                cmd.Parameters.AddWithValue("@StudContactNo", tbStudContact.Text.ToString().Trim());
                cmd.Parameters.AddWithValue("@ParentContactNo", tbParentContactNo.Text.ToString().Trim());
                cmd.Parameters.AddWithValue("@Semester",DdlSem.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@Department",ddl_dept.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@RegDate", DateTime.Now.ToString("yyyy-MM-dd h:m:s"));
                cmd.Parameters.AddWithValue("@AccountStatus",1);
                if (cmd.ExecuteNonQuery()==1)
                {
                    Response.Write("<script>alert('Student Added...');</script>");
                }
                
            }
        }

        protected void btnDeleteFaculty_Click(object sender, EventArgs e)
        {
            using (SqlCommand cmd = new SqlCommand("DeleteStudentById", db.DbConnect()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                int StudId=Convert.ToInt16(StudentIdHf.Value);
                cmd.Parameters.AddWithValue("@StudentId",StudId );
                cmd.ExecuteNonQuery();
                DeleteStudentFingerPrintRecordByStudentId(StudId);
            }
        }

        public void DeleteStudentFingerPrintRecordByStudentId(int StudentId) {
            using (SqlCommand cmd = new SqlCommand("DeleteStudentFingerPrintRecordById", db.ConnectFingerDb()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@StudentId", StudentId);
                cmd.ExecuteNonQuery();
            }
        }

    }

}
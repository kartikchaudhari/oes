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

namespace oes.student
{
    public partial class EnrollToExam : System.Web.UI.Page
    {
        Database db = new Database();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                BindDeptDdl();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            
            using (SqlCommand cmd = new SqlCommand("FetchEnrollmentExamDetail", db.DbConnect()))
            {
                int DeptId = Convert.ToInt16(DdlDept.SelectedItem.Value);
                int SemId = Convert.ToInt16(DdlSem.SelectedItem.Value);
                string CurrentDate=DateTime.Now.ToShortDateString();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@DeptId",DeptId);
                cmd.Parameters.AddWithValue("@SemId",SemId);
                cmd.Parameters.AddWithValue("@CurrentDate",CurrentDate);
                SqlDataReader rdr=cmd.ExecuteReader();
                if (rdr.HasRows){
                    PanelSearchResult.Visible = true;
                    ExamListDiv.InnerHtml = "<table class='table table-bordered'><tr><th style='text-align:center;'>Exam Name</th><th style='text-align:center;'>Exam Date</th><th style='text-align:center;'>Action</th></tr>";
                    while (rdr.Read()){
                        ExamListDiv.InnerHtml += "<tr><td align='center'>" + rdr["exam_name"].ToString() + "</td><td style='text-align:center;'>" + rdr["exam_date"].ToString() + "</td><td align='center'><a class='links btn btn-primary' href='ExamInstructions.aspx?ExamId="+ rdr["exam_id"].ToString()+"'>Enroll to Exam</a></td></tr>";
                    }
                    ExamListDiv.InnerHtml += "</table>";
                }
                else {
                    PanelSearchResult.Visible = true;
                    ExamListDiv.InnerHtml = "<strong style='color:red;'>No Exam Found</strong>&nbsp;<strong>&middot;</strong>&nbsp;<a class='links' href='UpCommingExams.aspx'>Click here to See UpComming Exams</a>"; 
                }

            }
        }
        public void BindDeptDdl()
        {
            using (SqlCommand cmd = new SqlCommand("FetchAllDepartment", db.DbConnect()))
            {
                DdlDept.AppendDataBoundItems = true;
                DdlDept.DataSource = cmd.ExecuteReader();
                DdlDept.DataTextField = "dept_name";
                DdlDept.DataValueField = "dept_id";
                DdlDept.DataBind();
            }

        }
    }
}
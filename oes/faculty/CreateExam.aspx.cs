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
    public partial class CreateExam : System.Web.UI.Page
    {
        Database db = new Database();
        Functions fn = new Functions();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDeptDdl();
            }
           
        }

        protected void btnCreateExam_Click(object sender, EventArgs e)
        {
            
            //create exam name
            string ExamName = null;
            string Sem = DdlSem.SelectedItem.Value;
            string DeptName = DdlDept.SelectedItem.Text.ToUpper();
            if (DdlExamType.SelectedItem.Value == "MID") {
                ExamName = DeptName+"-"+Sem + "-" + "MID SEM EXAM";
            }
            else{
                ExamName = DeptName + "-" + Sem + "-" + "CLASS TEST";
            }


            //parse exam date 
            DateTime ExamDate = DateTime.Parse(tbExamDate.Text);
            
            //create and store examcode
            string ExamCode = CreateExamCode(DdlExamType.SelectedItem.Value, DdlDept.SelectedItem.Value, DdlSem.SelectedItem.Value, DdlSubject.SelectedItem.Value, ExamDate);
            
            //insert the exam details 
            using (SqlCommand cmd = new SqlCommand("AddNewExam",db.DbConnect()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ExamName",ExamName);
                cmd.Parameters.AddWithValue("@ExamType", DdlExamType.SelectedItem.Value.ToString());
                cmd.Parameters.AddWithValue("@DeptId", Convert.ToInt16(DdlDept.SelectedItem.Value));
                cmd.Parameters.AddWithValue("@SemId", Convert.ToInt16(DdlSem.SelectedItem.Value));
                cmd.Parameters.AddWithValue("@SubjectId", Convert.ToInt16(DdlSubject.SelectedItem.Value));
                cmd.Parameters.AddWithValue("@ExamCode",ExamCode);
                cmd.Parameters.AddWithValue("@ExamDate", DateTime.Parse(tbExamDate.Text).ToShortDateString());
                cmd.Parameters.AddWithValue("@TotalTime", Convert.ToInt16(tbTotalTime.Text.ToString()));
                cmd.Parameters.AddWithValue("@TotalQuestions", Convert.ToInt16(tbTotalQuestion.Text.ToString()));
                cmd.Parameters.AddWithValue("@PassingMarks",Convert.ToInt16(tbPassingMarks.Text.ToString()));
                cmd.Parameters.AddWithValue("@TotalMarks", Convert.ToInt16(tbTotalMarks.Text.ToString()));
                if (cmd.ExecuteNonQuery() != 0)
                {
                    Response.Write("<script>alert('Exam Added');</script>");
                }
                else 
                {
                    Response.Write("<script>alert('Error While Exam Adding');</script>");
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

        public void BindSubjectDdlByDeptId(int deptid)
        {
            using (SqlCommand cmd = new SqlCommand("fetchAllSubjectByDeptId", db.DbConnect()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@DeptId", deptid);
                DdlSubject.DataSource = cmd.ExecuteReader();
                DdlSubject.DataTextField = "subject_name";
                DdlSubject.DataValueField = "subject_id";
                DdlSubject.DataBind();
            }

        }

        public void BindSubjectDdlBySemIdAndDeptId(int deptid, int semid)
        {
            using (SqlCommand cmd = new SqlCommand("FetchAllSubjectByDeptIdSemId", db.DbConnect()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@DeptId", deptid);
                cmd.Parameters.AddWithValue("@SemId", semid);
                DdlSubject.DataSource = cmd.ExecuteReader();
                DdlSubject.DataTextField = "subject_name";
                DdlSubject.DataValueField = "subject_id";
                DdlSubject.DataBind();
            }

        }

        protected void DdlDept_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindSubjectDdlByDeptId(Convert.ToInt16(DdlDept.SelectedItem.Value));
        }

        protected void DdlSem_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindSubjectDdlBySemIdAndDeptId(Convert.ToInt16(DdlDept.SelectedItem.Value), Convert.ToInt16(DdlSem.SelectedItem.Value));
        }

        public string CreateExamCode(string ExamType,string deptid,string semid,string subjectid,DateTime ExamDt) {
            int Year = ExamDt.Year;
            if (ExamType == "MID")
            {
                return "MID-" + deptid + "-" + semid + "-" + subjectid + "-" + Year;
            }
            else 
            {
                return "CT-" + deptid + "-" + semid + "-" + subjectid + "-" + Year;
            }
        }

    }
}
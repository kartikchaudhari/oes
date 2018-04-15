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
using oes.admin.Class;
using oes.faculty.Class;
namespace oes.admin
{
    public partial class Results : System.Web.UI.Page
    {
        Database Db = new Database();
        StudentClass student = new StudentClass();
        ExamClass exam = new ExamClass();
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
            
            if (tbSearch.Text == "")
            {
                query = "select * from result";
            }
            else
            {
                query = "select * from result where enrollment_no like '" + tbSearch.Text.ToString().Trim() + "%'";
            }
            sqlcmd = new SqlCommand(query, Db.DbConnect());
            da = new SqlDataAdapter(sqlcmd);
            dt.Clear();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                //Label1.Text = "";

                GridViewResult.DataSource = dt;
                GridViewResult.DataBind();
            }
            else
            {
                GridViewResult.DataBind();
                //Label1.Text = "No Records Found";
            }
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            GridData();
        }


        public string FetchStudentNameById(string StudentId){
            int StudIdInt = Convert.ToInt16(StudentId);
            return student.FetchStudentNameById(StudIdInt);
        }

        public string FetchExamNameById(string ExamId)
        {
            int ExamIdInt = Convert.ToInt16(ExamId);
            return exam.FetchExamNamesByid(ExamIdInt);
            
        }

        protected void tbSearch_TextChanged(object sender, EventArgs e)
        {
            GridData();
        }
        

        
    }
}
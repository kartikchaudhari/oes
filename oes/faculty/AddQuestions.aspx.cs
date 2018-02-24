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
    public partial class AddQuestions : System.Web.UI.Page
    {
        Database db = new Database();
        Functions fn = new Functions();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                BindDeptDdl();
            }
            
            
            if (Request.QueryString["subject_id"] == null)
            {
                NoSubjectId.Visible = true;
                hasSubjectId.Visible = false;
            }
            else
            {
                NoSubjectId.Visible = false;
                hasSubjectId.Visible = true;
                BindHasSubjectId(Convert.ToInt16(Request.QueryString["subject_id"]));
            }


        }

        protected void QuestionTypeDdl_SelectedIndexChanged(object sender, EventArgs e)
        {
            int qtype=Convert.ToInt16(QuestionTypeDdl.SelectedValue);
            switch (qtype)
            {
                case 1:
                    mcq.Visible = true;
                    tf.Visible = false;
                    ip.Visible = false;
                    fib.Visible = false;
                break;
                    
                case 2:
                    tf.Visible = true;
                    mcq.Visible = false;
                    ip.Visible = false;
                    fib.Visible = false;
                break;

                case 3:
                    ip.Visible = true;
                    tf.Visible = false;
                    mcq.Visible = false;
                    fib.Visible = false;
                break;

                case 4:
                    fib.Visible = true;
                    ip.Visible = false;
                    tf.Visible = false;
                    mcq.Visible = false;
                break;
                default:
                    break;
            }
        }

        public void BindDeptDdl()
        {
            using (SqlCommand cmd = new SqlCommand("FetchAllDepartment", db.DbConnect()))
            {
                DepartmentDdl.AppendDataBoundItems = true;
                DepartmentDdl.DataSource = cmd.ExecuteReader();
                DepartmentDdl.DataTextField = "dept_name";
                DepartmentDdl.DataValueField = "dept_id";
                DepartmentDdl.DataBind();
            }
         
        }

        protected void DepartmentDdl_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindSubjectDdlByDeptId(Convert.ToInt16(DepartmentDdl.SelectedItem.Value));
        }

        public void BindSubjectDdlByDeptId(int deptid)
        {
            using (SqlCommand cmd = new SqlCommand("fetchAllSubjectByDeptId", db.DbConnect()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@DeptId", deptid);
                SubjectDdl.DataSource = cmd.ExecuteReader();
                SubjectDdl.DataTextField = "subject_name";
                SubjectDdl.DataValueField = "subject_id";
                SubjectDdl.DataBind();
            }

        }

        public void BindSubjectDdlBySemIdAndDeptId(int deptid,int semid)
        {
            using (SqlCommand cmd = new SqlCommand("FetchAllSubjectByDeptIdSemId", db.DbConnect()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@DeptId", deptid);
                cmd.Parameters.AddWithValue("@SemId", semid);
                SubjectDdl.DataSource = cmd.ExecuteReader();
                SubjectDdl.DataTextField = "subject_name";
                SubjectDdl.DataValueField = "subject_id";
                SubjectDdl.DataBind();
            }

        }

        protected void SemDdl_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindSubjectDdlBySemIdAndDeptId(Convert.ToInt16(DepartmentDdl.SelectedItem.Value),Convert.ToInt16(SemDdl.SelectedItem.Value));
        }

        protected void btnSubmitQuestion_Click(object sender, EventArgs e)
        {
            AddQuestionToQBank();
        }

        public void AddQuestionToQBank() {
            //String question = Server.HtmlEncode(Question.Text);
            int DeptId = Convert.ToInt16(DepartmentDdl.SelectedItem.Value);
            int SemId = Convert.ToInt16(SemDdl.SelectedItem.Value);
            int SubjectId = Convert.ToInt16(SubjectDdl.SelectedItem.Value);
            String QuestionVar = Server.HtmlEncode(Question.Text);
            String OptA = null;
            String OptB = null;
            String OptC = null;
            String OptD = null;
            int CorrectAns;
            
            int QuestionType = Convert.ToInt16(QuestionTypeDdl.SelectedItem.Value);
            
            switch (QuestionType)
            {
                case 1:
                    OptA = Server.HtmlEncode(McqOptionA.Text);
                    OptB = Server.HtmlEncode(McqOptionB.Text);
                    OptC = Server.HtmlEncode(McqOptionC.Text);
                    OptD = Server.HtmlEncode(McqOptionD.Text);
                    CorrectAns = Convert.ToInt16(DdlMcqCorrectAns.SelectedItem.Value);
                    InsertQuestionToDb(DeptId, SemId, SubjectId, QuestionType, Server.HtmlDecode(QuestionVar), Server.HtmlDecode(OptA), Server.HtmlDecode(OptB), Server.HtmlDecode(OptC), Server.HtmlDecode(OptD),CorrectAns);
                break;

                case 2:
                    if (rbOptionATrue.Checked) 
                        OptA = Server.HtmlEncode(rbOptionATrue.Text);    
                    else 
                        OptA = Server.HtmlEncode(rbOptionAFalse.Text);


                    if (rbOptionBTrue.Checked)
                        OptB = Server.HtmlEncode(rbOptionBTrue.Text);
                    else
                        OptB = Server.HtmlEncode(rbOptionBFalse.Text);
                        CorrectAns = Convert.ToInt16(DdlTfCorrectAns.SelectedItem.Value);
                        InsertQuestionToDb(DeptId, SemId, SubjectId, QuestionType, Server.HtmlDecode(QuestionVar), Server.HtmlDecode(OptA), Server.HtmlDecode(OptB),"", "", CorrectAns);
                break;

                case 3:
                break;

                case 4:
                break;


                default:
                    break;
            }



        }

        public void BindHasSubjectId(int SubjectId) {
            using (SqlCommand cmd = new SqlCommand("FetchSubjectDetailById", db.DbConnect()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@subject_id", SubjectId);

                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read()) {
                    SubjectName.Text = rdr["subject_name"].ToString();
                    SubjectSem.Text = rdr["sem_id"].ToString();
                    SubjectDept.Text=fn.FetchDeptById(rdr["dept_id"].ToString());
                }
            }
        }

        public void InsertQuestionToDb(int dept_id,int sem_id,int subject_id,int qtype,string question,string a,string b,string c,string d,int correct_ans){
            using (SqlCommand cmd = new SqlCommand("AddQuestionToQBank", db.DbConnect()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@DeptId",dept_id);
                cmd.Parameters.AddWithValue("@SemId", sem_id);
                cmd.Parameters.AddWithValue("@SubjectId", subject_id);
                cmd.Parameters.AddWithValue("@QuestionType", qtype);
                cmd.Parameters.AddWithValue("@Question", question);
                cmd.Parameters.AddWithValue("@OptA", a);
                cmd.Parameters.AddWithValue("@OptB", b);
                cmd.Parameters.AddWithValue("@OptC", c);
                cmd.Parameters.AddWithValue("@OptD", d);
                cmd.Parameters.AddWithValue("@CorrectAns", correct_ans);
                if (cmd.ExecuteNonQuery() != 0)
                {
                    Response.Write("<script>alert('Question Added');</script>");
                }
                else {
                    Response.Write("<script>alert('Error');</script>");
                }
                
                
            }
        }
        public void InsertQuestionToDb(int dept_id, int sem_id, int subject_id, int qtype, string question, string a, string b, int correct_ans)
        {
            using (SqlCommand cmd = new SqlCommand("AddQuestionToQBank", db.DbConnect()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@DeptId", dept_id);
                cmd.Parameters.AddWithValue("@SemId", sem_id);
                cmd.Parameters.AddWithValue("@SubjectId", subject_id);
                cmd.Parameters.AddWithValue("@QuestionType", qtype);
                cmd.Parameters.AddWithValue("@Question", question);
                cmd.Parameters.AddWithValue("@OptA", a);
                cmd.Parameters.AddWithValue("@OptB", b);
                cmd.Parameters.AddWithValue("@CorrectAns", correct_ans);
                if (cmd.ExecuteNonQuery() != 0)
                {
                    Response.Write("<script>alert('Question Added');</script>");
                }
                else
                {
                    Response.Write("<script>alert('Error');</script>");
                }


            }
        }
    }
}
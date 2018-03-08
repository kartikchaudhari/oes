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

using System.IO;
using System.Data.OleDb;
using System.Configuration;


using oes.App_Code;

namespace oes.faculty
{
    public partial class AddQuestions : System.Web.UI.Page
    {
        Database db = new Database();
        Functions fn = new Functions();
        bool HasSubjectIdFlag = false;
        //to store value of subject_id,sem_id,dept_id when there is query string named as 
        //subject_id.... aka has SubjectId
        int HasQueryStringSubjectId, HasQueryStringDeptId, HasQueryStringSemId;
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
                HasSubjectIdFlag = true;
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
            int DeptId, SemId, SubjectId;
            if (HasSubjectIdFlag == true)
            {
                DeptId=HasQueryStringDeptId;
                SemId=HasQueryStringSemId;
                SubjectId=HasQueryStringSubjectId;
            }
            else {
                DeptId = Convert.ToInt16(DepartmentDdl.SelectedItem.Value);
                SemId = Convert.ToInt16(SemDdl.SelectedItem.Value);
                SubjectId = Convert.ToInt16(SubjectDdl.SelectedItem.Value);
            }
            
            String QuestionVar = Server.HtmlEncode(Question.Text);
            String OptA = null;
            String OptB = null;
            String OptC = null;
            String OptD = null;
            int CorrectAns;
            int Marks;
            
            int QuestionType = Convert.ToInt16(QuestionTypeDdl.SelectedItem.Value);
            
            switch (QuestionType)
            {
                case 1:
                    OptA = Server.HtmlEncode(McqOptionA.Text);
                    OptB = Server.HtmlEncode(McqOptionB.Text);
                    OptC = Server.HtmlEncode(McqOptionC.Text);
                    OptD = Server.HtmlEncode(McqOptionD.Text);
                    CorrectAns = Convert.ToInt16(DdlMcqCorrectAns.SelectedItem.Value);
                    Marks = Convert.ToInt16(tbMarks.Text);
                    InsertQuestionToDb(DeptId, SemId, SubjectId, QuestionType, Server.HtmlDecode(QuestionVar), Server.HtmlDecode(OptA), Server.HtmlDecode(OptB), Server.HtmlDecode(OptC), Server.HtmlDecode(OptD),CorrectAns,Marks);
                        
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
                        Marks = Convert.ToInt16(tbMarks.Text);
                        InsertQuestionToDb(DeptId, SemId, SubjectId, QuestionType, Server.HtmlDecode(QuestionVar), Server.HtmlDecode(OptA), Server.HtmlDecode(OptB),"", "", CorrectAns,Marks);
                break;

                case 3:
                    OptA = Server.HtmlEncode(ItpOptionA.Text);
                    OptB = Server.HtmlEncode(ItpOptionB.Text);
                    OptC = Server.HtmlEncode(ItpOptionC.Text);
                    OptD = Server.HtmlEncode(ItpOptionD.Text);
                    CorrectAns = Convert.ToInt16(DdlItpCorrectAns.SelectedItem.Value);
                    Marks = Convert.ToInt16(tbMarks.Text);
                    InsertQuestionToDb(DeptId, SemId, SubjectId, QuestionType, Server.HtmlDecode(QuestionVar), Server.HtmlDecode(OptA), Server.HtmlDecode(OptB), Server.HtmlDecode(OptC), Server.HtmlDecode(OptD), CorrectAns,Marks);
                break;

                case 4:
                    OptA = Server.HtmlEncode(FibOptionA.Text);
                    OptB = Server.HtmlEncode(FibOptionB.Text);
                    OptC = Server.HtmlEncode(FibOptionC.Text);
                    OptD = Server.HtmlEncode(FibOptionD.Text);
                    CorrectAns = Convert.ToInt16(DdlFibCorrectAns.SelectedItem.Value);
                    Marks = Convert.ToInt16(tbMarks.Text);
                    InsertQuestionToDb(DeptId, SemId, SubjectId, QuestionType, Server.HtmlDecode(QuestionVar), Server.HtmlDecode(OptA), Server.HtmlDecode(OptB), Server.HtmlDecode(OptC), Server.HtmlDecode(OptD), CorrectAns,Marks);
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
                   
                    HasQueryStringDeptId = Convert.ToInt16(rdr["dept_id"].ToString());
                    HasQueryStringSemId = Convert.ToInt16(rdr["sem_id"].ToString());
                    HasQueryStringSubjectId = Convert.ToInt16(rdr["subject_id"].ToString());
                }
            }
        }

        public void InsertQuestionToDb(int dept_id,int sem_id,int subject_id,int qtype,string question,string a,string b,string c,string d,int correct_ans,int QMarks){
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
                cmd.Parameters.AddWithValue("@Marks", QMarks);
                
                if (cmd.ExecuteNonQuery() != 0)
                {
                    Response.Write("<script>alert('Question Added');</script>");
                }
                else {
                    Response.Write("<script>alert('Error');</script>");
                }
                
                
            }
        }
        public void InsertQuestionToDb(int dept_id, int sem_id, int subject_id, int qtype, string question, string a, string b, int correct_ans,int QMarks)
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
                cmd.Parameters.AddWithValue("@Marks", QMarks);
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

        public void ClearFields() {
            Question.Text = "";
            McqOptionA.Text = "";
            McqOptionB.Text = "";
            McqOptionC.Text = "";
            McqOptionD.Text = "";

            ItpOptionA.Text = "";
            ItpOptionB.Text = "";
            ItpOptionC.Text = "";
            ItpOptionD.Text = "";


            FibOptionA.Text = "";
            FibOptionB.Text = "";
            FibOptionC.Text = "";
            FibOptionD.Text = "";


            tbMarks.Text = "";

        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {

            string UploadDir = Server.MapPath("~/faculty/QuestionImports/");

            string conString = string.Empty;
            string FileName = Path.GetFileName(ExcelFileUpload.PostedFile.FileName);
            string extension = Path.GetExtension(ExcelFileUpload.PostedFile.FileName);



            string excelPath = UploadDir + "QuestionsImport-" + DateTime.Now.ToString(("dd-MM-yyyy--hh-mm--tt")) + extension;
            ExcelFileUpload.SaveAs(excelPath);
            switch (extension)
            {
                case ".xls": //Excel 97-03
                    conString = ConfigurationManager.ConnectionStrings["Excel03ConString"].ConnectionString;
                    break;
                case ".xlsx": //Excel 07 or higher
                    conString = ConfigurationManager.ConnectionStrings["Excel07+ConString"].ConnectionString;
                    break;

            }


            conString = string.Format(conString, excelPath);
            using (OleDbConnection excel_con = new OleDbConnection(conString))
            {
                excel_con.Open();
                string sheet1 = excel_con.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null).Rows[0]["TABLE_NAME"].ToString();
                DataTable dtExcelData = new DataTable();

                dtExcelData.Columns.AddRange(new DataColumn[11] {
                    new DataColumn("Department Id", typeof(int)),
                    new DataColumn("Semester", typeof(int)),
                    new DataColumn("Subject", typeof(int)),
                    new DataColumn("Question Type", typeof(string)),
                    new DataColumn("Question", typeof(string)),
                    new DataColumn("Option A", typeof(string)),
                    new DataColumn("Option B", typeof(string)),
                    new DataColumn("Option C", typeof(string)),
                    new DataColumn("Option D", typeof(string)),
                    new DataColumn("Correct Answer", typeof(int)),
                    new DataColumn("Marks", typeof(int)),
                });
                using (OleDbDataAdapter oda = new OleDbDataAdapter("SELECT * FROM [" + sheet1 + "]", excel_con))
                {
                    oda.Fill(dtExcelData);
                }
                excel_con.Close();

                using (SqlBulkCopy sqlBulkCopy = new SqlBulkCopy(db.DbConnect()))
                {
                    //Set the database table name
                    sqlBulkCopy.DestinationTableName = "dbo.questions";
                    sqlBulkCopy.ColumnMappings.Add("Department Id", "dept_id");
                    sqlBulkCopy.ColumnMappings.Add("Semester", "sem_id");
                    sqlBulkCopy.ColumnMappings.Add("Subject", "subject_id");
                    sqlBulkCopy.ColumnMappings.Add("Question Type", "question_type");
                    sqlBulkCopy.ColumnMappings.Add("Question", "question");
                    sqlBulkCopy.ColumnMappings.Add("Option A", "opt_a");
                    sqlBulkCopy.ColumnMappings.Add("Option B", "opt_b");
                    sqlBulkCopy.ColumnMappings.Add("Option C", "opt_c");
                    sqlBulkCopy.ColumnMappings.Add("Option D", "opt_d");
                    sqlBulkCopy.ColumnMappings.Add("Correct Answer", "correct_ans");
                    sqlBulkCopy.ColumnMappings.Add("Marks", "marks");

                    sqlBulkCopy.WriteToServer(dtExcelData);

                }
            }
            
        }

    }
}
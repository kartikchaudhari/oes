using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data.SqlTypes;

using oes.App_Code;
using oes.faculty.Class;
using System.Web.Script.Serialization;

namespace oes.faculty.WebMethods
{
    /// <summary>
    /// Summary description for Questions
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class Questions : System.Web.Services.WebService
    {
        Database db = new Database();

        

        [WebMethod]
        public void FetchAllQuestionsByDepartment(int DeptId) {
            List<QuestionsClass> QuestionsList = new List<QuestionsClass>();
            using (SqlCommand cmd = new SqlCommand("FetchAllQuestionsByDeptId",db.DbConnect()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@DeptId", DeptId);
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    QuestionsClass questions = new QuestionsClass();
                    questions.QuestionId = Convert.ToInt16(rdr["q_id"].ToString());
                    questions.DepartmentName = questions.FetchDeptById(Convert.ToInt16(rdr["dept_id"].ToString()));
                    questions.SemId = Convert.ToInt16(rdr["sem_id"].ToString());
                    questions.SubjectName = questions.FetchSubjectById(Convert.ToInt16(rdr["subject_id"].ToString()));
                    questions.QuestionType = questions.DetermineQuestionType(Convert.ToInt16(rdr["question_type"].ToString()));
                    questions.Question = rdr["question"].ToString();
                    questions.OptionA = rdr["opt_a"].ToString();
                    questions.OptionB = rdr["opt_b"].ToString();
                    questions.OptionC = rdr["opt_c"].ToString();
                    questions.OptionD = rdr["opt_d"].ToString();
                    questions.CorrectAns = rdr["correct_ans"].ToString();
                    questions.Marks = Convert.ToInt16(rdr["marks"].ToString());
                    QuestionsList.Add(questions);
                }
            }
            JavaScriptSerializer js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(QuestionsList));
        }

        [WebMethod]
        public void FetchAllQuestions()
        {
            List<QuestionsClass> QuestionsList = new List<QuestionsClass>();
            using (SqlCommand cmd = new SqlCommand("FetchAllQuestions", db.DbConnect()))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    QuestionsClass questions = new QuestionsClass();
                    questions.DepartmentName = questions.FetchDeptById(Convert.ToInt16(rdr["dept_id"].ToString()));
                    questions.SemId = Convert.ToInt16(rdr["sem_id"].ToString());
                    questions.SubjectName = questions.FetchSubjectById(Convert.ToInt16(rdr["subject_id"].ToString()));
                    questions.QuestionType = questions.DetermineQuestionType(Convert.ToInt16(rdr["question_type"].ToString()));
                    questions.Question = rdr["question"].ToString();
                    questions.OptionA = rdr["opt_a"].ToString();
                    questions.OptionB = rdr["opt_b"].ToString();
                    questions.OptionC = rdr["opt_c"].ToString();
                    questions.OptionD = rdr["opt_d"].ToString();
                    questions.CorrectAns = rdr["correct_ans"].ToString();
                    questions.Marks = Convert.ToInt16(rdr["marks"].ToString());
                    QuestionsList.Add(questions);
                }
            }
            JavaScriptSerializer js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(QuestionsList));
        }

        
    }
}

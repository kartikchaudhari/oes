using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data.SqlTypes;

using oes.App_Code;

namespace oes.faculty.Class
{
    public class QuestionsClass
    {
        Database db = new Database();
        //Functions fn = new Functions();
        public int QuestionId { get; set; }
        public string DepartmentName { get; set; }
        public int SemId { get; set; }
        public string SubjectName { get; set; }
        public string QuestionType { get; set; }
        public string Question { get; set; }
        public string OptionA { get; set; }
        public string OptionB { get; set; }
        public string OptionC { get; set; }
        public string OptionD { get; set; }
        public string CorrectAns { get; set; }
        public int Marks { get; set; }

        public string FetchDeptById(string DeptId)
        {
            String DeptName = null;
            using (SqlCommand cmd = new SqlCommand("SELECT dept_name FROM department WHERE dept_id=" + DeptId, db.DbConnect()))
            {
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    return DeptName = rdr["dept_name"].ToString();
                }
                return DeptName;
            }
        }
        public string FetchDeptById(int DeptId)
        {
            String DeptName = null;
            using (SqlCommand cmd = new SqlCommand("SELECT dept_name FROM department WHERE dept_id=" + DeptId, db.DbConnect()))
            {
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    return DeptName = rdr["dept_name"].ToString();
                }
                return DeptName;
            }
        }

        public string FetchSubjectById(int SubjectId) {
            string SubjectName = null;
            using (SqlCommand cmd = new SqlCommand("FetchSubjectDetailById", db.DbConnect()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@subject_id", SubjectId);
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    return SubjectName = rdr["subject_name"].ToString();
                }
                return SubjectName;
            }
        }

        public string DetermineQuestionType(int QuestionType) {
            string QType = null;
            switch (QuestionType)
            {
                case 1:
                    QType = "M.C.Q";
                break;
                
                case 2:
                    QType = "True or False";
                break;
                
                case 3:
                    QType = "Identify Picture";
                break;

                case 4:
                 QType = "Fill in the Blanks";
                break;
                
                default:
                    QType = "N/A";
                break;
            }
            return QType;

        }

        public string DisplayCorrectAnswerCharacter(int CorrectAnsInteger) {
            string CorrectAnsChar=null;
            switch (CorrectAnsInteger)
            {
                case 1:
                    CorrectAnsChar="A";
                break;

                case 2:
                    CorrectAnsChar = "B";
                break;
               
                case 3:
                    CorrectAnsChar = "C";
                break;
                
                case 4:
                    CorrectAnsChar = "D";
                break;
                
                default:
                    break;
            }
            return CorrectAnsChar;
        }
        

    }

    public class QuestionDataAccessLayer
    {

        public static List<QuestionsClass> GetAllQuestionsByDeptId(int DeptId)
        {
            Database db = new Database();
            List<QuestionsClass> QuestionsList = new List<QuestionsClass>();
            using (SqlCommand cmd = new SqlCommand("FetchAllQuestionsByDeptId", db.DbConnect()))
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
            return QuestionsList;
        }

        public static List<QuestionsClass> GetAllQuestionsByDeptId(int DeptId, string sortColumn)
        {
            Database db = new Database();
            List<QuestionsClass> QuestionsList = new List<QuestionsClass>();
            using (db.DbConnect())
            {
                string SqlQuery = "SELECT * FROM questions WHERE dept_id=" + DeptId;
                if (!string.IsNullOrEmpty(sortColumn))
                {
                    SqlQuery += " ORDER BY " + sortColumn;
                }


                SqlCommand cmd = new SqlCommand(SqlQuery, db.DbConnect());
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    QuestionsClass questions = new QuestionsClass();
                    questions.QuestionId = Convert.ToInt16(rdr["q_id"].ToString());
                    questions.DepartmentName = questions.FetchDeptById(Convert.ToInt16(rdr["dept_id"].ToString()));
                    questions.SemId = Convert.ToInt16(rdr["sem_id"].ToString());
                    questions.SubjectName = questions.FetchSubjectById(Convert.ToInt16(rdr["subject_id"].ToString()));
                    questions.QuestionType = questions.DetermineQuestionType(Convert.ToInt16(rdr["question_type"].ToString()));
                    questions.Question = rdr["question"].ToString().Trim();
                    questions.OptionA = rdr["opt_a"].ToString().Trim();
                    questions.OptionB = rdr["opt_b"].ToString().Trim();
                    questions.OptionC = rdr["opt_c"].ToString().Trim();
                    questions.OptionD = rdr["opt_d"].ToString().Trim();
                    questions.CorrectAns = questions.DisplayCorrectAnswerCharacter(Convert.ToInt16(rdr["correct_ans"].ToString()));
                    questions.Marks = Convert.ToInt16(rdr["marks"].ToString());
                    QuestionsList.Add(questions);
                }
            }
            return QuestionsList;
        }

        public static List<QuestionsClass> GetAllQuestionsBySemId(int SemId)
        {
            Database db = new Database();
            List<QuestionsClass> QuestionsList = new List<QuestionsClass>();
            using (SqlCommand cmd = new SqlCommand("FetchAllQuestionsBySemId", db.DbConnect()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@SemId", SemId);
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
            return QuestionsList;
        }

        public static List<QuestionsClass> GetAllQuestionsBySemIdAndDeptId(string SemId, string DeptId)
        {
            int Dept_Id = Convert.ToInt16(DeptId);
            int Sem_Id = Convert.ToInt16(SemId);
            Database db = new Database();
            List<QuestionsClass> QuestionsList = new List<QuestionsClass>();
            using (SqlCommand cmd = new SqlCommand("FetchAllQuestionsByDeptIdAndSemId", db.DbConnect()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@DeptId", Dept_Id);
                cmd.Parameters.AddWithValue("@SemId", Sem_Id);
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
            return QuestionsList;
        }

        public static List<QuestionsClass> GetAllQuestionsBySemIdAndDeptId(string SemId, string DeptId,string sortColumn)
        {
            int Dept_Id = Convert.ToInt16(DeptId);
            int Sem_Id = Convert.ToInt16(SemId);
            Database db = new Database();
            List<QuestionsClass> QuestionsList = new List<QuestionsClass>();

            
            using (db.DbConnect())
            {
                string SqlQuery = "SELECT * FROM questions WHERE dept_id=" + Dept_Id+"AND sem_id="+Sem_Id;
                if (!string.IsNullOrEmpty(sortColumn))
                {
                    SqlQuery += " ORDER BY " + sortColumn;
                }


                SqlCommand cmd = new SqlCommand(SqlQuery, db.DbConnect());
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
            return QuestionsList;
        }
        public static List<QuestionsClass> GetAllQuestionsBySemIdAndDeptIdAndSubId(string SubId, string SemId, string DeptId)
        {
            int Dept_Id = Convert.ToInt16(DeptId);
            int Sem_Id = Convert.ToInt16(SemId);
            int Subject_Id = Convert.ToInt16(SubId);
            Database db = new Database();
            List<QuestionsClass> QuestionsList = new List<QuestionsClass>();


            using (db.DbConnect())
            {
                string SqlQuery = "SELECT * FROM questions WHERE dept_id=" + Dept_Id + "AND sem_id=" + Sem_Id + "AND subject_id=" + Subject_Id;
                //if (!string.IsNullOrEmpty(sortColumn))
                //{
                //    SqlQuery += " ORDER BY " + sortColumn;
                //}


                SqlCommand cmd = new SqlCommand(SqlQuery, db.DbConnect());
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
            return QuestionsList;
        }
        public static List<QuestionsClass> GetAllQuestionsBySemIdAndDeptIdAndSubId(string SubId, string SemId, string DeptId, string sortColumn)
        {
            int Dept_Id = Convert.ToInt16(DeptId);
            int Sem_Id = Convert.ToInt16(SemId);
            int Subject_Id = Convert.ToInt16(SubId);
            Database db = new Database();
            List<QuestionsClass> QuestionsList = new List<QuestionsClass>();


            using (db.DbConnect())
            {
                string SqlQuery = "SELECT * FROM questions WHERE dept_id=" + Dept_Id + "AND sem_id=" + Sem_Id+"AND subject_id="+Subject_Id;
                if (!string.IsNullOrEmpty(sortColumn))
                {
                    SqlQuery += " ORDER BY " + sortColumn;
                }


                SqlCommand cmd = new SqlCommand(SqlQuery, db.DbConnect());
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
            return QuestionsList;
        }

        public static void DeleteQuestion(int QuestionId)
        {
            Database Db = new Database();
            using (Db.DbConnect())
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM questions WHERE q_id=@QId", Db.DbConnect());
                SqlParameter param = new SqlParameter("@QId", QuestionId);
                cmd.Parameters.Add(param);
                cmd.ExecuteNonQuery();
            }

        }

    }   
}
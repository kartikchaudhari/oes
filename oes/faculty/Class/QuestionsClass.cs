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
    }
}
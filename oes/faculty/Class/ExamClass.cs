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
    public class ExamClass
    {
        Database db = new Database();
        public int ExamId { get; set; }
        public string ExamName{get;set;}
        public string ExamType { get; set; }
        public string DeptpartmentName { get; set; }
        public int SemId { get; set; }
        public string SubjectName { get; set; }
        public string ExamCode { get; set; }
        public string ExamDate { get; set; }

        
        public string SubjectNameById(int SubjectId) {
            using (SqlCommand cmd = new SqlCommand("FetchSubjectDetailById", db.DbConnect()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@subject_id",SubjectId);
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    SubjectName = rdr["subject_name"].ToString();
                }
            }

            return SubjectName;
        }

        
    }

    public class ExamDataAccessLayer
    {
        public static List<ExamClass> GetAllExamsByDeptId(int DeptId)
        {
            Database db = new Database();
            List<ExamClass> ExamsList = new List<ExamClass>();
            using (SqlCommand cmd = new SqlCommand("FetchExamListByDeptId", db.DbConnect()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@DeptId", DeptId);
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    ExamClass exams = new ExamClass();
                    exams.ExamId = Convert.ToInt16(rdr["exam_id"].ToString());
                    exams.ExamName = rdr["exam_name"].ToString();
                    exams.ExamType = rdr["exam_type"].ToString();
                    exams.DeptpartmentName = rdr["dept_id"].ToString();
                    exams.SemId = Convert.ToInt16(rdr["sem_id"].ToString());
                    exams.SubjectName = rdr["subject_id"].ToString();
                    exams.ExamCode = rdr["exam_code"].ToString();
                    exams.ExamDate = rdr["exam_date"].ToString();
                    ExamsList.Add(exams);
                }
            }
            return ExamsList;
        }

        public static void DeleteExam(int ExamId)
        {
            Database Db = new Database();
            using (Db.DbConnect())
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM exam WHERE exam_id=@Eid", Db.DbConnect());
                SqlParameter param = new SqlParameter("@Eid", ExamId);
                cmd.Parameters.Add(param);
                cmd.ExecuteNonQuery();
            }

        }

    }   
}
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

        public string FetchExamNamesByid(int ExamId)
        {
            string ExamName = null;
            using (SqlCommand cmd = new SqlCommand("FetchExamDetailById", db.DbConnect()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ExamId", ExamId);
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    ExamName = rdr["exam_name"].ToString();
                }
            }
            return ExamName;
        }

        
    }

    public class ExamDataAccessLayer
    {
        Database db = new Database();
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
                    exams.SubjectName = FetchSubjectNameById(Convert.ToInt16(rdr["subject_id"].ToString()));
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
        public static void UpdateExam(int ExamId, string ExamDate) {
            Database db = new Database();
            using (SqlCommand cmd = new SqlCommand("UpdateExamDate", db.DbConnect()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ExamID", ExamId);
                cmd.Parameters.AddWithValue("@ExamDate", ExamDate);
                cmd.ExecuteNonQuery();
            }
        }
        public static List<ExamClass> GetUpCommingExam(string Dept_ID,string SemId,string CurDate)
        {
            Database db = new Database();
            List<ExamClass> ExamsList = new List<ExamClass>();
            using (SqlCommand cmd = new SqlCommand("FetchUpCommingExams", db.DbConnect()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@DeptId", Convert.ToInt16(Dept_ID));
                cmd.Parameters.AddWithValue("@SemId", Convert.ToInt16(SemId));
                //cmd.Parameters.AddWithValue("@CurrentDate", CurDate);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    while (rdr.Read())
                    {
                        DateTime ExamDate = DateTime.Parse(rdr["exam_date"].ToString());
                        DateTime CurrentDate = DateTime.Parse(DateTime.Now.ToShortDateString());
                        int ResultCompare = DateTime.Compare(CurrentDate,ExamDate);
                        if (ResultCompare == 0 || ResultCompare == -1)
                        {
                            ExamClass UpCommingExams = new ExamClass();
                            UpCommingExams.ExamName = rdr["exam_name"].ToString();
                            UpCommingExams.ExamType = DetermineExamType(rdr["exam_type"].ToString());
                            UpCommingExams.ExamDate = rdr["exam_date"].ToString();
                            UpCommingExams.ExamCode = rdr["exam_code"].ToString();
                            UpCommingExams.SubjectName = FetchSubjectNameById(Convert.ToInt16(rdr["subject_id"].ToString()));
                            ExamsList.Add(UpCommingExams);
                        }
                        
                    }
                }
            }
            return ExamsList;
        }
        public static string FetchSubjectNameById(int SubjectId)
        {
            Database db = new Database();
            string SubjectName = null;
            using (SqlCommand cmd = new SqlCommand("FetchSubjectDetailById", db.DbConnect()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@subject_id", SubjectId);

                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    SubjectName = rdr["subject_name"].ToString();
                }
            }
            return SubjectName;
        }

        public static string  DetermineExamType(string ExamTypeShortCode){
            string ExamType = null;
            if (ExamTypeShortCode=="MID") {
                ExamType = "MID SEM EXAM";
            }
            else{
                ExamType="CLASS TEST";
            }
            return ExamType;
        }

      
    }   
}
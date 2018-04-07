using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data.SqlTypes;

using oes.App_Code;
namespace oes.student.Class
{
    public class ResultArchive
    {
        Database Db = new Database();
        public string ExamName { get; set; }
        public string ExamType { get; set; }
        public string ExamDate { get; set; }
        public string SubjectName { get; set; }
        public int TotalMarks { get; set; }
        public int PassingMarks { get; set; }
        public int ObtainedMarks { get; set; }
        public string Result { get; set; }

        public string FetchExamDetailsById(int ExamId, int DetailIndex)
        {
            string ExamData = null;
            using (SqlCommand cmd = new SqlCommand("FetchExamDetailById", Db.DbConnect()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ExamId", ExamId);
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {

                    switch (DetailIndex)
                    {
                        case 1://exam name
                            ExamData = rdr["exam_name"].ToString();
                            break;

                        case 2://exam type
                            ExamData = DetermineExamType(rdr["exam_type"].ToString());
                            break;

                        case 3://exam type
                            ExamData = rdr["exam_date"].ToString();
                            break;

                        case 4://subject name
                            ExamData = rdr["subject_id"].ToString();
                            break;

                        case 5://total marks
                            ExamData = rdr["total_marks"].ToString();
                            break;
                        case 6://passing marks
                            ExamData = rdr["passing_marks"].ToString();
                            break;
                        default:
                            break;
                    }
                }
            }
            return ExamData;
        }

        public string FetchSubjectById(int SubjectId)
        {
            string SubjectName = null;
            using (SqlCommand cmd = new SqlCommand("FetchSubjectDetailById", Db.DbConnect()))
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

        public string DetermineExamType(string ExamType) {
            string ExamTypeFull = null;
            if (ExamType == "MID")
            {
                ExamTypeFull = "MID SEMESTER";
            }
            else
            {
                ExamTypeFull = "CLASS TEST";
            }
            return ExamTypeFull;
        }
        

    }   

    public class ResultArchiveDataAccessLayer { 
        public static List<ResultArchive> FetchStudentResult(int StudentId){
            Database db = new Database();
            List<ResultArchive> ResultList = new List<ResultArchive>(); 
            using(SqlCommand cmd=new SqlCommand("FetchResultArchiveById",db.DbConnect()))
	        {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@StudentId",StudentId);

                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    ResultArchive RsA = new ResultArchive();
                    RsA.ExamName = RsA.FetchExamDetailsById(Convert.ToInt16(rdr["exam_id"].ToString()),1);
                    RsA.ExamType = RsA.FetchExamDetailsById(Convert.ToInt16(rdr["exam_id"].ToString()), 2);
                    RsA.ExamDate = RsA.FetchExamDetailsById(Convert.ToInt16(rdr["exam_id"].ToString()), 3);
                    RsA.SubjectName=RsA.FetchExamDetailsById(Convert.ToInt16(rdr["exam_id"].ToString()),4);
                    RsA.TotalMarks = Convert.ToInt16(RsA.FetchExamDetailsById(Convert.ToInt16(rdr["exam_id"].ToString()),5));
                    RsA.PassingMarks = Convert.ToInt16(RsA.FetchExamDetailsById(Convert.ToInt16(rdr["exam_id"].ToString()), 6)); 
                    RsA.ObtainedMarks = Convert.ToInt16(rdr["marks"].ToString());
                    RsA.Result = DeterMineResultStatus(rdr["result_status"].ToString());
                    
                    ResultList.Add(RsA);
                }
	    
	        }
            return ResultList;

        }

        public static string DeterMineResultStatus(string ResultStatus){
            string ResultStatusFull = null;
            if (ResultStatus == "0")
            {
                ResultStatusFull = "FAIL";
            }
            else
            {
                ResultStatusFull = "PASS";
            }
            return ResultStatusFull;
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Collections;
using System.Configuration;

using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data.SqlTypes;

using oes.App_Code;

using System.Text;
using System.Net;
using System.IO;

using oes.student.Class;

//for intenet connection
using System.Runtime;
using System.Runtime.InteropServices;

namespace oes.student
{
    public partial class Results : System.Web.UI.Page
    {
        Database Db = new Database();

        //student details
        int StudentsResultMarks;
        string StudentParentNo = null;
        string StudentEnrollment = null;
        //ExamDetails
        int SubjectIdGlobal = 0;
        int DeptIdGlobal = 0;
        int GlobalExamTotalMarks=0;

        //internet connection status
        public int status;
        //sms object
        public sms ResultSmsObject;

        //api,username,password
        public string api = "karti4WnRYtbOfIDo2iS";
        public string uname;
        public string pass;

        
        protected void Page_Load(object sender, EventArgs e)
        {
            status = Convert.ToInt16(Application["IsConntectedToNet"].ToString());
            if (Session["StartExamFlag"]==null)
            {
                ClientScript.RegisterStartupScript(typeof(Page), "closePage", "window.close();", true);
                Response.Redirect("EnrollToExam.aspx");
            }
            ArrayList al = (ArrayList)Session["AnswerList"];
            
            resultGrid.DataSource = al;
            resultGrid.DataBind();

            //calculate the total correct ansewer
            int m = 0;
            for (int i = 0; i < al.Count; i++)
            {
                m += Convert.ToInt16(al[i].ToString());
            }
            StudentsResultMarks = m;
            lblStudentsGotMarks.Text = StudentsResultMarks.ToString();
            lblExamTotalMarks.Text = al.Count.ToString();
            GlobalExamTotalMarks = al.Count;

            // Save the results into the database.
            if (IsPostBack == false)
            {
                try
                {
                    int UserId = Convert.ToInt16(Session["id"].ToString());
                    int Eid = Convert.ToInt16(Session["ExamId"].ToString());
                    SaveResultToDb(UserId, Eid, StudentsResultMarks);
                    SendMarksSms();
                }
                catch (Exception expct)
                {
                    errorLabel.Text = expct.ToString();
                }
            }

        }

        public void LoginToWay2Sms()
        {
            using (SqlCommand cmd = new SqlCommand("FetchSMSSettings", Db.DbConnect()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    ResultSmsObject = new sms(api,rdr["username"].ToString(),rdr["password"].ToString());
                }
            }

        }

        public void SendMarksSms() {
            if (status==1)
            {
                LoginToWay2Sms();
                string Message = "G.P.Waghai-" + FetchDeptNameById(DeptIdGlobal) + " " + StudentEnrollment + " " + "got " + StudentsResultMarks + "/ " + GlobalExamTotalMarks + " in " + FetchSubjectNameById(SubjectIdGlobal) + " Subject";
                ResultSmsObject.SendSms(Message, StudentParentNo);    
            }    
        }
        public void SaveResultToDb(int StudentId,int ExamId,int StudentMarks){
            //student data
            string EnrollmentNo=null;
            
            //Exam Data
            int DeptId=0, SemId=0,SubjectId=0,PassingMarks=0;

            //Result Data
            int ResultStatus=0;
            
            //get the user details
            using (SqlCommand cmd = new SqlCommand("FetchStudentData", Db.DbConnect()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id",StudentId);
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    StudentParentNo = rdr["parent_contact"].ToString();
                    EnrollmentNo = rdr["enrollment_no"].ToString();
                    StudentEnrollment = EnrollmentNo;
                }
            }

            //get the exam details
            using (SqlCommand cmd=new SqlCommand("FetchExamDetailById",Db.DbConnect()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ExamId",ExamId);
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    DeptId = Convert.ToInt16(rdr["dept_id"].ToString());
                    SemId = Convert.ToInt16(rdr["sem_id"].ToString());
                    SubjectId = Convert.ToInt16(rdr["subject_id"].ToString());
                    SubjectIdGlobal = SubjectId;
                    PassingMarks = Convert.ToInt16(rdr["passing_marks"].ToString());
                }

                if (StudentMarks > PassingMarks)
                {
                    ResultStatus = 1; //pass
                }
                else
                {
                    ResultStatus = 0; //fail
                }
            }

            //add result data to db
            using (SqlCommand cmd=new SqlCommand("AddResultToDb",Db.DbConnect()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@StudentId",StudentId);
                cmd.Parameters.AddWithValue("@EnrllmentNo",EnrollmentNo);
                cmd.Parameters.AddWithValue("@ExamId",ExamId);
                cmd.Parameters.AddWithValue("@DeptId",DeptId);
                cmd.Parameters.AddWithValue("@SemId",SemId);
                cmd.Parameters.AddWithValue("@SubjectId", SubjectId);
                cmd.Parameters.AddWithValue("@ResultStatus",ResultStatus);
                cmd.Parameters.AddWithValue("@Marks",StudentMarks);
                cmd.ExecuteNonQuery();
                //send marks                                              
                SendMarksSms();
            }
        }

        public string FetchSubjectNameById(int SubjectId) {
            string SubjectName = null;
            using (SqlCommand cmd=new SqlCommand("FetchSubjectDetailById",Db.DbConnect()))
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

        public string FetchDeptNameById(int DeptId)
        {
            string DeptName = null;
            using (SqlCommand cmd = new SqlCommand("FetchSubjectDetailById", Db.DbConnect()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@subject_id", DeptId);

                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    DeptName = rdr["dept_name"].ToString();
                }
            }
            return DeptName;
        }

        protected void btnFininshExam_Click(object sender, EventArgs e)
        {
            Session["AnswerList"] = null;
            Session["ExamID"] = null;
            Session["StartExamFlag"] = null;
            ClientScript.RegisterStartupScript(typeof(Page), "closePage", "window.close();", true);
            //foreach (string key in Session.Keys)
            //{
            //    Response.Write(key+"-->"+Session[key].ToString()+"<br>");
            //}
        }
    }
}

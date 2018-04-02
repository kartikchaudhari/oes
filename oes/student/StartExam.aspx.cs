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
using System.Collections;

using oes.App_Code;
using oes.student.Class;



namespace oes.student
{
    public partial class StartExam : System.Web.UI.Page
    {
        Database db = new Database();
        protected void Page_Load(object sender, EventArgs e)
        {

            questionDetails.DataBind();
            Session["StartExamFlag"] = 1;
            if (Request.QueryString["ExamId"] != null)
            {
                //create question buttons
                CreateQuestionButtonAndExanDetail(Convert.ToInt16(Request.QueryString["ExamId"].ToString()));
            }
            else
            {
                Response.Write("Plese select the exam..");
            }

            
        }


        public void CreateQuestionButtonAndExanDetail(int ExamId) {
            //we are not using it
            int NoOfquestionInExam;
            using (SqlCommand cmd = new SqlCommand("FetchEnrollmentExamDetailReturnQestionCount", db.DbConnect()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ExamId",ExamId);
                cmd.Parameters.AddWithValue("@NoOfQuestion", SqlDbType.Int);
                cmd.Parameters["@NoOfQuestion"].Direction = ParameterDirection.Output;
                cmd.ExecuteNonQuery();
                NoOfquestionInExam = Convert.ToInt16(cmd.Parameters["@NoOfQuestion"].Value.ToString());
                TotalQuestionCount.InnerHtml = NoOfquestionInExam.ToString();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {   
                    //fetch the exam fullname
                    ExamFullName.InnerHtml= rdr["exam_name"].ToString();
                }
            }


            //variable i is used for the text property of each button
            int i=1;
            using (SqlCommand cmd = new SqlCommand("FetchQuestionsToQuestionPaper", db.DbConnect()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ExamId", ExamId);
                SqlDataReader rdr = cmd.ExecuteReader();
                
                while (rdr.Read())
                {
                    HyperLink btn = new HyperLink();
                    //set the value of i to display it on button
                    btn.Text = i.ToString();

                    //get the question id 
                    btn.ID = rdr["QId"].ToString();
                    btn.CssClass = "btn InstButton QuestBtn";
                    btn.Attributes.Add("onclick", "alert('" + rdr["QId"].ToString() + "');");
                    btnPanel.Controls.Add(btn);
                    i++;
                }
            }
        }

        protected void SaveNext_Click(object sender, EventArgs e)
        {
            System.Data.DataRowView dr = (System.Data.DataRowView)questionDetails.DataItem;

            Answer a = new Answer();
            int ExamId = Convert.ToInt16(Request.QueryString["ExamId"].ToString());
            a.QuestionID = dr["q_id"].ToString();
            a.CorrectAnswer = dr["correct_ans"].ToString();
            a.MarksOfQuestion = Convert.ToInt16(dr["marks"].ToString());
            a.UserAnswer = ddlAnswer.SelectedValue.ToString();

            ArrayList al = (ArrayList)Session["AnswerList"];
            al.Add(a);
            Session.Add("AnswerList", al);

            if (questionDetails.PageIndex == questionDetails.PageCount - 1)
            {

                Response.Redirect("Results.aspx");
            }
            else
            {
                questionDetails.PageIndex++;
                AddAnsewerToDb(Convert.ToInt16(dr["q_id"].ToString()), ExamId, Convert.ToInt16(dr["correct_ans"].ToString()), Convert.ToInt16(ddlAnswer.SelectedValue.ToString()));

            }

            if (questionDetails.PageIndex == questionDetails.PageCount - 1)
            {
                SaveNext.Text = "Finished";
            }


        }

        public void AddAnsewerToDb(int Question_Id,int Exam_Id,int Correct_ans,int User_ans) {
            using (SqlCommand cmd=new SqlCommand("AddToAnswers",db.DbConnect()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@QuestionId",Question_Id);
                cmd.Parameters.AddWithValue("@ExamId",Exam_Id);
                cmd.Parameters.AddWithValue("@CorrectAns",Correct_ans);
                cmd.Parameters.AddWithValue("@UserAns",User_ans);
                cmd.ExecuteNonQuery();
            }
        }
    }
}
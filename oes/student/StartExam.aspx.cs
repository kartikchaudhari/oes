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

namespace oes.student
{
    public partial class StartExam : System.Web.UI.Page
    {
        Database db = new Database();
        protected void Page_Load(object sender, EventArgs e)
        {

            CreateQuestionButtonAndExanDetail(Convert.ToInt16(Request.QueryString["ExamId"].ToString()));
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            for (int i = 0,j=60; i < 30; i++,j++)
            {
                
            }
        }

        protected void btnReurnId(object sender, CommandEventArgs e)
        {
            //Response.Write("<script>alert('" + e.CommandArgument.ToString() + "');</script>");
            
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
    }
}
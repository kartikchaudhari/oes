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

namespace oes.faculty
{
    public partial class AddQuestionToExam : System.Web.UI.Page
    {
        Database db = new Database();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Request.QueryString["ExamId"] != null)
            {
                LoadExamData(Convert.ToInt16(Request.QueryString["ExamId"].ToString()));
                //NoOfQAdded.Text = AddedQCounter.ToString();
            }
            else
            {
                Response.Redirect("ManageExams.aspx?ErrorId=1");
            }
        }

       

        public void LoadExamData(int ExamId) {
            using (SqlCommand cmd = new SqlCommand("FetchExamDetailById", db.DbConnect()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ExamId", ExamId);
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    hf_sem_id.Value = rdr["sem_id"].ToString();
                    hf_dept_id.Value = rdr["dept_id"].ToString();
                    hf_subject_id.Value = rdr["subject_id"].ToString();
                }
            }
        }

        protected void btnAddQuestion_Click(object sender, EventArgs e)
        {
            
            int rowIndex = Convert.ToInt32(((sender as Button).NamingContainer as GridViewRow).RowIndex);
            GridViewRow row = CreateQPapperQListGridView.Rows[rowIndex];

            //get exam and question id to insert into question paper table 
            int ExamId = Convert.ToInt16(Request.QueryString["ExamId"].ToString());
            int Question_Id = Convert.ToInt16((row.FindControl("lblQId") as Label).Text);
            //lblNoOfQAdded.Text = AddQuestionsToQPaper(ExamId,Question_Id).ToString();
            AddQuestionsToQPaper(ExamId, Question_Id);
            //(row.FindControl("btnAddQuestion") as Button).Visible = false;
            //Response.Write(Question_Id);
        }

        //int NoQAddedToQPaper;
        public void AddQuestionsToQPaper(int EId,int QId){

            using (SqlCommand cmd = new SqlCommand("AddQToPaperAndReturnNoOfQ", db.DbConnect()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@eid", EId);
                cmd.Parameters.AddWithValue("@qid", QId);
                cmd.Parameters.Add("@NoOfQ",SqlDbType.Int);
                cmd.Parameters["@NoOfQ"].Direction = ParameterDirection.Output;
                cmd.ExecuteNonQuery();
                //Response.Write("<script>alert('" + cmd.Parameters["@NoOfQ"].Value.ToString() + "');</script>");

                //NoQAddedToQPaper=Convert.ToInt16(cmd.Parameters["@NoOfQ"].Value.ToString());
                ScriptManager.RegisterStartupScript(Page, typeof(Page), "somekey", "AlertSuccess();", true);
                ScriptManager.RegisterStartupScript(Page, typeof(Page), "somekey2", "AdjustImgSize();", true);
                //Page.ClientScript.RegisterStartupScript(this.GetType(), "helloAlert", "AlertSuccess();", true);
              
            }
            //return NoQAddedToQPaper;
        }
    }
}
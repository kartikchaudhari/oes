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
        	

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            for (int i = 0,j=60; i < 30; i++,j++)
            {
                HyperLink btn = new HyperLink();
                //Button btn = new Button();
                btn.Text = i.ToString();
                btn.ID = j.ToString();
                btn.CssClass = "btn InstButton QuestBtn";
                btn.Attributes.Add("onclick", "alert('" + j.ToString() + "');");
                btnPanel.Controls.Add(btn);
            }
        }

        protected void btnReurnId(object sender, CommandEventArgs e)
        {
            //Response.Write("<script>alert('" + e.CommandArgument.ToString() + "');</script>");
            
        }

        protected void CreateQuestionButton(int ExamId) {
            using (SqlCommand cmd = new SqlCommand("FetchEnrollmentExamDetail", db.DbConnect()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ExamId",ExamId);
                SqlDataReader rdr = cmd.ExecuteReader();
                //while (rdr.Read())
                //{
                    
                //}
            }
        }
    }
}
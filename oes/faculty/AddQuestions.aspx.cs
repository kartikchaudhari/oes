using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace oes.faculty
{
    public partial class AddQuestions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Request.QueryString["subject_id"] == null)
            //{
            //    Response.Redirect("Subjects.aspx");
            //}
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String str = Server.HtmlEncode(Question.Text);
            Label1.Text = Server.HtmlDecode(str);
        }

        protected void QuestionTypeDdl_SelectedIndexChanged(object sender, EventArgs e)
        {
            int qtype=Convert.ToInt16(QuestionTypeDdl.SelectedValue);
            switch (qtype)
            {
                case 1:
                    mcq.Visible = true;
                    tf.Visible = false;
                    ip.Visible = false;
                    fib.Visible = false;
                break;
                    
                case 2:
                    tf.Visible = true;
                    mcq.Visible = false;
                    ip.Visible = false;
                    fib.Visible = false;
                break;

                case 3:
                    ip.Visible = true;
                    tf.Visible = false;
                    mcq.Visible = false;
                    fib.Visible = false;
                break;

                case 4:
                    fib.Visible = true;
                    ip.Visible = false;
                    tf.Visible = false;
                    mcq.Visible = false;
                break;
                default:
                    break;
            }
        }
    }
}
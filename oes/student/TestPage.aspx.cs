using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using oes.student.Class;
namespace oes.student
{
    public partial class TestPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ArrayList al = (ArrayList)Session["AnswerList"];
           
           foreach(object o in al)
            {
                Answer ans = (Answer)o;
                Response.Write(ans.QuestionID+"<br>");
            }
        }
    }
}
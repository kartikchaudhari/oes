using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using oes.faculty.Class;
namespace oes.admin
{
    public partial class ManageQuestions : System.Web.UI.Page
    {
        QuestionsClass question = new QuestionsClass();
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void DdlDept_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView1.DataSourceID = null;
            GridView1.DataSource = DsGvByDept;
            GridView1.DataBind();
        }

        protected void DdlSem_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView1.DataSource = DsGvByDeptSem;
            GridView1.DataBind();
        }

        protected void DdlSubject_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView1.DataSource = DsGvByDeptSemSub;
            GridView1.DataBind();
        }

        public string FetchDeptById(string DeptIdString)
        {
            int DeptIdInt = Convert.ToInt16(DeptIdString);
            return question.FetchDeptById(DeptIdInt);
        }

        public string FetchSubjectById(string SubjectIdString)
        {
            int SubjectIdInt = Convert.ToInt16(SubjectIdString);
            return question.FetchSubjectById(SubjectIdInt);
            
        }

        public string DetermineQType(string QTypeString)
        {
            int QTypeInt = Convert.ToInt16(QTypeString);
            return question.DetermineQuestionType(QTypeInt);

        }

        public string CorrectAnsChar(string CorrectAnsString)
        {
            int CorrectAnsInt = Convert.ToInt16(CorrectAnsString);
            return question.DisplayCorrectAnswerCharacter(CorrectAnsInt);

        }
    }

   
   
}
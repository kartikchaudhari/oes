using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;

using oes.App_Code;

using oes.faculty.Class;
namespace oes.faculty
{
    public partial class ManageQuestions : System.Web.UI.Page
    {
        Database db = new Database();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadFacultyData(Convert.ToInt16(Session["id"]));
                //GetDataIntoQuestionGv(LoadFacultyData(Convert.ToInt16(Session["id"])));
            }
        }

        public int LoadFacultyData(int id)
        {
            int DeptId=0;
            using (SqlCommand cmd = new SqlCommand("FetchFacultyData", db.DbConnect()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", id);
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    hf_dept_id.Value = rdr["dept_id"].ToString();
                    //DeptId=Convert.ToInt16(rdr["dept_id"].ToString());
                }
                
            }
            return DeptId;
        }

        
        //private void GetDataIntoQuestionGv(int DeptId) {
        //    GridViewQuestionList.DataSource = QuestionDataAccessLayer.GetAllQuestionsByDeptId(DeptId);
        //    GridViewQuestionList.DataBind();
        //}

        protected void cbQIdHeader_CheckedChanged(object sender, EventArgs e)
        {
            foreach (GridViewRow gridViewRow in GridViewQuestionList.Rows)
            {
                ((CheckBox)gridViewRow.FindControl("cbSelectedQuestion")).Checked = ((CheckBox)sender).Checked;
            }
        }


        protected void cbSelectedQuestion_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void DdlSem_SelectedIndexChanged(object sender, EventArgs e)
        {
            //GridViewQuestionList.DataSource;
            //GridViewQuestionList.DataBind();
        }
    }
}
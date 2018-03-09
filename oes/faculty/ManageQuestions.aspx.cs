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
            LoadFacultyData(Convert.ToInt16(Session["id"]));
            //if (!IsPostBack)
            //{
            //    BindSubjectDdlByDeptId(LoadFacultyData(Convert.ToInt16(Session["id"])));
            //}
        }

        
        int DeptId;
        public int LoadFacultyData(int id)
        {
            using (SqlCommand cmd = new SqlCommand("FetchFacultyData", db.DbConnect()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", id);
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    hf_dept_id.Value = rdr["dept_id"].ToString();
                    DeptId=Convert.ToInt16(rdr["dept_id"].ToString());
                }
            }
            return DeptId;
        }

       

        //public void BindSubjectDdlByDeptId(int deptid)
        //{
        //    using (SqlCommand cmd = new SqlCommand("fetchAllSubjectByDeptId", db.DbConnect()))
        //    {
        //        cmd.CommandType = CommandType.StoredProcedure;
        //        cmd.Parameters.AddWithValue("@DeptId", deptid);
        //        DdlSubject.DataSource = cmd.ExecuteReader();
        //        DdlSubject.DataTextField = "subject_name";
        //        DdlSubject.DataValueField = "subject_id";
        //        DdlSubject.DataBind();
        //    }

        //}

        //public void BindSubjectDdlBySemIdAndDeptId(int deptid, int semid)
        //{
        //    using (SqlCommand cmd = new SqlCommand("FetchAllSubjectByDeptIdSemId", db.DbConnect()))
        //    {
        //        cmd.CommandType = CommandType.StoredProcedure;
        //        cmd.Parameters.AddWithValue("@DeptId", deptid);
        //        cmd.Parameters.AddWithValue("@SemId", semid);
        //        DdlSubject.DataSource = cmd.ExecuteReader();
        //        DdlSubject.DataTextField = "subject_name";
        //        DdlSubject.DataValueField = "subject_id";
        //        DdlSubject.DataBind();
        //    }

        //}

        //public void BindQuestionListGvByDeptIdAndSemId(int deptid, int semid)
        //{
        //    GridViewQuestionList.DataSource = QuestionDataAccessLayer.GetAllQuestionsBySemIdAndDeptId(semid,deptid);
        //    GridViewQuestionList.DataBind();
        //}

        //public void BindQuestionListGvByDeptId(int deptid)
        //{
        //    GridViewQuestionList.DataSource = QuestionDataAccessLayer.GetAllQuestionsByDeptId(deptid;
        //    GridViewQuestionList.DataBind();
        //}

        //protected void DdlSubject_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    BindSubjectDdlBySemIdAndDeptId(Convert.ToInt16(DeptId), Convert.ToInt16(DdlSem.SelectedItem.Value));
        //    //if (DdlSemFlag == 1)
        //    //{
        //    //    BindQuestionListGvByDeptIdAndSemId(Convert.ToInt16(DdlDdlSubject.SelectedItem.Value), Convert.ToInt16(DdlSem.SelectedItem.Value));
        //    //}
        //    //else {
        //    //    BindQuestionListGvByDeptId(Convert.ToInt16(DdlDdlSubject.SelectedItem.Value));
        //    //}
        //}

        
        //protected void btnDelete_Click(object sender, EventArgs e)
        //{
        //    List<string> lstQuestionToDelete=new List<string>();
        //    foreach (GridViewRow gridViewRow in GridViewQuestionList.Rows)
        //    {
        //        if (((CheckBox)gridViewRow.FindControl("cbDelete")).Checked)
        //        {
        //            string questionId = ((Label)gridViewRow.FindControl("lblQId")).Text;
        //            lstQuestionToDelete.Add(questionId);
        //        }
        //    }
        //    if (lstQuestionToDelete.Count > 0)
        //    {
        //        lblMsg.ForeColor = System.Drawing.Color.Red;
        //        lblMsg.Text = lstQuestionToDelete.Count.ToString() + " row(s) deleted";
        //        //GridViewQuestionList.DataSourceID
        //        //GridViewQuestionList.DataSource = QuestionDataAccessLayer.GetAllQuestionsByDeptId(LoadFacultyData(Convert.ToInt16(Session["id"])), GridViewQuestionList.SortExpression.ToString());
        //        //GridViewQuestionList.DataBind();
        //    }
        //    else 
        //    {
        //        lblMsg.ForeColor = System.Drawing.Color.Red;
        //        lblMsg.Text =  "No rows selected to deleted";
        //    }
        //}

        protected void cbDelete_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox headerCheckBox = (CheckBox)GridViewQuestionList.HeaderRow.FindControl("cbDeleteHeader");
            if (headerCheckBox.Checked)
            {
                headerCheckBox.Checked = ((CheckBox)sender).Checked;
            }
            else
            {
                bool allCheckBoxcesChecked = true;
                foreach (GridViewRow gridViewRow in GridViewQuestionList.Rows)
                {
                    if (!((CheckBox)gridViewRow.FindControl("cbDelete")).Checked)
                    {
                        allCheckBoxcesChecked = false;
                        break;
                    }
                }
                headerCheckBox.Checked = allCheckBoxcesChecked;
            }
        }
        
    }
}
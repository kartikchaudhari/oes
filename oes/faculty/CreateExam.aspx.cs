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
    public partial class CreateExam : System.Web.UI.Page
    {
        Database db = new Database();
        Functions fn = new Functions();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDeptDdl();
            }
           
        }

        protected void btnCreateExam_Click(object sender, EventArgs e)
        {
            Response.Write(tbSTime.Text);
        }

        public void BindDeptDdl()
        {
            using (SqlCommand cmd = new SqlCommand("FetchAllDepartment", db.DbConnect()))
            {
                DdlDept.AppendDataBoundItems = true;
                DdlDept.DataSource = cmd.ExecuteReader();
                DdlDept.DataTextField = "dept_name";
                DdlDept.DataValueField = "dept_id";
                DdlDept.DataBind();
            }

        }

        public void BindSubjectDdlByDeptId(int deptid)
        {
            using (SqlCommand cmd = new SqlCommand("fetchAllSubjectByDeptId", db.DbConnect()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@DeptId", deptid);
                DdlSubject.DataSource = cmd.ExecuteReader();
                DdlSubject.DataTextField = "subject_name";
                DdlSubject.DataValueField = "subject_id";
                DdlSubject.DataBind();
            }

        }

        public void BindSubjectDdlBySemIdAndDeptId(int deptid, int semid)
        {
            using (SqlCommand cmd = new SqlCommand("FetchAllSubjectByDeptIdSemId", db.DbConnect()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@DeptId", deptid);
                cmd.Parameters.AddWithValue("@SemId", semid);
                DdlSubject.DataSource = cmd.ExecuteReader();
                DdlSubject.DataTextField = "subject_name";
                DdlSubject.DataValueField = "subject_id";
                DdlSubject.DataBind();
            }

        }

        protected void DdlDept_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindSubjectDdlByDeptId(Convert.ToInt16(DdlDept.SelectedItem.Value));
        }

        protected void DdlSem_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindSubjectDdlBySemIdAndDeptId(Convert.ToInt16(DdlDept.SelectedItem.Value), Convert.ToInt16(DdlSem.SelectedItem.Value));
        }

    }
}
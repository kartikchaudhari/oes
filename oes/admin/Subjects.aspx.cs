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
namespace oes.admin
{
    public partial class Subjects : System.Web.UI.Page
    {
        public Database db = new Database();
        public Functions fn = new Functions();
        protected void Page_Load(object sender, EventArgs e){
            //if (Session["id"] == null)
            //{
            //    Response.Redirect("Login.aspx?eid=1");
            //}
            //else {
            if (!IsPostBack)
            {
                BindDeptRepeater();
            }
            //}
        }

        private void BindDeptRepeater()
        {
            using (SqlCommand cmd = new SqlCommand("FetchAllSubject", db.DbConnect()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtSubject = new DataTable();
                    sda.Fill(dtSubject);
                    SubjectRepeater.DataSource = dtSubject;
                    SubjectRepeater.DataBind();
                }
            }
        }


        protected void submit_btn_Click(object sender, EventArgs e)
        {
            using (SqlCommand cmd = new SqlCommand("AddSubject", db.DbConnect()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@sub_name", tbSubjectName.Text);
                cmd.Parameters.AddWithValue("@sub_code", tbSubjectCode.Text);
                cmd.Parameters.AddWithValue("@dept_id", ddl_dept.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@sem_id", ddl_sem.SelectedValue.ToString());
                cmd.ExecuteNonQuery();

                //redirect ot departments  page with message.
                Response.Redirect("Subjects.aspx?action=add");

                //clear textboxes
                TextBox[] tb = new TextBox[2] { tbSubjectName, tbSubjectCode };
                fn.CleartextBoxes(tb);
            }
            this.BindDeptRepeater();
        }

       protected string FetchDeptById(string DeptId) {
            String DeptName=null;
            using (SqlCommand cmd = new SqlCommand("SELECT dept_name FROM department WHERE dept_id=" + DeptId, db.DbConnect())) {
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    return DeptName = rdr["dept_name"].ToString();
                }
                return DeptName;
            }
            
        }
    }
}
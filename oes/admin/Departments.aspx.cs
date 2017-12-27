using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services; //webmethod namespace

using System.Data;
using System.Data.SqlClient;
using oes.App_Code;
namespace oes.admin
{
    public partial class Departments : System.Web.UI.Page
    {
        public Database db = new Database();
        public Functions fn = new Functions();
        protected void Page_Load(object sender, EventArgs e)
        {
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

        //bind data to repeater
        private void BindDeptRepeater()
        {
            using (SqlCommand cmd = new SqlCommand("FetchAllDepartment", db.DbConnect()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd)) {
                    DataTable dtDept = new DataTable();
                    sda.Fill(dtDept);
                    DeptRepeater.DataSource = dtDept;
                    DeptRepeater.DataBind();
                }
            }
        }

        //Add  Department-add tab
        protected void submit_btn_Click(object sender, EventArgs e)
        {
            using (SqlCommand cmd = new SqlCommand("AddDepartment", db.DbConnect()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@deptName", dept_name.Text);
                cmd.Parameters.AddWithValue("@deptCode", dept_code.Text);
                cmd.ExecuteNonQuery();
                
                //redirect ot departments  page with message.
                Response.Redirect("Departments.aspx?action=add");
                
                //clear textboxes
                TextBox[] tb = new TextBox[2] {dept_code,dept_name};
                fn.CleartextBoxes(tb);
            }
            this.BindDeptRepeater();
        }       

        //Delete Department-delete button
        protected void DeleteDept(object sender, EventArgs e)
        {
            int dept_id = int.Parse(((sender as Button).NamingContainer.FindControl("dept_id_hf") as HiddenField).Value);
            using (SqlCommand cmd = new SqlCommand("DELETE FROM department WHERE dept_id=@dept_id", db.DbConnect()))
            {
                cmd.Parameters.AddWithValue("@dept_id", dept_id);
                cmd.ExecuteNonQuery();
            }

            this.BindDeptRepeater();
        }
    }
}
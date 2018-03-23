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
    public partial class EnrollToExam : System.Web.UI.Page
    {
        Database db = new Database();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                BindDeptDdl();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            using (SqlCommand cmd = new SqlCommand("FetchEnrollmentExamDetail", db.DbConnect()))
            {
                int DeptId = Convert.ToInt16(DdlDept.SelectedItem.Value);
                int SemId = Convert.ToInt16(DdlSem.SelectedItem.Value);
                string CurrentDate=DateTime.Now.ToShortDateString();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@DeptId",DeptId);
                cmd.Parameters.AddWithValue("@SemId",SemId);
                cmd.Parameters.AddWithValue("@CurrentDate",CurrentDate);
                SqlDataReader rdr=cmd.ExecuteReader();
                while (rdr.Read())
                {
                   
                        PanelSearchResult.Visible = true;
                        lblExamName.Text = rdr["exam_name"].ToString();
                        lblExamDate.Text = rdr["exam_date"].ToString();
                        HyperLink HlInk = new HyperLink();
                        HlInk.CssClass = "links";
                        HlInk.NavigateUrl = "ExamInstructions.aspx?ExamId=" + rdr["exam_id"].ToString();
                        HlInk.Text = "Enroll to Exam";
                        HlInk.CssClass = "btn btn-primary";
                        ExamLinkPanel.Visible = true;
                        ExamLinkPanel.Controls.Add(HlInk);
                   
                   
                }
            }
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
    }
}
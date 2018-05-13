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
using oes.admin.Class;
using System.Collections;
namespace oes.admin
{

    public partial class ManageFingerDb : System.Web.UI.Page
    {
        Database Db = new Database();
        FacultyClass faculties = new FacultyClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                BindFacultyTable();
                BindStudentTable();
            }
        }

        protected void OnRowDataBoundFaculty(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView dr = (DataRowView)e.Row.DataItem;
                
                string imageUrl = "data:image/bmp;base64," + Convert.ToBase64String((byte[])dr["FingerPrintImage"]);
                int FacultyId = Convert.ToInt16(dr["user_id"].ToString());
                List<FacultyClass> fc = FetchAndBindFacultyDataByFacultyId(FacultyId);
                (e.Row.FindControl("FacultyThumb") as Image).ImageUrl = imageUrl;
                for (int i = 0; i < fc.Count; i++)
                {
                    (e.Row.FindControl("lblFacultyName") as Label).Text = fc[i].FullName.ToString();
                    (e.Row.FindControl("lblFacultyDept") as Label).Text = fc[i].DeptName.ToString();
                    (e.Row.FindControl("FacultyAvatar") as Image).ImageUrl = fc[i].AvatarPath.ToString();
                    (e.Row.FindControl("hLinkViewProfile") as HyperLink).NavigateUrl="FacultyProfile.aspx?FacultyId="+FacultyId+"&action=view";
                }
            }
            
        }

        public void BindFacultyTable() {
            using (Db.ConnectFingerDb())
            {
                using (SqlDataAdapter sda = new SqlDataAdapter("SELECT * FROM FacultyFingerPrint", Db.ConnectFingerDb()))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    gvFacultyRecords.DataSource = dt;
                    gvFacultyRecords.DataBind();
                }
            }    
        }

     
        public List<FacultyClass> FetchAndBindFacultyDataByFacultyId(int FacultyId)
        {
            List<FacultyClass> FacultyInfo = new List<FacultyClass>();
            using (SqlCommand cmd = new SqlCommand("FetchFacultyData", Db.DbConnect()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", FacultyId);

                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    FacultyClass faculty = new FacultyClass();
                    faculty.FullName = rdr["first_name"].ToString() + " " + rdr["last_name"].ToString();
                    faculty.DeptName = faculty.FetchDeptById(rdr["dept_id"].ToString());
                    faculty.AvatarPath = rdr["avatar"].ToString();
                    FacultyInfo.Add(faculty);
                }
            }
            return FacultyInfo;
        }

        protected void OnRowDataBoundStudent(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView dr = (DataRowView)e.Row.DataItem;

                string imageUrl = "data:image/bmp;base64," + Convert.ToBase64String((byte[])dr["FingerPrintImage"]);
                int StudentId = Convert.ToInt16(dr["user_id"].ToString());
                List<StudentClass> sc = FetchAndBindStudentDataByStudentId(StudentId);
                (e.Row.FindControl("StudentThumb") as Image).ImageUrl = imageUrl;
                for (int i = 0; i < sc.Count; i++)
                {
                    (e.Row.FindControl("lblStudentName") as Label).Text = sc[i].FullName.ToString();
                    (e.Row.FindControl("lblStudentDept") as Label).Text = sc[i].DeptName.ToString();
                    (e.Row.FindControl("StudentAvatar") as Image).ImageUrl = sc[i].AvatarPath.ToString();
                    (e.Row.FindControl("hLinkViewProfileStudent") as HyperLink).NavigateUrl = "StudentProfile.aspx?StudentId=" + StudentId + "&action=view";
                }
            }
        }

        public void BindStudentTable()
        {
            using (Db.ConnectFingerDb())
            {
                using (SqlDataAdapter sda = new SqlDataAdapter("SELECT * FROM StudentsFingerPrint", Db.ConnectFingerDb()))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    gvStudentRrecords.DataSource = dt;
                    gvStudentRrecords.DataBind();
                }
            }
        }

        public List<StudentClass> FetchAndBindStudentDataByStudentId(int StudentId)
        {
            List<StudentClass> StudentInfo = new List<StudentClass>();
            using (SqlCommand cmd = new SqlCommand("FetchStudentData", Db.DbConnect()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", StudentId);

                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    StudentClass student = new StudentClass();
                    student.FullName = rdr["first_name"].ToString() + " " + rdr["last_name"].ToString();
                    student.DeptName = student.FetchDeptById(rdr["dept_id"].ToString());
                    student.AvatarPath = rdr["avatar"].ToString();
                    StudentInfo.Add(student);
                }
            }
            return StudentInfo;
        }
    }
}
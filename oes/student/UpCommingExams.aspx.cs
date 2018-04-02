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
    public partial class UpCommingExams : System.Web.UI.Page
    {
        Database db = new Database();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            LoadStudentData(Convert.ToInt16(Session["id"]));
            hf_current_date.Value = DateTime.Now.ToShortDateString();
        }

        private void LoadStudentData(int id)
        {
            using (SqlCommand cmd = new SqlCommand("FetchStudentData", db.DbConnect()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", id);

                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    hf_dept_id.Value = rdr["dept_id"].ToString();
                    hf_sem_id.Value = rdr["sem_id"].ToString();
                }
            }
        }
    }
}
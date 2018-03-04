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
namespace oes.faculty
{
    public partial class ManageQuestions : System.Web.UI.Page
    {
        Database db = new Database();

        protected void Page_Load(object sender, EventArgs e)
        {
            LoadFacultyData(Convert.ToInt16(Session["id"]));
        }

        private void LoadFacultyData(int id)
        {
            using (SqlCommand cmd = new SqlCommand("FetchFacultyData", db.DbConnect()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", id);

                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    hf_dept_id.Value = rdr["dept_id"].ToString();
                }
            }
        }
    }
}
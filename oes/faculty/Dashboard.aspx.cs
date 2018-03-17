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
    public partial class Dashboard : System.Web.UI.Page
    {
        Database db = new Database();

        protected void Page_Load(object sender, EventArgs e)
        {
            //block the page from getting cached
            Response.Cache.SetNoStore();
            
            if (Session["id"] == null && Session["type"]==null)
            {
                Response.Redirect("Login.aspx?eid=1");
            }
            else
            {
                int UserType = Convert.ToInt16(Session["type"]);
                if (UserType==2)
                {
                    LoadFacultyData(Convert.ToInt16(Session["id"]));   
                }
            }
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
                    user.ImageUrl = rdr["avatar"].ToString();
                    faculty_name.Text = rdr["first_name"].ToString() + " " + rdr["last_name"].ToString();
                }
            }
        }
    }
}
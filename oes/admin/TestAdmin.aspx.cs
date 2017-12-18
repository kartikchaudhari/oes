using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

using oes.App_Code;

namespace oes.admin
{
    public partial class TestAdmin : System.Web.UI.Page
    {
        Database db = new Database();

        protected void Page_Load(object sender, EventArgs e)
        {
            using (SqlCommand cmd = new SqlCommand("SELECT * FROM admin WHERE admin_id=1", db.DbConnect()))
            {
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    Image1.ImageUrl = rdr["thumb_img"].ToString();
                }
            }
        }
    }
}
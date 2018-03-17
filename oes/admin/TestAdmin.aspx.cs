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

        //Functions fn = new Functions();
        protected void Page_Load(object sender, EventArgs e)
        {
           // Label1.Text = fn.RowCounter("admin").ToString();
           
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            string dt = DateTime.Parse(TextBox1.Text).ToShortDateString();
            Response.Write(dt);
            //Response.Write(DateTime.Parse(TextBox1.Text).ToShortDateString());
            //Response.Write(Calendar1.SelectedDate.ToShortDateString());
        }
    }
}
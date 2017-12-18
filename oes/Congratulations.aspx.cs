using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace oes
{
    public partial class Congratulations : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["fullname"] == null && Session["UserType"] == null)
            {
                Response.Redirect(Server.MapPath("~/Index.aspx"));
            }
            else {
                FullName.Text = Session["fullname"].ToString();
                UserType.Text = Session["UserType"].ToString();
                
                //destroy the session after 
                Session.Abandon();
            }
        }
    }
}
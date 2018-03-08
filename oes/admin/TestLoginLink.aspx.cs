using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace oes.admin
{
    public partial class TestLoginLink : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCreateCookie_Click(object sender, EventArgs e)
        {
            Response.Cookies["id"].Value = "17";
        }

        protected void btnCheckCookie_Click(object sender, EventArgs e)
        {
            if (Request.Cookies["id"] != null) {
                int CookieId = Convert.ToInt16(Request.Cookies["id"].Value.ToString());
                int tbId=Convert.ToInt16(TextBox1.Text);
                if (CookieId == tbId)
                {
                    Panel1.Visible = true;
                }
                else {
                    Panel1.Visible = false;
                }
            }
        }
    }
}
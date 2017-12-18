using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace oes.admin
{
    public partial class DashboardContents : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["name"] != null)
                {
                    welcome_user.Text = Session["name"].ToString();
                }
            }
            catch (Exception exx) {
                welcome_user.Text = exx.ToString();
            }
        }
    }
}
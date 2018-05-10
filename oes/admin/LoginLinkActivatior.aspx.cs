using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace oes
{
    public partial class LoginLinkActivatior : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnActiveFaculty_Click(object sender, EventArgs e)
        {
            Response.Write(e.ToString());
            Session["faculty"] = 1;
            Session["username"] = tbUserName.Text.Trim().ToString();
            System.Threading.Thread.Sleep(3000);
            lblStatusMessage.Text = "Link Activated";
            lblStatusMessage.ForeColor = System.Drawing.Color.DarkGreen;
            lblStatusMessage.Font.Bold = true;
        }

        protected void btnActiveStudent_Click(object sender, EventArgs e)
        {
            Session["student"] = 1;
            Session["enrollment"] = tbEnrollmentNo.Text.Trim().ToString();
            System.Threading.Thread.Sleep(3000);
            LabelMessageStudent.Text = "Link Activated";
            LabelMessageStudent.ForeColor = System.Drawing.Color.DarkGreen;
            LabelMessageStudent.Font.Bold = true;
        }
    }
}
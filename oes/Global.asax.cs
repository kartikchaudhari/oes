using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.UI;

//for intenet connection
using System.Runtime;
using System.Runtime.InteropServices;

using oes.App_Code;
namespace oes
{
    public class Global : System.Web.HttpApplication
    {

        //imort dll for internet
        [DllImport("wininet.dll")]
        private extern static bool InternetGetConnectedState(out int Description, int ReservedValue);
        protected void Application_Start(object sender, EventArgs e)
        {
            int Desc;
            if (InternetGetConnectedState(out Desc, 0))
            {
                //if the system is connected to internet
                Application["IsConntectedToNet"] = 1;
            }
            else 
            {
                //or else
                Application["IsConntectedToNet"] = 0;
            }
        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {
            //Exception ex = Server.GetLastError();
            //Logger.ErrorLogger(ex);
            //Server.ClearError();
            //Response.Redirect("~/ErrorPages/DefaultError.aspx");
        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}
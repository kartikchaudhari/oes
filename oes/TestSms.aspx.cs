using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Net;
using System.IO;

using oes.App_Code;

namespace oes
{
    public partial class TestSms : System.Web.UI.Page
    {
        sms s = new sms("karti4WnRYtbOfIDo2iS","8153976277","T9229K");
        protected void Page_Load(object sender, EventArgs e)
        {
            s.SendSms("hey bro kac haha is this correct---","8153976277");
    
        }
    }
}
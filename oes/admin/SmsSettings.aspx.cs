using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data.SqlTypes;

//sms api
using Nitin.Sms.Api;

//database connection
using oes.App_Code;

//for intenet connection
using System.Runtime;
using System.Runtime.InteropServices;


namespace oes.admin
{
    public partial class SmsSettings : System.Web.UI.Page
    {
        //database object
        Database db = new Database();
        public sms TestSmsSetting;

        public string apikey = "karti4WnRYtbOfIDo2iS";

        public int status;
        protected void Page_Load(object sender, EventArgs e)
        {
            int status = Convert.ToInt16(Application["IsConntectedToNet"].ToString());
            if (status == 1)
            {
                lblNetStatus.Text = "Connected";
                lblNetStatus.ForeColor = System.Drawing.Color.Green;
                lblNetStatus.Font.Bold = true;
                BindSmsSettingsToControl();
            }
            else
            {
                lblNetStatus.Text = "Not Connected";
                lblNetStatus.ForeColor = System.Drawing.Color.Red;
                lblNetStatus.Font.Bold = true;
                BindSmsSettingsToControl();
                btnSend.Attributes.Add("disabled", "disabled");
            }
        }

        public void BindSmsSettingsToControl() {
            
            using (SqlCommand cmd = new SqlCommand("FetchSMSSettings", db.DbConnect()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataReader rdr = cmd.ExecuteReader();
                while(rdr.Read()){
                    
                    lblUsernameSms.Text = rdr["username"].ToString();
                    lblPasswordSms.Text = rdr["password"].ToString();
                    tbUsernameSms.Text = rdr["username"].ToString();
                    tbPasswordSms.Text = rdr["password"].ToString();
                    tbSender.Text = rdr["username"].ToString();
                    //create and load the sms settings
                    TestSmsSetting = new sms(apikey,rdr["username"].ToString(), rdr["password"].ToString());
                }
            }
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            if (TestSmsSetting.SendSms(tbMsgContent.Text.ToString(),tbReceiver.Text.ToString()))
            {
                lblErrMsg.Text = "Message Sent....";
                lblErrMsg.ForeColor = System.Drawing.Color.Green;
                lblErrMsg.Font.Bold = true;
            }
            else
            {
                lblErrMsg.Text = "Sorry Message Not sent";
                lblErrMsg.ForeColor = System.Drawing.Color.Red;
                lblErrMsg.Font.Bold = true;
            }  
        }

        
    }
}   
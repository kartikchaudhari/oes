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

        //sms object
        public Way2Sms sms;

        //imort dll for internet
        [DllImport("wininet.dll")]
        private extern static bool InternetGetConnectedState(out int Description, int ReservedValue);
        protected void Page_Load(object sender, EventArgs e)
        {
            int Desc;
            if (InternetGetConnectedState(out Desc, 0))
            {
                lblNetStatus.Text = "Connected";
                lblNetStatus.ForeColor = System.Drawing.Color.Green;
                lblNetStatus.Font.Bold = true;
                BindSmsSettingsToControl();
            }
            else {
                lblNetStatus.Text = "Not Connected";
                lblNetStatus.ForeColor = System.Drawing.Color.Red;
                lblNetStatus.Font.Bold = true;
                BindSmsSettingsToControl();
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
                    
                    //create and load the sms settings
                    sms = new Way2Sms(rdr["username"].ToString(), rdr["password"].ToString());
                    tbSender.Text = rdr["username"].ToString();
                    try
                    {
                        sms.Login();
                    }
                    catch(HttpException httpexcp)
                    {
                        lblSettingLabel.Text = httpexcp.ToString();
                    }
                    
                    
                }
            }
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            if (sms.SendSms(tbReceiver.Text.ToString(), tbMsgContent.Text.ToString()))
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
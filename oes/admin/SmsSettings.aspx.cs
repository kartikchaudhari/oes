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
namespace oes.admin
{
    public partial class SmsSettings : System.Web.UI.Page
    {
        //database object
        Database db = new Database();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            BindSmsSettingsToControl();
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
                }
            }
        }
    }
}
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

using oes.App_Code;
namespace oes.faculty
{
    public partial class Notifications : System.Web.UI.Page
    {
        Database Db = new Database();
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnCreateNotification_Click(object sender, EventArgs e)
        {
            using (SqlCommand cmd = new SqlCommand("CreateNotification", Db.DbConnect()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@NContent", tbContents.Text.ToString());
                cmd.Parameters.AddWithValue("@NStatus", Convert.ToInt16(DdlNotificationStatus.SelectedItem.Value));
                cmd.Parameters.AddWithValue("@NFor", Convert.ToInt16(DdlNotificationFor.SelectedItem.Value));
                cmd.Parameters.AddWithValue("@NCreateData", DateTime.Parse(DateTime.Now.ToString()).ToShortDateString());
                if (cmd.ExecuteNonQuery() != 0)
                {
                    lblMessage.Text = "Notification Created..";
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    lblMessage.Font.Bold = true;

                    DdlNotificationFor.SelectedItem.Enabled = false;
                    DdlNotificationStatus.SelectedItem.Enabled = false;
                    tbContents.Text = "";
                }

                else
                {
                    lblMessage.Text = "Error while Notification Creation..";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Font.Bold = true;


                    DdlNotificationFor.SelectedItem.Enabled = false;
                    DdlNotificationStatus.SelectedItem.Enabled = false;
                    tbContents.Text = "";
                }
            }
        }

        public string DetermineNotificationStatus(string NotificationStatus)
        {
            if (NotificationStatus == "1")
            {
                return "Published";
            }
            else
            {
                return "Draft";
            }
        }
       
        
    }
}
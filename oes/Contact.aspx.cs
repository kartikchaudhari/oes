using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//these two namespaces are mendetory for database operation 
using System.Data.SqlClient;
using System.Configuration;


namespace oes
{
    public partial class Contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }

        protected void BtnSubmit_Click1(object sender, EventArgs e)
        {
            String ConString = ConfigurationManager.ConnectionStrings["ExamDbConString"].ConnectionString; //connection string
            using (SqlConnection con = new SqlConnection(ConString))
            { //create a connection object
                try
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("INSERT INTO contact(f_name,l_name,email_id,msg) VALUES('" + tbFname.Text.ToString() + "','" + tbLname.Text.ToString() + "','" + tbEmail.Text.ToString() + "','" + msg.Text.ToString() + "')", con); //sql command to be fire
                    cmd.ExecuteNonQuery(); //fire the query
                }
                catch (SqlException s)
                {

                    err_lbl.Text = s.ToString();
                }

            }
        }
    }
}
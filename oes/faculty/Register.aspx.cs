using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

/*add following namespaces to interact with sql server*/
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using oes.App_Code; //it include all the class file inside the App_Code folder :) 


namespace oes.faculty
{
    public partial class Register : System.Web.UI.Page
    {
        Database db = new Database();
        Functions fn = new Functions();
        
        //fetchig available deprtments in <select> list
        protected void Page_Load(object sender, EventArgs e)
        {
            
            using (db.DbConnect()) {
                try
                {
                    SqlCommand cmd = new SqlCommand("SELECT dept_id,dept_name,dept_code FROM department", db.DbConnect());

                    dept_ddl.DataSource = cmd.ExecuteReader();
                    
                    //text property of <option>
                    dept_ddl.DataTextField = "dept_name";
                    
                    //value property of <option>
                    dept_ddl.DataValueField = "dept_id";
                    dept_ddl.DataBind();
                }
                catch (Exception ddl_exception)
                {
                    lbl_msg.Text = ddl_exception.ToString(); 
                }
            }
      /*************************** Client Side Form validation attributes*********************/
            fname.Attributes.Add("onchange", "return ValidateFname();");
            lname.Attributes.Add("onchange", "return ValidateLame();");
            email.Attributes.Add("onchange", "return ValidateEmail()");
            contactno.Attributes.Add("onchange", "return ValidateContactNo(1);");
            cpass.Attributes.Add("onchange", "return ValidatePassword();");
      /***************************************************************************************/
        }

        protected void submit_btn_Click(object sender, EventArgs e)
        {
            using (db.DbConnect())
            {
                try //try to register a faculty
                {
                    SqlCommand FactRegCmd = new SqlCommand("INSERT INTO faculty(first_name,last_name,avatar,username,password,email,contact_no,dept_id,account_status) VALUES('" + fname.Text + "','" + lname.Text + "','../images/default.png','" + uname.Text + "','" + pass.Text + "','" + email.Text + "','" + contactno.Text + "','" + dept_ddl.SelectedValue + "',0)", db.DbConnect());
                    if (FactRegCmd.ExecuteNonQuery()!=0)
                    {
                        Session["username"] = uname.Text;
                        Response.Redirect("EnrollThumb.aspx");
                     }
                    else
                    {

                        /*
                         * array of textbox,
                         * after the form submitted successfully all the textbox having following ids
                         * are automatically cleared.
                         */
                        TextBox[] tb = new TextBox[6] { fname, lname, uname, pass, email, contactno };
                        fn.CleartextBoxes(tb);

                        lbl_msg.Text = "Error While Registration..";
                    }
                }
                catch (SqlException RegException)
                {
                    lbl_msg.Text = RegException.ToString();
                }
            }


        }

    }
}
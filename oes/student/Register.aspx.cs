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
using oes.App_Code; //it will include all the class file inside the App_Code folder :) 


namespace oes.student
{
    public partial class Register : System.Web.UI.Page
    {
        Database db = new Database();
        Functions fn = new Functions();

        protected void Page_Load(object sender, EventArgs e)
        {
            using (db.DbConnect())
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("SELECT dept_id,dept_name,dept_code FROM department", db.DbConnect());
                    dept_ddl.AppendDataBoundItems = true;
                    dept_ddl.DataSource = cmd.ExecuteReader();
                    //text property of select list
                    dept_ddl.DataTextField = "dept_name"; 

                    //value property of select list
                    dept_ddl.DataValueField = "dept_id";
                    dept_ddl.DataBind();
                }
                catch (Exception ddl_exception)
                {
                    lbl_msg.Text = ddl_exception.ToString();
                }
            }

            /*************************** Client Side Form validation attributes*********************/
            //fname.Attributes.Add("onchange", "return ValidateFname();");
            //lname.Attributes.Add("onchange", "return ValidateLame();");
            //email.Attributes.Add("onchange", "return ValidateEmail()");
            //parent_contactno.Attributes.Add("onchange", "return ValidateContactNo(2);");
            //stud_contactno.Attributes.Add("onchange", "return ValidateContactNo(3);");
            //cpass.Attributes.Add("onchange", "return ValidatePassword();");
            /***************************************************************************************/
        }

        protected void submit_btn_Click(object sender, EventArgs e)
        {
            using (db.DbConnect())
            {
                try
                {
                    SqlCommand StudRegCommand = new SqlCommand("INSERT INTO student(first_name,last_name,enrollment_no,username,password,sem_id,email,stud_contact,parent_contact,dept_id,reg_date,account_status) VALUES ('" + fname.Text + "','" + lname.Text + "','" + enrollment.Text + "','" + uname.Text + "','" + pass.Text + "','" + ddl_sem.SelectedItem.Value + "','" + email.Text + "','" + stud_contactno.Text + "','" + parent_contactno.Text + "','" + dept_ddl.SelectedItem.Value + "','" + DateTime.Now.ToString("yyyy-MM-dd h:m:s") + "',0)", db.DbConnect());

                    if (StudRegCommand.ExecuteNonQuery() == 1)
                    {
                        Session["username"] = uname.Text;
                        Response.Redirect("EnrollThumb.aspx");

                    }
                    else
                    {
                        TextBox[] tb = new TextBox[8] { fname, lname, enrollment, uname, pass, email, stud_contactno, parent_contactno };
                        fn.CleartextBoxes(tb);

                        lbl_msg.Text = "Error While Registration.";
                        lbl_msg.ForeColor = System.Drawing.Color.Red;
                    }

                }
                catch (SqlException StudRegException)
                {
                    lbl_msg.Text = StudRegException.ToString();
                }

            }

            //Response.Write(dept_ddl.SelectedItem.Value + "<br>" + ddl_sem.SelectedItem.Value);
        }
    }
}
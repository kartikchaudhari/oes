using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using oes.App_Code;

namespace oes.admin
{
    public partial class DashboardContents : System.Web.UI.Page
    {
        Functions fn = new Functions();
        protected void Page_Load(object sender, EventArgs e)
        {
            //display badges to tile
            lbl_dept.Text = fn.RowCounter("department").ToString();
            lbl_subjects.Text = fn.RowCounter("subject").ToString();
            lbl_faculties.Text = fn.RowCounter("faculty").ToString();
            lbl_students.Text = fn.RowCounter("department").ToString();
            lbl_exams.Text = fn.RowCounter("exam").ToString();
            lbl_results.Text = fn.RowCounter("result").ToString();

            //
            //TODO : make another method which fetch data according to notifications status 
            //count only this notifications which are un read
            //notification status: read-1, unread=0
            //
            //then change the following method
            lbl_notifications.Text = fn.RowCounter("notification").ToString();

        }
    }
}
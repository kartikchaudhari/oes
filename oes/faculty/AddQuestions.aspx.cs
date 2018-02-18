﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace oes.faculty
{
    public partial class AddQuestions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["subject_id"] == null)
            {
                Response.Redirect("Subjects.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String str = Server.HtmlEncode(CKEditor1.Text);
            Label1.Text = Server.HtmlDecode(str);
        }
    }
}
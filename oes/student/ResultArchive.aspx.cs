﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace oes.student
{
    public partial class ResultArchive : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"]!=null)
            {
                hf_stud_id.Value = Session["id"].ToString();
            }
        }

        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            GridView1.DataSourceID = null;
            GridView1.DataSource = ObjectDataSource1;
            GridView1.DataBind();
        }
    }
}
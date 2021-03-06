﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data.SqlTypes;

using System.Collections;

using oes.App_Code;
namespace oes.student
{
    public partial class ExamInstructions : System.Web.UI.Page
    {
        Database db = new Database();
        protected void Page_Load(object sender, EventArgs e)
        {

            ArrayList al = new ArrayList();
            Session.Add("AnswerList", al);


            if (Request.QueryString["ExamId"]!=null)
            {   
                int ExamId=Convert.ToInt16(Request.QueryString["ExamId"]);
                Session.Add("ExamID", ExamId);
                LoadExamDetail(ExamId);
            }
        }

        public void LoadExamDetail(int ExamId) {
            using (SqlCommand cmd = new SqlCommand("FetchExamDetailById", db.DbConnect()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ExamId", ExamId);
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    lblPassingMarks.Text = rdr["passing_marks"].ToString();
                    lblTotalMarks.Text = rdr["total_marks"].ToString();
                    lblTotalTime.Text = rdr["total_time"].ToString();
                    lblExamDuration.Text = rdr["total_time"].ToString();
                    HyperLink StartExambtn = new HyperLink();
                    StartExambtn.Attributes.Add("disabled","disabled");
                    StartExambtn.ID = "btnStartExam";
                    StartExambtn.Text = "Start Exam";
                    StartExambtn.Attributes.Add("onclick", "openerNew(" + rdr["exam_id"].ToString() + ")");
                    //StartExambtn.NavigateUrl = "StartExam.aspx?ExamId=" + rdr["exam_id"].ToString();
                    //StartExambtn.Target = "_blank";
                    StartExambtn.CssClass = "btn btn-success";
                    pnlStartExamBtn.Controls.Add(StartExambtn);
                }
            }
        }
    }
}
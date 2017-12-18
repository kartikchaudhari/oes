﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;//to access server controls include this namespace
using System.Web.UI.WebControls; //to access webpage control like textbox etc. include this namespace
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;


namespace oes.App_Code
{ 
    public class Functions
    {
        Database db = new Database();

        //method to clear all the form fields after form submitted
        public void CleartextBoxes(TextBox[] tboxes){
            for (int i = 0; i < tboxes.Length; i++) {
                tboxes[i].Text = "";
            }
        }


        //update thumbprint into student table 
        public Boolean UpdateStuentThumb(String path) {
            return true;
        }
            
        public void DeleteSubjectsByDept(int dept_id) {
            using (SqlCommand cmd = new SqlCommand("DeleteSubjectsByDept", db.DbConnect()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@dept_id", dept_id);
                cmd.ExecuteNonQuery();
            }
        }
    }
}
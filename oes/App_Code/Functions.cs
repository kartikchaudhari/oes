using System;
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
using System.IO;


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

        //table field counter for dashboard badges
        public int RowCounter(String TblName)
        {
            int NumRows;
            string stmt = string.Format("SELECT COUNT(*) FROM {0}",TblName);
            using (SqlCommand cmd = new SqlCommand(stmt, db.DbConnect()))
            {
                NumRows = (int)cmd.ExecuteScalar();
            }
            return NumRows;
        }

        public string FetchDeptById(string DeptId)
        {
            String DeptName = null;
            using (SqlCommand cmd = new SqlCommand("SELECT dept_name FROM department WHERE dept_id=" + DeptId, db.DbConnect()))
            {
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    return DeptName = rdr["dept_name"].ToString();
                }
                return DeptName;
            }
        }


        //ErrorLogger 
        public void LogError(Exception ex)
        {
            string message = string.Format("Time: {0}", DateTime.Now.ToString("dd/MM/yyyy hh:mm:ss tt"));
            message += Environment.NewLine;
            message += "-----------------------------------------------------------";
            message += Environment.NewLine;
            message += string.Format("Message: {0}", ex.Message);
            message += Environment.NewLine;
            message += string.Format("StackTrace: {0}", ex.StackTrace);
            message += Environment.NewLine;
            message += string.Format("Source: {0}", ex.Source);
            message += Environment.NewLine;
            message += string.Format("TargetSite: {0}", ex.TargetSite.ToString());
            message += Environment.NewLine;
            message += "-----------------------------------------------------------";
            message += Environment.NewLine;
            string path = HttpContext.Current.Server.MapPath("~/admin/ErrorLog/ErrorLog.txt");
            using (StreamWriter writer = new StreamWriter(path, true))
            {
                writer.WriteLine(message);
                writer.Close();
            }
            HttpContext.Current.Response.Redirect("~/Error.aspx");
        }
    }
}
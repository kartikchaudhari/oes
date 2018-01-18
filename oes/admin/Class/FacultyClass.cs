using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data.SqlTypes;

using oes.App_Code;


namespace oes.admin.Class
{
    public class FacultyClass
    {
        Database db = new Database();

        public int FacultyId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string FullName { get; set; }
        public string AvatarPath { get; set; }
        public string ThumbPath { get; set; }
        public string UserName { get; set; }
        public string EmailId { get; set; }
        public string ContactNo { get; set; }
        public string DeptName { get; set; }

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
    }
}
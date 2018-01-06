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
    public class SubjectClass
    {
        Database db = new Database();

        public int subject_id { get; set; }
        public string subject_name { get; set; }
        public int subject_code { get; set; }
        public string dept_name { get; set; }
        public int sem_id { get; set; }
        public string total_exam_taken { get; set; }

        
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
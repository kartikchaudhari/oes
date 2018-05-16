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
    public class StudentClass
    {
        Database db = new Database();

        public int StudentId { get; set; }
       // public string FirstName { get; set; }
        //public string LastName { get; set; }
        public string FullName { get; set; }
        public string EnrollmentNo { get; set; }
        public string AvatarPath { get; set; }
        public string ThumbPath { get; set; }
        //public string UserName { get; set; }
        //public string EmailId { get; set; }
        public string ContactNo { get; set; }
        public string ParentNo { get; set; }
        public string DeptName { get; set; }
        public string SemId { get; set; }

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

        public string FetchDeptById(int DeptId)
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

        public string FetchStudentNameById(int StudentId) {
            string StudName = null;
            using (SqlCommand cmd = new SqlCommand("FetchStudentData", db.DbConnect()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", StudentId);
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    StudName = rdr["first_name"].ToString() + " " + rdr["last_name"].ToString();
                }
            }
            return StudName;
        }

        public string FetchStudentNameById(string StudentId)
        {
            Database db = new Database();
            string StudName = null;
            using (SqlCommand cmd = new SqlCommand("FetchStudentData", db.DbConnect()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", StudentId);
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    StudName = rdr["first_name"].ToString() + " " + rdr["last_name"].ToString();
                }
            }
            return StudName;
        }
    }
}
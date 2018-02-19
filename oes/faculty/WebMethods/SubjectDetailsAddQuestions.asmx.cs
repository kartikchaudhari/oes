using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data.SqlTypes;

using oes.App_Code;
using oes.faculty.Class;
using System.Web.Script.Serialization;
namespace oes.faculty.WebMethods
{
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
     [System.Web.Script.Services.ScriptService]
    public class SubjectDetailsAddQuestions : System.Web.Services.WebService
    {
        Database db = new Database();

        [WebMethod]
        public void  getDepartments()
        {
            List<Department> depts = new List<Department>();
            using (SqlCommand cmd = new SqlCommand("FetchAllDepartment", db.DbConnect())) {
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read()) {
                    Department dept = new Department();
                    dept.DeptId = Convert.ToInt16(rdr["dept_id"].ToString());
                    dept.DeptName = rdr["dept_name"].ToString();
                    depts.Add(dept);
                }
                
            }
            JavaScriptSerializer js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(depts));
        }
    }
}

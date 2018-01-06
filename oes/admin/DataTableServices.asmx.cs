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
using oes.admin.Class;

//javascript serilization
using System.Web.Script.Serialization;

namespace oes.admin
{

    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 

    [System.Web.Script.Services.ScriptService]

    public class DataTableServices : System.Web.Services.WebService
    {
        Database db = new Database();

        [WebMethod]
        public void GetSubjectDetail()
        {
            List<SubjectClass> subjects = new List<SubjectClass>();
            using (SqlCommand cmd = new SqlCommand("FetchAllSubject", db.DbConnect()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    SubjectClass subject = new SubjectClass();
                    subject.subject_id = Convert.ToInt32(rdr["subject_id"]);
                    subject.subject_name = rdr["subject_name"].ToString();
                    subject.subject_code = Convert.ToInt32(rdr["sub_code"]);
                    subject.dept_name = subject.FetchDeptById(rdr["dept_id"].ToString());
                    subject.sem_id = Convert.ToInt16(rdr["sem_id"]);
                    subject.total_exam_taken = rdr["total_exam_taken"].ToString();
                    subjects.Add(subject);
                }
            }
            JavaScriptSerializer js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(subjects));
        }
    }
}

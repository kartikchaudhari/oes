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
namespace oes.admin.WebMethods
{
    /// <summary>
    /// Summary description for Subjects
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class Subjects : System.Web.Services.WebService
    {
        Database db = new Database();

        [WebMethod]
        public string RemoveSubject(int SubjectId)
        {
            string msg = null;
            using (SqlCommand cmd = new SqlCommand("DeleteSubjectsBySubjectId", db.DbConnect()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@SubjectId", SubjectId);
                //cmd.ExecuteNonQuery();
                if (cmd.ExecuteNonQuery() != 0)
                {
                    msg = "Subject Deleted";
                }
                else
                {
                    msg = "Error While Processing..";
                }
            }
            return msg;
        }
    }
}

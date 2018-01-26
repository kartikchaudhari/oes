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
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
     [System.Web.Script.Services.ScriptService]
    public class Faculty : System.Web.Services.WebService
    {
        //database object
        Database db = new Database();

        [WebMethod]
        public string ConfirmRequest(int UserId)
        {
            string msg = null;
            using (SqlCommand cmd = new SqlCommand("UPDATE faculty SET account_status=1 WHERE faculty_id=" + UserId + "", db.DbConnect()))
            {
                if (cmd.ExecuteNonQuery() != 0)
                {
                    msg = "Request Confirmed";
                }
                else
                {
                    msg = "Error While Processing..";
                }
            }
            return msg;
        }

        [WebMethod]
        public string BanFaculty(int UserId) {
            string msg=null;
            using (SqlCommand cmd = new SqlCommand("BanFaculty", db.DbConnect()))
            {
                cmd.CommandType=CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@fact_id", UserId);
                //cmd.ExecuteNonQuery();
                if (cmd.ExecuteNonQuery() != 0)
                {
                    msg = "Banned";
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

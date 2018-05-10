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
using System.Text;

namespace oes.admin.WebMethods
{
   
    [WebService]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
     [System.Web.Script.Services.ScriptService]
    public class DeptInfoCharts : System.Web.Services.WebService
    {
        

        [WebMethod]
        public string GetChart(string semid)
        {

            Database Db = new Database();
                string query = string.Format("select dept_id, student_id from student where sem_id = '{0}'", semid);
                using (SqlCommand cmd = new SqlCommand(query, Db.DbConnect()))
                {
                    cmd.CommandType = CommandType.Text;
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        StringBuilder sb = new StringBuilder();
                        sb.Append("[");
                        while (sdr.Read())
                        {
                            sb.Append("{");
                            System.Threading.Thread.Sleep(50);
                            string color = String.Format("#{0:X6}", new Random().Next(0x1000000));
                            sb.Append(string.Format("text :'{0}', value:{1}, color: '{2}'", sdr[0], sdr[1], color));
                            sb.Append("},");
                        }
                        sb = sb.Remove(sb.Length - 1, 1);
                        sb.Append("]");
                        return sb.ToString();
                    }
                }
            
        }
    }
}

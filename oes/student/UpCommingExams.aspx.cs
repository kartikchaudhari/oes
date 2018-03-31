using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data.SqlTypes;

using oes.App_Code;
namespace oes.student
{
    public partial class UpCommingExams : System.Web.UI.Page
    {
        Database db = new Database();
        protected void Page_Load(object sender, EventArgs e)
        {
            hf_current_date.Value = DateTime.Now.ToShortDateString();
        }

        public void LoadStudentData(int StudentId) {
            
        }
    }
}
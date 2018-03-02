using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.IO;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Configuration;

using oes.App_Code;

namespace oes.faculty
{
        
    public partial class ImportQuestions : System.Web.UI.Page
    {
        Database db = new Database();

        protected void Page_Load(object sender, EventArgs e)
        {
            //Response.Write(DateTime.Now.ToString(("dd-MM-yyyy--hh:mm--tt")));
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
                string UploadDir = Server.MapPath("~/faculty/QuestionImports/");

                string conString = string.Empty;
                string FileName = Path.GetFileName(ExcelFileUpload.PostedFile.FileName);
                string extension = Path.GetExtension(ExcelFileUpload.PostedFile.FileName);

                
                   
                string excelPath = UploadDir + "QuestionsImport-" + DateTime.Now.ToString(("dd-MM-yyyy--hh-mm--tt")) + extension;
                ExcelFileUpload.SaveAs(excelPath);
                switch (extension)
                {
                    case ".xls": //Excel 97-03
                        conString = ConfigurationManager.ConnectionStrings["Excel03ConString"].ConnectionString;
                        break;
                    case ".xlsx": //Excel 07 or higher
                        conString = ConfigurationManager.ConnectionStrings["Excel07+ConString"].ConnectionString;
                        break;

                }


                conString = string.Format(conString, excelPath);
                using (OleDbConnection excel_con = new OleDbConnection(conString))
                {
                    excel_con.Open();
                    string sheet1 = excel_con.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null).Rows[0]["TABLE_NAME"].ToString();
                    DataTable dtExcelData = new DataTable();

                    dtExcelData.Columns.AddRange(new DataColumn[12] {
                    new DataColumn("Department Id", typeof(int)),
                    new DataColumn("Semester", typeof(int)),
                    new DataColumn("Subject", typeof(int)),
                    new DataColumn("Exam Code", typeof(string)),
                    new DataColumn("Question Type", typeof(string)),
                    new DataColumn("Question", typeof(string)),
                    new DataColumn("Option A", typeof(string)),
                    new DataColumn("Option B", typeof(string)),
                    new DataColumn("Option C", typeof(string)),
                    new DataColumn("Option D", typeof(string)),
                    new DataColumn("Correct Answer", typeof(int)),
                    new DataColumn("Marks", typeof(int)),
                });
                    using (OleDbDataAdapter oda = new OleDbDataAdapter("SELECT * FROM [" + sheet1 + "]", excel_con))
                    {
                        oda.Fill(dtExcelData);
                    }
                    excel_con.Close();

                    using (SqlBulkCopy sqlBulkCopy = new SqlBulkCopy(db.DbConnect()))
                    {
                        //Set the database table name
                        sqlBulkCopy.DestinationTableName = "dbo.questions";
                        sqlBulkCopy.ColumnMappings.Add("Department Id", "dept_id");
                        sqlBulkCopy.ColumnMappings.Add("Semester", "sem_id");
                        sqlBulkCopy.ColumnMappings.Add("Subject", "subject_id");
                        sqlBulkCopy.ColumnMappings.Add("Exam Code", "exam_code");
                        sqlBulkCopy.ColumnMappings.Add("Question Type", "question_type");
                        sqlBulkCopy.ColumnMappings.Add("Question", "question");
                        sqlBulkCopy.ColumnMappings.Add("Option A", "opt_a");
                        sqlBulkCopy.ColumnMappings.Add("Option B", "opt_b");
                        sqlBulkCopy.ColumnMappings.Add("Option C", "opt_c");
                        sqlBulkCopy.ColumnMappings.Add("Option D", "opt_d");
                        sqlBulkCopy.ColumnMappings.Add("Correct Answer", "correct_ans");
                        sqlBulkCopy.ColumnMappings.Add("Marks", "marks");

                        sqlBulkCopy.WriteToServer(dtExcelData);

                    }
                }
            }
            
        
    }
}
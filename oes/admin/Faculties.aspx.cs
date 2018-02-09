using System.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.Sql;
using System.Data.SqlClient;
using System.Data.SqlTypes;


using oes.App_Code;

//for build in charts
using System.Web.UI.DataVisualization.Charting;

//for pdf creation
using iTextSharp.text;
using System.Drawing;
using iTextSharp.text.pdf;

namespace oes.admin
{
    
    public partial class Faculties : System.Web.UI.Page
    {
        //database object
        Database db = new Database();

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["id"] == null)
            //{
            //    Response.Redirect("Login.aspx?eid=1");
            //}
            //else {
            if (!IsPostBack)
            {
                BindRepeater();
                BindDeptList();
                GetChart();
                //CreatePdf(31);
            }
            //}
        }

        

        protected void BindRepeater()
        {
            using (SqlCommand cmd = new SqlCommand("FetchPendingFaculty", db.DbConnect()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtFacultyRequestsRepeater = new DataTable();
                    sda.Fill(dtFacultyRequestsRepeater);
                    if (dtFacultyRequestsRepeater.Rows.Count > 0)
                    {
                        FacultyRequestsRepeater.DataSource = dtFacultyRequestsRepeater;
                        FacultyRequestsRepeater.DataBind();
                     }
                     else
                    {
                        NoRecordsMsg.Visible = true;
                    }
                }
            }
        }

        protected void GetChart(){
            using (SqlCommand cmd = new SqlCommand("ChartsFaculty", db.DbConnect()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataReader rdr = cmd.ExecuteReader();
                Series series = FacultyChart.Series[0];
                while (rdr.Read())
                {
                    series.Points.AddXY(rdr["DepartmentName"].ToString(), rdr["NoofEmployees"].ToString());
                }
                FacultyChart.Legends.Add(new Legend("FacultyChartLegend"));
                FacultyChart.Legends[0].TableStyle = LegendTableStyle.Auto;
                FacultyChart.Legends[0].Docking = Docking.Bottom;
                FacultyChart.Legends[0].Alignment = System.Drawing.StringAlignment.Center;
                FacultyChart.Series[0].Label = "#VALY";
                FacultyChart.Series[0].Legend = "FacultyChartLegend";
                FacultyChart.Series[0].LegendText = "#VALX";
            }
        }

        protected void BindDeptList()
        {
            using (SqlCommand cmd = new SqlCommand("FetchAllDepartment", db.DbConnect()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                ddl_dept.DataSource = cmd.ExecuteReader();
                ddl_dept.DataTextField = "dept_name";
                ddl_dept.DataValueField = "dept_id";
                ddl_dept.DataBind();
            }
        }

        protected void btnAddFaculty_Click(object sender, EventArgs e)
        {
            using (SqlCommand cmd = new SqlCommand("RegisterFaculty", db.DbConnect()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                
                cmd.Parameters.AddWithValue("@Fname", tbFname.Text.ToString());
                cmd.Parameters.AddWithValue("@Lname", tbLname.Text.ToString());
                cmd.Parameters.AddWithValue("@Avatar", "../images/default.png");
                cmd.Parameters.AddWithValue("@Username", tbUname.Text.ToString());
                cmd.Parameters.AddWithValue("@Password", tbPass.Text.ToString());
                cmd.Parameters.AddWithValue("@EmailID", tbEmail.Text.ToString());
                cmd.Parameters.AddWithValue("@ContactNo", tbContact.Text.ToString());
                cmd.Parameters.AddWithValue("@DeptId", ddl_dept.SelectedValue);
                cmd.Parameters.AddWithValue("@AccountStatus",0);
                if (cmd.ExecuteNonQuery() != 0)
                {
                    Response.Redirect("Faculties.aspx?action=added");
                }
            }
        }

        private DataTable GetData(int id)
        {
            using (SqlCommand cmd = new SqlCommand("FetchFacultyData", db.DbConnect()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", id);
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    sda.SelectCommand = cmd;
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        return dt;
                    }
                }
            }
        }
        protected void CreatePdf(int id) {
            DataRow dr = GetData(39).Rows[0];
            Document document = new Document(PageSize.A4, 88f, 88f, 10f, 10f);
            iTextSharp.text.Font NormalFont = FontFactory.GetFont("Arial", 12, iTextSharp.text.Font.NORMAL,iTextSharp.text.BaseColor.BLACK);
            using (System.IO.MemoryStream memoryStream = new System.IO.MemoryStream())
            {
                PdfWriter writer = PdfWriter.GetInstance(document, memoryStream);
                Phrase phrase = null;
                PdfPCell cell = null;
                PdfPTable table = null;
                iTextSharp.text.BaseColor color = null;

                document.Open();

                //Header Table
                table = new PdfPTable(2);
                table.TotalWidth = 500f;
                table.LockedWidth = true;
                table.SetWidths(new float[] { 0.3f, 0.7f });

                //Company Logo
                cell = ImageCell("~/images/secure-test.png", 30f, PdfPCell.ALIGN_CENTER);
                table.AddCell(cell);

                //Company Name and Address
                phrase = new Phrase();
                phrase.Add(new Chunk("Online Examination System\n\n", FontFactory.GetFont("Arial", 16, iTextSharp.text.Font.BOLD,iTextSharp.text.BaseColor.BLACK)));
                phrase.Add(new Chunk("107, Park site,\n", FontFactory.GetFont("Arial", 8, iTextSharp.text.Font.NORMAL, iTextSharp.text.BaseColor.BLACK)));
                phrase.Add(new Chunk("Salt Lake Road,\n", FontFactory.GetFont("Arial", 8, iTextSharp.text.Font.NORMAL, iTextSharp.text.BaseColor.BLACK)));
                phrase.Add(new Chunk("Seattle, USA", FontFactory.GetFont("Arial", 8, iTextSharp.text.Font.NORMAL, iTextSharp.text.BaseColor.BLACK)));
                cell = PhraseCell(phrase, PdfPCell.ALIGN_LEFT);
                cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
                table.AddCell(cell);

                //Separater Line
                color = new iTextSharp.text.BaseColor(System.Drawing.ColorTranslator.FromHtml("#A9A9A9"));
                DrawLine(writer, 25f, document.Top - 79f, document.PageSize.Width - 25f, document.Top - 79f, color);
                DrawLine(writer, 25f, document.Top - 80f, document.PageSize.Width - 25f, document.Top - 80f, color);
                document.Add(table);

                table = new PdfPTable(2);
                table.HorizontalAlignment = Element.ALIGN_LEFT;
                table.SetWidths(new float[] { 0.3f, 1f });
                table.SpacingBefore = 20f;

                //Employee Details
                cell = PhraseCell(new Phrase("Faculty Detail", FontFactory.GetFont("Arial", 12, iTextSharp.text.Font.UNDERLINE, iTextSharp.text.BaseColor.BLACK)), PdfPCell.ALIGN_CENTER);
                cell.Colspan = 2;
                table.AddCell(cell);
                cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_CENTER);
                cell.Colspan = 2;
                cell.PaddingBottom = 30f;
                table.AddCell(cell);

                //Photo
                cell = ImageCell(string.Format("{0}", dr["avatar"]), 25f, PdfPCell.ALIGN_CENTER);
                table.AddCell(cell);

                //Name
                phrase = new Phrase();
                phrase.Add(new Chunk(dr["first_name"] + " " + dr["last_name"] + "\n", FontFactory.GetFont("Arial", 10, iTextSharp.text.Font.BOLD, iTextSharp.text.BaseColor.BLACK)));
                phrase.Add(new Chunk("Faculty at OES", FontFactory.GetFont("Arial", 8, iTextSharp.text.Font.BOLD, iTextSharp.text.BaseColor.BLACK)));
                cell = PhraseCell(phrase, PdfPCell.ALIGN_LEFT);
                cell.VerticalAlignment = PdfPCell.ALIGN_MIDDLE;
                table.AddCell(cell);
                document.Add(table);

                DrawLine(writer, 160f, 80f, 160f, 690f, iTextSharp.text.BaseColor.BLACK);
                DrawLine(writer, 115f, document.Top - 200f, document.PageSize.Width - 100f, document.Top - 200f, iTextSharp.text.BaseColor.BLACK);

                table = new PdfPTable(2);
                table.SetWidths(new float[] { 0.5f, 2f });
                table.TotalWidth = 340f;
                table.LockedWidth = true;
                table.SpacingBefore = 20f;
                table.HorizontalAlignment = Element.ALIGN_RIGHT;

                //Employee Id
                table.AddCell(PhraseCell(new Phrase("Faculty code:", FontFactory.GetFont("Arial", 8, iTextSharp.text.Font.BOLD, iTextSharp.text.BaseColor.BLACK)), PdfPCell.ALIGN_LEFT));
                table.AddCell(PhraseCell(new Phrase("000" + dr["faculty_id"], FontFactory.GetFont("Arial", 8, iTextSharp.text.Font.NORMAL, iTextSharp.text.BaseColor.BLACK)), PdfPCell.ALIGN_LEFT));
                cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_CENTER);
                cell.Colspan = 2;
                cell.PaddingBottom = 10f;
                table.AddCell(cell);


                //email Address
                table.AddCell(PhraseCell(new Phrase("Email ID:", FontFactory.GetFont("Arial", 8, iTextSharp.text.Font.BOLD, iTextSharp.text.BaseColor.BLACK)), PdfPCell.ALIGN_LEFT));
                phrase = new Phrase(new Chunk(dr["email"] + "\n", FontFactory.GetFont("Arial", 8, iTextSharp.text.Font.NORMAL, iTextSharp.text.BaseColor.BLACK)));
                //phrase.Add(new Chunk(dr["City"] + "\n", FontFactory.GetFont("Arial", 8, iTextSharp.text.Font.NORMAL, iTextSharp.text.BaseColor.BLACK)));
                //phrase.Add(new Chunk(dr["Region"] + " " + dr["Country"] + " " + dr["PostalCode"], FontFactory.GetFont("Arial", 8, iTextSharp.text.Font.NORMAL, iTextSharp.text.BaseColor.BLACK)));
                table.AddCell(PhraseCell(phrase, PdfPCell.ALIGN_LEFT));
                cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_CENTER);
                cell.Colspan = 2;
                cell.PaddingBottom = 10f;
                table.AddCell(cell);

                

                //Phone
                table.AddCell(PhraseCell(new Phrase("Phone Number:", FontFactory.GetFont("Arial", 8, iTextSharp.text.Font.BOLD, iTextSharp.text.BaseColor.BLACK)), PdfPCell.ALIGN_LEFT));
                table.AddCell(PhraseCell(new Phrase("+91 "+dr["contact_no"], FontFactory.GetFont("Arial", 8, iTextSharp.text.Font.NORMAL, iTextSharp.text.BaseColor.BLACK)), PdfPCell.ALIGN_LEFT));
                cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_CENTER);
                cell.Colspan = 2;
                cell.PaddingBottom = 10f;
                table.AddCell(cell);

                
                document.Add(table);
                document.Close();
                byte[] bytes = memoryStream.ToArray();
                memoryStream.Close();
                Response.Clear();
                Response.ContentType = "application/pdf";
                Response.AddHeader("Content-Disposition", "attachment; filename=" + dr["first_name"] + "_" + dr["last_name"]+".pdf");
                Response.ContentType = "application/pdf";
                Response.Buffer = true;
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.BinaryWrite(bytes);
                Response.End();
                Response.Close();
            }
        }

        private static void DrawLine(PdfWriter writer, float x1, float y1, float x2, float y2, iTextSharp.text.BaseColor color)
        {
            PdfContentByte contentByte = writer.DirectContent;
            contentByte.SetColorStroke(color);
            contentByte.MoveTo(x1, y1);
            contentByte.LineTo(x2, y2);
            contentByte.Stroke();
        }
        private static PdfPCell PhraseCell(Phrase phrase, int align)
        {
            PdfPCell cell = new PdfPCell(phrase);
            cell.BorderColor = iTextSharp.text.BaseColor.WHITE;
            cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
            cell.HorizontalAlignment = align;
            cell.PaddingBottom = 2f;
            cell.PaddingTop = 0f;
            return cell;
        }
        private static PdfPCell ImageCell(string path, float scale, int align)
        {
            iTextSharp.text.Image image = iTextSharp.text.Image.GetInstance(HttpContext.Current.Server.MapPath(path));
            image.ScalePercent(scale);
            PdfPCell cell = new PdfPCell(image);
            cell.BorderColor = iTextSharp.text.BaseColor.WHITE;
            cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
            cell.HorizontalAlignment = align;
            cell.PaddingBottom = 0f;
            cell.PaddingTop = 0f;
            return cell;
        }

        

    }
}
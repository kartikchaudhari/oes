using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
namespace oes.faculty
{
    public partial class Pictures : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void DisplayImageList() {

            DirectoryInfo sFile = new DirectoryInfo(Server.MapPath("~/faculty/ImageQuestions"));
            var SrNo=1;
            foreach (FileInfo ImageFile in sFile.GetFiles())
            {

                Response.Write("<tr>\n\t<td>" + SrNo + "</td>\n\t<td>" + ImageFile.Name + "</td>\n\t<td>" + Request.Url.GetLeftPart(UriPartial.Authority) + Request.ApplicationPath + "faculty/ImageQuestions/" + ImageFile.Name + "</td>\n\t<td><img src='" + Request.Url.GetLeftPart(UriPartial.Authority) + Request.ApplicationPath + "faculty/ImageQuestions/" + ImageFile.Name + "' height='50px' width='50px' style='cursor:pointer;' title='Click to Enlarge Image' onclick='return AssignSrc(this.src);' data-toggle='modal' data-target='#EnlargeImageDiv'/></td><td><button type='button' class='btn btn-success' onclick='CopyUrl();'>Copy Image URL</button><strong>&nbsp;&middot;&nbsp;</strong><button id='btnDelete' type='button'>Delete</button></td></tr>\n");
                SrNo=SrNo+1;
                
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            Response.Write("<script>alert('Delete is Pressed....');</script>");
        }
        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (ImageUpload.HasFiles) {
                ImageUpload.PostedFile.SaveAs(Server.MapPath("~/faculty/ImageQuestions/")+ImageUpload.FileName);
            }
        }


    }
}
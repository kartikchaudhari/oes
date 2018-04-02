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

                Response.Write("<tr>\n\t<td align='center'>" + SrNo + "</td>\n\t<td>" + ImageFile.Name + "</td>\n\t<td align='center'><textarea id='ImageId_" + SrNo + "' readonly='readonly' cols='70'>/faculty/ImageQuestions/" + ImageFile.Name + "</textarea></td>\n\t<td align='center'><img src='" + Request.Url.GetLeftPart(UriPartial.Authority) + Request.ApplicationPath + "faculty/ImageQuestions/" + ImageFile.Name + "' height='50px' width='50px' style='cursor:pointer;' title='Click to Enlarge Image' onclick='return AssignSrc(this.src);' data-toggle='modal' data-target='#EnlargeImageDiv'/></td><td align='center'><button type='button' class='btn btn-success add-regular' onclick='CopyUrl(\"ImageId_" + SrNo + "\");'>Copy Image URL</button></td></tr>\n");
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
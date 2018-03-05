<%@ Page Title="Pictures" Language="C#" MasterPageFile="~/faculty/FrameContentMaster.Master" AutoEventWireup="true" CodeBehind="Pictures.aspx.cs" Inherits="oes.faculty.Pictures" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ExternelCss" runat="server">
    <link rel="stylesheet" href="../css/jquery.gritter.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="page_contents" runat="server">
    <form id="MediaForm" runat="server">
        <!--breadcrumb start-->
        <div class="row-fluid">
            <ol class="breadcrumb bc-custom">
                <li class="breadcrumb-item">
                    <a class="links" href="#">Dashboard</a>
                </li>
                <li class="breadcrumb-item">
                    <a class="links">Questions</a>
                </li>
                <li class="breadcrumb-item">Pictures</li>
            </ol>
        </div>
        <!--breadcrumb end-->
        <div class="panel panel-warning">
            <div class="panel-heading">
                <div class="row clearfix">
                    <div class="col-md-10 pull-left">
                        <div class="panel-heading-custom-pages" style="text-align:center;">
                            <i class="fa fa-question-circle fa-1x"></i>&nbsp;&nbsp;<span>Images for Question</span>
                        </div>
                    </div>
                    <div class="col-md-2 pull-right">
                        <div class="btn-group pull-right">
                            <button type="button" class="btn btn-primary" title="Upload Images" data-toggle="modal" data-target="#myModal">Upload Images</button>
                            <button type="button" class="btn btn-primary" title="Refresh the Page" onclick="javascript:location.reload(true);">Refresh</button>
                        </div>
                    </div>
                </div>                   
            </div>
            <div class="panel-body" style="padding-left: 6px; padding-right: 6px;">
                <span><strong>Note :</strong>Click on "<strong>Thumbnail</strong>" to enlarge image.</span><br /> 
                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th>Sr. No.</th>
                            <th>File name</th>
                            <th>Image URL</th>
                            <th>Thumbnail</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%DisplayImageList(); %>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- upload image model-->
        <div id="myModal"  class="modal fade" role="dialog">
            <div class="modal-dialog">
                <div class="panel panel-bs-two">
                    <div class="panel-heading">
                        <a href="#" class="close" data-dismiss="modal" aria-label="close">&times;</a>
                        <strong>Upload Picture</strong>
                    </div>
                    <div class="panel-body" style="padding: 20px;">
                        <strong>Select an Image to Upload </strong>
                        <br />
                        <hr />
                        <asp:FileUpload ID="ImageUpload" runat="server" />
                    </div>
                    <div class="panel-footer">
                        <asp:Button ID="btnUpload" runat="server" Text="Upload" CssClass="btn btn-primary btn-sm" OnClick="btnUpload_Click" />
                    </div>
                </div>
            </div>
        </div>

        <!-- enlarge image model-->
        <div id="EnlargeImageDiv"  class="modal fade" role="dialog">
            <div class="modal-dialog">
                <div class="panel panel-bs-two">
                    <div class="panel-heading">
                        <a href="#" class="close" data-dismiss="modal" aria-label="close">&times;</a>
                        <strong>Enlarged Image</strong>
                    </div>
                    <div class="panel-body" style="padding: 20px;">
                        <img id="EnlargedImage" src="" height="400" width="500"/>
                    </div>
                    <div class="panel-footer">
                        <button class="btn btn-primary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script type="text/javascript">
        function AssignSrc(ImageSource) {
            EnlargedImage.src = ImageSource;
        }
     
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ExternalJs" runat="server">
    <script type="text/javascript" src="../js/jquery.gritter.min.js">

    </script>
    <script type="text/javascript">
        function CopyUrl(textAreaId) {
            document.getElementById("" + textAreaId + "").select();
            document.execCommand('copy');
            $.gritter.add({
                // (string | mandatory) the heading of the notification
                title: 'Image URL Copied!',
                // (string | mandatory) the text inside the notification
                text: 'The Image URL is successfully copied to clipboard.',
                // (string | optional) the image to display on the left
                image: '../images/Green _Tick_ 2.png',
                // (bool | optional) if you want it to fade out on its own or just sit there
                sticky: false,
                // (int | optional) the time you want it to be alive for before fading out
                time: 5000
            });

            return false;
            
        }
    </script>
</asp:Content>


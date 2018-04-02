<%@ Page Title="Upload Avatar" Language="C#" MasterPageFile="~/faculty/RegisterLoginMaster.Master" AutoEventWireup="true" CodeBehind="UploadAvatar.aspx.cs" Inherits="oes.faculty.UploadAvatar" %>
<asp:Content ID="js" ContentPlaceHolderID="ExternalJs" runat="server">
    <link href="../css/Jcrop.min.css" rel="stylesheet" />
    <script src="../js/Jcrop.min.js"></script>
     <script type="text/javascript">
         $(document).ready(function () {
             $('#<%=imgUpload.ClientID%>').Jcrop({
                 onSelect: SelectCropArea
             });
         });

         function SelectCropArea(c) {
             $('#<%=X.ClientID%>').val(parseInt(c.x));
             $('#<%=Y.ClientID%>').val(parseInt(c.y));
             $('#<%=W.ClientID%>').val(parseInt(c.w));
             $('#<%=H.ClientID%>').val(parseInt(c.h));
         }

    </script>
     <style>
        .test {
            overflow:scroll;
            border:1px solid red;
            margin-top:1%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="active_class_links" runat="server">
    <li class="dropdown active">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Registration <b class="caret"></b></a>
        <ul class="dropdown-menu">
            <li><a href="../student/Register.aspx">Student</a></li> 
            <li class="active"><a href="#">Faculty</a></li>
        </ul>
    </li>
    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Login <b class="caret"></b></a>
        <ul class="dropdown-menu">
            <li><a href="../student/Login.aspx">Student</a></li>
            <li><a href="Login.aspx">Faculty</a></li>
            <li><a href="../admin/Login.aspx">Administratior</a></li>
        </ul>
    </li>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="server">
    <form id="UploadAvatarForm" runat="server"><br /><br />
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <div class="panel panel-primary">
                  <div class="panel-heading panel-heading-custom">Upload Avatar</div>
                  <div class="panel-body">
                      <div class="table-responsive">
                          <table class="table">
                            <tr>
                                <td style="width:130px;">
                                    <strong>1. Select Image:</strong>
                                </td>
                                <td>
                                    <asp:FileUpload ID="FileUpload1" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong>2.</strong> <asp:Button ID="btnUpload" runat="server" Text="Upload" CssClass="btn btn-sm btn-info" OnClick="btnUpload_Click"/>
                                </td>
                                <td>
                                    <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>
                                </td>
                             </tr>
                            <tr>
                                <td colspan="2">
                                    <strong>3. Drag and Select the Desired part of image to Crop.</strong>
                                    <asp:Panel ID="Panel1" runat="server" CssClass="test">
                                        <asp:Image ID="imgUpload" runat="server" CssClass="img-responsive" />
                                    </asp:Panel>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                   <strong>4.</strong> <asp:Button ID="btnCrop" runat="server" CssClass="btn btn-sm btn-success" Text="Crop and Save" OnClick="btnCrop_Click"/>
                                </td>
                             </tr>
                            <tr>
                                    <td colspan="2">
                                        <asp:HiddenField ID="X" runat="server" />
                                        <asp:HiddenField ID="Y" runat="server" />
                                        <asp:HiddenField ID="W" runat="server" />
                                        <asp:HiddenField ID="H" runat="server" />
                                    </td>
                                </tr>
                          </table>
                      </div>
                  </div>
                </div>
            </div>
        </div>
    </form>
    <br />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FingerCaptureHolder" runat="server">
</asp:Content>

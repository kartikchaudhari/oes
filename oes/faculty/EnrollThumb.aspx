<%@ Page Title="Enroll your Thumb Imression" Language="C#" MasterPageFile="~/faculty/RegisterLoginMaster.Master" AutoEventWireup="true" CodeBehind="EnrollThumb.aspx.cs" Inherits="oes.faculty.EnrollThumb" %>
<asp:Content ID="Content2" ContentPlaceHolderID="active_class_links" runat="server">
     <li class="dropdown active">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Registration <b class="caret"></b></a>
        <ul class="dropdown-menu">
            <li><a href="../student/Register.aspx">Student</a></li>
            <li><a href="#">Faculty</a></li>
        </ul>
    </li>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="main_content" runat="server">
<form id="thumb_form" runat="server" method="post">
    <div class="row">
        <div id="message" runat="server">
             <asp:HiddenField ID="userid" runat="server" />
        </div>
        <div class="col-sm-10 col-sm-offset-1"> 
            <div class="panel panel-info thumb_container">
                <div class="panel-heading panel-heading-custom">
                     Welcome, <asp:Label ID="lbl_welcome" runat="server"></asp:Label>
                </div>
                <div class="panel-body custom-thumb_container-body">
                    <div class="tag-note">
                       <strong>Instrunctions:</strong> Click on "<strong>Scan</strong>" button then put your "<strong>Left thumb</strong>" or "<strong>Right thumb</strong>" on scanner. 
                    </div>     
                    <hr />
                    <div class="col-md-8 col-sm-offset-2 thumb_img">
                        <img id="FPImage1" alt="Fingerpint Image" src="" />
                        <input type="hidden" id="img_val" runat="server"/>
                    </div>
                </div>
                <div class="panel-footer">
                   <div class="row">
                        <div class="col-md-4 col-md-offset-4" style="border:1px solid red;">
                            <center>
                                <input id="btnScan" class="btn btn-primary" value="Click to Scan" onclick="captureFP()" type="button" /> 
                                <strong>&nbsp;&middot;&nbsp;</strong>
                                <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-success"  Text="Upload" disabled="disabled" OnClientClick="SendToDb()" OnClick="btnSubmit_Click"/>
                                <br />
                                <label class="checkbox-inline"><input type="checkbox">Confirm to Register this Thumb</label>
                                <br />
                                <asp:Label ID="Label1" runat="server"></asp:Label>
                            </center>
                        </div>
                    </div>
                    <%--<input id="btnScan" class="col-md-offset-5 btn btn-primary" value="Click to Scan" onclick="captureFP()" type="button" />             
                    <strong>&middot;</strong>
                    <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-success"  Text="Upload" OnClick="btnSubmit_Click" disabled="true"/>
                    <asp:Label ID="Label1" runat="server"></asp:Label> --%>  
                </div>
            </div>
        </div>
    </div>
</form>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="FingerCaptureHolder" runat="server">
    <script src="../js/FingerCapture.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('input[type="checkbox"]').click(function () {
                if ($(this).prop("checked") == true) {
                    $("#btnSubmit").removeAttr("disabled");
                }
                else if ($(this).prop("checked") == false) {
                    alert("Please Agree to Registration then click on register.");
                    $("#btnSubmit").attr("disabled", "disabled");
                }
            });

        });
    </script>
    <script type="text/javascript">
        function SendToDb() {
            $(function () {

                //if the "src" attribute is not empty, means
                //there is an image data then send call the 
                //web method and sem dthe base64 string
                if ($("[id*=FPImage1]", this).attr('src') || !$("[id*=FPImage1]", this).attr('src')) {

                    //activate login button

                    var name = $.trim($("[id*=img_val]").val());
                    var id = $.trim($("[id*=userid]").val());
                    $.ajax({
                        type: "POST",
                        url: "WebMethods/BioMatricEnrollment.asmx/RegisterUser",
                        data: "{ b64: '" + name + "',UserId:'" + id + "'}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json"
                    });
                    return false;
                } else {
                    //if there is no image do nothing 
                    //for the tracing purpose comment out the
                    //following line
                    //alert('empty src...');
                }

            });
        }
    </script>
</asp:Content>
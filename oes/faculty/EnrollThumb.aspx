<%@ Page Title="Enroll your Thumb Imression" Language="C#" MasterPageFile="~/faculty/RegisterLoginMaster.Master" AutoEventWireup="true" CodeBehind="EnrollThumb.aspx.cs" Inherits="oes.faculty.EnrollThumb" ClientIDMode="Static" %>
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
        <div id="message" runat="server"></div>
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
                    <input id="btnScan" class="col-md-offset-5 btn btn-primary" value="Click to Scan" onclick="captureFP()" type="button" />             
                    <strong>&middot;</strong>
                    <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-success"  Text="Upload" OnClick="btnSubmit_Click"/>
        <asp:Label ID="Label1" runat="server"></asp:Label>   
                </div>
            </div>
        </div>
    </div>
</form>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="FingerCaptureHolder" runat="server">
    <script src="../js/FingerCapture.js"></script>
</asp:Content>
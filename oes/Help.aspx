<%@ Page Title="Help :: Online Examination System" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="Help.aspx.cs" Inherits="oes.Help" %>
<asp:Content ID="Content2" ContentPlaceHolderID="active_class_links" runat="server">
    <li><a href="Index.aspx">Home</a></li>
    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Registration <b class="caret"></b></a>
        <ul class="dropdown-menu">
            <li><a href="student/Register.aspx">Student</a></li>
            <li><a href="faculty/Register.aspx">Faculty</a></li>
        </ul>
    </li>
    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Login <b class="caret"></b></a>
        <ul class="dropdown-menu">
            <li><a href="student/Login.aspx">Student</a></li>
            <li><a href="faculty/Login.aspx">Faculty</a></li>
            <li><a href="admin/Login.aspx">Administratior</a></li>
        </ul>
    </li>
    <li class="active"><a href="Help.aspx">Help</a></li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="main_content" runat="server">
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <div class="panel panel-skycolor">
                <div class="panel-heading panel-heading-custom-pages" style="padding-top:15px;padding-bottom:15px;">Help</div>
                <div class="panel-body">
                    <div class="col-md-11">
                        <div class="list-group">
                            <a href="HelpContents/Pro20_Driver_ Installation_Final.pdf" class="list-group-item">How to Install Secugen Biometric Driver ?</a>
                            <a href="HelpContents/SECUGEN_WEB_SERVICE_API_DOC.pdf" class="list-group-item">How to Install Secugen Web API ?</a>
                            <a class="list-group-item">Third item</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

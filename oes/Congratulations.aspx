<%@ Page Title="Congratulations" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="Congratulations.aspx.cs" Inherits="oes.Congratulations" %>
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
    <li><a href="Help.aspx">Help</a></li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="main_content" runat="server">
    <form id="Form1" runat="server">
        <div class="row home_row">
            <div class="col-sm-8 col-md-8 col-lg-8 col-sm-offset-2">
                <div class="panel panel-success thumb_container">
                    <div class="panel-heading panel-heading-custom">Congratulations</div>
                    <div class="panel-body custom-thumb_container-body">
                        <span class="congrets-text">Congratulations, 
                        <asp:Label ID="FullName" runat="server"></asp:Label>
&nbsp;you are succefully registered as 
                        <asp:Label ID="UserType" runat="server"></asp:Label>
                        </span>
                        <hr />
                        [&nbsp;<a href="#">Click here to Login</a>&nbsp;]
                            <strong>&nbsp;&middot;&nbsp;</strong>
                        [&nbsp;<a href="#">Register new Student</a>&nbsp;]
                            <strong>&nbsp;&middot;&nbsp;</strong>
                        [&nbsp;<a href="#">Register new Faculty</a>&nbsp;]
                            <strong>&nbsp;&middot&nbsp;</strong>
                        [&nbsp;<a href="Index.aspx">Goto Home</a>&nbsp;]

                    </div>
                    
                </div>
            </div>
        </div>
    </form>
</asp:Content>

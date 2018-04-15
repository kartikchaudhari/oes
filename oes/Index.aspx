<%@ Page Title="Welcome to Online Examination System" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="oes.Index" %>
<asp:Content ID="Content2" ContentPlaceHolderID="active_class_links" runat="server">
    <li class="active"><a href="Index.aspx">Home</a></li>
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
    <div class="container">
        <div class="row home_row">
            <div class="col-md-4 home_div">
                <div class="container-test">
                    <img class="img-users" src="images/student.png" height="300" width="300"/>
                    <div class="overlay-left"></div>
                </div>
                <br /><br />
                <a href="student/Login.aspx" class="btn_a links" style="width:300px;">STUDENT</a>
            </div>
            <div class="col-md-4 home_div">
                <div class="container-top">
                    <img class="img-users" src="images/faculty.png" height="300" width="300" />
                    <div class="overlay-top"></div>
                </div>
                <br /><br />
                <a href="faculty/Login.aspx" class="btn_a links"  style="width:300px;">FACULTY</a>
            </div>
            
            <div class="col-md-4 home_div" style="width: 350px; padding: 6px;">
                <div class="container-right">
                    <img class="img-users" src="images/admin.png" height="300" width="300"/>
                    <div class="overlay-right"></div>    
                </div>
                <br /><br />
                <a href="admin/Login.aspx" class="btn_a links"  style="width:300px;">ADMINISTRATOR</a>
            </div>
        </div>
    </div>
</asp:Content>

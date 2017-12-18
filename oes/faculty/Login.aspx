<%@ Page Title="Login &colon;&colon; Faculty" Language="C#" MasterPageFile="~/faculty/RegisterLoginMaster.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="oes.faculty.Login" %>
<asp:Content ID="Content2" ContentPlaceHolderID="active_class_links" runat="server">
    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Registration <b class="caret"></b></a>
        <ul class="dropdown-menu">
            <li><a href="../student/Register.aspx">Student</a></li>
            <li class="active"><a href="#">Faculty</a></li>
        </ul>
    </li>
    <li class="dropdown active">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Login <b class="caret"></b></a>
        <ul class="dropdown-menu">
            <li><a href="../student/Login.aspx">Student</a></li>
            <li class="active"><a href="#">Faculty</a></li>
            <li><a href="../admin/Login.aspx">Administratior</a></li>
        </ul>
    </li>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="main_content" runat="server">
<h3 align="center">Faculty :: Login</h3>    
</asp:Content>


<asp:Content ID="Content4" ContentPlaceHolderID="FingerCaptureHolder" runat="server">
</asp:Content>

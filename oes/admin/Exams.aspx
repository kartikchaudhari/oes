<%@ Page Title="Exams" Language="C#" MasterPageFile="~/admin/FrameContentMaster.Master" AutoEventWireup="true" CodeBehind="Exams.aspx.cs" Inherits="oes.admin.Exams" %>
<asp:Content ID="Content1" ContentPlaceHolderID="page_contents" runat="server">
    <!--breadcrumb start-->
    <div class="row-fluid">
        <ol class="breadcrumb bc-custom">
            <li class="breadcrumb-item"><a class="links" href="DashboardContents.aspx">Dashboard</a></li>
            <li class="breadcrumb-item active">Exams</li>
        </ol>
    </div>
    <!--breadcrumb end-->
    <button style="float: right; position: relative; margin-top: 20px; margin-right: 20px;" onclick="javascript:location.reload(true);">Refresh</button>
</asp:Content>

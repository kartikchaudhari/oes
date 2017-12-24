<%@ Page Title="Subjects" Language="C#" MasterPageFile="~/admin/FrameContentMaster.Master" AutoEventWireup="true" CodeBehind="Subjects.aspx.cs" Inherits="oes.admin.Subjects" %>
<asp:Content ID="Content1" ContentPlaceHolderID="page_contents" runat="server">
    <!--breadcrumb start-->
    <div class="row-fluid">
        <ol class="breadcrumb bc-custom">
            <li class="breadcrumb-item"><a class="links" href="DashboardContents.aspx">Dashboard</a></li>
            <li class="breadcrumb-item active">Subjects</li>
        </ol>
    </div>
    <!--breadcrumb end-->
    <button style="float: right; position: relative; margin-top: 20px; margin-right: 20px;" onclick="javascript:location.reload(true);">Refresh</button>
</asp:Content>

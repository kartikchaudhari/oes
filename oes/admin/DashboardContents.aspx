<%@ Page Title="" Language="C#" MasterPageFile="~/admin/FrameContentMaster.Master" AutoEventWireup="true" CodeBehind="DashboardContents.aspx.cs" Inherits="oes.admin.DashboardContents" %>
<asp:Content ID="Content1" ContentPlaceHolderID="page_contents" runat="server">
    <div class="container">
        <div class="row">
            <h1 align="center">Welcome,<asp:Label ID="welcome_user" runat="server"></asp:Label></h1>
        </div>
    </div>
</asp:Content>

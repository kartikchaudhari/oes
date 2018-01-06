<%@ Page Title="View Questions" Language="C#" MasterPageFile="~/admin/FrameContentMaster.Master" AutoEventWireup="true" CodeBehind="ViewQuestions.aspx.cs" Inherits="oes.admin.ViewQuestions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="page_contents" runat="server">
    <h1>View Questions</h1>
    <h4>Subject ID:<%Response.Write(Request.QueryString["subject_id"]); %></h4>
</asp:Content>

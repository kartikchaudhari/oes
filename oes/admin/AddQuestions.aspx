<%@ Page Title="Add Questions" Language="C#" MasterPageFile="~/admin/FrameContentMaster.Master" AutoEventWireup="true" CodeBehind="AddQuestions.aspx.cs" Inherits="oes.admin.AddQuestions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="page_contents" runat="server">
    <h1>Add Questions</h1>
    <h4>Subject ID:<%Response.Write(Request.QueryString["subject_id"]); %></h4>
</asp:Content>

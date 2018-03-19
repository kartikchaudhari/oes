<%@ Page Title="" Language="C#" MasterPageFile="~/student/FrameContentMaster.Master" AutoEventWireup="true" CodeBehind="StartExam.aspx.cs" Inherits="oes.student.StartExam" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ExternelCss" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="page_contents" runat="server">
    <%
        if (Request.QueryString["ExamId"]!=null)
        {
            Response.Write(Request.QueryString["ExamId"].ToString());
        }    
    %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ExternalJs" runat="server">
</asp:Content>

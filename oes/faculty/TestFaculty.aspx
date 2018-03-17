<%@ Page Title="" Language="C#" MasterPageFile="~/faculty/FrameContentMaster.Master" AutoEventWireup="true" CodeBehind="TestFaculty.aspx.cs" Inherits="oes.faculty.TestFaculty" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ExternelCss" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="page_contents" runat="server">
    <form id="d" runat="server">
    <asp:Label ID="Label1" runat="server"></asp:Label>
    <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ExternalJs" runat="server">
</asp:Content>

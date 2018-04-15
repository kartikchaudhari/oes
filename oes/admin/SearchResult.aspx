<%@ Page Title="" Language="C#" MasterPageFile="~/admin/FrameContentMaster.Master" AutoEventWireup="true" CodeBehind="SearchResult.aspx.cs" Inherits="oes.admin.SearchResult" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ExternelCss" runat="server">
    <script type="text/javascript" src="../js/ASPSnippets_Pager.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="page_contents" runat="server">
    <form id="frm" runat="server">
    <asp:TextBox ID="TextBox1" runat="server" TextMode="Number"></asp:TextBox><asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" >
        <Columns>
            <asp:BoundField DataField="result_id" HeaderText="Result Id" />

        </Columns>
        </asp:GridView>
    <br />
    <asp:Label ID="Label1" runat="server" EnableViewState="False"></asp:Label>
        </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ExternalJs" runat="server">
</asp:Content>

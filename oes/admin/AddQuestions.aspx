<%@ Page Title="Add Questions" Language="C#" MasterPageFile="~/admin/FrameContentMaster.Master" AutoEventWireup="true" CodeBehind="AddQuestions.aspx.cs" Inherits="oes.admin.AddQuestions" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="page_contents" runat="server">
    <h1>Add Questions</h1>
    <h4>Subject ID:<%Response.Write(Request.QueryString["subject_id"]); %></h4>
    <form runat="server">
        <div>
            <CKEditor:CKEditorControl ID="CKEditor1" BasePath="ckeditor/" runat="server">
            </CKEditor:CKEditorControl>
        </div>
        <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </form>
</asp:Content>

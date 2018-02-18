<%@ Page Title="" Language="C#" MasterPageFile="~/faculty/FrameContentMaster.Master" AutoEventWireup="true" CodeBehind="AddQuestions.aspx.cs" Inherits="oes.faculty.AddQuestions" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ExternelCss" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="page_contents" runat="server">
    <h1>Add Questions</h1>
    <h4>Subject ID:<%Response.Write(Request.QueryString["subject_id"]); %></h4>
    <form id="AddQuestions" runat="server">
        <!--breadcrumb start-->
        <div class="row-fluid">
            <ol class="breadcrumb bc-custom">
                <li class="breadcrumb-item">
                    <a class="links" href="Dashboard.aspx">Dashboard</a>
                </li>
                <li class="breadcrumb-item active">Departments</li>
            </ol>
        </div>
        <!--breadcrumb end-->
        <button style="float: right; position: relative; margin-top: 14.5px; margin-right: 20px;" onclick="javascript:location.reload(true);">Refresh</button>
        
            <div class="panel panel-primary">
                <div class="panel-heading">Panel with panel-primary class</div>
                <div class="panel-body">Panel Content</div>
            </div>
                
        <div>
            <CKEditor:CKEditorControl ID="CKEditor1" BasePath="ckeditor/" runat="server">
            </CKEditor:CKEditorControl>
        </div>
        <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ExternalJs" runat="server">
</asp:Content>

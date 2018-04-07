<%@ Page Title="Result Archive" Language="C#" MasterPageFile="~/student/FrameContentMaster.Master" AutoEventWireup="true" CodeBehind="ResultArchive.aspx.cs" Inherits="oes.student.ResultArchive" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ExternelCss" runat="server">
    <link rel="stylesheet" href="../css/gridview.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="page_contents" runat="server">
    <form id="ResultArchiveForm" runat="server">
    <asp:HiddenField ID="hf_stud_id" runat="server" />
<!--breadcrumb start-->
    <div class="row-fluid">
        <ol class="breadcrumb bc-custom">
            <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
            <li class="breadcrumb-item active">Results</li>
        </ol>
    </div>
<!--breadcrumb end-->
      <div class="panel panel-bj-one">
        <div class="panel-heading panel-heading-custom-pages">Result Archive</div>
        <div class="panel-body">
            <div class="table-responsive">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" 
                    CssClass="table table-bordered table-hover" DataSourceID="ObjectDataSource1" PageSize="8" >
                    <Columns>
                        <asp:BoundField DataField="ExamName" HeaderText="ExamName" SortExpression="ExamName" />
                        <asp:BoundField DataField="ExamType" HeaderText="ExamType" SortExpression="ExamType" />
                        <asp:BoundField DataField="ExamDate" HeaderText="ExamDate" SortExpression="ExamDate" />
                        <asp:BoundField DataField="SubjectName" HeaderText="SubjectName" SortExpression="SubjectName" />
                        <asp:BoundField DataField="TotalMarks" HeaderText="TotalMarks" SortExpression="TotalMarks" />
                        <asp:BoundField DataField="PassingMarks" HeaderText="PassingMarks" SortExpression="PassingMarks" />
                        <asp:BoundField DataField="ObtainedMarks" HeaderText="ObtainedMarks" SortExpression="ObtainedMarks" />
                        <asp:BoundField DataField="Result" HeaderText="Result" SortExpression="Result" />
                    </Columns>
                    <HeaderStyle CssClass="active" HorizontalAlign="Center" />
                    <PagerStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="pagination-ys" />
                </asp:GridView>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="FetchStudentResult" TypeName="oes.student.Class.ResultArchiveDataAccessLayer">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="hf_stud_id" Name="StudentId" PropertyName="Value" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </div>
        </div>
      </div>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ExternalJs" runat="server">
</asp:Content>

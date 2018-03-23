<%@ Page Title="Manage Exams" Language="C#" MasterPageFile="~/faculty/FrameContentMaster.Master" AutoEventWireup="true" CodeBehind="ManageExams.aspx.cs" Inherits="oes.faculty.ManageExams" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ExternelCss" runat="server">
    <link rel="stylesheet" href="../css/gridview.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="page_contents" runat="server">
    <form id="ManageExamsForm" runat="server">
        <!--breadcrumb start-->
        <div class="row-fluid">
            <ol class="breadcrumb bc-custom">
                <li class="breadcrumb-item">
                    <a class="links" href="#">Dashboard</a>
                </li>
                <li class="breadcrumb-item"><a class="links" href="#">Exams</a></li>
                <li class="breadcrumb-item active">Manage Exams</li>
            </ol>
        </div>
        <%if (Request.QueryString["ErrorId"] != null)
          {
           //ExamId is not set on other pages then redirect to ManageExamp page and display following alert
           Response.Write("<div class='alert alert-warning alert-dismissable fade in' style='margin-top:30px;'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><strong>Sorry!</strong> Please Select the Desired exam from below list, then Create Question paper.</div>");
         } %>
        <!--breadcrumb end-->
        <button class="btn btn-primary btn-sm" style="float: right; position: relative; margin-top: 14.5px; margin-right: 20px;" onclick="javascript:location.reload(true);">Refresh</button>
        <div class="panel panel-mint-two">
            <div class="panel-heading panel-heading-custom-pages">
                <i class="fa fa-pencil fa-1x"></i>&nbsp;&nbsp;<span>Manage Exams</span>
            </div>
            <div class="panel-body">
                <asp:HiddenField ID="hf_dept_id" runat="server" />
                <div class="table-responsive" style="padding:1%;">
                    <asp:GridView ID="ExamListGirdView" runat="server" AutoGenerateColumns="False" 
                        DataKeyNames="ExamId" DataSourceID="ObjectDataSourceExamList" 
                        AllowPaging="True" AllowSorting="True" PageSize="5" CssClass="table table-bordered table-hover" >
                        <Columns>
                            <asp:TemplateField HeaderText="checkbox"></asp:TemplateField>
                            <asp:TemplateField HeaderText="Exam ID">
                                <ItemTemplate>
                                    <asp:Label ID="lblExamIdIteams" runat="server" Text='<%# Bind("ExamId") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="Exam Name" DataField="ExamName" />
                            <asp:BoundField HeaderText="Exam Type" DataField="ExamType" />
                            <asp:BoundField HeaderText="Semester" DataField="SemId"/>
                            <asp:BoundField HeaderText="Subject" DataField="SubjectName" />
                            <asp:BoundField HeaderText="Exam Code" DataField="ExamCode" />
                            <asp:BoundField HeaderText="Exam Date" DataField="ExamDate" />
                       
                             <asp:HyperLinkField DataNavigateUrlFields="ExamId" DataNavigateUrlFormatString="~/faculty/AddQuestionToExam.aspx?ExamId={0}"
                                    HeaderText="Actions" ItemStyle-Width = "150" DataTextFormatString="Add Questions" Text="Add Questions" >
                                    <ItemStyle Width="150px"></ItemStyle>
                             </asp:HyperLinkField>
        
                            <asp:CommandField ButtonType="Button" ShowEditButton="True" HeaderText="Edit" />
                            <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" />
        
                        </Columns>
                        <PagerStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="pagination-ys" />
                    </asp:GridView>
                    <asp:ObjectDataSource ID="ObjectDataSourceExamList" runat="server" SelectMethod="GetAllExamsByDeptId" TypeName="oes.faculty.Class.ExamDataAccessLayer" DeleteMethod="DeleteExam">
                        <DeleteParameters>
                            <asp:Parameter Name="ExamId" Type="Int32" />
                       </DeleteParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="hf_dept_id" Name="DeptId" PropertyName="Value" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ExternalJs" runat="server">
    
</asp:Content>

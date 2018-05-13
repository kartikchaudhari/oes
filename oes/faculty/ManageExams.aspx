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
         }
          if (Request.QueryString["Action"] == "QAdded")
          {
         
              Response.Write("<div class='alert alert-success alert-dismissable fade in' style='margin-top:30px;'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><strong>Congratulations</strong> Exam added Successfully.</div>");
          }
         
          %>
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
                        AllowPaging="True" AllowSorting="True" PageSize="5" 
                        CssClass="table table-bordered table-hover" EnableViewState="False"
                        EmptyDataText="No Exam Found Please Add exams using Add Exam Modual">
                        <Columns>
                            <asp:TemplateField HeaderText="checkbox"></asp:TemplateField>
                            <asp:TemplateField HeaderText="Exam ID" HeaderStyle-CssClass="active">
                                <ItemTemplate>
                                    <asp:Label ID="lblExamIdIteams" runat="server" Text='<%# Bind("ExamId") %>'></asp:Label>
                                </ItemTemplate>

                                <HeaderStyle CssClass="active"></HeaderStyle>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="Exam Name" DataField="ExamName" HeaderStyle-CssClass="active">
                                <HeaderStyle CssClass="active"></HeaderStyle>
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Exam Type" DataField="ExamType" HeaderStyle-CssClass="active">
                                <HeaderStyle CssClass="active"></HeaderStyle>
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Semester" DataField="SemId" HeaderStyle-CssClass="active">
                                <HeaderStyle CssClass="active"></HeaderStyle>
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Subject" DataField="SubjectName" HeaderStyle-CssClass="active">
                                <HeaderStyle CssClass="active"></HeaderStyle>
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Exam Code" DataField="ExamCode" HeaderStyle-CssClass="active">
                                <HeaderStyle CssClass="active"></HeaderStyle>
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Exam Date" DataField="ExamDate" HeaderStyle-CssClass="active">

                                <HeaderStyle CssClass="active"></HeaderStyle>
                            </asp:BoundField>

                            <asp:HyperLinkField DataNavigateUrlFields="ExamId" DataNavigateUrlFormatString="~/faculty/AddQuestionToExam.aspx?ExamId={0}"
                                HeaderText="Add Questions" HeaderStyle-CssClass="active" ItemStyle-Width="150" DataTextFormatString="Add Questions" Text="Add Questions">
                                <ControlStyle CssClass="btn btn-success" />
                                <HeaderStyle CssClass="active"></HeaderStyle>

                                <ItemStyle Width="150px"></ItemStyle>
                            </asp:HyperLinkField>

                            <asp:CommandField ButtonType="Button" ShowEditButton="true" HeaderStyle-CssClass="active" HeaderText="Edit">
                                <ControlStyle CssClass="btn btn-info" />
                                <HeaderStyle CssClass="active"></HeaderStyle>
                            </asp:CommandField>
                            <asp:CommandField ButtonType="Button" ShowDeleteButton="True" HeaderStyle-CssClass="active" HeaderText="Delete">

                                <ControlStyle CssClass="btn btn-danger" />
                                <HeaderStyle CssClass="active"></HeaderStyle>
                            </asp:CommandField>
        
                        </Columns>
                        <EmptyDataRowStyle Font-Bold="True" Font-Size="16pt" ForeColor="#CC0000" HorizontalAlign="Center" VerticalAlign="Middle" />
                        <PagerStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="pagination-ys" />
                    </asp:GridView>
                    <asp:ObjectDataSource ID="ObjectDataSourceExamList" runat="server" SelectMethod="GetAllExamsByDeptId" TypeName="oes.faculty.Class.ExamDataAccessLayer" DeleteMethod="DeleteExam" UpdateMethod="UpdateExam">
                        <DeleteParameters>
                            <asp:Parameter Name="ExamId" Type="Int32" />
                       </DeleteParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="hf_dept_id" Name="DeptId" PropertyName="Value" Type="Int32" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="ExamId" Type="Int32" />
                            <asp:Parameter Name="ExamDate" Type="String" />
                        </UpdateParameters>
                    </asp:ObjectDataSource>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ExternalJs" runat="server">
    
</asp:Content>

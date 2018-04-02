<%@ Page Title="Upcomming Exams" Language="C#" MasterPageFile="~/student/FrameContentMaster.Master" AutoEventWireup="true" CodeBehind="UpCommingExams.aspx.cs" Inherits="oes.student.UpCommingExams" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ExternelCss" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="page_contents" runat="server">
    <form id="UpCommingExamsForm" runat="server">
        <asp:HiddenField ID="hf_dept_id" runat="server" />
        <asp:HiddenField ID="hf_sem_id" runat="server" />
        <asp:HiddenField ID="hf_current_date" runat="server" />
         <!--breadcrumb start-->
        <div class="row-fluid">
            <ol class="breadcrumb bc-custom">
                <li class="breadcrumb-item">
                    <a class="links" href="#">Dashboard</a>
                </li>
                <li class="breadcrumb-item"><a class="links" href="#">Exams</a></li>
                <li class="breadcrumb-item active">Upcomming Exams</li>
            </ol>
        </div>
        <!--breadcrumb end-->

        <button class="btn btn-primary btn-sm" style="float: right; position: relative; margin-top: 14.5px; margin-right: 20px;" onclick="javascript:location.reload(true);">Refresh</button>
        <div class="panel panel-pr-two">
            <div class="panel-heading panel-heading-custom-pages">
                <i class="fa fa-pencil fa-1x"></i>&nbsp;&nbsp;<span>Upcomming Exams</span>
            </div>
            <div class="panel-body">
                <div class="row" style="padding-left:15px;padding-right:15px;">
                    <div class="table-responsive">
                        <asp:GridView ID="GridView1" runat="server" BackColor="White" CellPadding="3"
                             CellSpacing="1" GridLines="None" CssClass="table"
                             AutoGenerateColumns="False" DataSourceID="ObjectDataSourceUpCommingExamGv"
                             EmptyDataText="No Exam Found Please Contact your faculty For more Information" >
                            <Columns>
                                <asp:BoundField DataField="ExamName" HeaderText="Exam Name" SortExpression="ExamName" />
                                <asp:BoundField DataField="ExamType" HeaderText="Exam Type" SortExpression="ExamType" />
                                <asp:BoundField DataField="SubjectName" HeaderText="Subject Name" SortExpression="SubjectName" />
                                <asp:BoundField DataField="ExamCode" HeaderText="Exam Code" SortExpression="ExamCode" />
                                <asp:BoundField DataField="ExamDate" HeaderText="Exam Date" SortExpression="ExamDate" />
                            </Columns>
                            <EmptyDataRowStyle Font-Bold="True" Font-Size="16pt" ForeColor="#CC0000" HorizontalAlign="Center" VerticalAlign="Middle" />
                            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                            <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#594B9C" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#33276A" />
                        </asp:GridView>
                        <asp:ObjectDataSource ID="ObjectDataSourceUpCommingExamGv" runat="server" SelectMethod="GetUpCommingExam" TypeName="oes.faculty.Class.ExamDataAccessLayer">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="hf_dept_id" Name="Dept_ID" PropertyName="Value" Type="String" />
                                <asp:ControlParameter ControlID="hf_sem_id" Name="SemId" PropertyName="Value" Type="String" />
                                <asp:ControlParameter ControlID="hf_current_date" Name="CurDate" PropertyName="Value" Type="String" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ExternalJs" runat="server">
</asp:Content>

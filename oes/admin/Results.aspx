<%@ Page Title="Results" Language="C#" MasterPageFile="~/admin/FrameContentMaster.Master" AutoEventWireup="true" CodeBehind="Results.aspx.cs" Inherits="oes.admin.Results" %>
<asp:Content ID="Content1" ContentPlaceHolderID="page_contents" runat="server">
<form id="ResultsForm" runat="server">
    <!--breadcrumb start-->
    <div class="row-fluid">
        <ol class="breadcrumb bc-custom">
            <li class="breadcrumb-item"><a class="links" href="DashboardContents.aspx">Dashboard</a></li>
            <li class="breadcrumb-item active">Results</li>
        </ol>
    </div>
    <!--breadcrumb end-->
    <button style="float: right; position: relative; margin-top:14.5px; margin-right: 20px;" onclick="javascript:location.reload(true);">Refresh</button>
    <div class="panel panel-default">
        <div class="panel-heading panel-heading-custom-pages">
            <i class="fa fa-edit fa-1x"></i>&nbsp;&nbsp;<span>Manage Results</span>
        </div>
        
        <div class="panel-body">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="row">
                        <div class="col-md-4 pull-left">
                             <div class="input-group">
                                 <asp:TextBox ID="tbSearch" runat="server" CssClass="form-control" placeholder="Enter Student Enrollmet No." TextMode="Number" required="required" AutoPostBack="true" OnTextChanged="tbSearch_TextChanged" ></asp:TextBox>
                                 <span class="input-group-btn">
                                    <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-success"  Text="Search" OnClick="btnSearch_Click" />           
                                 </span>
                             </div>
                         </div>
                        <div class="col-md-4 pull-right">
                 <asp:Button ID="btnExport" runat="server" CssClass="btn btn-info pull-right" Text="Export Search Result" />
             </div>
                        <div class="clearfix"></div>
                     </div>
                    <hr />
                    <div class="table-responsive">
                         <asp:GridView ID="GridViewResult" runat="server" AutoGenerateColumns="False" 
                            DataKeyNames="result_id" EmptyDataText="No Records Found"
                            CssClass="table table-bordered table-hover" AllowSorting="True" >
                             <Columns>
                                 <asp:BoundField HeaderStyle-CssClass="active" DataField="result_id" HeaderText="Result Id" SortExpression="q_id" />
                                 <asp:TemplateField HeaderStyle-CssClass="active" HeaderText="Student Name" SortExpression="student_id">
                                     <ItemTemplate>
                                         <a class="links" href="StudentProfile.aspx?StudentId=<%# Eval("student_id").ToString()%>&action=view"><%# FetchStudentNameById(Eval("student_id").ToString())%></a>
                                        <%-- <asp:Label ID="lblStudtName" Text='<%# FetchStudentNameById(Eval("student_id").ToString())%>'
                                             runat="server" />--%>
                                     </ItemTemplate>
                                 </asp:TemplateField>

                                 <asp:BoundField HeaderStyle-CssClass="active" DataField="enrollment_no" HeaderText="Enrollment No"/>
                                 <asp:TemplateField HeaderStyle-CssClass="active" HeaderText="Exam Name" SortExpression="exam_id">
                                     <ItemTemplate>
                                         <asp:Label ID="lblExamName" Text='<%# FetchExamNameById(Eval("exam_id").ToString())%>'
                                             runat="server" />
                                     </ItemTemplate>
                                 </asp:TemplateField>
                                 <asp:TemplateField HeaderStyle-CssClass="active" HeaderText="Department" SortExpression="dept_id">
                                     <ItemTemplate>
                                         <%--<asp:Label ID="lblQtype" Text='<%# DetermineQType(Eval("question_type").ToString())%>'
                                             runat="server" />--%>
                                     </ItemTemplate>
                                 </asp:TemplateField>
                                 <asp:BoundField HeaderStyle-CssClass="active" DataField="sem_id" HeaderText="Semester" SortExpression="sem_id" />
                                  <asp:TemplateField HeaderStyle-CssClass="active" HeaderText="Subject" SortExpression="subject_id">
                                     <ItemTemplate>
                                        <%-- <asp:Label ID="lblCorrectAns" Text='<%# CorrectAnsChar(Eval("correct_ans").ToString())%>'
                                             runat="server" />--%>
                                     </ItemTemplate>
                                 </asp:TemplateField>
                                 <asp:TemplateField HeaderStyle-CssClass="active" HeaderText="Result" SortExpression="result_status">
                                     <ItemTemplate>
                                        <%-- <asp:Label ID="lblCorrectAns" Text='<%# CorrectAnsChar(Eval("correct_ans").ToString())%>'
                                             runat="server" />--%>
                                     </ItemTemplate>
                                 </asp:TemplateField>
                                                           
                                 <asp:BoundField DataField="marks" HeaderText="Marks" HeaderStyle-CssClass="active" SortExpression="marks" />
                             </Columns>
                         </asp:GridView>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnSearch" />
                    <asp:AsyncPostBackTrigger ControlID="tbSearch" />
                </Triggers>
            </asp:UpdatePanel>
           
           <hr />
           
        </div>
        
    </div>

</form>
</asp:Content>

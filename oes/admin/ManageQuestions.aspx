<%@ Page Title="Manage Questions" Language="C#" MasterPageFile="~/admin/FrameContentMaster.Master" AutoEventWireup="true" CodeBehind="ManageQuestions.aspx.cs" Inherits="oes.admin.ManageQuestions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ExternelCss" runat="server">
   <%----%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="page_contents" runat="server">
    <form id="ManageQuestionForm" runat="server">
        <!--breadcrumb start-->
        <div class="row-fluid">
            <ol class="breadcrumb bc-custom">
                <li class="breadcrumb-item">
                    <a class="links" href="#">Dashboard</a>
                </li>
                <li class="breadcrumb-item">
                    <a class="links" href="Subjects.aspx">Subjects</a>
                </li>
                <li class="breadcrumb-item active">Manage Questions</li>
            </ol>
        </div>
        <!--breadcrumb end-->

        <div class="panel panel-primary">
            <div class="panel-heading panel-heading-custom-pages">
                 <i class="fa fa-question-circle fa-1x"></i>&nbsp;&nbsp;<span>Manage Questions</span>
            </div>
            <div class="panel-body">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div class="row">
                            
                            <div class="col-md-4">
                                <asp:DropDownList ID="DdlDept" CssClass="form-control" runat="server" 
                                    AutoPostBack="True" DataSourceID="DsDdlDept" DataTextField="dept_name" 
                                    DataValueField="dept_id" OnSelectedIndexChanged="DdlDept_SelectedIndexChanged"  AppendDataBoundItems="true" >
                                    <asp:ListItem Text="--- Select Department ---" Value="0" Selected="True"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="DsDdlDept" runat="server" ConnectionString="<%$ ConnectionStrings:ExamDbConString %>" SelectCommand="SELECT [dept_id], [dept_name] FROM [department]"></asp:SqlDataSource>
                            </div>
                            <div class="col-md-4">
                                <asp:DropDownList ID="DdlSem" CssClass="form-control" 
                                    runat="server" AutoPostBack="True" 
                                    OnSelectedIndexChanged="DdlSem_SelectedIndexChanged"  AppendDataBoundItems="true" >
                                    <asp:ListItem Text="--- Select Semester ---" Value="0" Selected="True"></asp:ListItem>
                                    <asp:ListItem>1</asp:ListItem>
                                    <asp:ListItem>2</asp:ListItem>
                                    <asp:ListItem>3</asp:ListItem>
                                    <asp:ListItem>4</asp:ListItem>
                                    <asp:ListItem>5</asp:ListItem>
                                    <asp:ListItem>6</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-4">
                                <asp:DropDownList ID="DdlSubject" CssClass="form-control" 
                                    runat="server" AutoPostBack="True" DataSourceID="DsSubject" 
                                    DataTextField="subject_name" DataValueField="subject_id"
                                     OnSelectedIndexChanged="DdlSubject_SelectedIndexChanged"  AppendDataBoundItems="true">
                                    <asp:ListItem Text="--- Select Subject ---" Value="0" Selected="True"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="DsSubject" runat="server" ConnectionString="<%$ ConnectionStrings:ExamDbConString %>" SelectCommand="SELECT [subject_id], [subject_name] FROM [subject] WHERE (([dept_id] = @dept_id) AND ([sem_id] = @sem_id))">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="DdlDept" Name="dept_id" PropertyName="SelectedValue" Type="Int32" />
                                        <asp:ControlParameter ControlID="DdlSem" Name="sem_id" PropertyName="SelectedValue" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-md-12 table-responsive">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                    DataKeyNames="q_id" DataSourceID="DsGv" EmptyDataText="No Records Found"
                                     CssClass="table table-bordered table-hover" AllowPaging="True" AllowSorting="True" >
                                    <Columns>
                                        <asp:BoundField HeaderStyle-CssClass="active"  DataField="q_id" HeaderText="Question Id" InsertVisible="False" ReadOnly="True" SortExpression="q_id" />
                                        <asp:TemplateField HeaderStyle-CssClass="active"  HeaderText="Department" SortExpression="dept_id" >
                                            <ItemTemplate>
                                                <asp:Label ID="lblDeptName" Text='<%# FetchDeptById(Eval("dept_id").ToString())%>'
                                                    runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        
                                        <asp:BoundField HeaderStyle-CssClass="active" DataField="sem_id" HeaderText="Semester" SortExpression="sem_id" />
                                        <asp:TemplateField HeaderStyle-CssClass="active"  HeaderText="Subject" SortExpression="subject_id" >
                                            <ItemTemplate>
                                                <asp:Label ID="lblSubject" Text='<%# FetchSubjectById(Eval("subject_id").ToString())%>'
                                                    runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderStyle-CssClass="active"  HeaderText="Question Type" SortExpression="question_type" >
                                            <ItemTemplate>
                                                <asp:Label ID="lblQtype" Text='<%# DetermineQType(Eval("question_type").ToString())%>'
                                                    runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="question" HeaderText="Question" HeaderStyle-CssClass="active" SortExpression="question" />
                                        <asp:BoundField DataField="opt_a" HeaderText="Option A" HeaderStyle-CssClass="active" SortExpression="opt_a" />
                                        <asp:BoundField DataField="opt_b" HeaderText="Option B" HeaderStyle-CssClass="active" SortExpression="opt_b" />
                                        <asp:BoundField DataField="opt_c" HeaderText="Option C" HeaderStyle-CssClass="active" SortExpression="opt_c" />
                                        <asp:BoundField DataField="opt_d" HeaderText="Option D" HeaderStyle-CssClass="active" SortExpression="opt_d" />
                                         <asp:TemplateField HeaderStyle-CssClass="active"  HeaderText="Correct Answer" SortExpression="correct_ans" >
                                            <ItemTemplate>
                                                <asp:Label ID="lblCorrectAns" Text='<%# CorrectAnsChar(Eval("correct_ans").ToString())%>'
                                                    runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="marks" HeaderText="Marks" HeaderStyle-CssClass="active" SortExpression="marks" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="DsGv" runat="server" ConnectionString="<%$ ConnectionStrings:ExamDbConString %>" SelectCommand="SELECT * FROM [questions]"></asp:SqlDataSource>
                                <asp:SqlDataSource ID="DsGvByDept" runat="server" ConnectionString="<%$ ConnectionStrings:ExamDbConString %>" SelectCommand="SELECT * FROM [questions] WHERE ([dept_id] = @dept_id)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="DdlDept" Name="dept_id" PropertyName="SelectedValue" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="DsGvByDeptSem" runat="server" ConnectionString="<%$ ConnectionStrings:ExamDbConString %>" SelectCommand="SELECT * FROM [questions] WHERE (([dept_id] = @dept_id) AND ([sem_id] = @sem_id))">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="DdlDept" Name="dept_id" PropertyName="SelectedValue" Type="Int32" />
                                        <asp:ControlParameter ControlID="DdlSem" Name="sem_id" PropertyName="SelectedValue" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="DsGvByDeptSemSub" runat="server" ConnectionString="<%$ ConnectionStrings:ExamDbConString %>" SelectCommand="SELECT * FROM [questions] WHERE (([dept_id] = @dept_id) AND ([sem_id] = @sem_id) AND ([subject_id] = @subject_id))">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="DdlDept" Name="dept_id" PropertyName="SelectedValue" Type="Int32" />
                                        <asp:ControlParameter ControlID="DdlSem" Name="sem_id" PropertyName="SelectedValue" Type="Int32" />
                                        <asp:ControlParameter ControlID="DdlSubject" Name="subject_id" PropertyName="SelectedValue" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                        </div>
                     </ContentTemplate>
                     <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="DdlDept" />
                        <asp:AsyncPostBackTrigger ControlID="DdlSem" />
                        <asp:AsyncPostBackTrigger ControlID="DdlSubject" />
                     </Triggers>
                 </asp:UpdatePanel>
            </div>
        </div>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ExternalJs" runat="server">
</asp:Content>

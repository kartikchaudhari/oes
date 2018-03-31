<%@ Page Title="Student :: Enroll to Exam" Language="C#" MasterPageFile="~/student/FrameContentMaster.Master" AutoEventWireup="true" CodeBehind="EnrollToExam.aspx.cs" Inherits="oes.student.EnrollToExam" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ExternelCss" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="page_contents" runat="server">
    <form id="EnrollToExamForm" runat="server">
        <!--breadcrumb start-->
        <div class="row-fluid">
            <ol class="breadcrumb bc-custom">
                <li class="breadcrumb-item">
                    <a class="links" href="#">Dashboard</a>
                </li>
                <li class="breadcrumb-item"><a class="links" href="#">Exams</a></li>
                <li class="breadcrumb-item active">Enroll to Exam</li>
            </ol>
        </div>
        <!--breadcrumb end-->

        <button class="btn btn-primary btn-sm" style="float: right; position: relative; margin-top: 14.5px; margin-right: 20px;" onclick="javascript:location.reload(true);">Refresh</button>
        <div class="panel panel-bs-two">
            <div class="panel-heading panel-heading-custom-pages">
                <i class="fa fa-pencil fa-1x"></i>&nbsp;&nbsp;<span>Enroll to Exams</span>
            </div>
            <div class="panel-body">
                <div class="row">
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <div class="col-md-8 col-md-offset-2" style="padding:8px;">
                                <div class="form-group">
                                    <label for="email">Select Department:</label>
                                    <asp:DropDownList ID="DdlDept" CssClass="form-control" runat="server">
                                        <asp:ListItem Value="NA" Text="---- Select Department ----"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RfVDdlDept" runat="server" ErrorMessage="Please Select Department" ControlToValidate="DdlDept" CssClass="ErrMsg" InitialValue="NA"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <label for="pwd">Select Semester:</label>
                                    <asp:DropDownList ID="DdlSem" CssClass="form-control" runat="server">
                                        <asp:ListItem Value="NA" Text="---- Select Semester ----"></asp:ListItem>
                                        <asp:ListItem Value="1" Text="1"></asp:ListItem>
                                        <asp:ListItem Value="2" Text="2"></asp:ListItem>
                                        <asp:ListItem Value="3" Text="3"></asp:ListItem>
                                        <asp:ListItem Value="4" Text="4"></asp:ListItem>
                                        <asp:ListItem Value="5" Text="5"></asp:ListItem>
                                        <asp:ListItem Value="6" Text="6"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RfvDdlSem" runat="server" ErrorMessage="Please Select Semester" ControlToValidate="DdlSem" CssClass="ErrMsg" InitialValue="NA"></asp:RequiredFieldValidator>
                                </div>
                                <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-success" Text="Search Exam" OnClick="btnSearch_Click" />
                                <strong>&middot;</strong>
                                <button type="reset" class="btn btn-danger">Reset</button>
                                <br /><br />
                                <asp:Panel ID="PanelSearchResult" runat="server" Visible="false">
                                     <div id="ExamListDiv" class="table-responsive" runat="server">
                                         
                                     </div>
                                </asp:Panel>
                            </div>
                        </ContentTemplate>
                        <Triggers>
                           <asp:AsyncPostBackTrigger ControlID="btnSearch" />
                        </Triggers>
                    </asp:UpdatePanel>
                    
                </div>
            </div>
        </div>

    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ExternalJs" runat="server">
</asp:Content>

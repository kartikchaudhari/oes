<%@ Page Title="Create Exam" Language="C#" MasterPageFile="~/faculty/FrameContentMaster.Master" AutoEventWireup="true" CodeBehind="CreateExam.aspx.cs" Inherits="oes.faculty.CreateExam"%>
<asp:Content ID="Content1" ContentPlaceHolderID="ExternelCss" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="page_contents" runat="server">
    <form id="CreateExamForm" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <!--breadcrumb start-->
        <div class="row-fluid">
            <ol class="breadcrumb bc-custom">
                <li class="breadcrumb-item">
                    <a class="links" href="#">Dashboard</a>
                </li>
                <li class="breadcrumb-item"><a class="links" href="#">Exams</a></li>
                <li class="breadcrumb-item active">Create Exams</li>
            </ol>
        </div>
        <!--breadcrumb end-->
        <button class="btn btn-primary btn-sm" style="float: right; position: relative; margin-top: 14.5px; margin-right: 20px;" onclick="javascript:location.reload(true);">Refresh</button>
        <div class="panel panel-default">
             <div class="panel-heading panel-heading-custom-pages">
                 <i class="fa fa-pencil fa-1x"></i>&nbsp;&nbsp;<span>Create Exam</span>
             </div>
             <div class="panel-body">
                <!-- Tab panes -->
                <div class="tab-content" style="padding: 20px;">
                       <div class="col-md-12">
                           <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <div class="row">
                                        <div class="col-sm-4 form_controls_custom">
                                            <div class="input-group">
                                                <label>Select Department :</label>
                                                <asp:DropDownList ID="DdlDept" runat="server" Width="300" CssClass="form-control" required="required" AutoPostBack="true" OnSelectedIndexChanged="DdlDept_SelectedIndexChanged">
                                                    <asp:ListItem Value="NA" Text="---- Select Department ----">
                                                    </asp:ListItem>
                                                </asp:DropDownList>
                                                <br /><br /><br />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Select Department" ControlToValidate="DdlDept" InitialValue="NA" Text="&nbsp;" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="col-sm-4 form_controls_custom">
                                            <div class="input-group">
                                                <label>Select Semester :</label>
                                                <asp:DropDownList ID="DdlSem" runat="server" Width="300" CssClass="form-control" required="required" AutoPostBack="true" OnSelectedIndexChanged="DdlSem_SelectedIndexChanged">
                                                    <asp:ListItem Value="NA" Text="---- Select Semester ----"></asp:ListItem>
                                                    <asp:ListItem Value="1">1</asp:ListItem>
                                                    <asp:ListItem Value="2">2</asp:ListItem>
                                                    <asp:ListItem Value="3">3</asp:ListItem>
                                                    <asp:ListItem Value="4">4</asp:ListItem>
                                                    <asp:ListItem Value="5">5</asp:ListItem>
                                                    <asp:ListItem Value="6">6</asp:ListItem>
                                                </asp:DropDownList>
                                                <br /><br /><br />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Select Semester" ControlToValidate="DdlSem" InitialValue="NA" Text="&nbsp;" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="col-sm-4 form_controls_custom">
                                            <div class="input-group">
                                                <label>Select Subject :</label>
                                                <asp:DropDownList ID="DdlSubject" runat="server" Width="300" CssClass="form-control" required="required">
                                                    <asp:ListItem Value="NA" Text="---- Select Subject ----">
                                                    </asp:ListItem>
                                                </asp:DropDownList>
                                                <br /><br /><br />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please Select Subject" ControlToValidate="DdlSubject" InitialValue="NA" Text="&nbsp;" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>

                                            </div>
                                        </div>
                                    </div>
                                    
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="DdlDept" />
                                    <asp:AsyncPostBackTrigger ControlID="DdlSem" />
                                </Triggers>
                            </asp:UpdatePanel>
                           <div class="row">
                               <div class="col-sm-4 form_controls_custom">
                                   <div class="input-group">
                                       <label>Exam Type :</label>
                                       <asp:DropDownList ID="DdlExamType" runat="server" Width="300" CssClass="form-control" required="required">
                                           <asp:ListItem Value="NA" Text="---- Select Exam Type ----"></asp:ListItem>
                                           <asp:ListItem Value="MID" Text="Mid Semester Exam"></asp:ListItem>
                                           <asp:ListItem Value="CT" Text="Class Test"></asp:ListItem>
                                       </asp:DropDownList>
                                   </div>
                               </div>
                               <div class="col-sm-4 form_controls_custom">
                                   <div class="input-group">
                                       <label>Exam Date :</label>
                                       <asp:TextBox ID="tbExamDate" TextMode="Date" runat="server" CssClass="form-control" Width="300"></asp:TextBox>
                                   </div>
                               </div>
                               <div class="col-sm-4 form_controls_custom">
                                   <div class="input-group">
                                       <label>Total Time (int Minute):</label>
                                       <asp:TextBox ID="tbTotalTime" TextMode="SingleLine" runat="server" CssClass="form-control" Width="300"></asp:TextBox>
                                   </div>
                               </div>
                           </div>
                            <br />
                           <div class="row">
                                <div class="col-sm-4 form_controls_custom">
                                    <div class="input-group">
                                        <label>Passing Marks :</label>
                                        <asp:TextBox ID="tbPassingMarks" runat="server" TextMode="Number" Width="300" CssClass="form-control" ></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-sm-4 form_controls_custom">
                                    <div class="input-group">
                                        <label>Total Questions</label>
                                        <asp:TextBox id="tbTotalQuestion" runat="server" TextMode="Number" Width="300" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                               <div class="col-sm-4 form_controls_custom">
                                    <div class="input-group">
                                        <label>Total Marks</label>
                                        <asp:TextBox id="tbTotalMarks" runat="server" TextMode="Number" Width="300" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                           <br />
                           <div class="row">
                                <div class="col-sm-6 form_controls_custom">
                                    <div class="input-group">
                                        <asp:Button ID="btnCreateExam" runat="server" CssClass="btn btn-md btn-success" Text="Create" OnClick="btnCreateExam_Click" />
                                        <strong>&nbsp;·&nbsp;</strong>
                                        <button type="reset" class="btn btn-md btn-danger">Reset</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                </div>
            </div>
         </div>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ExternalJs" runat="server">
</asp:Content>

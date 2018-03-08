<%@ Page Title="Add Questions" Language="C#" MasterPageFile="~/faculty/FrameContentMaster.Master" AutoEventWireup="true" CodeBehind="AddQuestions.aspx.cs" Inherits="oes.faculty.AddQuestions" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ExternelCss" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="page_contents" runat="server">
    <form id="AddQuestions" runat="server">
        <!--breadcrumb start-->
        <div class="row-fluid">
            <ol class="breadcrumb bc-custom">
                <li class="breadcrumb-item">
                    <a class="links" href="#">Dashboard</a>
                </li>
                <li class="breadcrumb-item">
                    <a class="links" href="Subjects.aspx">Subjects</a>
                </li>
                <li class="breadcrumb-item active">Add Questions</li>
            </ol>
        </div>
        <!--breadcrumb end-->
        <div class="btn-group pull-right" style="margin-top: 10px; margin-right: 20px;">
            <button type="button" class="btn btn-success" data-toggle="modal" data-target="#ImportQuestions"><span class="glyphicon glyphicon-import"></span>&nbsp;Import Questions</button>
            <button type="button" class="btn btn-success" onclick="javascript:location.reload(true);"><span class="glyphicon glyphicon-refresh"></span>&nbsp;Refresh</button>
        </div>
        <div class="panel panel-primary">
            <div class="panel-heading panel-heading-custom-pages" style="padding-left: 70px;">
                <i class="fa fa-question-circle fa-1x"></i>&nbsp;&nbsp;<span>Add Questions</span>
            </div>
            <div class="panel-body" style="padding-left: 6px; padding-right: 6px;">
                <!-- has subject_id -->
                <asp:Panel ID="hasSubjectId" runat="server" Visible="false">
                    <div class="panel-body">
                        <div class="panel panel-info">
                            <div class="panel-body" style="padding: 4px 4px;">
                                <div class="col-md-4"><strong>Subject:</strong>&nbsp;&nbsp;<asp:Label ID="SubjectName" runat="server"></asp:Label></div>
                                <div class="col-md-4"><strong>Semester:</strong>&nbsp;&nbsp;<asp:Label ID="SubjectSem" runat="server"></asp:Label></div>
                                <div class="col-md-4"><strong>Department:</strong>&nbsp;&nbsp;<asp:Label ID="SubjectDept" runat="server"></asp:Label></div>
                            </div>
                        </div>
                    </div>
                </asp:Panel>

                <asp:ScriptManager ID="ScriptManager1" runat="server" ClientIDMode="Static"></asp:ScriptManager>
                <asp:Panel ID="NoSubjectId" runat="server" Visible="true">
                    <asp:UpdatePanel ID="UpDeptSemSubDdl" runat="server">
                        <ContentTemplate>
                            <div class="panel-body">
                                <div class="panel panel-info">
                                    <div class="panel-body" style="padding: 4px 4px;">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <strong>Department:</strong>&nbsp;&nbsp;
                                            <asp:DropDownList ID="DepartmentDdl" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DepartmentDdl_SelectedIndexChanged" ValidationGroup="SemDeptSection">
                                                <asp:ListItem Text="--Select Department--" Value="0"></asp:ListItem>
                                            </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="rfValidatorDdlDept" runat="server" ErrorMessage="Please Select Department" Text="&nbsp;*" CssClass="ErrMsg" ControlToValidate="DepartmentDdl" InitialValue="0"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="col-md-4">
                                                <strong>Semester:</strong>&nbsp;&nbsp;
                                            <asp:DropDownList ID="SemDdl" runat="server" AutoPostBack="true" OnSelectedIndexChanged="SemDdl_SelectedIndexChanged" ValidationGroup="SemDeptSection">
                                                <asp:ListItem Text="-- Select Semester --" Value="0"></asp:ListItem>
                                                <asp:ListItem Value="1">1</asp:ListItem>
                                                <asp:ListItem Value="2">2</asp:ListItem>
                                                <asp:ListItem Value="3">3</asp:ListItem>
                                                <asp:ListItem Value="4">4</asp:ListItem>
                                                <asp:ListItem Value="5">5</asp:ListItem>
                                                <asp:ListItem Value="6">6</asp:ListItem>
                                            </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="rfValidatorDdlSem" runat="server" ErrorMessage="Please Select Semester" Text="&nbsp;*" ControlToValidate="SemDdl" CssClass="ErrMsg" InitialValue="0"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="col-md-4">
                                                <strong>Subject:</strong>&nbsp;&nbsp;
                                            <asp:DropDownList ID="SubjectDdl" runat="server" AutoPostBack="true" ValidationGroup="SemDeptSection">
                                                <asp:ListItem Text="--Select Sbject--" Value="0"></asp:ListItem>
                                            </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="rfValidatorDdlSubject" runat="server" ErrorMessage="Please Select Subject" Text="&nbsp;*" ControlToValidate="SubjectDdl" CssClass="ErrMsg" InitialValue="0"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <asp:Panel ID="ErrMsgPanel" runat="server" Visible="true" CssClass="row" Style="padding-left: 4%; padding-top: 1%;">
                                            <div class="col-md-4">
                                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="ErrMsg" />
                                            </div>
                                        </asp:Panel>
                                    </div>
                                </div>
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="DepartmentDdl" />
                            <asp:AsyncPostBackTrigger ControlID="SemDdl" />
                        </Triggers>
                    </asp:UpdatePanel>
                </asp:Panel>

                <!-- question container -->
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <strong style="font-size: 16px;">Question</strong>
                        <asp:RequiredFieldValidator ID="rfValidatorQuestion" runat="server" ErrorMessage="* Plese type Question" CssClass="ErrMsg" ControlToValidate="Question" Text="*"></asp:RequiredFieldValidator>
                    </div>
                    <div class="panel-body">
                        <CKEditor:CKEditorControl ID="Question" BasePath="ckeditor/" runat="server"></CKEditor:CKEditorControl>
                        <br />
                    </div>
                </div>
                <asp:UpdatePanel ID="UpDatePanel" runat="server">
                    <ContentTemplate>
                        <div class="col-md-8">
                            <strong>Question Type:</strong>
                            <asp:DropDownList ID="QuestionTypeDdl" runat="server" AutoPostBack="true" OnSelectedIndexChanged="QuestionTypeDdl_SelectedIndexChanged">
                                <asp:ListItem Text="-- Select Question Type --" Value="0"></asp:ListItem>
                                <asp:ListItem Text="Multiple Choice Question (M.C.Q - 4 Options)" Value="1"></asp:ListItem>
                                <asp:ListItem Text="True or False (2 Options)" Value="2"></asp:ListItem>
                                <asp:ListItem Text="Identify Picture" Value="3"></asp:ListItem>
                                <asp:ListItem Text="Fill in the Blanks" Value="4"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfQuestionyType" runat="server" ErrorMessage="* Plese Select Question Type" ControlToValidate="QuestionTypeDdl" CssClass="ErrMsg" Text="*"></asp:RequiredFieldValidator>
                        </div>
                        <br />
                        <!-- question container ends -->

                        <!-- mcq container starts -->
                        <asp:Panel ID="mcq" runat="server" Visible="false">
                            <!-- mcq-option-A -->
                            <div class="panel panel-success">
                                <div class="panel-heading" style="font-size: 16px;"><strong>Option A:</strong></div>
                                <div class="panel-body">
                                    <CKEditor:CKEditorControl ID="McqOptionA" BasePath="ckeditor/" runat="server"></CKEditor:CKEditorControl>
                                </div>
                            </div>

                            <!-- mcq-option-B -->
                            <div class="panel panel-success">
                                <div class="panel-heading" style="font-size: 16px;"><strong>Option B:</strong></div>
                                <div class="panel-body">
                                    <CKEditor:CKEditorControl ID="McqOptionB" BasePath="ckeditor/" runat="server"></CKEditor:CKEditorControl>
                                </div>
                            </div>

                            <!-- mcq-option-C -->
                            <div class="panel panel-success">
                                <div class="panel-heading" style="font-size: 16px;"><strong>Option C:</strong></div>
                                <div class="panel-body">
                                    <CKEditor:CKEditorControl ID="McqOptionC" BasePath="ckeditor/" runat="server"></CKEditor:CKEditorControl>
                                </div>
                            </div>

                            <!-- mcq-option-D -->
                            <div class="panel panel-success">
                                <div class="panel-heading" style="font-size: 16px;"><strong>Option D:</strong></div>
                                <div class="panel-body">
                                    <CKEditor:CKEditorControl ID="McqOptionD" BasePath="ckeditor/" runat="server"></CKEditor:CKEditorControl>
                                </div>
                            </div>

                            <!-- mcq-option-correct_ans -->
                            <div class="panel panel-psg">
                                <div class="panel-heading" style="font-size: 16px;"><strong>Select Correct Option</strong></div>
                                <div class="panel-body">
                                    <asp:DropDownList ID="DdlMcqCorrectAns" runat="server">
                                        <asp:ListItem Value="1">Option A</asp:ListItem>
                                        <asp:ListItem Value="2">Option B</asp:ListItem>
                                        <asp:ListItem Value="3">Option C</asp:ListItem>
                                        <asp:ListItem Value="4">Option D</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </asp:Panel>
                        <!-- mcq container ends-->


                        <!-- true or false container starts-->
                        <asp:Panel ID="tf" runat="server" Visible="false">
                            <!-- true or false option A-->
                            <div class="panel panel-success">
                                <div class="panel-heading" style="font-size: 16px;"><strong>Chooser answer as Option A</strong></div>
                                <div class="panel-body">
                                    <asp:RadioButton ID="rbOptionATrue" runat="server" Text="True" GroupName="OptionA" />
                                    <br />
                                    <asp:RadioButton ID="rbOptionAFalse" runat="server" Text="False" GroupName="OptionA" />
                                </div>
                            </div>

                            <!-- true or false option B -->
                            <div class="panel panel-danger">
                                <div class="panel-heading" style="font-size: 16px;"><strong>Choose answer as Option B</strong></div>
                                <div class="panel-body">
                                    <asp:RadioButton ID="rbOptionBTrue" runat="server" Text="True" GroupName="OptionB" />
                                    <br />
                                    <asp:RadioButton ID="rbOptionBFalse" runat="server" Text="False" GroupName="OptionB" />
                                </div>
                            </div>

                            <!-- true or false correct ans -->
                            <div class="panel panel-psg">
                                <div class="panel-heading" style="font-size: 16px;"><strong>Correct Option</strong></div>
                                <div class="panel-body">
                                    <asp:DropDownList ID="DdlTfCorrectAns" runat="server">
                                        <asp:ListItem Value="1">Option A</asp:ListItem>
                                        <asp:ListItem Value="2">Option B</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </asp:Panel>
                        <!-- true or false container ends-->

                        <!-- identify the picture container start-->
                        <asp:Panel ID="ip" runat="server" Visible="false">

                            <!-- itp-option-A -->
                            <div class="panel panel-success">
                                <div class="panel-heading" style="font-size: 16px;"><strong>Option A:</strong></div>
                                <div class="panel-body">
                                    <CKEditor:CKEditorControl ID="ItpOptionA" BasePath="ckeditor/" runat="server"></CKEditor:CKEditorControl>
                                </div>
                            </div>

                            <!-- itp-option-B -->
                            <div class="panel panel-success">
                                <div class="panel-heading" style="font-size: 16px;"><strong>Option B:</strong></div>
                                <div class="panel-body">
                                    <CKEditor:CKEditorControl ID="ItpOptionB" BasePath="ckeditor/" runat="server"></CKEditor:CKEditorControl>
                                </div>
                            </div>

                            <!-- itp-option-C -->
                            <div class="panel panel-success">
                                <div class="panel-heading" style="font-size: 16px;"><strong>Option C:</strong></div>
                                <div class="panel-body">
                                    <CKEditor:CKEditorControl ID="ItpOptionC" BasePath="ckeditor/" runat="server"></CKEditor:CKEditorControl>
                                </div>
                            </div>

                            <!-- itp-option-D -->
                            <div class="panel panel-success">
                                <div class="panel-heading" style="font-size: 16px;"><strong>Option D:</strong></div>
                                <div class="panel-body">
                                    <CKEditor:CKEditorControl ID="ItpOptionD" BasePath="ckeditor/" runat="server"></CKEditor:CKEditorControl>
                                </div>
                            </div>

                            <!-- itp-option-correct_ans -->
                            <div class="panel panel-psg">
                                <div class="panel-heading" style="font-size: 16px;"><strong>Choose Correct Option</strong></div>
                                <div class="panel-body">
                                    <asp:DropDownList ID="DdlItpCorrectAns" runat="server">
                                        <asp:ListItem Value="1">Option A</asp:ListItem>
                                        <asp:ListItem Value="2">Option B</asp:ListItem>
                                        <asp:ListItem Value="3">Option C</asp:ListItem>
                                        <asp:ListItem Value="4">Option D</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </asp:Panel>
                        <!-- identify the picture container ends-->


                        <!-- fill in the blanks container start-->
                        <asp:Panel ID="fib" runat="server" Visible="false">
                            <!-- fib-option-A -->
                            <div class="panel panel-success">
                                <div class="panel-heading" style="font-size: 16px;"><strong>Option A:</strong></div>
                                <div class="panel-body">
                                    <CKEditor:CKEditorControl ID="FibOptionA" BasePath="ckeditor/" runat="server"></CKEditor:CKEditorControl>
                                </div>
                            </div>

                            <!-- fib-option-B -->
                            <div class="panel panel-success">
                                <div class="panel-heading" style="font-size: 16px;"><strong>Option B:</strong></div>
                                <div class="panel-body">
                                    <CKEditor:CKEditorControl ID="FibOptionB" BasePath="ckeditor/" runat="server"></CKEditor:CKEditorControl>
                                </div>
                            </div>

                            <!-- fib-option-C -->
                            <div class="panel panel-success">
                                <div class="panel-heading" style="font-size: 16px;"><strong>Option C:</strong></div>
                                <div class="panel-body">
                                    <CKEditor:CKEditorControl ID="FibOptionC" BasePath="ckeditor/" runat="server"></CKEditor:CKEditorControl>
                                </div>
                            </div>

                            <!-- fib-option-D -->
                            <div class="panel panel-success">
                                <div class="panel-heading" style="font-size: 16px;"><strong>Option D:</strong></div>
                                <div class="panel-body">
                                    <CKEditor:CKEditorControl ID="FibOptionD" BasePath="ckeditor/" runat="server"></CKEditor:CKEditorControl>
                                </div>
                            </div>

                            <!-- fib-option-correct_ans -->
                            <div class="panel panel-psg">
                                <div class="panel-heading" style="font-size: 16px;"><strong>Choose Correct Option</strong></div>
                                <div class="panel-body">
                                    <asp:DropDownList ID="DdlFibCorrectAns" runat="server">
                                        <asp:ListItem Value="1">Option A</asp:ListItem>
                                        <asp:ListItem Value="2">Option B</asp:ListItem>
                                        <asp:ListItem Value="3">Option C</asp:ListItem>
                                        <asp:ListItem Value="4">Option D</asp:ListItem>
                                    </asp:DropDownList>

                                </div>
                            </div>
                        </asp:Panel>
                        <!-- fill in the blanks container ends-->

                        <%--                <h4>Subject ID:<%Response.Write(Request.QueryString["subject_id"]); %></h4>--%>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="QuestionTypeDdl" />
                    </Triggers>
                </asp:UpdatePanel>
                <div class="panel-footer">
                    <div class="row">
                        <div class="col-md-3">
                            <br />
                            <br />
                            <strong>Marks :</strong><asp:TextBox ID="tbMarks" runat="server"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Button ID="btnSubmitQuestion" CssClass="btn btn-primary btn-block" runat="server" Text="Add Question" OnClick="btnSubmitQuestion_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <%-- upload file model --%>
        <div id="ImportQuestions" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content panel-mint-two">
                    <div class="modal-header panel-heading">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Import Questions</h4>
                    </div>
                    <div class="modal-body panel-body">
                        <div class="row" style="padding:30px;">
                            <div class="col-md-5">
                                <asp:UpdatePanel ID="UploadQuestionUpdatePanel" runat="server">
                                    <ContentTemplate>
                                        <strong>Select File to Upload :</strong><hr />
                                        <asp:FileUpload ID="ExcelFileUpload" runat="server" />
                                        <br />
                                        <asp:RequiredFieldValidator ID="rfFileUpload" ErrorMessage="Please select file to upload" ControlToValidate="ExcelFileUpload"
                                            runat="server" ForeColor="Red" Font-Bold="true"  ValidationGroup="QuestionImportGroup" ></asp:RequiredFieldValidator>
                                        <br />
                                        <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" ValidationGroup="QuestionImportGroup"/>
                                        <br />
                                        <asp:Label ID="lblMsg" runat="server"></asp:Label>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:PostBackTrigger ControlID="btnUpload" />
                                    </Triggers>
                                </asp:UpdatePanel> 
                            </div>
                            <div class="col-md-2" style="text-align:left; vertical-align:middle;padding-top:55px;padding-bottom:45px;">
                                <asp:UpdateProgress ID="UpdateProgressLoading" runat="server" AssociatedUpdatePanelID="UploadQuestionUpdatePanel">
                                    <ProgressTemplate>
                                        <img src="../images/loading.gif" />
                                    </ProgressTemplate>
                                </asp:UpdateProgress>
                            </div>
                        </div>
                    </div>
                    <%--<div class="modal-footer panel-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>--%>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ExternalJs" runat="server">
    <script type="text/javascript" src="ckeditor/ckeditor.js"></script>
    
<script type="text/javascript">
    window.onsubmit = function () {
        if (Page_IsValid) {
            var updateProgress = $find("<%= UpdateProgressLoading.ClientID %>");
        window.setTimeout(function () {
            updateProgress.set_visible(true);
        }, 100);
    }
}
</script>

</asp:Content>

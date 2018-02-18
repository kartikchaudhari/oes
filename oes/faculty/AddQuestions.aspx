<%@ Page Title="" Language="C#" MasterPageFile="~/faculty/FrameContentMaster.Master" AutoEventWireup="true" CodeBehind="AddQuestions.aspx.cs" Inherits="oes.faculty.AddQuestions" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ExternelCss" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="page_contents" runat="server">
    
    <form id="AddQuestions" runat="server">
        <!--breadcrumb start-->
        <div class="row-fluid">
            <ol class="breadcrumb bc-custom">
                <li class="breadcrumb-item">
                    <a class="links" href="Dashboard.aspx">Dashboard</a>
                </li>
                <li class="breadcrumb-item">
                    <a class="links" href="Subjects.aspx">Subjects</a>
                </li>
                <li class="breadcrumb-item active">Add Questions</li>
            </ol>
        </div>
        <!--breadcrumb end-->
        <button class="btn btn-success btn-sm" style="float: right; position: relative; margin-top: 14.5px; margin-right: 20px;" onclick="javascript:location.reload(true);">Refresh</button>
        <div class="panel panel-primary">
            <div class="panel-heading panel-heading-custom-pages">
                <i class="fa fa-question-circle fa-1x"></i>&nbsp;&nbsp;<span>Add Questions</span>
            </div>
            <div class="panel-body">
                <div class="panel panel-info">
                  <div class="panel-body" style="padding:4px 4px;">
                      <div class="col-md-4"><strong>Subject:</strong>&nbsp;&nbsp;<span>AJAVA</span></div>
                      <div class="col-md-4"><strong>Semester:</strong>&nbsp;&nbsp;<span>6</span></div>
                      <div class="col-md-4"><strong>Department:</strong>&nbsp;&nbsp;<span>Computer Engineering</span></div>
                  </div>
                </div>

                <!-- question container -->
                <div class="panel panel-info">
                    <div class="panel-heading"><strong style="font-size:16px;">Question</strong></div>
                    <div class="panel-body">
                        <CKEditor:CKEditorControl ID="Question" BasePath="ckeditor/" runat="server"></CKEditor:CKEditorControl>
                        <br />
                        <div class="col-md-8">
                            <strong>Question Type:</strong>
                            <asp:DropDownList ID="QuestionTypeDdl" runat="server" AutoPostBack="true" OnSelectedIndexChanged="QuestionTypeDdl_SelectedIndexChanged">
                                <asp:ListItem Text="Multiple Choice Question (M.C.Q - 4 Options)" Value="1"></asp:ListItem>
                                <asp:ListItem Text="True or False (2 Options)" Value="2"></asp:ListItem>
                                <asp:ListItem Text="Identify Picture" Value="3"></asp:ListItem>
                                <asp:ListItem Text="Fill in the Blanks" Value="4"></asp:ListItem>     
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
                <!-- question container ends -->

                <!-- mcq container starts -->
                <asp:Panel ID="mcq" runat="server" Visible="false">
                    <!-- mcq-option-A -->
                    <div class="panel panel-success">
                        <div class="panel-heading" style="font-size:16px;"><strong>Option A:</strong></div>
                        <div class="panel-body">
                            <CKEditor:CKEditorControl ID="McqOptionA" BasePath="ckeditor/" runat="server"></CKEditor:CKEditorControl>
                        </div>
                    </div>

                    <!-- mcq-option-B -->
                    <div class="panel panel-success">
                        <div class="panel-heading" style="font-size:16px;"><strong>Option B:</strong></div>
                        <div class="panel-body">
                            <CKEditor:CKEditorControl ID="McqOptionB" BasePath="ckeditor/" runat="server"></CKEditor:CKEditorControl>
                        </div>
                    </div>

                    <!-- mcq-option-C -->
                    <div class="panel panel-success">
                        <div class="panel-heading" style="font-size:16px;"><strong>Option C:</strong></div>
                        <div class="panel-body">
                            <CKEditor:CKEditorControl ID="McqOptionC" BasePath="ckeditor/" runat="server"></CKEditor:CKEditorControl>
                        </div>
                    </div>

                    <!-- mcq-option-D -->
                    <div class="panel panel-success">
                        <div class="panel-heading" style="font-size:16px;"><strong>Option D:</strong></div>
                        <div class="panel-body">
                             <CKEditor:CKEditorControl ID="McqOptionD" BasePath="ckeditor/" runat="server"></CKEditor:CKEditorControl>
                        </div>
                    </div>
                </asp:Panel>
                <!-- mcq container ends-->

                <!-- true or false container starts-->
                <asp:Panel ID="tf" runat="server" Visible="false">
                    <!-- true or false option A-->
                    <div class="panel panel-success">
                        <div class="panel-heading" style="font-size:16px;"><strong>Option A</strong></div>
                        <div class="panel-body">
                             <CKEditor:CKEditorControl ID="TfOptionA" BasePath="ckeditor/" runat="server"></CKEditor:CKEditorControl>
                        </div>
                    </div>

                    <!-- true or false option B -->
                    <div class="panel panel-danger">
                        <div class="panel-heading" style="font-size:16px;"><strong>Option B</strong></div>
                        <div class="panel-body">
                            <CKEditor:CKEditorControl ID="TfOptionB" BasePath="ckeditor/" runat="server"></CKEditor:CKEditorControl>
                        </div>
                    </div>
                </asp:Panel>
                <!-- true or false container ends-->

                <!-- identify the picture container start-->
                <asp:Panel ID="ip" runat="server" Visible="false">
                    <!-- itp-option-A -->
                    <div class="panel panel-success">
                        <div class="panel-heading" style="font-size:16px;"><strong>Option A:</strong></div>
                        <div class="panel-body">
                            <CKEditor:CKEditorControl ID="ItpOptionA" BasePath="ckeditor/" runat="server"></CKEditor:CKEditorControl>
                        </div>
                    </div>

                    <!-- itp-option-B -->
                    <div class="panel panel-success">
                        <div class="panel-heading" style="font-size:16px;"><strong>Option B:</strong></div>
                        <div class="panel-body">
                            <CKEditor:CKEditorControl ID="ItpOptionB" BasePath="ckeditor/" runat="server"></CKEditor:CKEditorControl>
                        </div>
                    </div>

                    <!-- itp-option-C -->
                    <div class="panel panel-success">
                        <div class="panel-heading" style="font-size:16px;"><strong>Option C:</strong></div>
                        <div class="panel-body">
                            <CKEditor:CKEditorControl ID="ItpOptionC" BasePath="ckeditor/" runat="server"></CKEditor:CKEditorControl>
                        </div>
                    </div>

                    <!-- itp-option-D -->
                    <div class="panel panel-success">
                        <div class="panel-heading" style="font-size:16px;"><strong>Option D:</strong></div>
                        <div class="panel-body">
                             <CKEditor:CKEditorControl ID="ItpOptionD" BasePath="ckeditor/" runat="server"></CKEditor:CKEditorControl>
                        </div>
                    </div>
                </asp:Panel>
                <!-- identify the picture container ends-->

                <!-- fill in the blanks container start-->
                <asp:Panel ID="fib" runat="server" Visible="false">
                    <!-- fib-option-A -->
                    <div class="panel panel-success">
                        <div class="panel-heading" style="font-size:16px;"><strong>Option A:</strong></div>
                        <div class="panel-body">
                            <CKEditor:CKEditorControl ID="FibOptionA" BasePath="ckeditor/" runat="server"></CKEditor:CKEditorControl>
                        </div>
                    </div>

                    <!-- fib-option-B -->
                    <div class="panel panel-success">
                        <div class="panel-heading" style="font-size:16px;"><strong>Option B:</strong></div>
                        <div class="panel-body">
                            <CKEditor:CKEditorControl ID="FibOptionB" BasePath="ckeditor/" runat="server"></CKEditor:CKEditorControl>
                        </div>
                    </div>

                    <!-- fib-option-C -->
                    <div class="panel panel-success">
                        <div class="panel-heading" style="font-size:16px;"><strong>Option C:</strong></div>
                        <div class="panel-body">
                            <CKEditor:CKEditorControl ID="FibOptionC" BasePath="ckeditor/" runat="server"></CKEditor:CKEditorControl>
                        </div>
                    </div>

                    <!-- fib-option-D -->
                    <div class="panel panel-success">
                        <div class="panel-heading" style="font-size:16px;"><strong>Option D:</strong></div>
                        <div class="panel-body">
                             <CKEditor:CKEditorControl ID="FibOptionD" BasePath="ckeditor/" runat="server"></CKEditor:CKEditorControl>
                        </div>
                    </div>
                </asp:Panel>
                <!-- fill in the blanks container ends-->
                <h4>Subject ID:<%Response.Write(Request.QueryString["subject_id"]); %></h4>
             </div>
         </div>
                
        <div>
            
        </div>
        <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </form>
    </form>
    </form>
    </form>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ExternalJs" runat="server">
    <script type="text/javascript" src="ckeditor/ckeditor.js"></script>
</asp:Content>

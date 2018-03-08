<%@ Page Title="Manage Questions" Language="C#" MasterPageFile="~/faculty/FrameContentMaster.Master" AutoEventWireup="true" CodeBehind="ManageQuestions.aspx.cs" Inherits="oes.faculty.ManageQuestions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ExternelCss" runat="server">
    <link rel="stylesheet" href="../css/jquery.dataTables.min.css" />
    <link rel="stylesheet" href="../css/buttons.dataTables.min.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="page_contents" runat="server">
    <form id="ManagqQuestionsForm" runat="server">
        <!--breadcrumb start-->
        <div class="row-fluid">
            <ol class="breadcrumb bc-custom">
                <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
                <li class="breadcrumb-item"> <a href="#">Questions</a></li>
                <li class="breadcrumb-item">Manage Questions</li>
            </ol>
        </div>
        <!--breadcrumb end-->
        <button class="btn btn-primary btn-sm" style="float: right; position: relative; margin-top:14.5px; margin-right: 20px;" onclick="javascript:location.reload(true);">Refresh</button>
         <div class="panel panel-default">
            <div class="panel-heading panel-heading-custom-pages">
                <i class="fa fa-question-circle fa-1x"></i>&nbsp;&nbsp;<span>Manage Questions</span>
            </div>
            <!-- /.panel-heading -->
             <div class="panel-body">
                <!-- Nav tabs -->
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#view_questions" data-toggle="tab">View Questions</a></li>
                </ul>

                <!-- Tab panes -->
                <div class="tab-content" style="padding:10px;">
                    <asp:HiddenField ID="hf_dept_id" runat="server" />
                    <!-- view all questions start-->
                    <div class="tab-pane fade in active" id="view_questions">
                        <div class="row">
                            <div class="col-md-6" style="border:1px solid red;">
                                <label>Sort By:</label>
                                <asp:DropDownList ID="DdlSem" runat="server" OnSelectedIndexChanged="DdlSem_SelectedIndexChanged">
                                    <asp:ListItem Value="NA" Text="---- Select Semester ----"></asp:ListItem>
                                    <asp:ListItem Value="1" Text="1"></asp:ListItem>
                                    <asp:ListItem Value="2" Text="2"></asp:ListItem>
                                    <asp:ListItem Value="3" Text="3"></asp:ListItem>
                                    <asp:ListItem Value="4" Text="4"></asp:ListItem>
                                    <asp:ListItem Value="5" Text="5"></asp:ListItem>
                                    <asp:ListItem Value="6" Text="6"></asp:ListItem>
                                </asp:DropDownList>
                                &nbsp;
                                &nbsp;
                                &nbsp;
                                
                            </div>
                        </div>
                        <hr />
                        <div class="row">
                            <div class="table-responsive" style="padding:1%;">
                                <asp:GridView ID="GridViewQuestionList" runat="server" 
                                    AutoGenerateColumns="False" 
                                    CssClass="table table-bordered table-striped"
                                     DataSourceID="QuestionListDataSource" 
                                    PageSize="5" AllowPaging="True"
                                    AllowSorting="True" DataKeyNames="q_id" CellPadding="3" CellSpacing="2" ClientIDMode="Static">
                                <Columns>
                                    <asp:BoundField DataField="q_id" HeaderText="q_id" SortExpression="q_id" InsertVisible="False" ReadOnly="True"></asp:BoundField>
                                    <asp:BoundField DataField="dept_id" HeaderText="dept_id" SortExpression="dept_id" >
                                    </asp:BoundField>
                                    <asp:BoundField DataField="sem_id" HeaderText="sem_id" SortExpression="sem_id" >
                                    </asp:BoundField>
                                    <asp:BoundField DataField="subject_id" HeaderText="subject_id" SortExpression="subject_id" >
                                    </asp:BoundField>
                                    <asp:BoundField DataField="question_type" HeaderText="question_type" SortExpression="question_type" >
                                    </asp:BoundField>
                                    <asp:BoundField DataField="question" HeaderText="question" SortExpression="question" HtmlEncode="false" HtmlEncodeFormatString="false" >
                                    </asp:BoundField>
                                    <asp:BoundField DataField="opt_a" HeaderText="opt_a" SortExpression="opt_a" >
                                    </asp:BoundField>
                                    <asp:BoundField DataField="opt_b" HeaderText="opt_b" SortExpression="opt_b" >
                                    </asp:BoundField>
                                    <asp:BoundField DataField="opt_c" HeaderText="opt_c" SortExpression="opt_c" >
                                    </asp:BoundField>
                                    <asp:BoundField DataField="opt_d" HeaderText="opt_d" SortExpression="opt_d" >
                                    </asp:BoundField>
                                    <asp:BoundField DataField="correct_ans" HeaderText="correct_ans" SortExpression="correct_ans" >
                                    </asp:BoundField>
                                    <asp:BoundField DataField="marks" HeaderText="marks" SortExpression="marks" >
                                    </asp:BoundField>
                                </Columns>
                                    <PagerStyle HorizontalAlign="Center" Wrap="False" />
                            </asp:GridView>
                                <asp:SqlDataSource ID="QuestionListDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ExamDbConString %>" SelectCommand="FetchAllQuestionsByDeptId" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="hf_dept_id" Name="DeptId" PropertyName="Value" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.panel-body -->
        </div>

    </form>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ExternalJs" runat="server">
    <script src="../js/jquery.dataTables.min.js"></script>
    <script src="../js/dataTables.buttons.min.js"></script>
    <script src="../js/buttons.html5.min.js"></script>
    <script src="../js/jszip.min.js"></script>
    <script src="../js/json2.js"></script>
    <script type="text/javascript">
        //QuestionsByDeptDatatable();
    </script>
</asp:Content>

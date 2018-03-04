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
                        <h4 style="padding-top:0px;">New Requests</h4>
                        <hr />
                        <div class="row">
                          <!-- datatabls for questions start-->
                            <table width="100%" id="DatatableQuestionsByDept" class="table table-striped table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <td align="center"><strong>Question ID</strong></td>
                                        <td align="center"><strong>Department Name</strong></td>
                                        <td><strong>Semester</strong></td>
                                        <td><strong>Subject</strong></td>
                                        <td><strong>Question Type</strong></td> 
                                        <td><strong>Question</strong></td>
                                        <td><strong>Option A</strong></td>
                                        <td><strong>Option B</strong></td>
                                        <td><strong>Option C</strong></td>
                                        <td><strong>Option D</strong></td>
                                        <td><strong>Correct Option</strong></td>
                                        <td><strong>Marks</strong></td>
                                        <td><strong>Actions</strong></td>
                                    </tr>
                                </thead>
                            </table>
                          <!-- datatabls for questions end-->
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
    <script type="text/javascript">
        QuestionsByDeptDatatable();
    </script>
</asp:Content>

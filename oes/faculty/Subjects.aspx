<%@ Page Title="" Language="C#" MasterPageFile="~/faculty/FrameContentMaster.Master" AutoEventWireup="true" CodeBehind="Subjects.aspx.cs" Inherits="oes.faculty.Subjects" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ExternelCss" runat="server">
    <link rel="stylesheet" href="../css/jquery.dataTables.min.css" />
    <link rel="stylesheet" href="../css/buttons.dataTables.min.css" />
    <style>
        .excelButton {
           margin-left:60%;
         }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="page_contents" runat="server">

     <form id="form1" runat="server">
        <!--breadcrumb start-->
        <div class="row-fluid">
            <ol class="breadcrumb bc-custom">
                <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
                <li class="breadcrumb-item active">Subjects</li>
            </ol>
        </div>
        <!--breadcrumb end-->

        <button style="float: right; position: relative; margin-top: 14.5px; margin-right: 20px;" onclick="javascript:location.reload(true);">Refresh</button>
        <div class="panel panel-default">
            <div class="panel-heading panel-heading-custom-pages">
                <i class="fa fa-edit fa-1x"></i>&nbsp;&nbsp;<span>Manage Subjects</span>
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                <%if (Request.QueryString.Count > 0)
                  {
                      Response.Write("<div class='alert alert-success alert-dismissable'><a href='#' class='close' data-dismiss='alert' aria-label='close' title='Click to close this Message.'>&times;</a><strong>Congratulations!</strong> Subject added successfully, click <a class='links' href='AddQuestions.aspx?action=add' target='DashboardContentFrame'>here</a> to add Questions to it.</div>");
                  }
                %>
                <!-- Nav tabs -->
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#view" data-toggle="tab">View Subjects</a>
                    </li>
                    <li><a href="#add" data-toggle="tab">Add Subject</a>
                    </li>
                </ul>

                <!-- Tab panes -->
                <div class="tab-content" style="padding: 20px;">
                    <div class="tab-pane fade in active" id="view">
                        <h4>View Subjects</h4>
                        <hr />
                        <div class="table-responsive" style="padding-right:10px;">
                            <table id="datatable" class="table table-striped table-bordered table-hover table-responsible">
                            <thead>
                                <tr>
                                    <td align="center" width="30px"><strong>ID</strong></td>
                                    <td align="center" width="60px"><strong>Subject Name</strong></td>
                                    <td align="center" width="50px"><strong>Subject Code</strong></td>
                                    <td align="center" width="60px"><strong>Department</strong></td>
                                    <td align="center" width="50px"><strong>Semester</strong></td>
                                    <td align="center" width="80px"><strong>Total Exams Taken</strong></td>
                                    <td align="center" width="280px"><strong>Action</strong></td>
                                </tr>
                            </thead>
                           </table>
                        </div>
                    </div>
                    <div class="tab-pane" id="add">
                        <h4>Add Subject</h4>
                        <hr />
                        <div class="col-md-10">
                            <div class="row">
                                <div class="col-sm-6 form_controls_custom">
                                    <div class="input-group">
                                        <label>Select Department:</label>
                                        <asp:DropDownList ID="ddl_dept" runat="server" CssClass="form-control" DataSourceID="SelectDeptDs" DataTextField="dept_name" DataValueField="dept_id" Width="400px">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SelectDeptDs" runat="server" ConnectionString="<%$ ConnectionStrings:ExamDbConString %>" SelectCommand="SELECT [dept_id], [dept_name] FROM [department]"></asp:SqlDataSource>
                                    </div>
                                </div>
                                <div class="col-sm-6 form_controls_custom">
                                    <div class="input-group">
                                        <label>Select Semester</label>
                                        <asp:DropDownList ID="ddl_sem" runat="server" CssClass="form-control" Width="400px">
                                            <asp:ListItem>1</asp:ListItem>
                                            <asp:ListItem>2</asp:ListItem>
                                            <asp:ListItem>3</asp:ListItem>
                                            <asp:ListItem>4</asp:ListItem>
                                            <asp:ListItem>5</asp:ListItem>
                                            <asp:ListItem>6</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6 form_controls_custom">
                                    <div class="input-group">
                                        <label>Subject Name:</label>
                                        <asp:TextBox ID="tbSubjectName" runat="server" CssClass="form-control" TextMode="SingleLine" required="required" Width="400px"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-sm-6 form_controls_custom">
                                    <div class="input-group">
                                        <label>Subject Code:</label>
                                        <asp:TextBox ID="tbSubjectCode" runat="server" CssClass="form-control custom-input-control" TextMode="Number" required="required" Width="400px"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6 form_controls_custom">
                                    <div class="input-group">
                                        <asp:Button ID="submit_btn" runat="server" Text="Submit" CssClass="btn btn-success"/>
                                        <strong>&nbsp;&middot;&nbsp;</strong>
                                        <button id="btnClear" class="btn btn-danger" type="reset">Clear</button>
                                        <asp:Label ID="lbl_msg" runat="server" CssClass="lbl_msg"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.panel-body -->
        </div>
    </form>
</asp:Content>
<asp:Content ID="content4" ContentPlaceHolderID="ExternalJs" runat="server">
    <script src="../js/jquery.dataTables.min.js"></script>
    <script src="../js/dataTables.buttons.min.js"></script>
    <script src="../js/buttons.html5.min.js"></script>
    <script src="../js/jszip.min.js"></script>
    <script type="text/javascript">
        SubjectDatatable();
    </script>
</asp:Content>



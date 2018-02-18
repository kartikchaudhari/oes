<%@ Page Title="Students" Language="C#" MasterPageFile="~/admin/FrameContentMaster.Master" AutoEventWireup="true" CodeBehind="Students.aspx.cs" Inherits="oes.admin.Students" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="content2" ContentPlaceHolderID="ExternelCss" runat="server">
    <link rel="stylesheet" href="../css/jquery.dataTables.min.css" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="page_contents" runat="server">
<form id="form1" runat="server">    
    <!--breadcrumb start-->
    <div class="row-fluid">
        <ol class="breadcrumb bc-custom">
            <li class="breadcrumb-item"><a class="links" href="DashboardContents.aspx">Dashboard</a></li>
            <li class="breadcrumb-item active">Students</li>
        </ol>
    </div>
    <!--breadcrumb end-->
    <button class="btn btn-primary btn-sm" style="float: right; position: relative; margin-top:14.5px; margin-right: 20px;" onclick="javascript:location.reload(true);">Refresh</button>
    <div class="panel panel-default">
        <div class="panel-heading panel-heading-custom-pages">
            <i class="fa fa-edit fa-1x"></i>&nbsp;&nbsp;<span>Manage Students</span>
        </div>
        <!-- /.panel-heading -->
        <div class="panel-body">
                <%if (Request.QueryString["action"]=="added")
                  {
                      Response.Write("<div class='alert alert-success alert-dismissable'><a href='#' class='close' data-dismiss='alert' aria-label='close' title='Click to close this Message.'>&times;</a><strong>Congratulations!</strong> Faculty added successfully, accept the Registration request to approve the faculty account.</div>");
                  }
                %>


            <!-- Nav tabs -->
            <ul class="nav nav-tabs">
                <li class="active"><a href="#new_requests" data-toggle="tab">Registration Requests & Statistics</a>
                </li>
                <li><a href="#view" data-toggle="tab">View Students</a>
                </li>
                <li><a href="#add" data-toggle="tab">Add Student</a>
                </li>
            </ul>

            <!-- Tab panes -->
            <div class="tab-content">
                <!-- registration requests start-->
                <div class="tab-pane fade in active" id="new_requests">
                    <h4 style="padding-top: 20px;">New Requests</h4>
                    <hr />
                    <div class="row">
                        <div class="col-md-7">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <strong>Requests of Students</strong>
                                </div>
                                <div class="panel-body">
                                    <asp:Panel runat="server" ID="NoRecordsMsg" Visible="false">
                                        <div class="alert alert-info">
                                            <strong>No new Pending Requests.</strong>
                                        </div>
                                    </asp:Panel>
                                    <asp:Repeater ID="StudentRequestsRepeater" runat="server" ClientIDMode="Static">
                                        <ItemTemplate>
                                            <div class="alert alert-success alert-dismissable" style="text-align: justify;">
                                                <strong><%#Eval("first_name")%> <%#Eval("last_name")%></strong> requested for Registration.&nbsp;
                                                    <asp:HiddenField ID="hf_stud_id" runat="server" Value='<%#Eval("student_id")%>' />
                                                <input type="button" class="btn btn-primary btn-sm" value="Confirm" onclick=" ConfirmStudentRequest()" />
                                                <strong>&middot;</strong>
                                                <asp:Button ID="btnDeclain" CssClass="btn btn-danger btn-sm" runat="server" Text="Declain" />
                                                <strong>&middot;</strong>
                                                <asp:Button ID="btnView" CssClass="btn btn-info btn-sm" runat="server" Text="Profile" />
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <strong>Statistics</strong>
                                    </div>
                                    <div class="panel-body" style="text-align:center;">
                                        <asp:Chart ID="StudentChart" runat="server" Height="275px" Width="306px">
                                            <Titles>
                                                <asp:Title Text="No. of Students in each Deaprtment" Font="Microsoft Sans Serif, 14.25pt"></asp:Title>
                                            </Titles>
                                            <Series>
                                                <asp:Series ChartArea="StudentChartArea" Name="StudentChartSeries" ChartType="Pie" 
                                                    XValueMember="DepartmentName" YValueMembers="NoofNoofStudents" 
                                                    XValueType="String" YValueType="Int32"></asp:Series>
                                            </Series>
                                            <ChartAreas>
                                                <asp:ChartArea Name="StudentChartArea">
                                                    <AxisX Title="Department Name"></AxisX>
                                                    <AxisY Title="Students Count"></AxisY>
                                                </asp:ChartArea>
                                            </ChartAreas>
                                        </asp:Chart>
                                    </div>
                                </div>
                             </div>
                    </div>
                </div>
                <!-- registration requests end-->

                <!-- datatabls for student list start-->
                <div class="tab-pane fade" id="view">
                    <h4>All Faculties</h4>
                    <hr />
                    <table id="DatatableStudents" style="width:100%;table-layout: fixed;word-wrap:break-word;" class="table table-striped table-bordered table-hover" style="width: 650px;">
                        <thead>
                            <tr>
                                <td width="2%"><strong>ID</strong></td>
                                <td><strong>Student Name</strong></td>
                                <td><strong>Enrollment No.</strong></td>
                                <td><strong>Avatar</strong></td>
                                <td><strong>Thumb Image</strong></td>
                                <%--<td><strong>Username</strong></td>
                                        <td><strong>Email ID</strong></td>--%>
                                <td><strong>Contact No.</strong></td>
                                <%--<td><strong>Parent's Contact No.</strong></td>--%>
                                <td><strong>Department</strong></td>
                                <td><strong style="width:40px;">Semester</strong></td>
                                <td><strong>Actions</strong></td>
                            </tr>
                        </thead>
                    </table>

                    <!--delete faculty modal starts-->
                    <div class="modal fade" id="DeleteFacultyModal" role="dialog">
                        <div class="modal-dialog">
                            <div class="panel panel-dsg">
                                <div class="panel-heading">
                                    <a href="#" class="close" data-dismiss="modal" aria-label="close">&times;</a>
                                    <strong>Confirm to Remove faculty</strong>
                                </div>
                                <div class="panel-body" style="padding: 20px;">Are you Sure you want to Remove <strong><span id="fns"></span></strong>??<br />
                                    <br />
                                    if <strong>Yes</strong> click <strong>Delete</strong> button otherwise click on <strong>Cancle</strong> button.</div>
                                <div class="panel-footer">
                                    <button type="button" class="btn btn-danger btn-sm">Delete</button><strong>&nbsp;&middot;&nbsp;</strong>
                                    <button type="button" class="btn btn-primary btn-sm">Cancle</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--delete faculty modal ends -->

                </div>
                <!-- datatabls list faculties end-->


            </div>
        </div>
        <!-- /.panel-body -->
    </div>
</form>
    <div id="RequestConfirmModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Request Confirmed</h4>
                </div>
                <div class="modal-body">
                    <p>The Registration request for the selected Student is confirmed and registered.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" onclick="javascript:location.reload(true);">Close</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="content3" ContentPlaceHolderID="ExternalJs" runat="server">
    <script src="../js/jquery.dataTables.min.js"></script>
    <script type="text/javascript">
        StudentDatatable();
    </script>
</asp:Content>

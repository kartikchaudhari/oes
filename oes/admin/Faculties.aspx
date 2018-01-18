<%@Page Title="Faculties" Language="C#" MasterPageFile="~/admin/FrameContentMaster.Master" AutoEventWireup="true" CodeBehind="Faculties.aspx.cs" Inherits="oes.admin.Faculties" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="content2" ContentPlaceHolderID="ExternelCss" runat="server">
    <link rel="stylesheet" href="../css/jquery.dataTables.min.css" />
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="page_contents" runat="server">
    <form id="form1" runat="server">
        <!--breadcrumb start-->
        <div class="row-fluid">
            <ol class="breadcrumb bc-custom">
                <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
                <li class="breadcrumb-item active">Faculties</li>
            </ol>
        </div>
         <!--breadcrumb end-->

         <button style="float: right; position: relative; margin-top:14.5px; margin-right: 20px;" onclick="javascript:location.reload(true);">Refresh</button>
         
        <div class="panel panel-default">
            <div class="panel-heading panel-heading-custom-pages">
                <i class="fa fa-edit fa-1x"></i>&nbsp;&nbsp;<span>Manage Faculties</span>
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                <!-- Nav tabs -->
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#new_requests" data-toggle="tab">Registration Requests & Statistics</a>
                    </li>
                    <li><a href="#view" data-toggle="tab">View Faculties</a>
                    </li>
                    <li><a href="#add" data-toggle="tab">Add Faculty</a>
                    </li>
                </ul>

                <!-- Tab panes -->
                <div class="tab-content" style="padding:20px;">
                    <!-- registration requests start-->
                    <div class="tab-pane fade in active" id="new_requests">
                        <h4 style="padding-top:20px;">New Requests</h4>
                        <hr />
                        <div class="row">
                            <div class="col-md-7">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <strong>Requests of Faculties</strong>
                                    </div>
                                    <div class="panel-body">
                                        <asp:Repeater ID="FacultyRequestsRepeater" runat="server" ClientIDMode="Static">
                                            <ItemTemplate>
                                                <div class="alert alert-success alert-dismissable" style="text-align:justify;">
                                                    <strong><%#Eval("first_name")%> <%#Eval("last_name")%></strong> requested for Registration.&nbsp;
                                                    <asp:HiddenField ID="hf_fact_id" runat="server" Value='<%#Eval("faculty_id")%>'/>
                                                    <input type="button" class="btn btn-primary btn-sm" value="Confirm" onclick="ConfirmFacultyRequest()" />
                                                    <strong>&middot;</strong>
                                                    <asp:Button ID="btnDeclain" CssClass="btn btn-danger btn-sm" runat="server" Text="Declain"/>
                                                    <strong>&middot;</strong>
                                                    <asp:Button ID="btnView" CssClass="btn btn-info btn-sm" runat="server" Text="Profile"/>
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
                                        <asp:Chart ID="FacultyChart" runat="server" Height="214px" Width="369px" DataSourceID="SqlDataSource1">
                                            <Legends>
                                                <asp:Legend Alignment="Center" Docking="Right" Name="FacultyChartLegend"></asp:Legend>
                                            </Legends>
                                            <Series>
                                                <asp:Series Name="FacultyChartSeries" ChartType="Pie" XValueMember="Department Name" YValueMembers="No of Employees" Label="#VALY{D}">
                                                </asp:Series>
                                            </Series>

                                            <ChartAreas>
                                                <asp:ChartArea Name="ChartArea1">
                                                </asp:ChartArea>
                                            </ChartAreas>
                                            <Titles>
                                                <asp:Title Text="No. of Faculties per Department" TextOrientation="Auto" Alignment="TopCenter" Font="Lucida Console, 12pt" IsDockedInsideChartArea="False"></asp:Title>
                                            </Titles>
                                        </asp:Chart>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ExamDbConString %>" SelectCommand="ChartsFaculty" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                    </div>
                                </div>
                             </div>
                        </div>
                    </div>
                    <!-- registration requests end-->

                    <!-- datatabls flist faculties start-->
                    <div class="tab-pane fade" id="view">
                        <h4>All Faculties</h4>
                        <hr />  
                        <div class="table-responsive">
                            <table width="99%" id="DatatableFaculties" class="table table-striped table-bordered table-hover table-responsible">
                                <thead>
                                    <tr>
                                        <td align="center" width="30px"><strong>ID</strong></td>
                                        <td align="center"><strong>Faculty Name</strong></td>
                                        <td align="center"><strong>Avatar</strong></td>
                                        <td align="center"><strong>Thumb Image</strong></td>
                                        <td align="center"><strong>Username</strong></td>
                                        <td align="center"><strong>Email ID</strong></td>
                                        <td align="center"><strong>Contact No.</strong></td>
                                        <td align="center"><strong>Department</strong></td>
                                        <td align="center"><strong>Actions</strong></td>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                        </div>
                    <!-- datatabls flist faculties end-->

                    <!-- add new faculty start-->    
                    <div class="tab-pane fade" id="add">
                       <h4>Add Faculty</h4>
                       <hr />
                        <div class="col-md-10">
                            <div class="form-group">
                                <label>Select Department:</label>
                                <asp:DropDownList ID="ddl_dept" runat="server" CssClass="form-control"></asp:DropDownList>
                            </div>
                            <div class="row">
                                <div class="col-sm-6 form_controls_custom">
                                    <div class="input-group">
                                        <label>Enter First Name:</label>
                                        <input maxlength="20" id="fname" class="form-control" required="required" onchange="return ValidateFname();" type="text" style="width:400px;">
                                    </div>
                                </div>
                                <div class="col-sm-6 form_controls_custom">
                                    <div class="input-group">
                                        <label>Select Semester</label><br />
                                        <input maxlength="20" id="lname" class="form-control" placeholder="Last Name" required="required" onchange="return ValidateLame();" type="text" style="width:400px;">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- add new faculty end-->

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
                    <p>The Registration request For the Select user is Confirmed and Registered.</p>
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
        FacultyDatatable();
    </script>
</asp:Content>



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
                                        <asp:Panel runat="server" ID="NoRecordsMsg" Visible="false">
                                            <div class="alert alert-info">
                                                <strong>No new Pending Requests.</strong>
                                            </div>
                                        </asp:Panel>
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
                                        <asp:Chart ID="FacultyChart" runat="server" Height="275px" Width="306px">
                                            <Titles>
                                                <asp:Title Text="No. of Faculties per Deaprtment" Font="Microsoft Sans Serif, 14.25pt"></asp:Title>
                                            </Titles>
                                            <Series>
                                                <asp:Series ChartArea="FacultyChartArea" Name="FacultyChartSeries" ChartType="Pie" 
                                                    XValueMember="DepartmentName" YValueMembers="NoofEmployees" 
                                                    XValueType="String" YValueType="Int32"></asp:Series>
                                            </Series>
                                            <ChartAreas>
                                                <asp:ChartArea Name="FacultyChartArea">
                                                    <AxisX Title="Department Name"></AxisX>
                                                    <AxisY Title="Faculty Count"></AxisY>
                                                </asp:ChartArea>
                                            </ChartAreas>
                                        </asp:Chart>
                                    </div>
                                </div>
                             </div>
                        </div>
                    </div>
                    <!-- registration requests end-->

                    <!-- datatabls flist faculties start-->
                    <div class="tab-pane fade in active" id="view">
                        <h4>All Faculties</h4>
                        <hr />  
                            <table width="100%" id="DatatableFaculties" class="table table-striped table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <td align="center"><strong>ID</strong></td>
                                        <td><strong>Faculty Name</strong></td>
                                        <td><strong>Avatar</strong></td>
                                        <td><strong>Thumb Image</strong></td>
                                        <%--<td><strong>Username</strong></td>
                                        <td><strong>Email ID</strong></td>--%>
                                        <td><strong>Contact No.</strong></td>
                                        <td><strong>Department</strong></td>
                                        <td><strong>Actions</strong></td>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                    <!-- datatabls flist faculties end-->

                    <!-- add new faculty start-->    
                    <div class="tab-pane fade" id="add">
                       <h4>Add Faculty</h4>
                       <hr />
                        <div class="col-md-10">
                            <div class="row">
                                <div class="col-sm-6 form_controls_custom">
                                    <div class="input-group">
                                        <label>First Name:</label>
                                        <input maxlength="20" id="fname" class="form-control" required="required" type="text" style="width:400px;">
                                    </div>
                                </div>
                                <div class="col-sm-6 form_controls_custom">
                                    <div class="input-group">
                                        <label>Last Name:</label>
                                        <input maxlength="20" id="lname" class="form-control" required="required" type="text" style="width:400px;">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6 form_controls_custom">
                                    <div class="input-group">
                                        <label>Username:</label>
                                        <input maxlength="20" id="tbUname" class="form-control" required="required type="text" style="width:400px;">
                                    </div>
                                </div>
                                <div class="col-sm-6 form_controls_custom">
                                    <div class="input-group">
                                        <label>Email ID:</label>
                                        <input maxlength="20" id="tbEmail" class="form-control" required="required" type="email" style="width:400px;">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6 form_controls_custom">
                                    <div class="input-group">
                                        <label>Password:</label>
                                        <input maxlength="20" id="tbPassword" class="form-control" required="required" type="password" style="width:400px;">
                                    </div>
                                </div>
                                <div class="col-sm-6 form_controls_custom">
                                    <div class="input-group">
                                        <label>Confirm Password</label>
                                        <input maxlength="20" id="tbConfirmPass" class="form-control" required="required"  type="password" style="width:400px;">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6 form_controls_custom">
                                    <div class="input-group">
                                        <label>Contact No.:</label>
                                        <input maxlength="20" id="tbContact" class="form-control" required="required" type="tel" style="width: 400px;">
                                    </div>
                                </div>
                                <div class="col-sm-6 form_controls_custom">
                                    <div class="input-group">
                                        <label>Select Department:</label>
                                        <asp:DropDownList ID="ddl_dept" runat="server" CssClass="form-control" Style="width: 400px;"></asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6 form_controls_custom">
                                    <div class="input-group">
                                        <button id="btnAddFaculty" type="button" class="btn btn-md btn-success">Submit</button>
                                        <strong>&nbsp;&middot;&nbsp;</strong>
                                        <button type="reset" class="btn btn-md btn-danger">Reset</button>
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
    <div class="modal fade" id="EditFacultyModel" role="dialog">
    <div class="modal-dialog">
    	<div class="panel panel-default">
  			<div class="panel-heading">
            	<a href="#" class="close" data-dismiss="modal" aria-label="close">&times;</a>
                <span>Panel Heading</span>
            </div>
  			<div class="panel-body">Panel Content</div>
            <div class="panel-footer"><button type="button" class="btn btn-default" data-dismiss="modal">Close</button></div>
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

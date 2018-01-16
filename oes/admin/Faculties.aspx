<%@Page Title="Faculties" Language="C#" MasterPageFile="~/admin/FrameContentMaster.Master" AutoEventWireup="true" CodeBehind="Faculties.aspx.cs" Inherits="oes.admin.Faculties" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
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
                <li class="active"><a href="#new_requests" data-toggle="tab">Home</a>
                </li>
                <li><a href="#view" data-toggle="tab">View</a>
                </li>
                <li><a href="#messages" data-toggle="tab">Messages</a>
                </li>
                <li><a href="#settings" data-toggle="tab">Settings</a>
                </li>
            </ul>

            <!-- Tab panes -->
            <div class="tab-content">
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
                                                <input type="button" class="btn btn-primary btn-sm" value="Confirm" onclick="Confirm()" />
                                                <strong>&middot;</strong>
                                                <asp:Button ID="btnDeclain" CssClass="btn btn-danger btn-sm" runat="server" Text="Declain" data-dismiss="alert" />
                                                <strong>&middot;</strong>
                                                <asp:Button ID="btnView" CssClass="btn btn-info btn-sm" runat="server" Text="Profile" data-dismiss="alert" />
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
                                    <asp:Chart ID="FacultyChart" runat="server" AlternateText="Total  Faculites per Department" DataSourceID="FacultyChartDataSource" Height="196px" Width="321px">
                                        <Series>
                                            <asp:Series Name="Series1" XValueMember="Department Name" YValueMembers="No of Employees" IsValueShownAsLabel="True" LabelToolTip="True" ChartType="Pie" Legend="FacultyChartLegends"></asp:Series>
                                        </Series>
                                        <ChartAreas>
                                            <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                                        </ChartAreas>
                                        <Legends>
                                            <asp:Legend Alignment="Center" DockedToChartArea="ChartArea1" IsDockedInsideChartArea="False" Name="FacultyChartLegends" AutoFitMinFontSize="12" TitleFont="Microsoft Sans Serif, 24pt">
                                            </asp:Legend>
                                        </Legends>
                                        <Titles>
                                            <asp:Title BackImageAlignment="Center" Font="Microsoft Sans Serif, 12pt" Name="Title1" Text="No. of Faculties per Deaprtment">
                                            </asp:Title>
                                        </Titles>
                                    </asp:Chart>
                                    <asp:SqlDataSource ID="FacultyChartDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ExamDbConString %>" SelectCommand="ChartsFaculty" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                </div>
                            </div>
                         </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="view">
                    <h4>All Faculties</h4>  
                    <hr />
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                </div>
                <div class="tab-pane fade" id="messages">
                    <h4>Messages Tab</h4>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                </div>
                <div class="tab-pane fade" id="settings">
                    <h4>Settings Tab</h4>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                </div>
            </div>
        </div>
        <!-- /.panel-body -->
    </div> 
    </form>
</asp:Content>
<asp:Content ID="content2" ContentPlaceHolderID="ExternalJs" runat="server">
    <script type="text/javascript">

        function Confirm() {
            
                var faculty_id = $.trim($("[id*=hf_fact_id]").val());
                $.ajax({
                   type:"POST",
                   url: "Faculties.aspx/ConfirmRequest",
                   data: '{UserId:"' + faculty_id + '"}',
                   contentType: "application/json;charset=utf-8",
                    dataType:"json",
                    success: function (r) {
                        alert(r.d);
                    },
                    error: function (r) {
                        alert(r.responseText);
                        //alert(faculty_id);
                    },
                    failure: function (r) {
                        alert(r.responseText);
                        //alert(faculty_id);
                    }
                });
                return false;
        }
    </script>
</asp:Content>


﻿<%@Page Title="Dashboard" Language="C#" MasterPageFile="~/admin/FrameContentMaster.Master" AutoEventWireup="true" CodeBehind="DashboardContents.aspx.cs" Inherits="oes.admin.DashboardContents" %>
<asp:Content ID="Content1" ContentPlaceHolderID="page_contents" runat="server">
  <form id="form1" runat="server">
      <div class="container-fluid">
      <!--breadcrumb start-->
        <div class="row">
            <ol class="breadcrumb bc-custom">
                <li class="breadcrumb-item">
                    <a href="#">Dashboard</a>
                </li>
                <li class="breadcrumb-item active">My Dashboard</li>
            </ol>
        </div>
      <!--breadcrumb end-->

      <!--Dashboard iteam tiles start-->
        <div class="row">
            <div class="col-lg-3 col-md-3">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-sitemap fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge">
                                    <asp:Label ID="lbl_dept" runat="server"></asp:Label></div>
                                <div>Departments</div>
                            </div>
                        </div>
                    </div>
                    <a class="links" href="Departments.aspx" target="DashboardContentFrame" title="Departments">
                        <div class="panel-footer">
                            <span class="pull-left">View Details</span>
                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                            <div class="clearfix"></div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-lg-3 col-md-3">
                <div class="panel panel-green">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-book fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge">
                                    <asp:Label ID="lbl_subjects" runat="server"></asp:Label></div>
                                <div>Subjects</div>
                            </div>
                        </div>
                    </div>
                    <a class="links" href="Subjects.aspx" target="DashboardContentFrame" title="Subjects">
                        <div class="panel-footer">
                            <span class="pull-left">View Details</span>
                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                            <div class="clearfix"></div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-lg-3 col-md-3">
                <div class="panel panel-yellow">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-group fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge">
                                    <asp:Label ID="lbl_faculties" runat="server"></asp:Label></div>
                                <div>Faculties</div>
                            </div>
                        </div>
                    </div>
                    <a class="links" href="Faculties.aspx" target="DashboardContentFrame" title="Faculties">
                        <div class="panel-footer">
                            <span class="pull-left">View Details</span>
                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                            <div class="clearfix"></div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-lg-3 col-md-3">
                <div class="panel panel-red">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-male fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge">
                                    <asp:Label ID="lbl_students" runat="server"></asp:Label></div>
                                <div>Students</div>
                            </div>
                        </div>
                    </div>
                    <a class="links" href="Students.aspx" target="DashboardContentFrame" title="Students">
                        <div class="panel-footer">
                            <span class="pull-left">View Details</span>
                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                            <div class="clearfix"></div>
                        </div>
                    </a>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-3 col-md-3">
                <div class="panel panel-maroon">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-pencil fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge">
                                    <asp:Label ID="lbl_exams" runat="server"></asp:Label></div>
                                <div>Exams</div>
                            </div>
                        </div>
                    </div>
                    <a class="links" href="Exams.aspx" target="DashboardContentFrame" title="Exams">
                        <div class="panel-footer">
                            <span class="pull-left">View Details</span>
                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                            <div class="clearfix"></div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-lg-3 col-md-3">
                <div class="panel panel-olive">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-trophy fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge">
                                    <asp:Label ID="lbl_results" runat="server"></asp:Label></div>
                                <div>Results</div>
                            </div>
                        </div>
                    </div>
                    <a class="links" href="Results.aspx" target="DashboardContentFrame" title="Results">
                        <div class="panel-footer">
                            <span class="pull-left">View Details</span>
                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                            <div class="clearfix"></div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-lg-3 col-md-3">
                <div class="panel panel-DarkGoldenRod">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-bell fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge">
                                    <asp:Label ID="lbl_notifications" runat="server"></asp:Label></div>
                                <div>Notifications</div>
                            </div>
                        </div>
                    </div>
                    <a class="links" href="Notifications.aspx" target="DashboardContentFrame" title="Notifications">
                        <div class="panel-footer">
                            <span class="pull-left">View Details</span>
                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                            <div class="clearfix"></div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-lg-3 col-md-3">
                <div class="panel panel-steelblue">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-cogs fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge">12</div>
                                <div>System Settings</div>
                            </div>
                        </div>
                    </div>
                    <a class="links" href="SystemSettings.aspx" target="DashboardContentFrame" title="System Settings">
                        <div class="panel-footer">
                            <span class="pull-left">View Details</span>
                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                            <div class="clearfix"></div>
                        </div>
                    </a>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-3 col-md-3">
                <div class="panel panel-dsg">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-list-alt fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge">12</div>
                                <div>Logs</div>
                            </div>
                        </div>
                    </div>
                    <a class="links" href="Logs.aspx" target="DashboardContentFrame" title="Logs">
                        <div class="panel-footer">
                            <span class="pull-left">View Details</span>
                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                            <div class="clearfix"></div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-lg-3 col-md-3">
                <div class="panel panel-ecs">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-link fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge">&nbsp;</div>
                                <div>Login Link Activator</div>
                            </div>
                        </div>
                    </div>
                    <a class="links" href="LoginLinkActivatior.aspx" target="DashboardContentFrame" title="Login Link Activator">
                        <div class="panel-footer">
                            <span class="pull-left">View Details</span>
                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                            <div class="clearfix"></div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-lg-3 col-md-3">
                <div class="panel panel-bio">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-6">
                                <img src="../images/touchbar_touchid_icon_large.png" height="70" width="70" />
                            </div>
                            <div class="col-xs-6 text-right">
                                <div class="huge">&nbsp;</div>
                                <div>Fingerprint Database</div>
                            </div>
                        </div>
                    </div>
                    <a class="links" href="ManageFingerDb.aspx" target="DashboardContentFrame" title="Fingerprint Database">
                        <div class="panel-footer">
                            <span class="pull-left">View Details</span>
                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                            <div class="clearfix"></div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
      <!--Dashboard iteam tiles ends-->
    </div>
</form>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/admin/FrameContentMaster.Master" AutoEventWireup="true" CodeBehind="DashboardContents.aspx.cs" Inherits="oes.admin.DashboardContents" %>
<asp:Content ID="Content1" ContentPlaceHolderID="page_contents" runat="server">
    <div class="container">
        <div class="row">
            <h1 align="center">Welcome,<asp:Label ID="welcome_user" runat="server"></asp:Label></h1>
        </div>
        <div class="row">
            <div class="col-lg-3 col-md-3">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-comments fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge"><strong>4</strong></div>
                                    <div><strong>Departments</strong></div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
        </div>
    </div>
</asp:Content>

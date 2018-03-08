<%@ Page Title="SMS Settings" Language="C#" MasterPageFile="~/admin/FrameContentMaster.Master" AutoEventWireup="true" CodeBehind="SmsSettings.aspx.cs" Inherits="oes.admin.SmsSettings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ExternelCss" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 121px
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="page_contents" runat="server">
    <form id="SmsSettingsForm" runat="server">
        <!--breadcrumb start-->
        <div class="row-fluid">
        <ol class="breadcrumb bc-custom">
            <li class="breadcrumb-item"><a class="links" href="DashboardContents.aspx">Dashboard</a></li>
            <li class="breadcrumb-item"><a href="#">Settings</a></li>
            <li class="breadcrumb-item active">SMS Settings</li>

        </ol>
    </div>
        <!--breadcrumb end-->
        <button class="btn btn-primary btn-sm"  style="float: right; position: relative; margin-top:14.5px; margin-right: 20px;" onclick="javascript:location.reload(true);">Refresh</button>
        <div class="panel panel-default">
        <div class="panel-heading panel-heading-custom-pages">
            <i class="fa fa-envelope fa-1x"></i>&nbsp;&nbsp;<span>Manage SMS Settings</span>
        </div>
        <!-- /.panel-heading -->
        <div class="panel-body">
            <!-- Nav tabs -->
            <ul class="nav nav-tabs">
                <li class="active"><a href="#settings" data-toggle="tab">Settings</a></li>
                <li><a href="#edit" data-toggle="tab">Edit / Update Settings</a></li>
            </ul>

            <!-- Tab panes -->
            <div class="tab-content">
                <!-- view system settings -->
                <div class="tab-pane fade in active" id="settings" style="padding-left:10px;padding-top:10px;">
                    <h4>Settings</h4>
                    <hr />
                    <table class="table table-striped">
                        <tbody>
                            <tr>
                                <td colspan="2" style="width:50px;"><strong style="color:red;">Note :</strong><span style="color:red;"> Make sure the changed <strong>Username</strong> and <strong>Password</strong> must be registered at <strong>http://site23.way2sms.com/</strong>.</span></td>
                            </tr>
                            <tr><td class="auto-style1">&nbsp;</td><td>&nbsp;</td></tr>
                            <tr>
                                <td class="auto-style1"><strong>Username :</strong></td>
                                <td><asp:Label ID="lblUsernameSms" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <td class="auto-style1"><strong>Password :</strong></td>
                                <td><asp:Label ID="lblPasswordSms" runat="server"></asp:Label></td>
                            </tr>
                            
                        </tbody>
                    </table>
                </div>
                <div class="tab-pane fade" id="edit" style="padding-left:10px;padding-top:10px;">
                    <h4>Update Settings</h4>
                    <hr />
                    <table class="table table-striped">
                        <tbody>
                            <tr>
                                <td class="auto-style1"><strong>Username :</strong></td>
                                <td><asp:TextBox ID="tbUsernameSms" runat="server" CssClass="form-control" TextMode="SingleLine" Width="800"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td class="auto-style1"><strong>Password :</strong></td>
                                <td><asp:TextBox ID="tbPasswordSms" runat="server" CssClass="form-control" TextMode="SingleLine" Width="800"></asp:TextBox></td>
                            </tr>
                            
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!-- /.panel-body -->
    </div>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ExternalJs" runat="server">
</asp:Content>

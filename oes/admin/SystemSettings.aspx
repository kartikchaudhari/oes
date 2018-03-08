<%@ Page Title="System Settings" Language="C#" MasterPageFile="~/admin/FrameContentMaster.Master" AutoEventWireup="true" CodeBehind="SystemSettings.aspx.cs" Inherits="oes.admin.Settings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="page_contents" runat="server">
 <form id="SystemSettingForm" runat="server">
   <!--breadcrumb start-->
    <div class="row-fluid">
        <ol class="breadcrumb bc-custom">
            <li class="breadcrumb-item"><a class="links" href="DashboardContents.aspx">Dashboard</a></li>
            <li class="breadcrumb-item"><a href="#">Settings</a></li>
            <li class="breadcrumb-item active">System Settings</li>

        </ol>
    </div>
    <!--breadcrumb end-->
    <button class="btn btn-primary btn-sm"  style="float: right; position: relative; margin-top:14.5px; margin-right: 20px;" onclick="javascript:location.reload(true);">Refresh</button>
    <div class="panel panel-default">
        <div class="panel-heading panel-heading-custom-pages">
            <i class="fa fa-cogs fa-1x"></i>&nbsp;&nbsp;<span>Manage System Settings</span>
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
                <div class="tab-pane fade" id="settings" style="padding-left:10px;padding-top:10px;">
                    <h4>Settings</h4>
                    <hr />
                    <table class="table table-striped">
                        <tbody>
                            <tr>
                                <td style="width:150px;"><strong>Site Title</strong></td>
                                <td><asp:Label ID="lblSiteTitle" runat="server" Text="Online Examination System"></asp:Label></td>
                            </tr>
                            <tr>
                                <td><strong>Tag Line</strong></td>
                                <td><asp:Label ID="lblTagLine" runat="server" Text="sunt in culpa qui officia deserunt mollit anim id est laborum"></asp:Label></td>
                            </tr>
                            <tr>
                                <td><strong>Logo</strong></td>
                                <td><asp:Image ID="Image1" runat="server" ImageUrl="~/images/secure-test.png" Height="80" Width="80" />
                                   
                                </td>
                            </tr>
                            <tr>
                                <td><strong>Copyright Content</strong></td>
                                <td><asp:Label ID="lblCoyright" runat="server" Text="Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam."></asp:Label></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="tab-pane fade in active" id="edit" style="padding-left:10px;padding-top:10px;">
                    <h4>Update Settings</h4>
                    <hr />
                    <table class="table table-striped">
                        <tbody>
                            <tr>
                                <td style="width:150px;"><strong>Site Title</strong></td>
                                <td><asp:TextBox ID="tbSiteTitle" runat="server" CssClass="form-control" TextMode="SingleLine" Width="800"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td><strong>Tag Line</strong></td>
                                <td><asp:TextBox ID="tbTagLine" runat="server" CssClass="form-control" TextMode="SingleLine" Width="800"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td><strong>Logo</strong></td>
                                <td>
                                     &nbsp;</td>
                            </tr>
                            <tr>
                                <td><strong>Copyright Content</strong></td>
                                <td><asp:TextBox ID="lblCopyrightContent" runat="server" TextMode="MultiLine" Width="800" CssClass="form-control" ></asp:TextBox></td>
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

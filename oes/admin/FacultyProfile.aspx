<%@ Page Title="Facylty Profile" Language="C#" MasterPageFile="~/admin/FrameContentMaster.Master" AutoEventWireup="true" CodeBehind="FacultyProfile.aspx.cs" Inherits="oes.admin.FacultyProfile" %>
<asp:Content ID="Content3" ContentPlaceHolderID="page_contents" runat="server">
    <form id="ProfileForm" runat="server">
        <!--breadcrumb start-->
        <div class="row-fluid">
            <ol class="breadcrumb bc-custom">
                <li class="breadcrumb-item">
                    <a class="links" href="Dashboard.aspx" target="DashboardContent">Dashboard</a>
                </li>
                <li class="breadcrumb-item active">
                    <a class="links" href="Faculties.aspx">Faculties</a>
                </li>
                <li class="breadcrumb-item active">Faculty Profile</li>
            </ol>
        </div>
        <!--breadcrumb end-->
        <div class="panel panel-default">
            <div class="panel-heading panel-heading-custom-pages-left">
                <div class="row clearfix">
                    <div class="col-xs-6 col-sm-6 col-md-6" style="text-align:left;">
                        <i class="fa fa-user fa-1x"></i>&nbsp;&nbsp;<span>My Profile</span>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6" style="text-align: right;">
                        <div class="btn-group">
                            <button type="button" class="btn btn-primary" onclick="javascript:window.print(this);" title="Print your Profile.">Print</button>
                            <button type="button" class="btn btn-primary" onclick="javascript:location.reload(true);" title="Refresh the Page.">Refresh</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-4">
                        <div class="panel panel-primary">
                            <div class="panel-heading clearfix"><strong>Profile Picture</strong><a class="editLinks links pull-right" href="" title="click to update your profile picture.">[&nbsp;Edit&nbsp;]</a></div>
                            <div class="panel-body" style="text-align: center;">
                                <asp:Image ID="UserAvatar" runat="server" Height="100" Width="100" />
                            </div>
                        </div>
                        <div class="panel panel-primary">
                            <div class="panel-heading clearfix"><strong>Biometric Thumb Impression</strong><a class="editLinks links pull-right" href="" title="click to update your biometric thumb impression.">[&nbsp;Edit&nbsp;]</a></div>
                            <div class="panel-body" style="text-align: center;">
                                <asp:Image ID="UserThumb" runat="server" Height="120" Width="100" />
                            </div>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="panel panel-primary">
                            <div class="panel-heading clearfix"><strong>Profile Information</strong><a class="editLinks links pull-right" href="" title="click to update your profile information.">[&nbsp;Edit&nbsp;]</a></div>
                            <div class="panel-body">
                                <table class="table table-striped" border="0">
                                    <tbody>
                                        <tr>
                                            <td width="130"><strong>First Name :</strong></td>
                                            <td><asp:Label ID="LblFname" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td><strong>Last Name :</strong></td>
                                            <td><asp:Label ID="LblLname" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td><strong>Email ID :</strong></td>
                                            <td><asp:Label ID="LblEmail" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td><strong>Username :</strong></td>
                                            <td><asp:Label ID="LblUname" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td><strong>Password :</strong></td>
                                            <td><asp:Label ID="LblPass" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td><strong>Contact No. :</strong></td>
                                            <td><asp:Label ID="LblContact" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td><strong>Department :</strong></td>
                                            <td><asp:Label ID="LblDept" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td><strong>Account Status :</strong></td>
                                            <td><asp:Label ID="LblStatus" runat="server" Font-Bold="true"></asp:Label></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
         </div>
    </form>
</asp:Content>

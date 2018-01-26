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
                        <asp:Panel ID="ProfiePicturePanelView" runat="server" Visible="true" EnableViewState="false">
                            <div class="panel panel-primary">
                                <div class="panel-heading"><strong>Profile Picture</strong></div>
                                <div class="panel-body" style="text-align: center;">
                                    <asp:Image ID="UserAvatar" runat="server" Height="100" Width="100" />
                                </div>
                            </div>
                        </asp:Panel>
                        <asp:Panel ID="ProfilePicturePanelEdit" runat="server" Visible="false" EnableViewState="false">
                            <div class="panel panel-primary">
                                <div class="panel-heading"><strong>Profile Picture</strong></div>
                                <div class="panel-body" style="text-align: center;">
                                    <asp:Image ID="UserAvatarEdit" runat="server" Height="100" Width="100" />
                                </div>
                                <div class="panel-footer">
                                    <asp:Button ID="Button1" runat="server" Text="Browse" />&middot;
                                    <asp:Button ID="Button2" runat="server" Text="Upload" />
                                </div>
                            </div>
                        </asp:Panel>

                        <asp:Panel ID="BiometricThumbView" runat="server" Visible="true" EnableViewState="false">
                            <div class="panel panel-primary">
                                <div class="panel-heading"><strong>Biometric Thumb Impression</strong><a class="editLinks links pull-right" href="" title="click to update your biometric thumb impression.">[&nbsp;Edit&nbsp;]</a></div>
                                <div class="panel-body" style="text-align: center;">
                                    <asp:Image ID="UserThumb" runat="server" Height="120" Width="100" />
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                    <div class="col-md-8">
                        <asp:Panel ID="ProfileInfoView" runat="server" Visible="true" EnableViewState="false">
                            <div class="panel panel-primary">
                                <div class="panel-heading clearfix"><strong>Profile Information</strong><a class="editLinks links pull-right" href="" title="click to update your profile information.">[&nbsp;Edit&nbsp;]</a></div>
                                <div class="panel-body">
                                    <table class="table table-striped" border="0">
                                        <tbody>
                                            <tr>
                                                <td width="130"><strong>First Name :</strong></td>
                                                <td>
                                                    <asp:Label ID="LblFname" runat="server"></asp:Label></td>
                                            </tr>
                                            <tr>
                                                <td><strong>Last Name :</strong></td>
                                                <td>
                                                    <asp:Label ID="LblLname" runat="server"></asp:Label></td>
                                            </tr>
                                            <tr>
                                                <td><strong>Email ID :</strong></td>
                                                <td>
                                                    <asp:Label ID="LblEmail" runat="server"></asp:Label></td>
                                            </tr>
                                            <tr>
                                                <td><strong>Username :</strong></td>
                                                <td>
                                                    <asp:Label ID="LblUname" runat="server"></asp:Label></td>
                                            </tr>
                                            <tr>
                                                <td><strong>Password :</strong></td>
                                                <td>
                                                    <asp:Label ID="LblPass" runat="server"></asp:Label></td>
                                            </tr>
                                            <tr>
                                                <td><strong>Contact No. :</strong></td>
                                                <td>
                                                    <asp:Label ID="LblContact" runat="server"></asp:Label></td>
                                            </tr>
                                            <tr>
                                                <td><strong>Department :</strong></td>
                                                <td>
                                                    <asp:Label ID="LblDept" runat="server"></asp:Label></td>
                                            </tr>
                                            <tr>
                                                <td><strong>Account Status :</strong></td>
                                                <td>
                                                    <asp:Label ID="LblStatus" runat="server" Font-Bold="true"></asp:Label></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </asp:Panel>
                        <asp:Panel ID="ProfileInfoEdit" runat="server" Visible="false" EnableViewState="false">
                            <div class="panel panel-primary">
                                <div class="panel-heading clearfix"><strong>Profile Information</strong><a class="editLinks links pull-right" href="" title="click to update your profile information.">[&nbsp;Edit&nbsp;]</a></div>
                                <div class="panel-body">
                                    <table class="table table-striped" border="0">
                                        <tbody>
                                            <tr>
                                                <td width="130"><strong>First Name :</strong></td>
                                                <td>
                                                    <asp:TextBox ID="tbFname" runat="server" TextMode="SingleLine"></asp:TextBox>    
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><strong>Last Name :</strong></td>
                                                <td>
                                                    <asp:TextBox ID="tbLname" runat="server" TextMode="SingleLine"></asp:TextBox>   
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><strong>Email ID :</strong></td>
                                                <td>
                                                    <asp:TextBox ID="tbEmail" runat="server" TextMode="Email"></asp:TextBox>    
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><strong>Username :</strong></td>
                                                <td>
                                                    <asp:TextBox ID="tbUserName" runat="server" TextMode="SingleLine"></asp:TextBox>    
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><strong>Password :</strong></td>
                                                <td>
                                                    <asp:TextBox ID="tbPass" runat="server" TextMode="Password"></asp:TextBox>   
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><strong>Contact No. :</strong></td>
                                                <td>
                                                    <asp:TextBox ID="tbContact" runat="server" TextMode="Phone"></asp:TextBox> 
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><strong>Department :</strong></td>
                                                <td>
                                                       
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><strong>Account Status :</strong></td>
                                                <td>
                                                    <asp:Label ID="Label8" runat="server" Font-Bold="true"></asp:Label></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
            </div>
         </div>
    </form>
</asp:Content>

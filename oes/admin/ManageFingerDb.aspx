<%@ Page Title="" Language="C#" MasterPageFile="~/admin/FrameContentMaster.Master" AutoEventWireup="true" CodeBehind="ManageFingerDb.aspx.cs" Inherits="oes.admin.ManageFingerDb" %>
<asp:Content ID="content4" ContentPlaceHolderID="ExternelCss" runat="server">
    <link rel="stylesheet" href="../css/gridview.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="page_contents" runat="server">
<form id="ManagFingerDbForm" runat="server">
    <!--breadcrumb start-->
        <div class="row-fluid">
            <ol class="breadcrumb bc-custom">
                <li class="breadcrumb-item">
                    <a class="links" href="Dashboard.aspx">Dashboard</a>
                </li>
                <li class="breadcrumb-item active">Manage Fingeprint Database</li>
            </ol>
        </div>
        <!--breadcrumb end-->
    <button style="float: right; position: relative; margin-top: 14.5px; margin-right: 20px;" onclick="javascript:location.reload(true);">Refresh</button>
    <div class="panel panel-bio">
        <div class="panel-heading panel-heading-custom-pages" style="padding-top:8px;padding-bottom:8px;">
            <img src="../images/touchbar_touchid_icon_large.png" width="35" height="35">&nbsp;<span style="margin-top:4px;">Manage Fingeprint Database</span>
        </div>
        <div class="panel-body">
            <ul class="nav nav-tabs">
                <li><a data-toggle="tab" href="#FacultyFingerPrints">Faculty Records</a></li>
                <li><a data-toggle="tab" href="#StudentFingerPrints">Student Records</a></li>
            </ul>
            <div class="tab-content">
                <div id="FacultyFingerPrints" class="tab-pane fade">
                    <h3>Faculty Fingerprint Records</h3><hr />
                    <div class="table-responsive">
                        <asp:GridView ID="gvFacultyRecords" runat="server" 
                            AutoGenerateColumns="False" OnRowDataBound="OnRowDataBoundFaculty" 
                            CssClass="table table-bordered table-hover"
                             AllowPaging="True" PageSize="5"  >
                            <Columns>
                                <asp:BoundField HeaderStyle-Width="84" DataField="Faculty_Id" HeaderText="Faculty Id" HeaderStyle-CssClass="active">
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="Name" HeaderStyle-CssClass="active">
                                    <ItemTemplate>
                                        <asp:Label ID="lblFacultyName" runat="server"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Department" HeaderStyle-CssClass="active">
                                    <ItemTemplate>
                                        <asp:Label ID="lblFacultyDept" runat="server"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Avatar" HeaderStyle-CssClass="active" ItemStyle-Height="100" ItemStyle-Width="100" >
                                    <ItemTemplate>
                                        <asp:Image ID="FacultyAvatar" runat="server" CssClass="img-thumbnail"/>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Thumb Image" HeaderStyle-CssClass="active">
                                    <ItemTemplate>
                                        <asp:Image ID="FacultyThumb" runat="server" Height="80" Width="60" CssClass="img-thumbnail" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Actions" HeaderStyle-CssClass="active">
                                     <ItemTemplate>
                                         <asp:HyperLink ID="hLinkViewProfile" runat="server" ToolTip="View Profile"  Text="View Profile" CssClass="links btn btn-primary">View Profile</asp:HyperLink>
                                         &nbsp;<strong>&middot;</strong>&nbsp;
                                         <asp:Button ID="btnViewThumbImpression" runat="server" Text="View Fingerprint" CssClass="btn btn-success" />
                                    </ItemTemplate>
                                 </asp:TemplateField>
                            </Columns>
                            <PagerStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="pagination-ys" />
                        </asp:GridView>
                    </div>
                </div>
                <div id="StudentFingerPrints" class="tab-pane fade in active">
                    <h3>Student Fingerprint Records</h3><hr />
                    <div class="table-responsive">
                        <asp:GridView ID="gvStudentRrecords" runat="server" 
                            AutoGenerateColumns="False" OnRowDataBound="OnRowDataBoundStudent" 
                            CssClass="table table-bordered table-hover"
                             AllowPaging="True" PageSize="5"  >
                            <Columns>
                                <asp:BoundField HeaderStyle-Width="84" DataField="Student_Id" HeaderText="Student_Id" HeaderStyle-CssClass="active">
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="Name" HeaderStyle-CssClass="active">
                                    <ItemTemplate>
                                        <asp:Label ID="lblStudentName" runat="server"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Department" HeaderStyle-CssClass="active">
                                    <ItemTemplate>
                                        <asp:Label ID="lblStudentDept" runat="server"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Avatar" HeaderStyle-CssClass="active" ItemStyle-Height="100" ItemStyle-Width="100" >
                                    <ItemTemplate>
                                        <asp:Image ID="StudentAvatar" runat="server" CssClass="img-thumbnail"/>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Thumb Image" HeaderStyle-CssClass="active">
                                    <ItemTemplate>
                                        <asp:Image ID="StudentThumb" runat="server" Height="80" Width="60" CssClass="img-thumbnail" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Actions" HeaderStyle-CssClass="active">
                                     <ItemTemplate>
                                         <asp:HyperLink ID="hLinkViewProfileStudent" runat="server" ToolTip="View Profile"  Text="View Profile" CssClass="links btn btn-primary">View Profile</asp:HyperLink>
                                         &nbsp;<strong>&middot;</strong>&nbsp;
                                         <asp:Button ID="btnViewThumbImpressionStudent" runat="server" Text="View Fingerprint" CssClass="btn btn-success" />
                                    </ItemTemplate>
                                 </asp:TemplateField>
                            </Columns>
                            <PagerStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="pagination-ys" />
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
</form>
</asp:Content>

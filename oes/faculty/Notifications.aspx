<%@ Page Title="Notifications" Language="C#" MasterPageFile="~/faculty/FrameContentMaster.Master" AutoEventWireup="true" CodeBehind="Notifications.aspx.cs" Inherits="oes.faculty.Notifications" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ExternelCss" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="page_contents" runat="server">
    <form id="ManageNotificationFrm" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <!--breadcrumb start-->
    <div class="row-fluid">
        <ol class="breadcrumb bc-custom">
            <li class="breadcrumb-item"><a class="links" href="DashboardContents.aspx">Dashboard</a></li>
            <li class="breadcrumb-item active">Notifications</li>
        </ol>
    </div>
    <!--breadcrumb end-->
    
        <button style="float: right; position: relative; margin-top:14.5px; margin-right: 20px;" onclick="javascript:location.reload(true);">Refresh</button>
        <div class="panel panel-bs-one">
        <div class="panel-heading panel-heading-custom-pages">
            <i class="fa fa-edit fa-1x"></i>&nbsp;&nbsp;<span>Manage Notifications</span>
        </div>
        <!-- /.panel-heading -->
        <div class="panel-body">
            <!-- Nav tabs -->
            <ul class="nav nav-tabs">
                <li class="active"><a href="#create" data-toggle="tab">Create</a></li>
                <li><a href="#manage" data-toggle="tab">Manage</a></li>
            </ul>

            <!-- Tab panes -->
            <div class="tab-content">
                <div class="tab-pane fade in active" id="create">
                    <h4 style="margin-top:20px;margin-left:8px;">Create Notification</h4><hr />
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group">
                            <label for="email">Notification Status:</label>
                            <asp:DropDownList ID="DdlNotificationStatus" runat="server" CssClass="form-control">
                                <asp:ListItem Text="--- Select Notification Status ---" Value="NA"></asp:ListItem>
                                <asp:ListItem Text="Published" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Draft" Value="0"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
                                runat="server" ErrorMessage="Please Select Notification Status"
                                 ControlToValidate="DdlNotificationStatus" InitialValue="NA" CssClass="ErrMsg" ></asp:RequiredFieldValidator>
                        </div>
                                <div class="form-group">
                            <label for="pwd">Notification For:</label>
                            <asp:DropDownList ID="DdlNotificationFor" runat="server" CssClass="form-control">
                                <asp:ListItem Text="Students" Value="2"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                                <div class="form-group">
                                    <label for="pwd">Contents:</label>
                                    <asp:TextBox ID="tbContents" runat="server"  TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" 
                                 runat="server" ErrorMessage="Please write Notification Contents"
                                 ControlToValidate="tbContents" CssClass="ErrMsg" ></asp:RequiredFieldValidator>
                                 </div>
                                <asp:Button ID="btnCreateNotification" runat="server" Text="Submit" CssClass="btn btn-success" OnClick="btnCreateNotification_Click"
                                    />
                                &nbsp;&nbsp;
                                <asp:Label ID="lblMessage" runat="server" EnableViewState="false"></asp:Label>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div class="tab-pane fade" id="manage">
                    <h4 style="margin-top:20px;margin-left:8px;">Manage Notifications</h4><hr />
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <div class="table-responsive">
                                <asp:GridView ID="GridView1" runat="server"
                                     CssClass="table table-bordered table-hover" 
                                     AllowPaging="True" AllowSorting="True" 
                                    AutoGenerateColumns="False" DataKeyNames="n_id"
                                     DataSourceID="SqlDataSource1" EnableViewState="False">
                                    <Columns>
                                        <asp:BoundField DataField="n_id" HeaderStyle-CssClass="active" HeaderText="Notification Id" InsertVisible="False" ReadOnly="True" SortExpression="n_id" >
                                        <HeaderStyle CssClass="active" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="content" HeaderStyle-CssClass="active" HeaderText="Content" SortExpression="content" >
                                        <HeaderStyle CssClass="active" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="Notification Status" SortExpression="status">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="status" runat="server" Text='<%# Bind("status") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("status") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="active" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Notification For" SortExpression="notification_for">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="notification_for" runat="server" Text='<%# Bind("notification_for") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("notification_for") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="active" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="create_date" HeaderStyle-CssClass="active" HeaderText="Create Date" SortExpression="create_date" >
                                        <HeaderStyle CssClass="active" />
                                        </asp:BoundField>
                                         <asp:CommandField HeaderText="Actions" HeaderStyle-CssClass="active" ShowDeleteButton="True" ShowEditButton="True" >   
                                        <HeaderStyle CssClass="active" />
                                        </asp:CommandField>
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:ExamDbConString %>" 
                                    DeleteCommand="DELETE FROM [notification] WHERE [n_id] = @n_id" 
                                    InsertCommand="INSERT INTO [notification] ([content], [status], [notification_for], [create_date]) VALUES (@content, @status, @notification_for, @create_date)"
                                    SelectCommand="SELECT * FROM [notification] ORDER BY n_id ASC" 
                                    UpdateCommand="UPDATE [notification] SET [content] = @content, [status] = @status, [notification_for] = @notification_for, [create_date] = @create_date WHERE [n_id] = @n_id">
                                    <DeleteParameters>
                                        <asp:Parameter Name="n_id" Type="Int32" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="content" Type="String" />
                                        <asp:Parameter Name="status" Type="Int32" />
                                        <asp:Parameter Name="notification_for" Type="Int32" />
                                        <asp:Parameter Name="create_date" Type="String" />
                                    </InsertParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="content" Type="String" />
                                        <asp:Parameter Name="status" Type="Int32" />
                                        <asp:Parameter Name="notification_for" Type="Int32" />
                                        <asp:Parameter Name="create_date" Type="String" />
                                        <asp:Parameter Name="n_id" Type="Int32" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
        <!-- /.panel-body -->
    </div>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ExternalJs" runat="server">
</asp:Content>

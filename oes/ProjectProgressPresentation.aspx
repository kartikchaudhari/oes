<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectProgressPresentation.aspx.cs" Inherits="oes.ProjectProgressPresentation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Online Examination System</title>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="Online Examination system for Educational Organizations" />
    <meta name="keywords" content="Online examination system" />
     <!-- App Styling Bundle -->
    <link href="css/bootstrap.beautified.css" rel="stylesheet" />
    <link href="css/custom.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/bootsnipp.min.css" />
    <link rel="icon" type="image/x-icon" href="images/favicon.ico" />

    <style>
        .panel-title-custom {
            font-size:20px;
            font-weight:bold;
        }
    </style>
    <!-- jquery and progressbar-->
    <script src="js/vendor.min.js"></script>
</head>
<body style="background-color: #EAEDF1;">
    <form id="form1" runat="server">
        <div class="container-fluid" style="padding: 20px;">
            <div class="panel panel-bj-two">
                <div class="panel-heading panel-heading-custom-pages">
                    <i class="fa fa-graduation-cap fa-1x"></i>&nbsp;<span>Online Examination System Project Progress Hierchy</span>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-4" style="text-align: center;">
                            <div class="panel panel-danger">
                                <div class="panel-heading"><span class="panel-title-custom">Student</span></div>
                                <div class="panel-body">Panel Content</div>
                            </div>
                        </div>
                        <div class="col-md-4" style="text-align: center;">
                            <div class="panel panel-info">
                                <div class="panel-heading"><span class="panel-title-custom">Faculty</span></div>
                                <div class="panel-body">
                                    <asp:TreeView ID="tvFaculty" runat="server" ImageSet="XPFileExplorer" LineImagesFolder="~/TreeLineImages" NodeIndent="15" ShowLines="True" Font-Size="X-Large">
                                        <HoverNodeStyle Font-Underline="False" ForeColor="#6666AA" />
                                        <LeafNodeStyle Font-Bold="False" Font-Names="sans-serif" Font-Size="Small" />
                                        <Nodes>
                                            <asp:TreeNode Expanded="True" Text="Faculty" Value="Administrator">
                                                <asp:TreeNode NavigateUrl="http://localhost:6026/faculty/Register.aspx" Target="_blank" Text="Registraion" Value="Registraion"></asp:TreeNode>
                                                <asp:TreeNode Expanded="False" Text="Login" Value="Login">
                                                    <asp:TreeNode NavigateUrl="http://localhost:6026/faculty/Login.aspx" Target="_blank" Text="Login via Biometric" ToolTip="Login with Thumb Impression" Value="Login via Biometric"></asp:TreeNode>
                                                    <asp:TreeNode Target="_blank" Text="Login via UserId" ToolTip="Login using Username and Password" Value="Login via UserId" NavigateUrl="http://localhost:6026/faculty/LoginViaUid.aspx"></asp:TreeNode>
                                                </asp:TreeNode>
                                                <asp:TreeNode Expanded="False" NavigateUrl="http://localhost:6026/faculty/Dashboard.aspx" Target="_blank" Text="Dashboard" Value="Dashboard"></asp:TreeNode>
                                                <asp:TreeNode Expanded="False" Text="Departments" Value="Dashboard">
                                                    <asp:TreeNode Text="View" Value="View"></asp:TreeNode>
                                                </asp:TreeNode>
                                                <asp:TreeNode Expanded="False" Text="Subjects" Value="Dashboard">
                                                    <asp:TreeNode Text="View" Value="View"></asp:TreeNode>
                                                    <asp:TreeNode Text="Add" Value="Add"></asp:TreeNode>
                                                    <asp:TreeNode Text="Remove" Value="Remove"></asp:TreeNode>
                                                    <asp:TreeNode Expanded="False" Text="Questions" Value="Questions">
                                                        <asp:TreeNode Text="Add" Value="Add"></asp:TreeNode>
                                                        <asp:TreeNode Text="View" Value="View"></asp:TreeNode>
                                                        <asp:TreeNode Text="Edit" Value="Edit"></asp:TreeNode>
                                                        <asp:TreeNode Text="Remove" Value="Remove"></asp:TreeNode>
                                                    </asp:TreeNode>
                                                    <asp:TreeNode Text="Import and Export" Value="Import and Export"></asp:TreeNode>
                                                </asp:TreeNode>
                                                <asp:TreeNode Expanded="False" Text="Students" Value="Students">
                                                    <asp:TreeNode Text="Registrtation Requests and Statistics" Value="Registrtation Requests and Statistics"></asp:TreeNode>
                                                    <asp:TreeNode Text="Add" Value="Add"></asp:TreeNode>
                                                    <asp:TreeNode Text="View" Value="View"></asp:TreeNode>
                                                    <asp:TreeNode Text="Edit" Value="Edit"></asp:TreeNode>
                                                    <asp:TreeNode Text="Remove" Value="Remove"></asp:TreeNode>
                                                    <asp:TreeNode Text="Import and Export" Value="Import and Export"></asp:TreeNode>
                                                </asp:TreeNode>
                                                <asp:TreeNode Expanded="False" Text="Questions" Value="Questions">
                                                    <asp:TreeNode Text="Add" Value="Add"></asp:TreeNode>
                                                    <asp:TreeNode Text="Manage" Value="Manage"></asp:TreeNode>
                                                    <asp:TreeNode Text="Import and Export" Value="Import and Export"></asp:TreeNode>
                                                    <asp:TreeNode Text="Question Pictures" Value="Question Pictures"></asp:TreeNode>
                                                </asp:TreeNode>
                                                <asp:TreeNode Expanded="False" Text="Exams" Value="Exams">
                                                    <asp:TreeNode Text="Create" Value="Create"></asp:TreeNode>
                                                    <asp:TreeNode Text="Edit" Value="Edit"></asp:TreeNode>
                                                    <asp:TreeNode Text="View" Value="View"></asp:TreeNode>
                                                    <asp:TreeNode Text="Remove" Value="Remove"></asp:TreeNode>
                                                    <asp:TreeNode Text="Export" Value="Export"></asp:TreeNode>
                                                    <asp:TreeNode Text="Add Questions" Value="Add Questions"></asp:TreeNode>
                                                </asp:TreeNode>
                                                <asp:TreeNode Expanded="False" Text="Results" Value="Results">
                                                    <asp:TreeNode Text="View" Value="View"></asp:TreeNode>
                                                    <asp:TreeNode Text="Export" Value="Export"></asp:TreeNode>
                                                </asp:TreeNode>
                                                <asp:TreeNode Expanded="False" Text="Notifications" Value="Notifications">
                                                    <asp:TreeNode Text="View" Value="View"></asp:TreeNode>
                                                </asp:TreeNode>
                                                <asp:TreeNode Expanded="False" Text="Logs" Value="Logs">
                                                    <asp:TreeNode Text="Error Log" Value="Error Log"></asp:TreeNode>
                                                </asp:TreeNode>

                                                <asp:TreeNode Text="Profile" Value="Profile">
                                                    <asp:TreeNode Text="View" Value="View"></asp:TreeNode>
                                                    <asp:TreeNode Text="Update (only Avatar and Information)" Value="Update (only Avatar and Information)"></asp:TreeNode>
                                                </asp:TreeNode>

                                            </asp:TreeNode>
                                        </Nodes>
                                        <NodeStyle Font-Names="Tahoma" Font-Size="8pt" ForeColor="Black" HorizontalPadding="2px" NodeSpacing="0px" VerticalPadding="2px" />
                                        <ParentNodeStyle Font-Bold="False" Font-Size="Medium" Font-Names="sans-serif" />
                                        <RootNodeStyle Font-Size="Large" Font-Names="sans-serif" />
                                        <SelectedNodeStyle BackColor="#B5B5B5" Font-Underline="False" HorizontalPadding="0px" VerticalPadding="0px" />
                                    </asp:TreeView>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4" style="text-align: center;">
                            <div class="panel panel-success">
                                <div class="panel-heading"><span class="panel-title-custom">Administrator</span></div>
                                <div class="panel-body" style="text-align:center;font-size:16px;">
                                    <asp:TreeView ID="tvAdmin" runat="server" ImageSet="XPFileExplorer" LineImagesFolder="~/TreeLineImages" NodeIndent="15" ShowLines="True" Font-Size="X-Large">
                                        <HoverNodeStyle Font-Underline="False" ForeColor="#6666AA" />
                                        <LeafNodeStyle Font-Bold="False" Font-Names="sans-serif" Font-Size="Small" />
                                        <Nodes>
                                            <asp:TreeNode Expanded="True" Text="Administrator" Value="Administrator">
                                                <asp:TreeNode Expanded="False" Text="Login" Value="Login">
                                                    <asp:TreeNode NavigateUrl="http://localhost:6026/admin/Login.aspx" Target="_blank" Text="Login via Biometric" ToolTip="Login with Thumb Impression" Value="Login via Biometric"></asp:TreeNode>
                                                    <asp:TreeNode Target="_blank" Text="Login via UserId" ToolTip="Login using Username and Password" Value="Login via UserId" NavigateUrl="http://localhost:6026/admin/LoginViaUid.aspx"></asp:TreeNode>
                                                </asp:TreeNode>
                                                <asp:TreeNode Expanded="False" NavigateUrl="http://localhost:6026/admin/Dashboard.aspx" Target="_blank" Text="Dashboard" Value="Dashboard"></asp:TreeNode>
                                                <asp:TreeNode Expanded="False" Text="Departments" Value="Dashboard">
                                                    <asp:TreeNode Text="View" Value="View"></asp:TreeNode>
                                                    <asp:TreeNode Text="Add" Value="Add"></asp:TreeNode>
                                                    <asp:TreeNode Text="Remove" Value="Remove"></asp:TreeNode>
                                                </asp:TreeNode>
                                                <asp:TreeNode Expanded="False" Text="Subjects" Value="Dashboard">
                                                    <asp:TreeNode Text="View" Value="View"></asp:TreeNode>
                                                    <asp:TreeNode Text="Add" Value="Add"></asp:TreeNode>
                                                    <asp:TreeNode Text="Remove" Value="Remove"></asp:TreeNode>
                                                    <asp:TreeNode Expanded="False" Text="Questions" Value="Questions">
                                                        <asp:TreeNode Text="Add" Value="Add"></asp:TreeNode>
                                                        <asp:TreeNode Text="View" Value="View"></asp:TreeNode>
                                                        <asp:TreeNode Text="Edit" Value="Edit"></asp:TreeNode>
                                                        <asp:TreeNode Text="Remove" Value="Remove"></asp:TreeNode>
                                                    </asp:TreeNode>
                                                </asp:TreeNode>
                                                <asp:TreeNode Expanded="False" Text="Faculties" Value="Faculties">
                                                    <asp:TreeNode Text="Registrtation Requests and Statistics" Value="Registrtation Requests and Statistics"></asp:TreeNode>
                                                    <asp:TreeNode Text="Add" Value="Add"></asp:TreeNode>
                                                    <asp:TreeNode Text="View" Value="View"></asp:TreeNode>
                                                    <asp:TreeNode Text="Edit" Value="Edit"></asp:TreeNode>
                                                    <asp:TreeNode Text="Remove" Value="Remove"></asp:TreeNode>
                                                    <asp:TreeNode Text="Import and Export" Value="Import and Export"></asp:TreeNode>
                                                </asp:TreeNode>
                                                <asp:TreeNode Expanded="False" Text="Students" Value="Students">
                                                    <asp:TreeNode Text="Registrtation Requests and Statistics" Value="Registrtation Requests and Statistics"></asp:TreeNode>
                                                    <asp:TreeNode Text="Add" Value="Add"></asp:TreeNode>
                                                    <asp:TreeNode Text="View" Value="View"></asp:TreeNode>
                                                    <asp:TreeNode Text="Edit" Value="Edit"></asp:TreeNode>
                                                    <asp:TreeNode Text="Remove" Value="Remove"></asp:TreeNode>
                                                    <asp:TreeNode Text="Import and Export" Value="Import and Export"></asp:TreeNode>
                                                </asp:TreeNode>
                                                <asp:TreeNode Expanded="False" Text="Questions" Value="Questions"></asp:TreeNode>
                                                <asp:TreeNode Expanded="False" Text="Exams" Value="Exams"></asp:TreeNode>
                                                <asp:TreeNode Expanded="False" Text="Results" Value="Results"></asp:TreeNode>
                                                <asp:TreeNode Expanded="False" Text="Notifications" Value="Notifications"></asp:TreeNode>
                                                <asp:TreeNode Expanded="False" Text="Settings" Value="Settings">
                                                    <asp:TreeNode Text="System Setting" Value="System Setting"></asp:TreeNode>
                                                    <asp:TreeNode Text="SMS Setting" Value="SMS Setting"></asp:TreeNode>
                                                </asp:TreeNode>
                                                <asp:TreeNode Expanded="False" Text="Logs" Value="Logs">
                                                    <asp:TreeNode Text="Error Log" Value="Error Log"></asp:TreeNode>
                                                </asp:TreeNode>

                                                <asp:TreeNode Text="Profile" Value="Profile">
                                                    <asp:TreeNode Text="View" Value="View"></asp:TreeNode>
                                                    <asp:TreeNode Text="Update" Value="Update"></asp:TreeNode>
                                                </asp:TreeNode>

                                            </asp:TreeNode>
                                        </Nodes>
                                        <NodeStyle Font-Names="Tahoma" Font-Size="8pt" ForeColor="Black" HorizontalPadding="2px" NodeSpacing="0px" VerticalPadding="2px" />
                                        <ParentNodeStyle Font-Bold="False" Font-Size="Medium" Font-Names="sans-serif" />
                                        <RootNodeStyle Font-Size="Large" Font-Names="sans-serif" />
                                        <SelectedNodeStyle BackColor="#B5B5B5" Font-Underline="False" HorizontalPadding="0px" VerticalPadding="0px" />
                                    </asp:TreeView>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>

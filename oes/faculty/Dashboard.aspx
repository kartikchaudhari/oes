<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="oes.faculty.Dashboard" ClientIDMode="Static"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Dashboard :: Faculty</title>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="Online Examination system for Educational Organizations" />
    <meta name="keywords" content="Online examination system" />
    <!-- App Styling Bundle -->
    <link href="../css/bootstrap.beautified.css" rel="stylesheet" />
    <link href="../css/custom.css" rel="stylesheet" />
    <link href="../css/simple-sidebar.css" rel="stylesheet" />
    <link href="../css/progress-bar.css" rel="stylesheet" />
    <link rel="icon" type="../image/x-icon" href="images/favicon.ico" />
    
    <!-- jquery and javacripts-->
    <script src="../js/vendor.min.js"></script>
    <script src="../js/progress-bar.js"></script>
</head>
<body id="DashboardBody" onload="Timer();">
    <!--navbar_top-->
    <nav class="navbar navbar-inverse custom-navbar">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle Navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>

                <a class="navbar-brand" style="padding-left: 0px; padding-right: 0px; padding-bottom: 0px; padding-top: 7.5px;" href="../Index.aspx">
                    <span>
                        <img src="../images/secure-test.png" style="height: 50px; width: 50px;"></span>
                    <span id="oes_title">Online Examination System</span>
                </a>

            </div>
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="user-profile dropdown-toggle" data-toggle="dropdown">
                            <asp:Image ID="user" CssClass="user-profile-img" runat="server" />&nbsp;<asp:Label ID="faculty_name" runat="server"></asp:Label>
                            <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="#"><i class="fa fa-gear fa-fw"></i>Settings</a></li>
                            <li class="divider"></li>
                            <li><a class="links" href="Profile.aspx" target="DashboardContentFrame"><i class="fa fa-user fa-fw"></i>User Profile</a></li>
                            <li>
                                <a class="links" href="Logout.aspx">
                                    <i class="fa fa-sign-out fa-fw"></i>Logout</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <!--navbar_top/-->

    <div id="wrapper">
        <!-- Sidebar -->
        <div id="sidebar-wrapper">
            <ul class="sidebar-nav nav-pills nav-stacked" id="menu">
                <li style="border:2px solid red;border-radius:4px;">
                    <strong>Time Left:</strong>&nbsp;<span id="countDown"></span><span>&nbsp;</span>
                    
                </li>
                <li class="active">
                    <a class="links" href="DashboardContents.aspx" target="DashboardContentFrame">
                        <span class="fa fa-stack fa-lg pull-left">
                            <i class="fa fa-dashboard fa-stack-1x"></i>
                        </span>Dashboard</a>
                </li>
                <li>
                    <a class="links" href="Departments.aspx" target="DashboardContentFrame">
                        <span class="fa fa-stack fa-lg pull-left">
                               <i class="fa fa-sitemap fa-fw fa-stack-1x"></i>
                        </span>Departments</a>
                </li>
                <li>
                    <a class="links" href="Subjects.aspx" target="DashboardContentFrame">
                        <span class="fa-stack fa-lg pull-left">
                            <i class="fa fa-book fa-stack-1x"></i>
                        </span>Subjects</a>
                </li>
                <li>
                    <a class="links" href="Faculties.aspx" target="DashboardContentFrame">
                        <span class="fa-stack fa-lg pull-left">
                            <i class="fa fa-group fa-stack-1x"></i>
                        </span>Faculties</a>
                </li>
                <li>
                    <a class="links" href="Students.aspx" target="DashboardContentFrame">
                        <span class="fa-stack fa-lg pull-left">
                            <i class="fa fa-male fa-stack-1x"></i></span>Students</a>
                </li>
                <li>
                    <a class="links" href="QuestionBank.aspx" target="DashboardContentFrame">
                        <span class="fa-stack fa-lg pull-left">
                            <i class="fa fa-question-circle fa-stack-1x"></i></span>Question Bank</a>
                </li>
                <li>
                    <a class="links" href="Exams.aspx" target="DashboardContentFrame">
                        <span class="fa-stack fa-lg pull-left">
                            <i class="fa fa-pencil  fa-stack-1x"></i></span>Exams</a>
                </li>
                <li>
                    <a class="links" href="Results.aspx" target="DashboardContentFrame">
                        <span class="fa-stack fa-lg pull-left">
                            <i class="fa fa-trophy fa-stack-1x"></i></span>Results</a>
                </li>
                <li>
                    <a class="links" href="Notifications.aspx" target="DashboardContentFrame">
                        <span class="fa-stack fa-lg pull-left">
                            <i class="fa fa-bell fa-stack-1x"></i></span>Notifications</a>
                </li>
                <li>
                    <a class="links" href="SystemSettings.aspx" target="DashboardContentFrame">
                        <span class="fa-stack fa-lg pull-left">
                            <i class="fa fa-cogs fa-stack-1x"></i></span>System Settings</a>
                </li>
                <li>
                    <a class="links" href="Logs.aspx" target="DashboardContentFrame">
                        <span class="fa-stack fa-lg pull-left">
                            <i class="fa fa-list-alt fa-stack-1x"></i></span>Logs <span class="fa arrow"></span>
                    </a>
                    <%--<ul class="nav-pills nav-stacked" style="list-style-type: none;">
                        <li><a href="#"><span class="fa-stack fa-lg pull-left"><i class="fa fa-flag fa-stack-1x"></i></span>link1</a></li>
                        <li><a href="#"><span class="fa-stack fa-lg pull-left"><i class="fa fa-flag fa-stack-1x"></i></span>link2</a></li>
                    </ul>--%>
                </li>
            </ul>
        </div>
        <!-- /#sidebar-wrapper -->

        <!-- Page Content -->
        <div id="page-content-wrapper" style="padding:8px;">
            <div class="embed-responsive embed-responsive-12by6">
                <iframe id="DashBoardFrame" src="DashboardContents.aspx" name="DashboardContentFrame"></iframe>
            </div>
        </div>
         <!-- /#page-content-wrapper -->
    </div>
    <!--javascripts -->
    <script src="../js/custom.js"></script>
    <script src="../js/sidebar_menu.js"></script>
    <script type="text/javascript">
        function Timer() {
            var timeout = '<%= Session.Timeout * 60 * 1000 %>';
            var timer = setInterval(function () {
                timeout -= 1000;
                document.getElementById('countDown').innerHTML = time(timeout);
                if (timeout == 0) {
                    clearInterval(timer);
                    alert('Times up PAL!');
                    window.location.href = 'Logout.aspx';
                }
            }, 1000);
            function two(x) { return ((x > 9) ? "" : "0") + x }
            function time(ms) {
                var t = '';
                var sec = Math.floor(ms / 1000);
                ms = ms % 1000


                var min = Math.floor(sec / 60);
                sec = sec % 60;
                t = two(sec);


                var hr = Math.floor(min / 60);
                min = min % 60;
                t = two(min) + ":" + t;


                return t + "<strong>&nbsp;minutes</strong>";
            }
        }
    </script>
</body>
</html>

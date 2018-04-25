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
    <link href="../css/sidebar.css" rel="stylesheet" />
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
                    <li class="dropdown" id="DropDownRight">
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

    <div class="wrapper">
        <!-- /#sidebar-wrapper -->
        <nav id="sidebar">
                <div class="sidebar-header">
                    <h4 id="CountDownHeader"><span class="TimeText">Time Left:&nbsp;</span><span id="countDown"></span></h4>
                </div>
                <ul class="list-unstyled components" id="menu">
                    <li class="active">
                        <a class="links" href="DashboardContents.aspx" target="DashboardContentFrame">
                            <span class="fa fa-stack">
                               <i class="fa fa-dashboard fa-fw fa-stack-1x"></i>
                            </span>
                            Dashboard
                        </a>
                    </li>

                    <li>
                        <a class="links" href="Departments.aspx" target="DashboardContentFrame">
                            <span class="fa fa-stack">
                               <i class="fa fa-sitemap fa-fw fa-stack-1x"></i>
                            </span>
                            Departments
                        </a>
                    </li>
                    <li>
                        <a class="links" href="../admin/Subjects.aspx" target="DashboardContentFrame">
                            <span class="fa fa-stack">
                               <i class="fa fa-sitemap fa-fw fa-stack-1x"></i>
                            </span>
                            Subjects&nbsp;&nbsp;
                        </a>
                    </li>
                    
                    <li>
                        <a class="links" href="../admin/Students.aspx" target="DashboardContentFrame">
                            <span class="fa fa-stack">
                                <i class="fa fa-male fa-fw fa-stack-1x"></i>
                            </span>
                            Students&nbsp;&nbsp;
                        </a>
                    </li>
                    <li> <a class="my" href="#homeSubmenu" data-toggle="collapse" aria-expanded="false">
                            <span class="fa-stack">
                                <i class="fa fa-question-circle fa-stack-1x"></i></span>&nbsp;&nbsp;Questions&nbsp;&nbsp;&nbsp;&nbsp;<b class="caret"></b>
                        </a>
                        <ul class="collapse list-unstyled" id="homeSubmenu">
                            <li><a class="links" href="AddQuestions.aspx" target="DashboardContentFrame" style="padding-left: 25%;" title="Add Questions to Question Bank">Add Questions</a></li>
                            <li><a class="links" href="ManageQuestions.aspx" target="DashboardContentFrame" style="padding-left: 25%;" title="Manage Question Bank Questions">Manage Questions</a></li>
                            <li><a class="links" href="Pictures.aspx" target="_blank" style="padding-left: 25%;" title="Manage Question Pictures">Question Pictures</a></li>
                        </ul>
                    </li>
                    <li> <a class="my" href="#ExamSubMenu" data-toggle="collapse" aria-expanded="false">
                            <span class="fa-stack">
                                <i class="fa fa-pencil fa-stack-1x"></i></span>&nbsp;&nbsp;Exams&nbsp;&nbsp;&nbsp;&nbsp;<b class="caret"></b>
                        </a>
                        <ul class="collapse list-unstyled" id="ExamSubMenu">
                            <li><a class="links" href="CreateExam.aspx" target="DashboardContentFrame" style="padding-left: 25%;" title="Create Exam">Create Exam</a></li>
                            <li><a class="links" href="ManageExams.aspx" target="DashboardContentFrame" style="padding-left: 25%;" title="Manage Exams">Manage Exam</a></li>
                        </ul>
                    </li>
                    
                
                    <li>
                        <a class="links" href="../admin/Results.aspx" target="DashboardContentFrame">
                            <span class="fa fa-stack">
                                <i class="fa fa-trophy fa-fw fa-stack-1x"></i>
                            </span>
                            &nbsp;Results&nbsp;&nbsp;&nbsp;
                        </a>
                    </li>
                    
                    <li>
                        <a class="links" href="Notifications.aspx" target="DashboardContentFrame">
                            <span class="fa fa-stack">
                                <i class="fa fa-bell fa-fw fa-stack-1x"></i>
                            </span>
                            Notifications&nbsp;<asp:Label ID="newNotificicationCounter" runat="server" CssClass="label label-danger"></asp:Label>
                        </a>
                    </li>
                    
                    <li>
                        <a href="#" id="sidebarCollapse">
                               <span class="fa fa-stack">
                                <i class="fa fa-chevron-circle-left fa-fw fa-stack-1x"></i>
                            </span>
                            Toggle Sidebar
                            </a>
                    </li>
                </ul>
            </nav>

        <!-- Page Content -->
        <div id="content" style="padding:8px;">
            <div class="embed-responsive embed-responsive-12by6" style="padding-bottom: 60%;">
                <iframe id="DashBoardFrame" src="DashboardContents.aspx" name="DashboardContentFrame"></iframe>
            </div>
        </div>
         <!-- /#page-content-wrapper -->
    </div>


    <!--javascripts -->
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/custom.js"></script>
   
    <script type="text/javascript">
        $(document).ready(function () {
            $('#sidebarCollapse').on('click', function () {
                $('#sidebar').toggleClass('active');
                $('.TimeText').toggleClass('HideData');
            });

            $('#DropDownRight').on('click', function () {
                $('#DropDownRight').toggleClass('open');
            });

        });
        
        function Timer() {
            var timeout = '<%= Session.Timeout * 60 * 1000 %>';
            var timer = setInterval(function ()
            {
                timeout -= 1000;
                document.getElementById('countDown').innerHTML = time(timeout);
                if (timeout == 0)
                {
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


                return t ;
            }
        }

        PreventHrefJump();
        </script>
</body>
</html>

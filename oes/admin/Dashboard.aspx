<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="oes.admin.Dashboard" ClientIDMode="Static" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dashboard :: Administrator</title>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="Online Examination system for Educational Organizations" />
    <meta name="keywords" content="Online examination system" />
    <!-- App Styling Bundle -->
    <link href="../css/bootstrap.beautified.css" rel="stylesheet" />
    <link href="../css/custom.css" rel="stylesheet" />
    <link href="../css/simple-sidebar.css" rel="stylesheet" />
    <link rel="icon" type="../image/x-icon" href="images/favicon.ico" />
</head>
<body onload="Timer()">
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

               <a class="navbar-brand" style="padding-left:0px;padding-right:0px;padding-bottom:0px;padding-top:7.5px;" href="../Index.aspx">
                   <span><img src="../images/secure-test.png" style="height:50px;width:50px;"></span>
                    <span id="oes_title">Online Examination System</span>    
               </a>
               
           </div>
           <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="user-profile dropdown-toggle" data-toggle="dropdown">
                            <asp:Image ID="user" CssClass="user-profile-img" runat="server" />&nbsp;Kartik Chaudhari <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a></li>
                            <li class="divider"></li>
                            <li><a href="Profile.aspx" target="DashboardContentFrame"><i class="fa fa-user fa-fw"></i> User Profile</a></li>
                            <li>
                                <a href="Logout.aspx">
                                    <i class="fa fa-sign-out fa-fw"></i> Logout</a>
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
                    <strong>Time Left:</strong><span id="countDown"></span><span>&nbsp;<strong>minute</strong></span>
                    
                </li>
                <li class="active">
                    <a href="#">
                        <span class="fa fa-stack fa-lg pull-left">
                            <i class="fa fa-dashboard fa-stack-1x"></i>
                        </span>Dashboard</a>
                </li>
                <li>
                    <a href="Departments.aspx" target ="DashboardContentFrame">
                        <span class="fa fa-stack fa-lg pull-left">
                               <i class="fa fa-sitemap fa-fw fa-stack-1x"></i>
                        </span>Departments</a>
                </li>
                <li>
                    <a href="#"><span class="fa-stack fa-lg pull-left"><i class="fa fa-flag fa-stack-1x "></i></span>Shortcut</a>
                    <ul class="nav-pills nav-stacked" style="list-style-type: none;">
                        <li><a href="#"><span class="fa-stack fa-lg pull-left"><i class="fa fa-flag fa-stack-1x"></i></span>link1</a></li>
                        <li><a href="#"><span class="fa-stack fa-lg pull-left"><i class="fa fa-flag fa-stack-1x"></i></span>link2</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#"><span class="fa-stack fa-lg pull-left"><i class="fa fa-cloud-download fa-stack-1x"></i></span>Overview</a>
                </li>
                <li>
                    <a href="#"><span class="fa-stack fa-lg pull-left"><i class="fa fa-cart-plus fa-stack-1x"></i></span>Events</a>
                </li>
                <li>
                    <a href="#"><span class="fa-stack fa-lg pull-left"><i class="fa fa-youtube-play fa-stack-1x"></i></span>About</a>
                </li>
                <li>
                    <a href="#"><span class="fa-stack fa-lg pull-left"><i class="fa fa-wrench fa-stack-1x"></i></span>Services</a>
                </li>
                <li>
                    <a href="#"><span class="fa-stack fa-lg pull-left"><i class="fa fa-server fa-stack-1x"></i></span>Contact</a>
                </li>
            </ul>
        </div>
        <!-- /#sidebar-wrapper -->

        <!-- Page Content -->
        <div id="page-content-wrapper">
            <div class="embed-responsive  embed-responsive-12by6">
                <iframe id="DashBoardFrame" src="DashboardContents.aspx" name="DashboardContentFrame"></iframe>
            </div>
            <!-- /#page-content-wrapper -->
        </div>
        <!-- Vendor Scripts Bundle -->
    </div>
    <script src="../js/vendor.min.js"></script>
    <script src="../js/custom.js"></script>
    <script src="../js/sidebar_menu.js"></script>
    <script type="text/javascript">
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
                    window.location.href = 'Login.aspx?eid=1';
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


                return  t;
            }
        }
    </script>
    <!-- App Scripts Bundle -->
    <script src="../js/scripts.min.js"></script>
</body>
</html>

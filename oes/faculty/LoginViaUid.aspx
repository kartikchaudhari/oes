<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginViaUid.aspx.cs" Inherits="oes.faculty.LoginViaUid" ClientIDMode="Static" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="Online Examination system for Educational Organizations" />
    <meta name="keywords" content="Online examination system" />
    <title>Login &colon;&colon; Faculty</title>

    <!-- App Styling Bundle -->
    <link href="../css/bootstrap.min.css" rel="stylesheet"/>
    <link href="../css/custom.css" rel="stylesheet" />
    <link href="../css/font-awesome.min.css" rel="stylesheet" />
    <link rel="icon" type="image/x-icon" href="../images/favicon.ico" />
</head>
<body style="background-color: #EAEDF1;">
    <!-- top nav-->
    <nav class="navbar navbar-inverse custom-navbar">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle Navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" style="padding-left: 0px; padding-right: 0px; padding-bottom: 0px; padding-top: 3px;" href="../Index.aspx">
                    <span>
                        <img src="../images/secure-test.png" style="height: 50px; width: 50px;"></span>
                    <span id="oes_title">Online Examination System</span>
                </a>
            </div>
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="../Index.aspx">Home</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Registration <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="../student/Register.aspx">Student</a></li>
                            <li><a href="../faculty/Register.aspx">Faculty</a></li>
                        </ul>
                    </li>
                    <li class="dropdown active">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Login <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="../student/Login.aspx">Student</a></li>
                            <li class="active"><a href="../faculty/Login.aspx">Faculty</a></li>
                            <li><a href="../admin/Login.aspx">Administratior</a></li>
                        </ul>
                    </li>
                    <li><a href="../Help.aspx">Help</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- nav bar ends -->

    <!-- main content-->
    <div class="container">
        <form id="AdminUidLoginForm" runat="server" method="post">
            <div class="row">
                <div class="col-sm-10 col-sm-offset-1">
                    <%if(Request.QueryString.Count>0){
                          int id = Convert.ToInt16(Request.QueryString["eid"]);
                          
                          switch (id)
                          {
                              case 1:
                              {
                                  //session timed out
                                Response.Write("<div class='alert alert-warning alert-dismissable fade in' style='margin-top:30px;'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><strong>Sorry!</strong> The session is timed out. Please re-login below.</div>");
                              }
                              break;

                              case 2: 
                              {
                                  //invalid username and password
                                  Response.Write("<div class='alert alert-warning alert-dismissable fade in' style='margin-top:30px;'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><strong>Invalid Credentials</strong> The username and passwrod are invlaid.Please retry below.</div>");
                              }
                              break;
                                  

                              default:
                                  break;
                          }
                      } %>
                    <asp:Panel ID="LoginForm" runat="server" Visible="false">
                        <div class="panel panel-primary thumb_container">
                            <div class="panel-heading panel-heading-custom">Faculty  Login</div>
                            <div class="panel-body custom-thumb_container-body">
                            <div class="col-md-6 col-sm-offset-3">
                                <div class="form-group">
                                    <label for="email">Username:</label>
                                    <asp:TextBox ID="tbUsername" runat="server" CssClass="form-control" TextMode="SingleLine" required="required"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvUserName" ControlToValidate="tbUsername" ErrorMessage="Pleas Enter Username." runat="server" CssClass="ErrMsg"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <label for="pwd">Password:</label>
                                    <asp:TextBox ID="tbPass" runat="server" CssClass="form-control" TextMode="Password"  required="required"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvPass" ControlToValidate="tbPass" ErrorMessage="Pleas Enter Password." runat="server" CssClass="ErrMsg"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <asp:Button ID="btn_login" runat="server" Text="Login" CssClass="btn btn-success" OnClick="btn_login_Click"/>
                                    <strong>&nbsp;&middot;&nbsp;</strong>
                                    <button id="btnClear" class="btn btn-danger" type="reset">Clear</button> 
                                </div>
                                <div class="form-group">
                                    <a href="ForgotPassword.aspx">Forgot Password ?</a>
                                </div>
                            </div>
                        </div>
                        </div>
                    </asp:Panel>
                    <asp:Panel ID="ErrorPanel" runat="server" Visible="true" style="margin-top:6%;">
                        <div class="panel panel-pdanger thumb_container">
                            <div class="panel-heading panel-heading-custom">Access Denied!!</div>
                            <div class="panel-body">
                                <div class="col-md-6 col-md-offset-3">
                                    <table>
                                        <tr>
                                            <td align="center">
                                                <div class="img-responsive">
                                                    <img class="img-rounded" src="../images/denied.ico" />
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <h4 align="center">You don't have permission to access this page.</h4> 
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><h5>Please contact your Administrator or Faculty for further Information.</h5></td>
                                        </tr>
                                    </table>
                                </div>

                            </div>
                        </div>
                    </asp:Panel>
                    <div class="row">
                        <div id="BottomLinks" class="col-sm-5 col-sm-offset-4">
                            [&nbsp; <a href="Register.aspx">Create  New Account</a> &nbsp;]
                            <strong>&middot;</strong>
                            [&nbsp; <a href="../Index.aspx">Back to Home</a> &nbsp;]
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <!-- main content ends-->
    
    <footer class="footer custom-footer">
        <!--#include file="../footer.html"-->
    </footer>

    <script src="../js/custom.js"></script>

    <!-- jquery -->
    <script src="../js/vendor.min.js"></script>
</body>
</html>
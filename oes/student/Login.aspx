<%@ Page Title="Login &colon;&colon; Student" Language="C#" MasterPageFile="~/student/RegisterLoginMaster.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="oes.student.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="active_class_links" runat="server">
    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Registration <b class="caret"></b></a>
        <ul class="dropdown-menu">
            <li><a class="links" href="Register.aspx">Student</a></li>
            <li class="links active"><a href="../faculty/Register.aspx">Faculty</a></li>
        </ul>
    </li>
    <li class="dropdown active">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Login <b class="caret"></b></a>
        <ul class="dropdown-menu">
            <li  class="active"><a href="#">Student</a></li>
            <li><a class="links" href="../faculty/Login.aspx">Faculty</a></li>
            <li><a class="links" href="../admin/Login.aspx">Administratior</a></li>
        </ul>
    </li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="main_content" runat="server">
    <!-- main content-->
    <div class="container">
        <form id="StudentThumbLoginForm" runat="server" method="post">
            <div class="row">
                <div class="col-sm-10 col-sm-offset-1">
                    <%if(Request.QueryString.Count>0){
                          int id = Convert.ToInt16(Request.QueryString["eid"]);
                          switch (id)
                          {
                              case 1:
                              {
                                //session time out
                                Response.Write("<div class='alert alert-warning alert-dismissable fade in' style='margin-top:30px;'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><strong>Sorry!</strong> : The session is timed out. Please re-login below.</div>");
                              }
                              break;

                              case 2: 
                              {
                                  //invalid username and password
                                  Response.Write("<div class='alert alert-danger alert-dismissable fade in' style='margin-top:30px;'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><strong>Invalid Credentials</strong> : The username and passwrod are invlaid.Please retry below.</div>");
                              }
                              break;

                              case 3:
                              {
                                  //no user found for the specifid fingerprint 
                                  Response.Write("<div class='alert alert-danger alert-dismissable fade in' style='margin-top:30px;'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><strong>No user Found</strong> : No such user foud for the provided fingerprint.</div>");
                              }
                              break;
                              
                              case 444:
                              {
                                  //no thumb is scanned 
                                  Response.Write("<div class='alert alert-info alert-dismissable fade in' style='margin-top:30px;'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a> Please Scan your Thumb via Scanner.</div>");
                              }
                              break;      
                              default:
                                  break;
                          }
                      } %>
                    <div class="panel panel-primary thumb_container">
                        <div class="panel-heading panel-heading-custom">
                            Student  Login
                        </div>
                        <div class="panel-body custom-thumb_container-body">
                            <div class="tag-note">
                                <strong>Instrunctions:</strong> Click on "<strong>Scan</strong>" button then put your "<strong>Left thumb</strong>" or "<strong>Right thumb</strong>" on scanner. 
                            </div>
                            <hr />
                            <div class="col-md-8 col-sm-offset-2 thumb_img">
                                <img id="FPImage1" alt="Fingerpint Image" src="" onload="Send()"/>
                                <input type="hidden" id="img_val" runat="server" />
                            </div>
                        </div>
                        <div class="panel-footer" style="text-align:center;">
                                <input id="btnScan" class="btn btn-primary" value="Click to Scan" onclick="captureFP()" type="button" />
                                <strong>&middot;</strong>
                                <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-success" Text="Login" OnClick="btnSubmit_Click"/>
                        &nbsp;
                        <asp:Label ID="Label1" runat="server"></asp:Label></div>
                    </div>
                    <div class="row">
                        <div class="col-sm-8 col-sm-offset-3">
                            [&nbsp; <a href="#">Create  New Account</a> &nbsp;]
                            <strong>&middot;</strong>
                            [&nbsp; <a href="#">Request Login Page</a> &nbsp;]
                            <strong>&middot;</strong>
                            [&nbsp; <a class="links" href="LoginViaUid.aspx">Login Via Uid</a> &nbsp;]
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <!-- main content ends-->
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FingerCaptureHolder" runat="server">
    <script src="../js/FingerCapture.js"></script>
</asp:Content>

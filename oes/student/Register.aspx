﻿<%@ Page Title="" Language="C#" MasterPageFile="~/student/RegisterLoginMaster.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="oes.student.Register" ClientIDMode="Static" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    <title>Registration &colon;&colon; Student</title>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="active_class_links" runat="server">
    <li class="dropdown active">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Registration <b class="caret"></b></a>
        <ul class="dropdown-menu">
            <li class="active"><a href="#">Student</a></li> 
            <li><a href="../faculty/Register.aspx">Faculty</a></li>
        </ul>
    </li>
    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Login <b class="caret"></b></a>
        <ul class="dropdown-menu">
            <li><a href="Login.aspx">Student</a></li>
            <li><a href="../faculty/Login.aspx">Faculty</a></li>
            <li><a href="../admin/Login.aspx">Administratior</a></li>
        </ul>
    </li>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="main_content" runat="server">
   <div class="row-content">
    <div class="col-md-8 col-md-offset-2">
        <div class="panel panel-info">
            <div class="panel-heading panel-heading-custom">Student Registration</div>
            <div class="panel-body custom-body">

                <form id="StudentRegisterForm" runat="server">
                    <!-- first name last name-->
                    <div class="row">
                        <div class="col-sm-5 form_controls_custom">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <asp:TextBox ID="fname" CssClass="form-control" type="text" MaxLength="20" ClientIDMode="Static" placeholder="First Name" runat="server" required="required" onchange="ValidateName(fname);"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-sm-5 form_controls_custom">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <asp:TextBox ID="lname" CssClass="form-control" type="text" MaxLength="20" ClientIDMode="Static" placeholder="Last Name" runat="server" required="required"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <!-- username enrollment no.-->
                    <div class="row">
                        <div class="col-md-5 form_controls_custom">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <asp:TextBox ID="uname" CssClass="form-control" type="text" MaxLength="20" ClientIDMode="Static" placeholder="User Name" runat="server" required="required"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-5 form_controls_custom">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                                <asp:TextBox ID="enrollment" CssClass="form-control" type="text" MaxLength="40" ClientIDMode="Static" placeholder="Enrollmet No." runat="server" required="required"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <!-- email address-->
                    <div class="row">
                        <div class="col-md-11 form_controls_custom">
                            <div class="input-group email-div">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                                <asp:TextBox ID="email" CssClass="form-control" MaxLength="40" ClientIDMode="Static" placeholder="Email Address" runat="server" required="required"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <!-- password, confirm passsword-->
                    <div class="row">
                      <div class="col-md-5 form_controls_custom">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                            <asp:TextBox ID="pass" CssClass="form-control" type="password" MaxLength="40" ClientIDMode="Static" placeholder="Password" runat="server" required="required"></asp:TextBox>
                        </div>
                    </div>
                      <div class="col-md-5 form_controls_custom">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                <asp:TextBox ID="cpass" CssClass="form-control" type="password" MaxLength="40" ClientIDMode="Static" placeholder="Re-enter Password" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                                            
                   <!-- parents,student contact no. -->
                   <div class="row">
                        <div class="col-md-5 form_controls_custom">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
                                <asp:TextBox ID="parent_contactno" CssClass="form-control" MaxLength="10" ClientIDMode="Static" placeholder="Parents Contact No." runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-5 form_controls_custom">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
                                <asp:TextBox ID="stud_contactno" CssClass="form-control" MaxLength="10" ClientIDMode="Static" placeholder="Student Contact No." runat="server"></asp:TextBox>
                            </div>
                        </div>
                   </div>  

                   <!-- department and semester -->
                   <div class="row">
                       <div class="col-md-5 form_controls_custom">
                           <div class="input-group">
                              <%-- <label><strong>Department:</strong></label>--%>
                               <asp:DropDownList ID="dept_ddl" runat="server" CssClass="form-control" Width="275">
                                   <asp:ListItem Value="NA" Text="---- Select Department ----"></asp:ListItem>
                               </asp:DropDownList>
                           </div>
                       </div>
                       <div class="col-md-5 form_controls_custom">
                           <div class="input-group">
                              <%-- <label><strong>Semester:</strong></label>--%>
                               <asp:DropDownList ID="ddl_sem" runat="server"  CssClass="form-control" Width="275">
                                   <asp:ListItem Value="NA" Text="---- Select Semester ----"></asp:ListItem>
                                   <asp:ListItem>1</asp:ListItem>
                                   <asp:ListItem>2</asp:ListItem>
                                   <asp:ListItem>3</asp:ListItem>
                                   <asp:ListItem>4</asp:ListItem>
                                   <asp:ListItem>5</asp:ListItem>
                                   <asp:ListItem>6</asp:ListItem>
                               </asp:DropDownList> 
                           </div>
                       </div>
                    </div>
                    <div class="row">
                        <div class="col-md-5 form_controls_custom">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Select Department" ForeColor="Red" Font-Bold="true" InitialValue="NA" ControlToValidate="dept_ddl"></asp:RequiredFieldValidator>
                        </div>
                        <div class="col-md-5 form_controls_custom">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Select Semester" ForeColor="Red" Font-Bold="true" InitialValue="NA" ControlToValidate="ddl_sem" ></asp:RequiredFieldValidator>
                        </div>
                    </div>
                   <!-- submit, reset -->
                   <div class="col-md-8 form_controls_custom">
                       <div class="input-group">
                           <asp:Button ID="submit_btn" CssClass="btn btn-success" runat="server" Text="Submit" OnClick="submit_btn_Click" />
                           
                           <asp:Button ID="reset_btn" CssClass="btn btn-danger" runat="server" Text="Reset" />
                           &nbsp;<strong>&middot;</strong>&nbsp;
                            or click <strong> <a href="Login.aspx" class="links">here</a> </strong> to Login 
        
                           <asp:Label ID="lbl_msg" runat="server" Visible="True"></asp:Label>
                       </div>
                   </div>   
                </form>
            </div>
        </div>
       
    </div>
</div>
</asp:Content>

<%@ Page Title="Registration &colon;&colon; Faculty" Language="C#" MasterPageFile="~/faculty/RegisterLoginMaster.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="oes.faculty.Register" %>
<asp:Content ID="Content2" ContentPlaceHolderID="active_class_links" runat="server">
    <li class="dropdown active">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Registration <b class="caret"></b></a>
        <ul class="dropdown-menu">
            <li><a href="../student/Register.aspx">Student</a></li>
            <li class="active"><a href="#">Faculty</a></li>
        </ul>
    </li>
    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Login <b class="caret"></b></a>
        <ul class="dropdown-menu">
            <li><a href="../student/Login.aspx">Student</a></li>
            <li><a href="../faculty/Login.aspx">Faculty</a></li>
            <li><a href="../admin/Login.aspx">Administratior</a></li>
        </ul>
    </li>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="main_content" runat="server">
<div class="row-content">
    <div class="col-sm-6 col-sm-offset-3">
        <div class="panel panel-info">
            <div class="panel-heading panel-heading-custom">Faculty Registration</div>
            <div class="panel-body custom-body">
                <form id="form1" runat="server" method="post" action="#">
                    <div class="col-md-10 form_controls_custom">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                            <asp:TextBox ID="fname" CssClass="form-control" type="text" MaxLength="20" ClientIDMode="Static" placeholder="First Name" runat="server" required="required"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-10 form_controls_custom">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                            <asp:TextBox ID="lname" CssClass="form-control" type="text" MaxLength="20" ClientIDMode="Static" placeholder="Last Name" runat="server" required="required"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-10 form_controls_custom">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                            <asp:TextBox ID="uname" CssClass="form-control" type="text" MaxLength="20" ClientIDMode="Static" placeholder="User Name" runat="server" required="required"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-10 form_controls_custom">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                            <asp:TextBox ID="email" CssClass="form-control" type="email" MaxLength="40" ClientIDMode="Static" placeholder="Email Address" runat="server" required="required"></asp:TextBox>
                        </div>
                    </div>

                      <div class="col-md-10 form_controls_custom">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                            <asp:TextBox ID="pass" CssClass="form-control" type="password" MaxLength="40" ClientIDMode="Static" placeholder="Password" runat="server" required="required"></asp:TextBox>
                        </div>
                    </div>

                     <div class="col-md-10 form_controls_custom">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                            <asp:TextBox ID="cpass" CssClass="form-control" type="password" MaxLength="40" ClientIDMode="Static" placeholder="Re-enter Password" runat="server"></asp:TextBox>
                        </div>
                    </div>

                    <div class="col-md-10 form_controls_custom">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
                            <asp:TextBox ID="contactno" CssClass="form-control" MaxLength="10" ClientIDMode="Static" placeholder="Contact Number" runat="server"></asp:TextBox>
                        </div>
                    </div>

                    <div class="col-md-10 form_controls_custom">
                        <div class="input-group">
                            <label><strong>Department:</strong></label>
                            <asp:DropDownList ID="dept_ddl" runat="server"></asp:DropDownList>
                         </div>
                    </div>
                    <div class="col-md-10 form_controls_custom">
                        <div class="input-group">
                                <asp:Button ID="submit_btn" CssClass="btn btn-success"  runat="server" Text="Submit" OnClick="submit_btn_Click"/>
                                <asp:Button ID="reset_btn" CssClass="btn btn-danger" runat="server" Text="Reset"/>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Label ID="lbl_msg" runat="server" Visible="True"></asp:Label>
                        </div> 
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</asp:Content>

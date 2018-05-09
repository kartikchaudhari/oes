<%@ Page Title="Forgot Password" Language="C#" MasterPageFile="~/faculty/RegisterLoginMaster.Master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="oes.faculty.ForgotPassword" %>

<asp:Content ID="Content2" ContentPlaceHolderID="active_class_links" runat="server">
    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Registration <b class="caret"></b></a>
        <ul class="dropdown-menu">
            <li><a href="../student/Register.aspx">Student</a></li>
            <li><a href="Register.aspx">Faculty</a></li>
        </ul>
    </li>
    <li class="dropdown active">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Login <b class="caret"></b></a>
        <ul class="dropdown-menu">
            <li><a href="../student/Login.aspx">Student</a></li>
            <li class="active"><a href="Login.aspx">Faculty</a></li>
            <li><a href="../admin/Login.aspx">Administratior</a></li>
        </ul>
    </li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="main_content" runat="server">
     <form id="ForgotPasswordForm" runat="server"><br /><br />
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
         <div class="row">
             <div class="col-md-8 col-md-offset-2">
                 <div id="pdc" class="panel panel-pcrimson" style="margin-bottom:2%;">
                     <div class="panel-heading panel-heading-custom">Forgot Password</div>
                     <div class="panel-body">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <div class="form-group">
                                    <label>Enter Email Address:</label>
                                    <asp:TextBox ID="tbEmail" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                        ErrorMessage="Plese Enter Email Address" CssClass="ErrMsg" ControlToValidate="tbEmail"></asp:RequiredFieldValidator>        
                                    <asp:RegularExpressionValidator ID="RegExValidatorEmail" runat="server" 
                                       ErrorMessage="Enter a Valid email-address" ControlToValidate="tbEMail" 
                                       ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass="ErrMsg"></asp:RegularExpressionValidator>
                                </div>
                                <div class="form-group">
                                    <label>Enter Username:</label>
                                    <asp:TextBox ID="tbUserName" runat="server" CssClass="form-control" TextMode="SingleLine"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                        ErrorMessage="Plese Enter username" 
                                        CssClass="ErrMsg" ControlToValidate="tbUserName"></asp:RequiredFieldValidator>
                                   
                                </div>
                                <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-success" OnClientClick="RemoveMargin()" OnClick="btnSubmit_Click"/>
                                <br /><br />
                                <div id="DataFund" runat="server"></div>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnSubmit" />
                            </Triggers>
                        </asp:UpdatePanel>
                     </div>
                 </div>
                 <div class="row" style="margin-bottom:6%;">
                     <div class="col-md-4 col-md-offset-4">
                         [<a href="Login.aspx">Go to Login</a>]&nbsp;&nbsp;<strong>&middot;</strong>&nbsp;&nbsp;[<a href="../Index.aspx">Back to Home</a>]
                     </div>
                 </div>
             </div>
          </div>
     </form>
</asp:Content>

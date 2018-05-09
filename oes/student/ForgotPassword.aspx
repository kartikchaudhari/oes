<%@ Page Title="" Language="C#" MasterPageFile="~/student/RegisterLoginMaster.Master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="oes.student.ForgotPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    <title>Forgot Password</title>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="active_class_links" runat="server">
    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Registration <b class="caret"></b></a>
        <ul class="dropdown-menu">
            <li><a href="#">Student</a></li>
            <li><a href="../faculty/Register.aspx">Faculty</a></li>
        </ul>
    </li>
    <li class="dropdown active">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Login <b class="caret"></b></a>
        <ul class="dropdown-menu">
            <li class="active"><a href="Login.aspx">Student</a></li>
            <li><a href="../faculty/Login.aspx">Faculty</a></li>
            <li><a href="../admin/Login.aspx">Administratior</a></li>
        </ul>
    </li>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="main_content" runat="server">
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
                                    <label>Enter Enrollment No.:</label>
                                    <asp:TextBox ID="tbEnrollmentNo" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Plese Enter Enrollment No." CssClass="ErrMsg" ControlToValidate="tbEnrollmentNo"></asp:RequiredFieldValidator>        
                                </div>
                                <div class="form-group">
                                    <label>Enter Username:</label>
                                    <asp:TextBox ID="tbUserName" runat="server" CssClass="form-control" TextMode="SingleLine"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Plese Enter username" CssClass="ErrMsg" ControlToValidate="tbUserName"></asp:RequiredFieldValidator>
                                </div>
                                <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-success" OnClientClick="RemoveMargin()"  OnClick="btnSubmit_Click" />
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

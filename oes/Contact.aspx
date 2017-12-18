<%@ Page Title="Contact us" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="oes.Contact" %>
<asp:Content ID="Content3" ContentPlaceHolderID="active_class_links" runat="server">
    <li class="active"><a href="Contact.aspx">Contact us</a></li>    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="server">
    <div class="container-fluid">
   <div class="row">
       <div class=""></div>
   </div>
        <div class="col-md-3">&nbsp;</div>
        <div class="col-md-4">
            <div class="panel panel-info shadow-pannel">
                <div class="panel-heading">
                    <span style="font-size:20px;">Get in touch with us</span>
                </div>
                <div class="panel-body">
                    <form id="form1" runat="server" method="post" action="#">
                        <div class="form-group">
                            <label>First name:</label>
                            <asp:TextBox ID="tbFname" runat="server" class="form-control" type="text" required="required"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Last name:</label>
                            <asp:TextBox ID="tbLname" runat="server" class="form-control" type="text" required="required"></asp:TextBox>
                        </div>
                        
                        <div class="form-group">
                            <label for="email">Email:</label>
                            <asp:TextBox ID="tbEmail" runat="server" class="form-control" type="email" required="required"></asp:TextBox>
                       </div>
                        <div class="form-group">
                            <label for="comment">Message:</label>
                            <asp:TextBox ID="msg" class="form-control textbox_css" runat="server"></asp:TextBox>
                             </div>
                        <asp:Button ID="BtnSubmit" runat="server" class="btn btn-default" Text="Submit" OnClick="BtnSubmit_Click1" />
                     </form>
                     <asp:Label ID="err_lbl" runat="server" Text="Label"></asp:Label>
                </div>
            </div>
        </div>
    </div>   
</asp:Content>

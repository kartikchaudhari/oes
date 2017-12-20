<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestPage.aspx.cs" Inherits="oes.TestPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js" type="text/javascript"></script>
 <script type="text/javascript">
     $(function () {
         $("[id*=btnSubmit]").click(function () {
             var name = $.trim($("[id*=txtName]").val());
             
             $.ajax({
                 type: "POST",
                 url: "SendBase64.asmx/CreateImage",
                 data: "{ b64: '" + name + "'}",
                 contentType: "application/json; charset=utf-8",
                 dataType: "json",
                 success: function (r) {
                     alert(r.d);
                 },
                 error: function (r) {
                     alert(r.responseText);
                 },
                 failure: function (r) {
                     alert(r.responseText);
                 }
             });
             return false;
         });
     });
</script>

</head>
<body>
    <form id="form1" runat="server">
     
     <table border="0" cellpadding="0" cellspacing="0">
<tr>
    <td>
        Name:
    </td>
    <td>
        <asp:TextBox ID="txtName" runat="server" Text="" />
    </td>
</tr>
<tr>
    <td>
        <asp:Button ID="btnSubmit" Text="Submit" runat="server" />
    </td>
</tr>
</table>
    </form>
</body>
</html>

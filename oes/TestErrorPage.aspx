<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestErrorPage.aspx.cs" Inherits="oes.TestErrorPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
    </div>
    </form>
</body>
</html>

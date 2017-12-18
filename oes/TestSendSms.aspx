<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestSendSms.aspx.cs" Inherits="oes.TestForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .lbl_status {
            color:green;
            font-size:30px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="lbl" runat="server" CssClass="lbl_status"></asp:Label>
    </div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Results.aspx.cs" Inherits="oes.student.Results" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="resultGrid" runat="server" AutoGenerateColumns="False" 
            AutoGenerateSelectButton="True" CellPadding="4" DataKeyNames="QuestionID"
              ForeColor="#333333" GridLines="None" SelectedIndex="0" Width="555px">
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#F7F6F3" CssClass="generaltext" ForeColor="#333333" HorizontalAlign="Center" />
            <Columns>
                <asp:BoundField DataField="QuestionID" HeaderText="Question" />
                <asp:BoundField DataField="CorrectAnswer" HeaderText="Correct Answer" />
                <asp:BoundField DataField="UserAnswer" HeaderText="Your Answer" />
                <asp:BoundField DataField="Result" HeaderText="Result" />
            </Columns>
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#5D7B9D" CssClass="boldtext" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#999999" />
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        </asp:GridView>
        <br />
        <asp:Label ID="errorLabel" runat="server"></asp:Label>
    
    </div>
    </form>
</body>
</html>

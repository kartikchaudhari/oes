<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestAdmin.aspx.cs" Inherits="oes.admin.TestAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <%--<asp:Label ID="Label1" runat="server"></asp:Label>--%>
        <% 
             
            //
            
            
            
         //    A signed number indicating the relative values of t1 and t2.
         //Value Type Condition
        //     Less than zero t1 is earlier than t2. Zero t1 is the same as t2. Greater
        //     than zero t1 is later than t2.

           
            //DateTime DesiredDate = DateTime.Parse("11-03-2018");
            //DateTime CurrentDate = 
            string dt=DateTime.Now.ToShortDateString();
            dt.CompareTo();
            int ResultCompare = DateTime.Compare(DesiredDate, CurrentDate);
            //if (ResultCompare==-1)
            //{
            //    Response.Write("Desired Date is less then Current Date.");
            //}
            //else if (ResultCompare==0)
            //{
            //    Response.Write("Current Date anad Desired Date are Equeal :) :)");
            //}
            //else if (ResultCompare == 1) 
            //{
            //    Response.Write("Desired Date is Greater then Current Date");
            //}

            //Response.Write(DesiredDate);
            Response.Write(dt);
             %>
        
        <br />
        <asp:TextBox ID="TextBox1" runat="server" TextMode="Date" Width="329px"></asp:TextBox>
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
    </div>
    </form>
</body>
</html>

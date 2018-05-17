<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Results.aspx.cs" Inherits="oes.student.Results" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Exam Result</title>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="Online Examination system for Educational Organizations" />
    <meta name="keywords" content="Online examination system" />
     
    <!-- Stylesheets -->
    <link href="../css/bootstrap.beautified.css" rel="stylesheet" />
    <link href="../css/custom.css" rel="stylesheet" />
    <link href="../css/progress-bar.css" rel="stylesheet" />
    <link rel="icon" type="image/x-icon" href="../images/favicon.ico" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-10 col-md-offset-1"><br /><br />
                <div class="panel panel-psg">
                    <div class="panel-body">
                        <div class="table-responsive" style="padding:6px;">
                            <div id="SmsPanel" class="alert alert-success alert-dismissable fade in" runat="server">
                                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                <strong>Congratulations!</strong> Your marks are sent to your parents Successfully.
                             </div>
                            <div class="alert alert-info">
                                <div class="pull-left"><strong>You've Got:</strong> <asp:Label ID="lblStudentsGotMarks" runat="server"></asp:Label> <strong>Marks</strong></div>
                                <div class="pull-right"><strong>Total Marks:</strong> <asp:Label id="lblExamTotalMarks" runat="server"></asp:Label></div>
                                
                                <div class="clearfix"></div> 
                             </div>
                            <asp:GridView ID="resultGrid" runat="server" AutoGenerateColumns="False" 
                                CellPadding="4" DataKeyNames="QuestionID"
                                ForeColor="#333333" GridLines="None" Width="555px" CssClass="table table-bordered"
                                 EnableViewState="false">
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <RowStyle BackColor="#F7F6F3" CssClass="generaltext" ForeColor="#333333" HorizontalAlign="Center" />
                            <Columns>
                                <asp:BoundField DataField="QuestionID" HeaderText="Question" />
                                <asp:BoundField DataField="CorrectAnswer" HeaderText="Correct Answer" />
                                <asp:BoundField DataField="UserAnswer" HeaderText="Your Answer" />
                                <asp:BoundField DataField="Result" HeaderText="Result" />
                                <asp:BoundField DataField="MarksOfQuestion" HeaderText="Marks of Question" />
                            </Columns>
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <HeaderStyle BackColor="#5D7B9D" CssClass="boldtext" Font-Bold="True" ForeColor="White" />
                            <EditRowStyle BackColor="#999999" />
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        </asp:GridView>
                            <br />
                                <asp:Label ID="errorLabel" runat="server"></asp:Label>
                            <br />
                            <asp:Button ID="btnFininshExam" runat="server" CssClass="btn btn-success" Text="Finish" Font-Bold="true" OnClick="btnFininshExam_Click" />
                        </div>
                    </div>
                <//div>
            </div>
        </div>
        
    
    </div>
    </form>
</body>
</html>

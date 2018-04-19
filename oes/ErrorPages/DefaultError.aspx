<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DefaultError.aspx.cs" Inherits="oes.ErrorPages.DefaultError" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Error Occured</title>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="Online Examination system for Educational Organizations" />
    <meta name="keywords" content="Online examination system" />
     
    <!-- Stylesheets -->
    <link href="../css/bootstrap.beautified.css" rel="stylesheet" />
    <link href="../css/custom.css" rel="stylesheet" />
    <link href="../css/progress-bar.css" rel="stylesheet" />
    <link rel="icon" type="../image/x-icon" href="images/favicon.ico" />
    
    <!-- jquery -->
    <script src="../js/vendor.min.js"></script>
    <script src="../js/progress-bar.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <div class="row"><br /><br />
            <div class="col-md-11 col-md-offset-1" style="padding:15px;">
                
                    <div style="position:absolute;padding:20px;border-radius:5px;">
                        <div class="col-md-6 pull-left" style="padding-top:30px;">
                            <img src="../images/oops_error_broken_pencil.jpg" style="height:300px;width:600px;"/>
                        </div>
                        <div class="col-md-6 pull-right">
                            <div class="jumbotron">
                                <h1 style="text-align:center;">Oops!</h1><hr />
                                <h3 style="text-align:center;">Something went wrong here.</h3>
                                <p style="font-weight:normal;font-size:15px;padding-left:30px;">
                                    We're working on it and we'll get it fixed<br />
                                    as soons as possible.<br /><br />
                                    You can go back to your dashboard or homepage.

                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            
        </div>
    </div>
    </form>
    <script src="../js/custom.js"></script>
</body>
</html>
﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ThumbTest.aspx.cs" Inherits="oes.ThumbTest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table border="0" align="center" width="50%">
            <tr>
                <td>
                    <h1 align="center">Secugen Biometric Web API</h1>
                    <hr>
                </td>
            </tr>
            <tr>
                <td align="center">
                    <img border="2" id="FPImage1" alt="Fingerpint Image" height="300" width="210" src="" onload="Send()">
                    <input type="hidden" id="img_val" />
                    <br>
                </td>
            </tr>
            <tr>
                <td>
                    <p id="result"></p>
                </td>
            </tr>
            <tr>
                <td align="center">
                    <input type="button" value="Click to Scan" onclick="captureFP()">
                        &nbsp;&nbsp;<strong>&middot;</strong>
                    <input type="button" value="Login"/>
                </td>
            </tr>
        </table>
    </div>
    </form>
    <script type="text/javascript" src="js/FingerCapture.js"></script>
</body>
</html>

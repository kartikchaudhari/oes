<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ThumbTest.aspx.cs" Inherits="oes.ThumbTest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <!-- jquery -->
    <script src="../js/vendor.min.js"></script>
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
                    <input type="number" placeholder="Enter User Id" id="userid" style="width:100%;"/>
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
                        <br />
                    <input type="checkbox"/>Confirm to Register this Thumb
                    <br />
                    <input id="btnRegister" type="button" value="Register" onclick="SendToDb()" disabled="disabled" />
                </td>
            </tr>
        </table>
    </div>
    </form>
    <script type="text/javascript" src="js/FingerCapture.js"></script>
     <script type="text/javascript">
         $(document).ready(function () {
             $('input[type="checkbox"]').click(function () {
                 if ($(this).prop("checked") == true) {
                     $("#btnRegister").removeAttr("disabled");
                 }
                 else if ($(this).prop("checked") == false) {
                     alert("Please Agree to Registration then click on register.");
                     $("#btnRegister").attr("disabled", "disabled");
                 }
             });

         });
    </script>
    <script type="text/javascript">
        function SendToDb() {
            $(function () {

                //if the "src" attribute is not empty, means
                //there is an image data then send call the 
                //web method and sem dthe base64 string
                if ($("[id*=FPImage1]", this).attr('src') || !$("[id*=FPImage1]", this).attr('src')) {

                    //activate login button

                    var name = $.trim($("[id*=img_val]").val());
                    var id = $.trim($("[id*=userid]").val());
                    $.ajax({
                        type: "POST",
                        url: "SendBase64.asmx/RegisterUser",
                        data: "{ b64: '" + name + "',UserId:'"+id+"'}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json"
                    });
                    return false;
                } else {
                    //if there is no image do nothing 
                    //for the tracing purpose comment out the
                    //following line
                    //alert('empty src...');
                }

            });
        }

    </script>
</body>
</html>

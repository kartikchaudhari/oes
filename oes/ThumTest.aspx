<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ThumTest.aspx.cs" Inherits="oes.ThumTest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js" type="text/javascript"></script>
<script type = "text/javascript">
    function Send() {
        var vals = $('#img_val').val();
        $.ajax({
            type: "POST",
            url: "SendBase64.asmx/CreateImage",
            data: '{b64:vals}',
        success: function (response) {
            alert(response.d);
        }
    });
}
</script>

    
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1>Ohh Yeahh</h1>
        <div class="col-md-8 col-sm-offset-2 thumb_img">
            <img id="FPImage1" alt="Fingerpint Image" src="" />
            <input type="text" id="img_val" runat="server" />
       </div>
            <input id="btnScan" class="col-md-offset-5 btn btn-primary" value="Click to Scan" onclick="captureFP()" type="button" />             
            <strong>&middot;</strong>
            <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-success"  Text="Upload" OnClick="btnSubmit_Click" />
    </div>
        <button onclick="Send();">HaHa</button>
   
        <p>
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        </p>
         <br />
        <br />
        <p id="base64string" style="border:1px solid red;"></p>
    </form>
       <!-- App Scripts Bundle -->
    

     <script src="js/FingerCapture.js"></script>
    </body>
</html>

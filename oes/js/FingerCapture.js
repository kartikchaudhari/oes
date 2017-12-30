function captureFP() {
    CallSGIFPGetData(SuccessFunc, ErrorFunc);
   
}

/* 
    This functions is called if the service sucessfully returns some data in JSON object
 */

function SuccessFunc(result) {
    if (result.ErrorCode == 0) {
        /* 	Display BMP data in image tag and store the base64 value to input tag
            BMP data is in base 64 format 
        */
        if (result != null && result.BMPBase64.length > 0) {
            document.getElementById("FPImage1").src = "data:image/bmp;base64," + result.BMPBase64;
            document.getElementById("img_val").value = result.BMPBase64;
        }
    }
    else {
        alert("Fingerprint Capture ErrorCode " + result.ErrorCode);
    }
}

function ErrorFunc(status) {

    /* 	
        If you reach here, user is probabaly not running the 
        service. Redirect the user to a page where he can download the
        executable and install it. 
    */
    alert("Check if SGIBIOSRV service is running.. Or Contact the Administrator.. ");

}

function CallSGIFPGetData(successCall, failCall) {
    var uri = "http://localhost:8000/SGIFPCapture";

    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function () {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            fpobject = JSON.parse(xmlhttp.responseText);
            successCall(fpobject);
        }
        else if (xmlhttp.status == 404) {
            failCall(xmlhttp.status)
        }
    }
    xmlhttp.onerror = function () {
        failCall(xmlhttp.status);
    }
    xmlhttp.open("POST", uri, true);
    xmlhttp.send();
}

function Send() {
    $(function () {

        //if the "src" attribute is not empty, means
        //there is an image data then send call the 
        //web method and semdthe base64 string
        if ($("[id*=FPImage1]", this).attr('src') || !$("[id*=FPImage1]", this).attr('src')) {
            var name = $.trim($("[id*=img_val]").val());
            $.ajax({
                type: "POST",
                url: "SendBase64.asmx/CreateImage",
                data: "{ b64: '" + name + "'}",
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


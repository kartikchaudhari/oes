function OpenPage(page) {
    //$.ajax({
    //    type: 'GET',
    //    url: page,
    //    success: function (data) {
    //        try {
    //            $('#DashBoardFrame').html(data);
    //        } catch (err) {
    //            alert(err);
    //        }
    //    }
    //});
    $('#DashBoardFrame').load(page);

}

function LoadPage() {
    document.getElementById('#DashBoardFrame').src = "DashboardContents.aspx";
}



function ValidateContactNo(type) {
    
    switch (type) {
        case 1:{
                //contact no. of faculty    
                var contact = document.getElementById("contactno").value;
                var pattern = /^\d{10}$/;
                if (pattern.test(contact)) {
                    if (contact.length > 0 && contact.length <= 10) {
                        return true;
                    }
                }
                alert("It is not valid mobile number. input 10 digits number!");
                return false;
        }
            break;

        case 2: {
            //contact no. of parents    
            var contact = document.getElementById("parent_contactno").value;
            var pattern = /^\d{10}$/;
            if (pattern.test(contact)) {
                if (contact.length > 0 && contact.length <= 10) {
                    return true;
                }
            }
            alert("It is not valid mobile number. input 10 digits number!");
            return false;
        }
            break;

        case 3: {
            //contact no. of student    
            var contact = document.getElementById("stud_contactno").value;
            var pattern = /^\d{10}$/;
            if (pattern.test(contact)) {
                if (contact.length > 0 && contact.length <= 10) {
                    return true;
                }
            }
            alert("It is not valid mobile number. input 10 digits number!");
            return false;
        }
            break;
        default:
    }
    
}

function ValidatePassword() {
    var pass1 = document.getElementById("pass").value;
    var pass2 = document.getElementById("cpass").value;
    if (pass1==null) {
        alert("Password Field Cannot be Empty.");
        return false;
    }
    if (pass1 != pass2) {
        alert("Password does not match.");
        return false;
    }
}

function ValidateFname() {
    var name = document.getElementById("fname").value;
    if (name.length < 2 && name.length > 40) {
        alert("Invalid name length");
    }

    var pattern = new RegExp("^[a-z\. ]+$");
    var return_value = pattern.exec(name);
    if (return_value == null) {
        alert("Please give valid name.");
        return false;
    }
}

function ValidateLname() {
    var name = document.getElementById("fname").value;
    if (name.length < 2 && name.length > 40) {
        alert("Invalid name Length.");
    }

    var pattern = new RegExp("^[a-z\. ]+$");
    var return_value = pattern.exec(name);
    if (return_value == null) {
        alert("Please give valid name.");
        return false;
    }
}

function ValidateEmail() {
    var email = document.getElementById("email").value;
    if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(email)) {
        return true;
    } else {
        alert("You have entered an invalid email address!");
        return false;
    }
}


//add active class to clicked sidebar iteam
$(function () {
    $('#menu a').filter(function () { return this.href == location.href }).parent().addClass('active').siblings().removeClass('active')
    $('#menu a').click(function () {
        $(this).parent().addClass('active').siblings().removeClass('active')
    })
})


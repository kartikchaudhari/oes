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


//Datatable for subject list
function SubjectDatatable() {
    $.ajax({
        url: 'DataTableServices.asmx/GetSubjectDetail',
        method: 'POST',
        dataType: 'json',
        success: function (data) {
            $('#datatable').dataTable({
                //set the "show entries" select list
                "aLengthMenu": [[5, 10, 20, -1], [5, 10, 20, "All"]],
                "iDisplayLength": 5,

                //fetch the data
                data: data,
                columns: [
                    {
                        'data': 'subject_id',
                        'sortable': true,
                        'searcbale': true
                    },
                    {
                        'data': 'subject_name',
                        'sortable': false,
                        'searchable': true
                    },
                    {
                        'data': 'subject_code',
                        'sortable': true,
                        'searcbale': true
                    },
                    {
                        'data': 'dept_name',
                        'sortable': true
                    },
                    {
                        'data': 'sem_id',
                        'sortable': true
                    },
                    {
                        'data': 'total_exam_taken',
                        'sortable': true,
                        'render':function(total_exam_taken){
                            if (!total_exam_taken) {
                                return 0;
                            } else {
                                return total_exam_taken;
                            }
                        }
                    },
                    {
                        'data': 'subject_id',
                        'sortable': false,
                        'searchable': false,
                        'render': function (jsonId) {
                            var id = parseInt(jsonId);
                            var btn = '<a class="links" href="ha.aspx?id=' + id + '"><button type="button" class="btn btn-primary btn-xs">Edit</button></a>&nbsp;<strong>&middot;</strong>&nbsp;<button type="button" class="btn btn-danger btn-xs">Delete</button>&nbsp;<strong>&middot;</strong>&nbsp;<a class="links" href="AddQuestions.aspx?subject_id=' + id + '"><button type="button" class="btn btn-success btn-xs">Add Questions</button></a>&nbsp;<strong>&middot;</strong>&nbsp;<a class="links" href="ViewQuestions.aspx?subject_id=' + id + '" target="DashboardContentFrame"><button type="button" class="btn btn-info btn-xs">View Questions</button></a>&nbsp;';
                            return btn;
                        }
                    }
                ]
            });
        }
    });
}

function FacultyDatatable() {
    $.ajax({
        url: 'DataTableServices.asmx/GetFacultyDetail',
        method: 'POST',
        dataType: 'json',
        success: function (data) {
            $('#DatatableFaculties').dataTable({
                //set the "show entries" select list
                "aLengthMenu": [[5, 10, 20, -1], [5, 10, 20, "All"]],
                "iDisplayLength": 5,

                //fetch the data
                data: data,
                columns: [
                    {
                        'data': 'FacultyId',
                        'sortable': true,
                        'searcbale': true
                    },
                    {
                        'data': 'FullName',
                        'sortable': false,
                        'searchable': true
                    },
                    {
                        'data': 'AvatarPath',
                        'sortable': false,
                        'searchable': false,
                        'render': function (Avatar) {
                            if (Avatar.length == 0) {
                                return "No Image";
                            } else {
                                var btn = '<img src="' + Avatar + '" style="height:50px;width:50px;"/>';
                                return btn;
                            }
                        }
                    },
                    {
                        'data': 'ThumbPath',
                        'sortable': false,
                        'searchable': false,
                        'render': function (Thumb) {
                            if (Thumb.length == 0) {
                                return "No Thumb Impression";
                            } else {
                                var btn = '<img src="' + Thumb + '" style="height:50px;width:50px;"/>';
                                return btn;
                            }
                        }
                     
                    },
                    {
                        'data': 'UserName',
                        'searchable': true,
                        'sortable':false
                    },
                    {
                        'data': 'EmailId',
                        'searchable': true,
                        'sortable':false
                    },
                    {
                        'data': 'ContactNo',
                        'searchable': true,
                        'sortable':false
                    },
                    {
                        'data': 'DeptName',
                        'searchable': true,
                        'sortable':true
                    },
                    {
                        'data': 'FacultyId',
                        'sortable': false,
                        'searchable': false,
                        'render': function (jsonId) {
                            var id = parseInt(jsonId);
                            var btn = '<a class="links" href="ha.aspx?id=' + id + '"><button type="button" class="btn btn-primary btn-xs" style="margin-bottom:6%;">Edit</button></a>&nbsp;&nbsp;<button type="button" class="btn btn-danger btn-xs">Delete</button>&nbsp;';
                            return btn;
                        }
                    }
                ]
            });
        }
    });
}

/*
* Function : Confirms the Faculty Registration Request
*
*/
function ConfirmFacultyRequest() {
    var faculty_id = parseInt($.trim($("[id*=hf_fact_id]").val()));
    $.ajax({
        type: "POST",
        url: "WebMethods/Faculty.asmx/ConfirmRequest",
        data: '{UserId:"' + faculty_id + '"}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (r) {
            $("#RequestConfirmModal").modal("show", { keyboard: true });
            //alert(r);
        },
        error: function (r) {
            alert(r.responseText);
        }
    });
    return false;
}




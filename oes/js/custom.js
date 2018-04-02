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

    var pattern = new RegExp("^[a-z\. ][A-Z\. ]+$");
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


// prevent href=# click jump
function PreventHrefJump() {
    document.addEventListener("DOMContentLoaded", function () {
        var links = document.getElementsByTagName("A");
        for (var i = 0; i < links.length; i++) {
            if (links[i].href.indexOf('#') != -1) {
                links[i].addEventListener("click", function (e) {
                    console.debug("prevent href=# click");
                    if (this.hash) {
                        if (this.hash == "#") {
                            e.preventDefault();
                            return false;
                        }
                        else {
                        }
                    }
                    return false;
                })
            }
        }
    }, false);
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
    //var d = Date.getDate() + "-" + Date.getMonth() + "-" + Date.getFullYear();
    $.ajax({
        url: 'DataTableServices.asmx/GetSubjectDetail',
        method: 'POST',
        dataType: 'json',
        success: function (data) {

            $('#datatable').DataTable({
              
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
                            var btn = '<div class="btn-group"><button type="button" class="btn btn-success btn-sm">Actions</button><button type="button" class="btn btn-success btn-sm dropdown-toggle" data-toggle="dropdown"><span class="caret"></span></button><ul class="dropdown-menu" role="menu"><li><a href="../faculty/ViewSubject.aspx?subject_id=' + id + '">View</a></li><li><a href="../faculty/EditSubject.aspx?subject_id=' + id + '">Edit / Update</a></li><li><a href="#" data-toggle="modal" data-target="#DeleteSubjectsModal" onclick="DeleteSubjectByIdForButton(' + id + ')">Delete</a></li></ul></div>&nbsp;<strong>&middot;</strong>&nbsp;<div class="btn-group"><button type="button" class="btn btn-primary btn-sm">Questions</button><button type="button" class="btn btn-primary btn-sm dropdown-toggle" data-toggle="dropdown"><span class="caret"></span></button><ul class="dropdown-menu" role="menu"><li><a class="links" href="../faculty/AddQuestions.aspx?subject_id=' + id + '">Add Questions</a></li><li><a href="../faculty/ViewQuestions.aspx?subject_id=' + id + '">View Questions</a></li></ul></div>';
                            return btn;
                        }
                    }
                ],
                 
                dom: 'lBfrtip',
                buttons: [
                    {
                        text: 'Export to CSV',
                        extend: 'csv',
                        className: 'btn btn-default btn-xs',
                        exportOptions: {
                            columns: [1, 2,3,4,5,5]
                        }
                    }
                ]
            });
        }
        
    });
}

//append faculty  name to alert
function fnn(nn) {
    document.getElementById("fns").innerHTML = nn;
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
                        'searchable': true,
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
                    //{
                    //    'data': 'UserName',
                    //    'searchable': true,
                    //    'sortable':false
                    //},
                    //{
                    //    'data': 'EmailId',
                    //    'searchable': true,
                    //    'sortable':false
                    //},
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
                        'render': function (data, type, row, meta) {
                            var id = parseInt(row['FacultyId']);
                            var btn = '<div class="btn-group"><button type="button" class="btn btn-sm btn-success"><i class="fa fa-flash"></i>&nbsp;Actions</button><button type="button" class="btn btn-sm btn-success dropdown-toggle" data-toggle="dropdown"><span class="caret"></span></button><ul class="dropdown-menu" role="menu"><li><a class="links" href="FacultyProfile.aspx?FacultyId=' + id + '&action=view"><i class="fa fa-eye"></i>&nbsp;&nbsp;View</a></li><li onclick="fnn(\'' + row['FullName'] + '\')"><a class="links" href="#" data-toggle="modal" data-target="#DeleteFacultyModel" onclick="DeleteFacultyByIdForButton(' + id + ')"><i class="fa fa-trash-o"></i>&nbsp;&nbsp;Delete</a></li><li><a class="links" href="FacultyProfile.aspx?FacultyId=' + id + '&action=edit"><i class="fa fa-pencil"></i>&nbsp;&nbsp;Edit</a></li></ul></div> ';
                            return btn;
                        }
                    },
                   
                ]
            });
           
            
        }

    });
}

function StudentDatatable() {

    $.ajax({
        url: 'DataTableServices.asmx/GetStudentDetail',
        method: 'POST',
        dataType: 'json',
        success: function (data) {
            $('#DatatableStudents').dataTable({

                //set the "show entries" select list
                "aLengthMenu": [[5, 10, 20, -1], [5, 10, 20, "All"]],
                "iDisplayLength": 5,

                //fetch the data
                data: data,
                //"bAutoWidth": false,
                "aoColumns": [
                    {
                        'data': 'StudentId',
                        'sortable': true,
                        'searcbale': true,
                    },
                    {
                        'data': 'FullName',
                        'sortable': false,
                        'searchable': true,
                    },
                    {
                        'data': 'EnrollmentNo',
                        'sortable': false,
                        'searchable': true,
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
                    //{
                    //    'data': 'UserName',
                    //    'searchable': true,
                    //    'sortable':false
                    //},
                    //{
                    //    'data': 'EmailId',
                    //    'searchable': true,
                    //    'sortable':false
                    //},
                    {
                        'data': 'ContactNo',
                        'searchable': true,
                        'sortable': false
                    },
                     //{
                     //    'data': 'ParentNo',
                     //    'searchable': true,
                     //    'sortable': false
                     //},
                    {
                        'data': 'DeptName',
                        'searchable': true,
                        'sortable': true
                    },
                    {
                        'data': 'SemId',
                        'searchable': true,
                        'sortable': false,
                        'sWidth':'1%'
                    },
                    {
                        'data': 'StudentId',
                        'sortable': false,
                        'searchable': false,
                        'render': function (data, type, row, meta) {
                            var id = parseInt(row['StudentId']);
                            var btn = '<div class="btn-group"><button type="button" class="btn btn-sm btn-success"><i class="fa fa-flash"></i>&nbsp;Actions</button><button type="button" class="btn btn-sm btn-success dropdown-toggle" data-toggle="dropdown"><span class="caret"></span></button><ul class="dropdown-menu" role="menu"><li><a class="links" href="StudentProfile.aspx?StudentId=' + id + '&action=view"><i class="fa fa-eye"></i>&nbsp;&nbsp;View</a></li><li onclick="fnn(\'' + row['FullName'] + '\')"><a class="links" href="#" data-toggle="modal" data-target="#DeleteFacultyModal"><i class="fa fa-trash-o"></i>&nbsp;&nbsp;Delete</a></li><li><a class="links" href="StudentProfile.aspx?StudentId=' + id + '&action=edit"><i class="fa fa-pencil"></i>&nbsp;&nbsp;Edit</a></li></ul></div> ';
                            return btn;
                        }
                    },

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
/*
* Function : Delete the Faculty Registration Request
*
*/
function DeleteFacultyRequest() {
    var faculty_id = parseInt($.trim($("[id*=hf_fact_id]").val()));
    $.ajax({
        type: "POST",
        url: "WebMethods/Faculty.asmx/RemoveFaculty",
        data: '{FacultyId:"' + faculty_id + '"}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (r) {
            $("#RequestDeleteModal").modal("show", { keyboard: true });
            //alert(r);
        },
        error: function (r) {
            alert(r.responseText);
        }
    });
    return false;
}


/*
* Function : Confirms the Student Registration Request
*
*/
function ConfirmStudentRequest() {
    var student_id = parseInt($.trim($("[id*=hf_stud_id]").val()));
    $.ajax({
        type: "POST",
        url: "WebMethods/Student.asmx/ConfirmRequest",
        data: '{UserId:"' + student_id + '"}',
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

//fetch all question in datatbales
function QuestionsByDeptDatatable() {
    var dept_id = parseInt($.trim($("[id*=hf_dept_id]").val()));

    $.ajax({
        type: 'POST',
        url: 'WebMethods/Questions.asmx/FetchAllQuestionsByDepartment',
        data: '{DeptId:"' + dept_id + '"}',
        contentType: "application/json; charset=utf-8",
        dataType: 'json',
        success: function (data) {
            $('#DatatableQuestionsByDept').dataTable({
                //set the "show entries" select list
                "aLengthMenu": [[5, 10, 20, -1], [5, 10, 20, "All"]],
                "iDisplayLength": 5,

                data: data,

                columns: [
                    {
                        'data': 'QuestionId',
                        'sortable': true,
                        'searcbale': true,
                    },
                    {
                        'data': 'DepartmentName',
                        'sortable': true,
                        'searchable': true,
                    },
                    {
                        'data': 'SemId',
                        'sortable': true,
                        'searchable': true,
                    },
                    {
                        'data': 'SubjectName',
                        'sortable': true,
                        'searchable': true,
                    },
                    {
                        'data': 'QuestionType',
                        'sortable': true,
                        'searchable': false,
                    },
                    {
                        'data': 'Question',
                        'sortable': false,
                        'searchable': false,
                    },
                    {
                        'data': 'OptionA',
                        'sortable': false,
                        'searchable': false,
                    },
                    {
                        'data': 'OptionB',
                        'sortable': false,
                        'searchable': false,
                    },

                    {
                        'data': 'OptionC',
                        'sortable': false,
                        'searchable': false,
                    },
                    {
                         'data': 'OptionD',
                         'sortable': false,
                         'searchable': false,
                    },
                    {
                        'data': 'CorrectAns',
                        'sortable': false,
                        'searchable': false,
                    },
                    {
                        'data': 'Marks',
                        'sortable': false,
                        'searchable': false,
                    },
                    //,
                    //{
                    //    'data': 'QuestionId',
                    //    'sortable': false,
                    //    'searchable': false,
                    //    'render': function (data, type, row, meta) {
                    //        var id = parseInt(row['QuestionId']);
                    //        var btn = '<div class="btn-group"><button type="button" class="btn btn-sm btn-success"><i class="fa fa-flash"></i>&nbsp;Actions</button><button type="button" class="btn btn-sm btn-success dropdown-toggle" data-toggle="dropdown"><span class="caret"></span></button><ul class="dropdown-menu" role="menu"><li><a class="links" href="StudentProfile.aspx?StudentId=' + id + '&action=view"><i class="fa fa-eye"></i>&nbsp;&nbsp;View</a></li><li onclick="fnn(\'' + row['FullName'] + '\')"><a class="links" href="#" data-toggle="modal" data-target="#DeleteFacultyModal"><i class="fa fa-trash-o"></i>&nbsp;&nbsp;Delete</a></li><li><a class="links" href="StudentProfile.aspx?StudentId=' + id + '&action=edit"><i class="fa fa-pencil"></i>&nbsp;&nbsp;Edit</a></li></ul></div> ';
                    //        return btn;
                    //    }
                    //}

                ]
            });
        },
        error: function (r) {
            alert(r.responseText);
        }
    });
}

var SubjectIdToDelete;
function DeleteSubjectByIdForButton(subjectId) {
    SubjectIdToDelete = subjectId;
}
function DeleteSubjectBySubjectIdForModal() {
    $.ajax({
        type: "POST",
        url: "WebMethods/Subjects.asmx/RemoveSubject",
        data: '{SubjectId:"' + SubjectIdToDelete + '"}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (r) {
            $.gritter.add({
                // (string | mandatory) the heading of the notification
                title: 'Subject Deleted!',
                // (string | mandatory) the text inside the notification
                text: 'The selected Subject was deleted successfully.',
                // (string | optional) the image to display on the left
                image: '../images/Green _Tick_ 2.png',
                // (bool | optional) if you want it to fade out on its own or just sit there
                sticky: false,
                // (int | optional) the time you want it to be alive for before fading out
                time: 5000,
				// (function | optional) function called after it closes
                    after_open: function(e){
                        location.reload(this);
                    }
            });
            //location.reload(true);
            //$("#DeleteSubjectsModal").modal("show", { keyboard: true });
            //alert(r);
        },
        error: function (r) {
            alert(r.responseText);
        }
    });
    return false;
}


var FacultyToDelete;
function DeleteFacultyByIdForButton(facultyId) {
    FacultyToDelete = facultyId;
}
function DeleteFacultyByFacultyIdForModal() {
    $.ajax({
        type: "POST",
        url: "WebMethods/Faculty.asmx/RemoveFaculty",
        data: '{FacultyId:"' + FacultyToDelete + '"}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (r) {
            $.gritter.add({
                // (string | mandatory) the heading of the notification
                title: 'Faculty Deleted!',
                // (string | mandatory) the text inside the notification
                text: 'The selected Faculty was deleted successfully.',
                // (string | optional) the image to display on the left
                image: '../images/Green _Tick_ 2.png',
                // (bool | optional) if you want it to fade out on its own or just sit there
                sticky: false,
                // (int | optional) the time you want it to be alive for before fading out
                time: 5000,
                // (function | optional) function called after it closes
                after_open: function (e) {
                    location.reload(this);
                }
            });
            //location.reload(true);
            //$("#DeleteSubjectsModal").modal("show", { keyboard: true });
            //alert(r);
        },
        error: function (r) {
            alert(r.responseText);
        }
    });
    return false;
}



//file uplaod validatior 
function ValidateFileTypes(FileType) {
    switch(FileType){
        case 1: //image validation 
            var FileName = document.getElementById("FileUpload");
            var FileNameValue = FileName.value;
            var FileExt = FileNameVale.substring(FileNameValue.lastIndexOf('.') + 1);
            if (FileExt=="jpg"||FileExt=="JPG"||FileExt=="png"||FileExt=="PNG") {

            }
        break;

        case 2: //excel file validatin
            break;
    }
}
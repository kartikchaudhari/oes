﻿<%@ Page Title="Subjects" Language="C#" MasterPageFile="~/admin/FrameContentMaster.Master" AutoEventWireup="true" CodeBehind="Subjects.aspx.cs" Inherits="oes.admin.Subjects" %>
<asp:Content ID="content2" ContentPlaceHolderID="ExternelCss" runat="server">
    <link rel="stylesheet" href="../css/jquery.dataTables.min.css" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="page_contents" runat="server">
    <form id="form1" runat="server">
        <!--breadcrumb start-->
        <div class="row-fluid">
            <ol class="breadcrumb bc-custom">
                <li class="breadcrumb-item"><a class="links" href="DashboardContents.aspx">Dashboard</a></li>
                <li class="breadcrumb-item active">Subjects</li>
            </ol>
        </div>
        <!--breadcrumb end-->

        <button style="float: right; position: relative; margin-top: 14.5px; margin-right: 20px;" onclick="javascript:location.reload(true);">Refresh</button>
        <div class="panel panel-default">
            <div class="panel-heading panel-heading-custom-pages">
                <i class="fa fa-edit fa-1x"></i>&nbsp;&nbsp;<span>Manage Subjects</span>
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                <%if (Request.QueryString.Count > 0)
                  {
                      Response.Write("<div class='alert alert-success alert-dismissable'><a href='#' class='close' data-dismiss='alert' aria-label='close' title='Click to close this Message.'>&times;</a><strong>Congratulations!</strong> Subject added successfully, click <a class='links' href='AddQuestions.aspx?action=add' target='DashboardContentFrame'>here</a> to add Questions to it.</div>");
                  }
                %>
                <!-- Nav tabs -->
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#view" data-toggle="tab">View</a>
                    </li>
                    <li><a href="#add" data-toggle="tab">Add</a>
                    </li>
                </ul>

                <!-- Tab panes -->
                <div class="tab-content" style="padding: 20px;">
                    <div class="tab-pane fade in active" id="view">
                        <h4>View Subjects</h4>
                        <hr />
                        <div class="form-group">
                            <table id="datatable" class="table table-striped table-bordered table-hover">
                            <thead>
                                <tr>
                                    <td align="center"><strong>ID</strong></td>
                                    <td align="center"><strong>Subject Name</strong></td>
                                    <td align="center"><strong>Subject Code</strong></td>
                                    <td align="center"><strong>Department</strong></td>
                                    <td align="center"><strong>Semester</strong></td>
                                    <td align="center"><strong>Total Exams Taken</strong></td>
                                    <td align="center"><strong>Action</strong></td>
                                </tr>
                            </thead>
                           <%-- <tbody>
                            <asp:Repeater ID="SubjectRepeater" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td><%#Eval("subject_id")%></td>
                                        <td><%#Eval("subject_name")%></td>
                                        <td><%#Eval("sub_code")%></td>
                                        <td><%#FetchDeptById(Eval("dept_id").ToString())%></td>
                                        <td><%#Eval("sem_id") %></td>
                                        <td><%#Eval("total_exam_taken") %></td>
                                        <td>
                                            <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="btn btn-primary btn-sm"/>
                                            <asp:Button ID="btnRemove" runat="server" CssClass="btn btn-danger btn-sm" Text="Remove" OnClientClick="return confirm('Do you want to delete this Subject?');"/>
                                            <a class="links" href="AddQuestions.aspx?subject_id=<%#Eval("subject_id")%>" target="DashboardContentFrame"><button class="btn btn-success btn-sm">Add Questions</button></a>
                                            <a class="links" href="ViewQuestions.aspx?subject_id=<%#Eval("subject_id")%>" target="DashboardContentFrame"><button class="btn btn-info btn-sm">View Questions</button></a>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>--%>
                           </table>
                        </div>
                    </div>
                    <div class="tab-pane" id="add">
                        <h4>Add Subject</h4>
                        <hr />
                        <div class="col-md-10">
                            <div class="form-group">
                                <label>Select Department:</label>
                                <asp:DropDownList ID="ddl_dept" runat="server" CssClass="form-control" DataSourceID="SelectDeptDs" DataTextField="dept_name" DataValueField="dept_id">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SelectDeptDs" runat="server" ConnectionString="<%$ ConnectionStrings:ExamDbConString %>" SelectCommand="SELECT [dept_id], [dept_name] FROM [department]"></asp:SqlDataSource>
                            </div>
                            <div class="form-group">
                                <label>Select Semester</label>
                                <asp:DropDownList ID="ddl_sem" runat="server" CssClass="form-control">
                                    <asp:ListItem>1</asp:ListItem>
                                    <asp:ListItem>2</asp:ListItem>
                                    <asp:ListItem>3</asp:ListItem>
                                    <asp:ListItem>4</asp:ListItem>
                                    <asp:ListItem>5</asp:ListItem>
                                    <asp:ListItem>6</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <label>Enter Subject Name:</label>
                                <asp:TextBox ID="tbSubjectName" runat="server" CssClass="form-control" TextMode="SingleLine" required="required"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>Enter Subject Code:</label>
                                <asp:TextBox ID="tbSubjectCode" runat="server" CssClass="form-control" TextMode="Number" required="required"></asp:TextBox>
                            </div>

                            <asp:Button ID="submit_btn" runat="server" Text="Submit" CssClass="btn btn-success" OnClick="submit_btn_Click" />
                            <strong>&nbsp;&middot;&nbsp;</strong>
                            <button id="btnClear" class="btn btn-danger" type="reset">Clear</button>
                            <asp:Label ID="lbl_msg" runat="server" CssClass="lbl_msg"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.panel-body -->
        </div>
    </form>
</asp:Content>
<asp:Content ID="content3" ContentPlaceHolderID="ExternalJs" runat="server">
    <script src="../js/jquery.dataTables.min.js"></script>
    <script type="text/ecmascript">
        $(document).ready(function () {
            $.ajax({
                url: 'DataTableServices.asmx/GetSubjectDetail',
                method: 'POST',
                dataType: 'json',
                success: function (data) {
                    $('#datatable').dataTable({
                        data: data,
                        columns: [
                            { 'data': 'subject_id' },
                            { 'data': 'subject_name' },
                            { 'data': 'subject_code' },
                            { 'data': 'dept_name' },
                            { 'data': 'sem_id' },
                            { 'data': 'total_exam_taken' },
                            {
                                'data': 'subject_id',
                                'render':function(jsonId){
                                    var id = parseInt(jsonId);
                                    var btn = '<a href="ha.aspx?id=' + id + '">View</a>/<a href="ha.aspx">Edit</a>';
                                    return btn;
                                }
                            }
                        ]
                        });
                }
            });
        });
    </script>
</asp:Content>

<%@Page Title="Departments" Language="C#" MasterPageFile="~/admin/FrameContentMaster.Master" AutoEventWireup="true" CodeBehind="Departments.aspx.cs" Inherits="oes.admin.Departments" %>
<asp:Content ID="Content1" ContentPlaceHolderID="page_contents" runat="server">
    <form id="form1" runat="server">
        <!--breadcrumb start-->
        <div class="row-fluid">
            <ol class="breadcrumb bc-custom">
                <li class="breadcrumb-item">
                    <a class="links" href="Dashboard.aspx">Dashboard</a>
                </li>
                <li class="breadcrumb-item active">Departments</li>
            </ol>
        </div>
        <!--breadcrumb end-->
        <button style="float: right; position: relative; margin-top: 14.5px; margin-right: 20px;" onclick="javascript:location.reload(true);">Refresh</button>
        <div class="panel panel-default">
            <div class="panel-heading panel-heading-custom-pages">
                <i class="fa fa-edit fa-1x"></i>&nbsp;&nbsp;<span>Manage Departments</span>
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                <%if (Request.QueryString.Count > 0)
                  {
                      Response.Write("<div class='alert alert-success alert-dismissable'><a href='#' class='close' data-dismiss='alert' aria-label='close' title='Click to close this Message.'>&times;</a><strong>Brilliant!</strong> Department added successfully click <a class='links' href='Subjects.aspx?action=add' target='DashboardContentFrame'>here</a> to add Subjects to it.</div>");
                  }
                %>
                <!-- Nav tabs -->
                <ul class="nav nav-tabs">
                    <li class="active">
                        <a aria-expanded="true" href="#view" data-toggle="tab">View</a>
                    </li>
                    <li>
                        <a aria-expanded="false" href="#add" data-toggle="tab"><i class="fa fa-plus"></i>Add   </a>
                    </li>
                </ul>

                <!-- Tab panes -->
                <div class="tab-content" style="padding: 20px;">
                    <div class="tab-pane fade active in" id="view">
                        <h4>All Departments</h4>
                        <hr />
                        <table class="table table-striped table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th align="center">ID</th>
                                    <th align="center">Name</th>
                                    <th align="center">Code</th>
                                    <th align="center">Total Subjects</th>
                                    <th align="center">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="DeptRepeater" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td><%#Eval("dept_id")%></td>
                                            <td><%#Eval("dept_name")%></td>
                                            <td><%#Eval("dept_code")%></td>
                                            <td><%#Eval("total_subjects")%></td>
                                            <td>
                                                <asp:HiddenField ID="dept_id_hf" runat="server" Value='<%#Eval("dept_id")%>' />
                                                <asp:Button ID="btn_delete" runat="server" CssClass="btn btn-danger btn-sm" Text="Remove" OnClientClick="return confirm('Do you want to delete this Department?');" OnClick="DeleteDept" />
                                                <strong>&middot;</strong>
                                                <button type="button" class="btn btn-success btn-sm" data-toggle="modal" data-target='#EditDeptInfo_<%#Eval("dept_id")%>'>Edit</button>
                                            </td>
                                        </tr>
                                        <!-- Modal -->
                                        <div id="EditDeptInfo_<%#Eval("dept_id")%>" class="modal fade" role="dialog">
                                            <div class="modal-dialog">
                                                <!-- Modal content-->
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                        <h4 class="modal-title">Edit Department Details</h4>
                                                    </div>
                                                    <div class="modal-body">
                                                        <div class="form-group">
                                                            <label>Department Name:</label>
                                                            <asp:TextBox ID="update_dept_name" runat="server" CssClass="form-control" TextMode="SingleLine" Text='<%#Eval("dept_name")%>'></asp:TextBox>
                                                        </div>
                                                        <div class="form-group">
                                                            <label>Department Code:</label>
                                                            <asp:TextBox ID="update_dept_code" runat="server" CssClass="form-control" TextMode="Number" Text='<%#Eval("dept_code")%>'></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                    </div>
                    <div class="tab-pane fade" id="add">
                        <h4>Add a Department</h4>
                        <hr />
                        <div class="col-md-10">
                            <div class="form-group">
                                <label>Department Name:</label>
                                <asp:TextBox ID="dept_name" runat="server" CssClass="form-control" TextMode="SingleLine"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>Department Code:</label>
                                <asp:TextBox ID="dept_code" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                            </div>

                            <asp:Button ID="submit_btn" runat="server" Text="Submit" CssClass="btn btn-success" OnClick="submit_btn_Click" />
                            <asp:Label ID="lbl_msg" runat="server" CssClass="lbl_msg"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.panel-body -->
        </div>
    </form>
</asp:Content>

<%@ Page Title="Departments" Language="C#" MasterPageFile="~/faculty/FrameContentMaster.Master" AutoEventWireup="true" CodeBehind="Departments.aspx.cs" Inherits="oes.faculty.Departments" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ExternelCss" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="page_contents" runat="server">
     <form id="form1" runat="server">
        <!--breadcrumb start-->
        <div class="row-fluid">
            <ol class="breadcrumb bc-custom">
                <li class="breadcrumb-item">
                    <a class="links" href="#">Dashboard</a>
                </li>
                <li class="breadcrumb-item active">Departments</li>
            </ol>
        </div>
        <!--breadcrumb end-->

         <button style="float: right; position: relative; margin-top: 14.5px; margin-right: 20px;" onclick="javascript:location.reload(true);">Refresh</button>
         <div class="panel panel-default">
             <div class="panel-heading panel-heading-custom-pages">
                 <i class="fa fa-edit fa-1x"></i>&nbsp;&nbsp;<span>Departments</span>
             </div>
             <div class="panel-body">
                <!-- Nav tabs -->
                <ul class="nav nav-tabs">
                    <li class="active">
                        <a aria-expanded="true" href="#view" data-toggle="tab">View</a>
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
                                                <button type="button" class="btn btn-success btn-sm" data-toggle="modal" data-target='#EditDeptInfo_<%#Eval("dept_id")%>'>View</button>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
         </div>
         

        </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ExternalJs" runat="server">
</asp:Content>

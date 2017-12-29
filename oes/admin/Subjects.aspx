<%@ Page Title="Subjects" Language="C#" MasterPageFile="~/admin/FrameContentMaster.Master" AutoEventWireup="true" CodeBehind="Subjects.aspx.cs" Inherits="oes.admin.Subjects" %>
<asp:Content ID="Content1" ContentPlaceHolderID="page_contents" runat="server">
    <!--breadcrumb start-->
    <div class="row-fluid">
        <ol class="breadcrumb bc-custom">
            <li class="breadcrumb-item"><a class="links" href="DashboardContents.aspx">Dashboard</a></li>
            <li class="breadcrumb-item active">Subjects</li>
        </ol>
    </div>
    <!--breadcrumb end-->

    <button style="float: right; position: relative; margin-top:14.5px; margin-right: 20px;" onclick="javascript:location.reload(true);">Refresh</button>
    <div class="panel panel-default">
        <div class="panel-heading panel-heading-custom-pages">
            <i class="fa fa-edit fa-1x"></i>&nbsp;&nbsp;<span>Manage Subjects</span>
        </div>
        <!-- /.panel-heading -->
        <div class="panel-body" >
            <!-- Nav tabs -->
            <ul class="nav nav-tabs">
                <li class="active"><a href="#view" data-toggle="tab">View</a>
                </li>
                <li><a href="#add" data-toggle="tab">Add</a>
                </li>
            </ul>

            <!-- Tab panes -->
            <div class="tab-content" style="padding:20px;">
                <div class="tab-pane fade in active" id="view">
                    <h4>View Subjects</h4>
                    <hr />
                </div>
                <div class="tab-pane fade" id="add">
                    <h4>Add Subject</h4>
                    <hr />
                     <div class="table-responsive">
                         <table border="0" class="table">
                             <tr>
                                 <td>Department Name:</td>
                             </tr>
                         </table>
                     </div> 
                </div>
            </div>
        </div>
        <!-- /.panel-body -->
    </div>

</asp:Content>

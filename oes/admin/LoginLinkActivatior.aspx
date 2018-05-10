<%@ Page Title="" Language="C#" MasterPageFile="~/admin/FrameContentMaster.Master" AutoEventWireup="true" CodeBehind="LoginLinkActivatior.aspx.cs" Inherits="oes.LoginLinkActivatior" %>
<asp:Content ID="Content2" ContentPlaceHolderID="page_contents" runat="server">
    <form id="LoginLinkActivatorForm" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <!--breadcrumb start-->
        <div class="row-fluid">
            <ol class="breadcrumb bc-custom">
                <li class="breadcrumb-item">
                    <a class="links" href="Dashboard.aspx">Dashboard</a>
                </li>
                <li class="breadcrumb-item active">Login Link Activator</li>
            </ol>
        </div>
        <!--breadcrumb end-->
        <button style="float: right; position: relative; margin-top: 14.5px; margin-right: 20px;" onclick="javascript:location.reload(true);">Refresh</button>
        <div class="panel panel-default">
            <div class="panel-heading panel-heading-custom-pages"><i class="fa fa-link fa-1x"></i>&nbsp;&nbsp;<span>Login Link Activator</span></div>
            <div class="panel-body">
                <ul class="nav nav-tabs">
                    <li class="active"><a data-toggle="tab" href="#faculty">Faculty</a></li>
                    <li><a data-toggle="tab" href="#student">Student</a></li>
                </ul>
                <div class="tab-content">
                  <div id="faculty" class="tab-pane fade in active">
                    <h3>Faculty</h3>
                      <hr />
                      <div class="col-md-6">
                          <asp:UpdatePanel ID="ForFaculty" runat="server">
                              <ContentTemplate>
                                  <div class="form-group">
                                     <label>Enter Faculty Username:</label>
                                     <asp:TextBox ID="tbUserName" runat="server" TextMode="SingleLine" CssClass="form-control"></asp:TextBox>
                                  </div>
                                  <div class="form-group">
                                    <div class="table-responsive">
                                        <table>
                                            <tr>
                                                <td>
                                                     <asp:Button ID="btnActiveFaculty" runat="server" OnClick="btnActiveFaculty_Click" CssClass="btn btn-success"  Text="Activate This Faculty" />
                                                </td>
                                                <td>&nbsp;&nbsp;&nbsp;<asp:Label ID="lblStatusMessage" runat="server"></asp:Label>&nbsp;</td>
                                                <td>
                                                    <asp:UpdateProgress ID="UpdateProgressForFaculty" runat="server" AssociatedUpdatePanelID="ForFaculty" EnableViewState="true" DisplayAfter="1" >
                                                        <ProgressTemplate>
                                                            <img src="../images/loading.gif" />
                                                        </ProgressTemplate>
                                                    </asp:UpdateProgress>
                                                </td>
                                            </tr>
                                      </table>
                                    </div>
                                  </div>
                              </ContentTemplate>
                              <Triggers>
                                  <asp:AsyncPostBackTrigger ControlID="btnActiveFaculty"/>
                              </Triggers>
                          </asp:UpdatePanel>
                      </div>
                  </div>
                  <div id="student" class="tab-pane fade">
                    <h3>Student</h3>
                    <hr />
                      <div class="col-md-6">
                          <asp:UpdatePanel ID="ForStudent" runat="server">
                              <ContentTemplate>
                                  <div class="form-group">
                                     <label>Enter Student Enrollment No.::</label>
                                     <asp:TextBox ID="tbEnrollmentNo" runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
                                  </div>
                                  <div class="form-group">
                                    <div class="table-responsive">
                                        <table>
                                            <tr>
                                                <td>
                                                     <asp:Button ID="btnActiveStudent" runat="server"  CssClass="btn btn-success"  Text="Activate This Student" OnClick="btnActiveStudent_Click"/>
                                                </td>
                                                <td>&nbsp;&nbsp;&nbsp;<asp:Label ID="LabelMessageStudent" runat="server"></asp:Label>&nbsp;</td>
                                                <td>
                                                    <asp:UpdateProgress ID="UpStudent" runat="server" AssociatedUpdatePanelID="ForStudent" EnableViewState="true" DisplayAfter="1" >
                                                        <ProgressTemplate>
                                                            <img src="../images/loading.gif" />
                                                        </ProgressTemplate>
                                                    </asp:UpdateProgress>
                                                </td>
                                            </tr>
                                      </table>
                                    </div>
                                  </div>
                              </ContentTemplate>
                              <Triggers>
                                  <asp:AsyncPostBackTrigger ControlID="btnActiveStudent"/>
                              </Triggers>
                          </asp:UpdatePanel>
                      </div>
                  </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
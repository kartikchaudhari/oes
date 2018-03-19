<%@ Page Title="Exam Instructions" Language="C#" MasterPageFile="~/student/FrameContentMaster.Master" AutoEventWireup="true" CodeBehind="ExamInstructions.aspx.cs" Inherits="oes.student.ExamInstructions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ExternelCss" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="page_contents" runat="server">
    <form id="ExamInstuctionForm" runat="server">
        <div class="row">
            <div class="col-md-10 col-md-offset-1"  style="padding-top:20px;">
               <div class="panel panel-aqua-one">
                    <div class="panel-heading"><h2 align="center" style="margin:0px;">Instructions</h2></div>
                    <div class="panel-body">
                        <h3 align="center" style="margin-top:0px;margin-bottom:20px;"></h3>
                        <div class="row">
                            <div class="col-md-4"><strong>Total Marks:</strong> <asp:Label ID="lblTotalMarks" runat="server"></asp:Label></div>
                            <div class="col-md-4"><strong>Time :</strong> <asp:Label ID="lblTotalTime" runat="server"></asp:Label> Minute</div>
                            <div class="col-md-4"><strong>Passing Marks :</strong> <asp:Label ID="lblPassingMarks" runat="server"></asp:Label></div>
                        </div>
                        <hr />
                        <h4 align="center">Please read the instructions carefully before you attend the quiz.</h4>
                        <div class="row">
                            <div class="col-md-10 col-md-offset-1" style="border:1px solid red;margin-top:1%;">
                                <ol style="list-style-type: decimal;margin-left:2%;">
                                    <li></li>
                                    <li></li>
                                    <li></li>
                                    <li></li>
                                    <li></li>
                                    <li></li>
                                    <li></li>
                                    <li></li>
                                </ol>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-8 col-md-offset-1">
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" value="1"><strong>I have read and understood the instructions given above.</strong></label>
                                        <br /><br />
                                        <asp:Panel ID="pnlStartExamBtn" runat="server" Visible="true">

                                        </asp:Panel>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ExternalJs" runat="server">
</asp:Content>

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
                            <div class="col-md-10 col-md-offset-1" style="margin-top:1%;">
                                <ol style="list-style-type: decimal;margin-left:2%;">
                                    <li>Total duration of examination is <asp:Label ID="lblExamDuration" Font-Bold="true" runat="server"></asp:Label> minutes.</li>
                                    <li>The countdown timer in the top right corner of screen will display the remaining time available for you to complete the examination. When the timer reaches zero, the examination will end by itself. You will not be required to end or submit your examination.</li>
                                    <li>The Question Palette displayed on the right side of screen will show the status of each question using one of the following symbols:
                                        <table border="0" style="margin-left: 20px; border-collapse: collapse; margin-top: 15px;">
                                             <tr>
                                                <td style="padding:6px;" align="center"><button type="button" class="InstButton">1</button></td>
                                                <td style="padding:6px;">You have not visited the question yet.</td>
                                            </tr>
                                            <tr>
                                                <td style="padding:6px;" align="center"><button type="button" class="InstButton" style="background-color:red;">2</button></td>
                                                <td style="padding:6px;">You have not answered the question.</td>
                                            </tr>
                                            <tr>
                                                <td style="padding:6px;" align="center"><button type="button" class="InstButton" style="background-color:green;">3</button></td>
                                                <td style="padding:6px;">Answered /<strong>Attempted Question.</strong></td>
                                            </tr>
                                            <tr>
                                                <td style="padding:6px;" align="center"><button type="button" class="InstButton" style="background-color:yellow;">4</button></td>
                                                <td style="padding:6px;">You have NOT answered the question, but have marked the question for review.</td>
                                            </tr>
                                        </table>
                                    </li>
                                    <li>All the answered questions will be counted for calculating the final score. </li>
                                    <li>Do not click final <strong>Submit</strong> on the bottom-right corner of each question screen unless you have completed the exam. In case you click final <strong>Submit</strong> you will not be permitted to continue. </li>
                                    <li>Obtained marks will be displayed immediately after the test. </li>
                                </ol>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-8 col-md-offset-1">
                                <div class="checkbox">
                                    <label>
                                        <input id="cbAgreement" type="checkbox" value="1"><strong>I have read and understood the instructions given above.</strong></label>
                                        <br /><br />
                                        <asp:Panel ID="pnlStartExamBtn" runat="server" Visible="true"></asp:Panel>
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
    <script type="text/javascript">
        $(document).ready(function () {
            $('input[type="checkbox"]').click(function () {
                if ($(this).prop("checked") == true) {
                    $("#btnStartExam").removeAttr("disabled");
                }
                else if ($(this).prop("checked") == false) {
                    alert("Please Accept the terms and conditions before start exam.");
                    $("#btnStartExam").attr("disabled", "disabled");
                }
            });
        });
    </script>
</asp:Content>

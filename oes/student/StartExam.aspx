<%@ Page Title="" Language="C#" MasterPageFile="~/student/FrameContentMaster.Master" AutoEventWireup="true" CodeBehind="StartExam.aspx.cs" Inherits="oes.student.StartExam" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ExternelCss" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="page_contents" runat="server">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
       
    <div class="row" ><br /><br />
        <div class="col-md-10 col-md-offset-1">
            <div class="panel panel-primary">
                <div class="panel-body">
                    <table border="1" align="center" width="100%">
		        <tr>
			        <td style="width:830px;padding:10px;">
				         <h3 id="ExamFullName" runat="server"></h3>
			        </td>
			        <td>
                        <div class="media" style="padding:6px;" >
                            <div class="pull-left">
                                <asp:Image ID="StudentImage" runat="server" CssClass="media-object" AlternateText="Profile Image" Height="60" Width="60" />
                            </div>
                            <div class="media-body" style="padding-top:6px;">
                                <h4 class="media-heading"><asp:Label ID="lblStudentFullName" runat="server"></asp:Label></h4>
                                <p><asp:Label ID="StudentDeptName" runat="server"></asp:Label> - <asp:Label ID="StudentSem" runat="server"></asp:Label></p>
                            </div>
                        </div>
			        </td>
		        </tr>
	        </table>
	        <table border="1" align="center" width="100%" style="border-top:1px solid white;">
		        <tr>
			        <td style="height: 7px;padding: 4px;" width="830" colspan="2">
				        <span style="font-size: 20px;"><strong>Question <span id="ShowingQuestionId" runat="server"></span> of <span id="TotalQuestionCount" runat="server"></span></strong></span>
			        </td>
		        </tr>
		        <tr>
			        <td valign="top" style="padding-left:20px;padding-top: 20px;width:830px;">
                        <div class="col-md-offset-1" style="height:300px;overflow:auto;padding-top:40px;" >
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                     
                                    <asp:DetailsView ID="questionDetails" runat="server" 
                                        Width="631px" AutoGenerateRows="False" CellPadding="4"
                                         ForeColor="#333333" GridLines="None" DataKeyNames="q_id,QPaperId"
                                         DataSourceID="SqlDataSourceQuestionPaper" 
                                        BorderColor="#9999FF" BorderStyle="Solid" BorderWidth="4px" OnDataBound="FillHiddenField">
                            <RowStyle BackColor="#EFF3FB"/>
                            <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" CssClass="boldtext" Width="100px" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <Fields>
                                <asp:BoundField DataField="question" HeaderText="Question" SortExpression="question" HtmlEncode="False" HtmlEncodeFormatString="False">
                                    <HeaderStyle CssClass="iteamStyleDetailsView borderRight" HorizontalAlign="Right" />
                                    <ItemStyle CssClass="iteamStyleDetailsView" Height="50" HorizontalAlign="Left" BackColor="#DEE8F5" />
                                </asp:BoundField>
                                
                                <asp:BoundField DataField="opt_a" HeaderText="A." SortExpression="opt_a" >
                                    <HeaderStyle CssClass="iteamStyleDetailsView borderTop  borderRight" HorizontalAlign="Right" />
                                    <ItemStyle CssClass="iteamStyleDetailsView borderTop" VerticalAlign="Middle" /> 
                                </asp:BoundField>
                                
                                <asp:BoundField DataField="opt_b" HeaderText="B." SortExpression="opt_b" >
                                    <HeaderStyle  CssClass="iteamStyleDetailsView  borderRight" HorizontalAlign="Right" />
                                    <ItemStyle CssClass="iteamStyleDetailsView" VerticalAlign="Middle" />
                                </asp:BoundField>

                                <asp:BoundField DataField="opt_c" HeaderText="C." SortExpression="opt_c" >
                                    <HeaderStyle  CssClass="iteamStyleDetailsView  borderRight" HorizontalAlign="Right" />
                                    <ItemStyle CssClass="iteamStyleDetailsView" VerticalAlign="Middle" />
                                </asp:BoundField>

                                <asp:BoundField DataField="opt_d" HeaderText="D." SortExpression="opt_d" >
                                    <HeaderStyle  CssClass="iteamStyleDetailsView  borderRight" HorizontalAlign="Right" />
                                    <ItemStyle CssClass="iteamStyleDetailsView" VerticalAlign="Middle" />
                                </asp:BoundField>
                            </Fields>
                        </asp:DetailsView>
                                    <asp:HiddenField ID="HfQuestionId" runat="server" />
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="SaveNext" />
                                    <asp:AsyncPostBackTrigger ControlID="btnReview" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </div>
                        <br />
                        <div style="border:1px solid #faebcc;border-radius:6px; margin-bottom:2%;direction:ltr;padding:6px;margin-right:3%;background-color: #fcf8e3;">
                            <table>
                                <tr>
                                    <td><strong>Select Answer :-</strong></td>
                                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                    <td>
                                        <%--<asp:RadioButtonList ID="ansRadioBtnList" runat="server" RepeatDirection="Horizontal" ClientIDMode="Static" CellPadding="20" CellSpacing="20" Width="400px" >
                                            <asp:ListItem Value="1" Text="A">A</asp:ListItem>
                                            <asp:ListItem Value="2" Text="B">B</asp:ListItem>
                                            <asp:ListItem Value="3" Text="C">C</asp:ListItem>
                                            <asp:ListItem Value="4" Text="D">D</asp:ListItem>
                                        </asp:RadioButtonList>--%>
                                        <asp:DropDownList ID="ddlAnswer" runat="server">
                                            <asp:ListItem Value="NA" Text="---- Select Answer ----"></asp:ListItem>
                                            <asp:ListItem Value="1">Answer 1</asp:ListItem>
                                            <asp:ListItem Value="2">Answer 2</asp:ListItem>
                                            <asp:ListItem Value="3">Answer 3</asp:ListItem>
                                            <asp:ListItem Value="4">Answer 4</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvUserAnserDdl" runat="server" ErrorMessage="Plese Select Your answer.." ControlToValidate="ddlAnswer" InitialValue="NA"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </div>
			        </td>
			        <td style="padding: 14px;" align="center" valign="top" >
                        <table border="1" style="position:relative;width:230px;">
                            <tr>
                                <td style="padding:6px;" align="center" colspan="2"><strong>Time Left</strong></td>
                                
                            </tr>
                            <tr>
                                <td style="padding:6px;" align="center" colspan="2">
                                     time :<span id="countDown"></span>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding:6px;" align="center" colspan="2"><strong>Choose a Question</strong></td>
                            </tr>
                            <tr>
                                <td style="padding:6px;" align="center" colspan="2">
                                     <asp:Panel ID="btnPanel" runat="server"></asp:Panel>
                                </td>
                            </tr>
                            <tr><td style="padding:6px;" colspan="2" class="blank"></td></tr>
                            <tr><td style="padding:6px;border-top:1px solid white;" colspan="2" class="blank" ></td></tr>
                            <tr>
                                <td style="padding:6px;" align="center" colspan="2"><strong>Indicators</strong></td>
                            </tr>
                            <tr>
                                <td style="padding:6px;" align="center"><button type="button" class="InstButton">1</button><br />No visited</td>
                                <td style="padding:6px;" align="center"><button type="button" class="InstButton" style="background-color:red;">2</button><br />Not Answered</td>
                            </tr>
                             <tr>
                                 <td style="padding:6px;" align="center"><button type="button" class="InstButton" style="background-color:green;">3</button><br />Answered</td>
                                 <td style="padding:6px;" align="center"><button type="button" class="InstButton" style="background-color:yellow;">4</button><br /> Marked for Review</td>
                             </tr>
                            
                        </table>
			        </td>
		        </tr>
                <tr>
                    <td align="center" colspan="2">
                     <div class="row">
                         <div class="col-md-3"> <button type="reset">Clear Response</button></div>
                         <div class="col-md-3"><asp:Button ID="btnReview" runat="server" Text="Make for Review Next" OnClick="btnReview_Click" /></div>
                         <div class="col-md-3"><asp:Button id="SaveNext" runat="server" Text="Save &amp; Next"  OnClick="SaveNext_Click" /></div>
                         <div class="col-md-3"><button>Submit</button></div>
                     </div>
                    </td>
                 </tr>
            </table>
         </div>
        </div>
       </div>
      </div>
        <asp:SqlDataSource ID="SqlDataSourceQuestionPaper" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ExamDbConString %>" 
            SelectCommand="SELECT questions.q_id, questions.dept_id, questions.sem_id, questions.subject_id, questions.question_type, questions.question, questions.opt_a, questions.opt_b, questions.opt_c, questions.opt_d, questions.correct_ans, questions.marks, QuestionPaper.QPaperId, QuestionPaper.QId, QuestionPaper.exam_id FROM questions INNER JOIN QuestionPaper ON questions.q_id = QuestionPaper.QId WHERE (QuestionPaper.exam_id = @ExamId)">
            <SelectParameters>
                <asp:SessionParameter Name="ExamId" SessionField="ExamId" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <script>
            function Timer() {
                var timeout = '<%= Session.Timeout * 60 * 1000 %>';
                 var timer = setInterval(function () {
                timeout -= 1000;
                document.getElementById('countDown').innerHTML = time(timeout);
                if (timeout == 0) {
                    clearInterval(timer);
                    alert('Times up PAL!');
                    window.location.href = 'Logout.aspx';
                }
            }, 1000);
            function two(x) { return ((x > 9) ? "" : "0") + x }
            function time(ms) {
                var t = '';
                var sec = Math.floor(ms / 1000);
                ms = ms % 1000


                var min = Math.floor(sec / 60);
                sec = sec % 60;
                t = two(sec);


                var hr = Math.floor(min / 60);
                min = min % 60;
                t = two(min) + ":" + t;


                return t;
            }
        }
            Timer();

            function MarkForReview() {
                var QuestionId = document.getElementById('HfQuestionId').value;
                document.getElementById(QuestionId).setAttribute("style", "background-color:yellow;");
                
            }

            function MarkForAnswered() {
                var QuestionId = document.getElementById('HfQuestionId').value;
                document.getElementById(QuestionId).setAttribute("style", "background-color:green;");

            }
   </script>
    </form>
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ExternalJs" runat="server">
   
</asp:Content>

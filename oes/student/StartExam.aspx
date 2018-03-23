<%@ Page Title="" Language="C#" MasterPageFile="~/student/FrameContentMaster.Master" AutoEventWireup="true" CodeBehind="StartExam.aspx.cs" Inherits="oes.student.StartExam" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ExternelCss" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="page_contents" runat="server">
    <form id="form1" runat="server">
	<style type="text/css">
		.qbtn{
			text-align: center;
			border:1px solid grey;
			border-radius: 3px;
			cursor:pointer;
			margin-top: 5px;
			width: 35px;
			height: 25px;
		}
		.q{
			font-size: 18px;
			font-weight: bold;
		}

		label{
			font-weight: bold;
		}
	</style>
    <div class="row"><br /><br />
        <div class="col-md-10 col-md-offset-1">
            <div class="panel panel-primary">
                <div class="panel-body">
                    <table border="1" align="center" width="100%">
		        <tr>
			        <td style="width:830px;padding:10px;">
				         <h3>MID-2 SEM EXAM-SEPTEEMBER-2017 DWPD COMPUTER-SEM-5</h3>
			        </td>
			        <td>
                        <div class="media" style="padding:6px;" >
                            <div class="pull-left">
                                <img class="media-object" src="../images/149071.png" alt="profile-image" height="60" width="60">
                            </div>
                            <div class="media-body" style="padding-top:6px;">
                                <h4 class="media-heading">Kartik Chaudahri</h4>
                                <p>Computer Engineering - 5</p>
                            </div>
                        </div>
			        </td>
		        </tr>
	        </table>
	        <table border="1" align="center" width="100%" style="border-top:1px solid white;">
		        <tr>
			        <td style="height: 7px;padding: 4px;" width="830">
				        <span style="font-size: 20px;"><strong>Question 14 of 200</strong></span>
			        </td>
			        <td style="padding: 10px;" align="center">
				        <span style="font-size: 20px;">Question Pellet</span>
			        </td>
		        </tr>
		        <tr>
			        <td valign="top" style="padding-left:20px;padding-top: 20px;">
                        <div class="col-md-offset-1" style="height:300px;overflow:auto;padding-top:40px;" >
                            <asp:DetailsView ID="questionDetails" runat="server" Width="631px" AutoGenerateRows="False" CellPadding="4" ForeColor="#333333" GridLines="None" DataKeyNames="q_id,QPaperId" DataSourceID="SqlDataSourceQuestionPaper" BorderColor="#9999FF" BorderStyle="Solid" BorderWidth="4px">
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
                        </div>
                        <br />
                        <div style="border:1px solid #faebcc;border-radius:6px; margin-bottom:2%;direction:ltr;padding:6px;margin-right:3%;background-color: #fcf8e3;">
                            <table>
                                <tr>
                                    <td><strong>Select Answer :-</strong></td>
                                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                    <td>
                                        <asp:RadioButtonList ID="ansRadioBtnList" runat="server" RepeatDirection="Horizontal" ClientIDMode="Static" CellPadding="20" CellSpacing="20" Width="400px" >
                                            <asp:ListItem Value="1" Text="A">A</asp:ListItem>
                                            <asp:ListItem Value="2" Text="B">B</asp:ListItem>
                                            <asp:ListItem Value="3" Text="C">C</asp:ListItem>
                                            <asp:ListItem Value="4" Text="D">D</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                            </table>
                        </div>
			        </td>
			        <td style="padding: 10px;" align="center">
				        <button class='qbtn'>1</button>&nbsp;&nbsp;<button class='qbtn'>2</button>&nbsp;&nbsp;
                        <button class='qbtn'>3</button>&nbsp;&nbsp;<button class='qbtn'>4</button>&nbsp;&nbsp;
                        <button class='qbtn'>5</button>&nbsp;&nbsp;<button class='qbtn'>6</button>&nbsp;&nbsp;
                        <button class='qbtn'>7</button>&nbsp;&nbsp;<button class='qbtn'>8</button>&nbsp;&nbsp;
                        <button class='qbtn'>9</button>&nbsp;&nbsp;<button class='qbtn'>10</button>&nbsp;&nbsp;
                        <button class='qbtn'>11</button>&nbsp;&nbsp;<button class='qbtn'>12</button>&nbsp;&nbsp;
                        <button class='qbtn'>13</button>&nbsp;&nbsp;<button class='qbtn'>14</button>&nbsp;&nbsp;
                        <button class='qbtn'>15</button>&nbsp;&nbsp;<button class='qbtn'>16</button>&nbsp;&nbsp;
                        <button class='qbtn'>17</button>&nbsp;&nbsp;<button class='qbtn'>18</button>&nbsp;&nbsp;
                        <button class='qbtn'>19</button>&nbsp;&nbsp;<button class='qbtn'>20</button>&nbsp;&nbsp;
                        <button class='qbtn'>21</button>&nbsp;&nbsp;<button class='qbtn'>22</button>&nbsp;&nbsp;
                        <button class='qbtn'>23</button>&nbsp;&nbsp;<button class='qbtn'>24</button>&nbsp;&nbsp;
                        <button class='qbtn'>25</button>&nbsp;&nbsp;<button class='qbtn'>26</button>&nbsp;&nbsp;
                        <button class='qbtn'>27</button>&nbsp;&nbsp;<button class='qbtn'>28</button>&nbsp;&nbsp;
                        <button class='qbtn'>29</button>&nbsp;&nbsp;<button class='qbtn'>30</button>&nbsp;&nbsp;
			        </td>
		        </tr>
	        </table>
            <table border="1" align="center" width="100%">
                <tr>
                    <td align="center">
                      <button type="reset">Clear Response</button>
                    </td>
                    <td align="center">
                      <button>Make for Review Next</button>
                    </td>
                    <td align="center">
                       <button>Save &amp; Next</button>
                    </td>
                    <td align="center">
                       <button>Submit</button>
                    </td>
                 </tr>
               </table>
         </div>
        </div>
       </div>
      </div>
	

          
            <asp:SqlDataSource ID="SqlDataSourceQuestionPaper" runat="server" ConnectionString="<%$ ConnectionStrings:ExamDbConString %>" SelectCommand="FetchQuestionsToQuestionPaper" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="0" Name="ExamId" SessionField="ExamId" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
      
        <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
        <%-- <asp:Button ID="btn" runat="server" CommandArgument="1" OnCommand="btnReurnId" Text="Click Me" />
        <asp:Panel ID="btnPanel" runat="server" BorderWidth="1" BorderStyle="Solid" BorderColor="red" ></asp:Panel>--%>
        
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ExternalJs" runat="server">
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/faculty/FrameContentMaster.Master" AutoEventWireup="true" CodeBehind="AddQuestionToExam.aspx.cs" Inherits="oes.faculty.AddQuestionToExam" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ExternelCss" runat="server">
    <link rel="stylesheet" href="../css/gridview.css" />
    <link rel="stylesheet" href="../css/jquery.gritter.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="page_contents" runat="server">
    <form id="CreateQuestionPaperForm" runat="server">
    <asp:HiddenField ID="hf_dept_id" runat="server" /><asp:HiddenField ID="hf_sem_id" runat="server" /><asp:HiddenField ID="hf_subject_id" runat="server" />
    <!--breadcrumb start-->
    <div class="row-fluid">
        <ol class="breadcrumb bc-custom">
            <li class="breadcrumb-item">
                <a class="links" href="#">Dashboard</a>
            </li>
            <li class="breadcrumb-item"><a class="links" href="#">Exams</a></li>
            <li class="breadcrumb-item"><a class="links" href="#">Manage Exams</a></li>
            <li class="breadcrumb-item active">Create Question Paper</li>
        </ol>
    </div>
    <!--breadcrumb end-->
    <button class="btn btn-primary btn-sm" style="float: right; position: relative; margin-top: 7px; margin-right: 20px;" onclick="javascript:location.reload(true);">Refresh</button>
    <div class="panel panel-default" onload="AdjustImgSize();">
        <div class="panel-heading" style="text-align:center;"><span style="font-size:16px;font-weight:bold;">Add Questions To Exam</span></div>
        <div class="panel-body">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <!-- question counter panel -->
                    <div class="row row-detail-container">
                        <strong>No. of Question Added :</strong>
                        <span><asp:Label ID="lblNoOfQAdded" runat="server"></asp:Label></span>&nbsp;&nbsp;&nbsp;
                        <strong>|</strong>
                    </div>
                    <br />
                    <!-- question list grid view -->
                    <asp:GridView ID="CreateQPapperQListGridView" runat="server"
                        AllowPaging="True" AutoGenerateColumns="False" DataSourceID="ObjectDataSourceCreateQPaperQList"
                        PageSize="5" CssClass="table table-bordered table-striped" AllowSorting="True" DataKeyNames="QuestionId">
                        <Columns>
                            <asp:TemplateField HeaderText="Question ID" SortExpression="q_id">
                                <ItemTemplate>
                                    <asp:Label ID="lblQId" runat="server" Text='<%# Bind("QuestionId") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="SemId" HeaderText="Semester" SortExpression="sem_id" />
                            <asp:BoundField DataField="SubjectName" HeaderText="Subject" />
                            <asp:BoundField DataField="QuestionType" HeaderText="Question Type" SortExpression="question_type" />
                            <asp:BoundField DataField="Question" HeaderText="Question" HtmlEncode="False" HtmlEncodeFormatString="False"></asp:BoundField>
                            <asp:BoundField DataField="OptionA" HeaderText="Option A" />
                            <asp:BoundField DataField="OptionB" HeaderText="Option B" />
                            <asp:BoundField DataField="OptionC" HeaderText="Option C" />
                            <asp:BoundField DataField="OptionD" HeaderText="Option D" />
                            <asp:BoundField DataField="CorrectAns" HeaderText="Correct Answer" />
                            <asp:BoundField DataField="Marks" HeaderText="Marks" />
                            <asp:TemplateField HeaderText="Actions">
                                <ItemTemplate>
                                    <asp:Button ID="btnAddQuestion" runat="server" CssClass="btn btn-success btn-sm" Text="Add" OnClick="btnAddQuestion_Click"  UseSubmitBehavior="False"/>
                                    <asp:Button ID="btnRemoveQuestion" runat="server" CssClass="btn btn-danger btn-sm" Text="Remove" UseSubmitBehavior="false" OnClick="btnRemoveQuestion_Click" />
                                </ItemTemplate>
                            </asp:TemplateField>
                    
                        </Columns>
                        <PagerStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="pagination-ys" />
                    </asp:GridView>
                    <asp:ObjectDataSource ID="ObjectDataSourceCreateQPaperQList" runat="server" SelectMethod="GetAllQuestionsBySemIdAndDeptIdAndSubId" SortParameterName="sortColumn"  TypeName="oes.faculty.Class.QuestionDataAccessLayer">
                        <SelectParameters>
                            
                            <asp:ControlParameter ControlID="hf_subject_id" Name="SubId" PropertyName="Value" Type="String" />
                            <asp:ControlParameter ControlID="hf_sem_id" Name="SemId" PropertyName="Value" Type="String" />
                            <asp:ControlParameter ControlID="hf_dept_id" Name="DeptId" PropertyName="Value" Type="String" />
                            <asp:Parameter Name="sortColumn" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </ContentTemplate>
            </asp:UpdatePanel>
            
        </div>
    </div>
</form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ExternalJs" runat="server">
    <script type="text/javascript" src="../js/jquery.gritter.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('img').load(function () {
                $('img').addClass("GvQImg2");
            }).removeAttr('width').removeAttr('height');
        });

        function AdjustImgSize() {
            $('img').load(function () {
                $('img').addClass("GvQImg2");
            }).removeAttr('width').removeAttr('height');
        }
        function AlertSuccess() {
            $.gritter.add({
                // (string | mandatory) the heading of the notification
                title: 'Question Added!',
                // (string | mandatory) the text inside the notification
                text: 'The Selected Question is added to Question Paper.',
                // (string | optional) the image to display on the left
                image: '../images/Green _Tick_ 2.png',
                // (bool | optional) if you want it to fade out on its own or just sit there
                sticky: false,
                // (int | optional) the time you want it to be alive for before fading out
                time: 5000
                    });
        }

        function AlertQDeleted() {
            $.gritter.add({
                // (string | mandatory) the heading of the notification
                title: 'Question Deleted!',
                // (string | mandatory) the text inside the notification
                text: 'The Selected Question is Deletd Successfully.',
                // (string | optional) the image to display on the left
                image: '../images/Green _Tick_ 2.png',
                // (bool | optional) if you want it to fade out on its own or just sit there
                sticky: false,
                // (int | optional) the time you want it to be alive for before fading out
                time: 5000
            });
        }

        
    </script>
</asp:Content>

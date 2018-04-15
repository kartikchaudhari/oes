<%@ Page Title="Manage Questions" Language="C#" MasterPageFile="~/faculty/FrameContentMaster.Master" AutoEventWireup="true" CodeBehind="ManageQuestions.aspx.cs" Inherits="oes.faculty.ManageQuestions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ExternelCss" runat="server">
    <link rel="stylesheet" href="../css/jquery.dataTables.min.css" />
    <link rel="stylesheet" href="../css/buttons.dataTables.min.css" />
    <link rel="stylesheet" href="../css/gridview.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="page_contents" runat="server">
    
    <form id="ManagqQuestionsForm" runat="server">
        <!--breadcrumb start-->
        <div class="row-fluid">
            <ol class="breadcrumb bc-custom">
                <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
                <li class="breadcrumb-item"> <a href="#">Questions</a></li>
                <li class="breadcrumb-item">Manage Questions</li>
            </ol>
        </div>
        <!--breadcrumb end-->
        <button class="btn btn-primary btn-sm" style="float: right; position: relative; margin-top:14.5px; margin-right: 20px;" onclick="javascript:location.reload(true);">Refresh</button>
         <div class="panel panel-default">
            <div class="panel-heading panel-heading-custom-pages">
                <i class="fa fa-question-circle fa-1x"></i>&nbsp;&nbsp;<span>Manage Questions</span>
            </div>
            <!-- /.panel-heading -->
             <div class="panel-body">
                <!-- Nav tabs -->
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#view_questions" data-toggle="tab">View Questions</a></li>
                </ul>

                <!-- Tab panes -->
                <div class="tab-content" style="padding:10px;">
                    <asp:HiddenField ID="hf_dept_id" runat="server" />
                    <!-- view all questions start-->
                    <div class="tab-pane fade in active" id="view_questions">
                        <div class="row">
                            <div class="table-responsive" style="padding: 1%;">
                                        <br />
                                        <asp:GridView ID="GridViewQuestionList" runat="server"
                                            AllowPaging="True" AutoGenerateColumns="False" 
                                            DataSourceID="ObjectDataSourceQuestionList"
                                            PageSize="5" CssClass="table table-bordered table-striped"
                                             AllowSorting="True" DataKeyNames="QuestionId" EnableViewState="False">
                                            <Columns>
                                                
                                                <%--<asp:TemplateField>
                                                    <HeaderTemplate>
                                                        <asp:CheckBox ID="cbDeleteHeader" onclick="toggleSelectionUsingHeaderCheckBox(this);"  runat="server" />
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="cbDelete" onclick="toggleSelectionOfHeaderCheckBox();" runat="server" OnCheckedChanged="cbDelete_CheckedChanged" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>--%>
                                                <asp:TemplateField HeaderText="Question ID" SortExpression="q_id">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblQId" runat="server" Text='<%# Bind("QuestionId") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="DepartmentName" HeaderText="Department"/>
                                                <asp:BoundField DataField="SemId" HeaderText="Semester" SortExpression="sem_id" />
                                                <asp:BoundField DataField="SubjectName" HeaderText="Subject"/>
                                                <asp:BoundField DataField="QuestionType" HeaderText="Question Type" SortExpression="question_type" />
                                                <asp:BoundField DataField="Question" HeaderText="Question" HtmlEncode="False" HtmlEncodeFormatString="False">
                                                
                                                </asp:BoundField>
                                                <asp:BoundField DataField="OptionA" HeaderText="Option A">
                                                <ItemStyle Width="40px" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="OptionB" HeaderText="Option B">
                                                <ItemStyle Width="40px" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="OptionC" HeaderText="Option C">
                                                <ItemStyle Width="40px" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="OptionD" HeaderText="Option D">
                                                <ItemStyle Width="40px" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="CorrectAns" HeaderText="Correct Answer"/>
                                                <asp:BoundField DataField="Marks" HeaderText="Marks"/>
                                                <asp:CommandField ShowDeleteButton="True" ControlStyle-CssClass="btn btn-sm btn-danger">
<ControlStyle CssClass="btn btn-sm btn-danger"></ControlStyle>
                                                </asp:CommandField>
                                                <asp:CommandField ShowEditButton="true" ControlStyle-CssClass="btn btn-sm  btn-success" >
<ControlStyle CssClass="btn btn-sm  btn-success"></ControlStyle>
                                                </asp:CommandField>
                                            </Columns>
                                            <PagerStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="pagination-ys" />
                                        </asp:GridView>
                                        <asp:Label ID="lblMsg" runat="server"></asp:Label>
                                        <br />
                                        <asp:ObjectDataSource ID="ObjectDataSourceQuestionList" runat="server" SelectMethod="GetAllQuestionsByDeptId" SortParameterName="sortColumn" TypeName="oes.faculty.Class.QuestionDataAccessLayer" DeleteMethod="DeleteQuestion">
                                            <DeleteParameters>
                                                <asp:Parameter Name="QuestionId" Type="Int32" />
                                            </DeleteParameters>
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="hf_dept_id" Name="DeptId" PropertyName="Value" Type="Int32" />
                                                <asp:Parameter Name="sortColumn" Type="String" />
                                            </SelectParameters>
                                        </asp:ObjectDataSource>
                                    </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.panel-body -->
        </div>

    </form>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ExternalJs" runat="server">
    <script type="text/javascript">
        function toggleSelectionUsingHeaderCheckBox(source) {
            $("#GridViewQuestionList input[name$='cbDelete']").each(function () {
                $(this).attr('checked', source.checked);
            });
        }

        function toggleSelectionOfHeaderCheckBox() {
            if ($("#GridViewQuestionList input[name$='cbDelete']").length == $("#GridViewQuestionList input[name$='cbDelete']:checked").length) {
                $("#GridViewQuestionList input[name$='cbDeleteHeader']").first().attr('checked', true);
            } else {
                $("#GridViewQuestionList input[name$='cbDeleteHeader']").first().attr('checked', false);
            }
        }

        $(document).ready(function () {
            $('#btnDelete').click(function () {
                var rowSelected = $("#GridViewQuestionList input[name$='cbDelete']:checked").length;
                if (rowSelected == 0) {
                    alert("No row selected");
                    return false;
                }
                else {
                    return confirm(rowSelected + " row(s) will be deleted");
                }
            });
            $('img').load(function () {
                $('img').addClass("GvQImg");
            }).removeAttr('width').removeAttr('height');
        });

    </script>
</asp:Content>

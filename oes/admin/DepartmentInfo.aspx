<%@ Page Title="" Language="C#" MasterPageFile="~/admin/FrameContentMaster.Master" AutoEventWireup="true" CodeBehind="DepartmentInfo.aspx.cs" Inherits="oes.admin.DepartmentInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ExternelCss" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="page_contents" runat="server">
    <form id="frm" runat="server">
    <table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            Country:
            <asp:DropDownList ID="ddlSem" runat="server">
                <asp:ListItem Text="1" Value="1" />
                <asp:ListItem Text="1" Value="2" />
                <asp:ListItem Text="1" Value="3" />
                <asp:ListItem Text="1" Value="4" />
                <asp:ListItem Text="1" Value="5" />
                <asp:ListItem Text="1" Value="6" />
            </asp:DropDownList>
         
            <asp:RadioButtonList ID="rblChartType" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem Text="Pie" Value="1" Selected="True" />
                <asp:ListItem Text="Doughnut" Value="2" />
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
        <td>
            <div id="dvChart">
            </div>
        </td>
        <td>
            <div id="dvLegend">
            </div>
        </td>
    </tr>
</table>
        </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ExternalJs" runat="server">
    <script src="../js/excanvas.js"></script>
    <script src="../js/Chart.js"></script>
     <script type="text/javascript">
         $(function () {
             LoadChart();
             $("[id*=ddlCountries]").bind("change", function () {
                 LoadChart();
             });
             $("[id*=rblChartType] input").bind("click", function () {
                 LoadChart();
             });
         });
         function LoadChart() {
             var chartType = parseInt($("[id*=rblChartType] input:checked").val());
             $.ajax({
                 type: "POST",
                 url: "WebMethods/DeptInfoCharts.asmx/GetChart",
                 data: "{semid: '" + $("[id*=ddlSem]").val() + "'}",
                 contentType: "application/json; charset=utf-8",
                 dataType: "json",
                 success: function (r) {
                     $("#dvChart").html("");
                     $("#dvLegend").html("");
                     var data = eval(r.d);
                     var el = document.createElement('canvas');
                     $("#dvChart")[0].appendChild(el);

                     //Fix for IE 8
                     if ($.browser.msie && $.browser.version == "8.0") {
                         G_vmlCanvasManager.initElement(el);
                     }
                     var ctx = el.getContext('2d');
                     var userStrengthsChart;
                     switch (chartType) {
                         case 1:
                             userStrengthsChart = new Chart(ctx).Pie(data);
                             break;
                         case 2:
                             userStrengthsChart = new Chart(ctx).Doughnut(data);
                             break;
                     }
                     for (var i = 0; i < data.length; i++) {
                         var div = $("<div />");
                         div.css("margin-bottom", "10px");
                         div.html("<span style = 'display:inline-block;height:10px;width:10px;background-color:" + data[i].color + "'></span> " + data[i].text);
                         $("#dvLegend").append(div);
                     }
                 },
                 failure: function (response) {
                     alert('There was an error.');
                 }
             });
         }
</script>
</asp:Content>

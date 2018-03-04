<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Countdown.aspx.cs" Inherits="oes.student.Countdown" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <input type="text" size="8" id="counter" style=”text-align:center;font-size:x-large;font-weight:bold;color:Red;” />
        <br />
        <br />

        <asp:HiddenField ID="HidH" runat="server" Value="0" />
        <asp:HiddenField ID="HidM" runat="server" Value="1" />
        <asp:HiddenField ID="HidS" runat="server" Value="00" />
        <input type="hidden"    id="HidHours" value="<%=HidH.Value%>"/>
        <input type="hidden"  id="HidMinutes" value="<%=HidM.Value%>"/>
        <input type="hidden"  id="HidSeconds" value="<%=HidS.Value%>"/>
    </div>
        
        <script>

            var hours=document.getElementById("HidHours").value;

            var minutes=document.getElementById("HidMinutes").value;

            var seconds=document.getElementById("HidSeconds").value;

            function

            display()

            {

                if (seconds<=0)

                {

                    if ((hours==0)&&(minutes==0))

                        seconds=0;

                    else

                    {

                        seconds=60;

                        minutes-=1;

                    }

                }

                if (minutes<=0)

                {

                    if ((hours<0)&&(minutes<0))

                    {

                        hours = minutes = seconds = 0;

                    }

                    else

                    {

                        if ((hours==0)&&(minutes==0))

                            hours=minutes=0;

                        if ((hours>0)&&(minutes<0))

                        {

                            minutes=59;

                            hours-=1;

                        }

                    }

                }

                if ((minutes<=-1)||(hours<=-1))

                {

                    if (hours<=-1)

                    {

                        minutes=0;

                        hours+=1;

                    }

                    else

                        minutes-=1;

                    seconds=0;

                    minutes+=1;

                }

                else

                    if (seconds>0)

                        seconds-=1;

                if (seconds <= 9 && seconds.toString().length < 2)
                    seconds = "0"+seconds;

                if (minutes <= 9 && minutes.toString().length < 2)
                    minutes = "0"+minutes;

                if (hours <= 9  && hours.toString().length < 2)
                    hours = "0"+hours;

                document.getElementById('counter').value=hours+":"+minutes+":"+seconds;

                setTimeout("display()", 1000);
                if (hours == 0 && minutes == 0 && seconds == 0) {
                    alert("Time out");
                   
                    
                }

            }

            display();

        </script>
    </form>
</body>
</html>

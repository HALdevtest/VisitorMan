<%@ Page Title="Check" Language="C#" AutoEventWireup="true" CodeBehind="Check.aspx.cs" Inherits="VisitorMan.Check" %>
<?xml version="1.0" encoding="utf-8" ?>
<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <title></title>
    <script src="Scripts/jquery-1.11.1.js" type="text/javascript"></script>
    <script src="Scripts/jquery-1.11.1.min.js" type="text/javascript"></script>
    <script src="Scripts/jquery.dynDateTime.min.js" type="text/javascript"></script>
    <script src="Scripts/calendar-en.min.js" type="text/javascript"></script>
    <link href="Content/calendar-blue.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        $(document).ready(function () {
            $("#<%=txtDate.ClientID %>").dynDateTime({
                showsTime: true,
                ifFormat: "%d/%m/%Y",
                daFormat: "%l;%M %p, %e %m, %Y",
                align: "BR",
                electric: false,
                singleClick: false,
                displayArea: ".siblings('.dtcDisplayArea')",
                button: ".next()"
            });
        });
    </script>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js" type="text/javascript"></script>
    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/themes/south-street/jquery-ui.css" type="text/css" rel="stylesheet" />
    <link href="Content/jquery.signature.css" type="text/css" rel="stylesheet" />
    <script src="Scripts/jquery.signature.js" type="text/javascript"></script>
    <script>
        $(function () {
            $('#sig').signature();
            $('#clear').click(function () {
                $('#sig').signature('clear');
            });
            $('#json').click(function () {
                alert($('#sig').signature('toJSON'));
            });
            $('#svg').click(function () {
                alert($('#sig').signature('toSVG'));
            });
        });
    </script>
    <script src="Scripts/jquery.ui.touch-punch.min.js" type="text/javascript"></script>
    <link href="Content/Check.css" type="text/css" rel="stylesheet" />
</head>
<body style="width:100%;">
    <form id="form1" runat="server">
    <div>
        <section id="header">
            <div id="header-main">
                <div id="image-logo">
                    <img src="Content/Aviation-logo.png" />
                </div>
            </div>
        </section>

        <hr />

        <section id="info">
            <div id="info-main">
                <asp:Label ID="lblName" runat="server">Enter Name:</asp:Label>
                <asp:TextBox ID="txtSurname" runat="server" style="margin-left:10px; margin-right:1px;" Text="Enter Name.."></asp:TextBox>
                <input type="text" runat="server" placeholder="Enter Name.." style="margin-left:10px; margin-right:1px;" />
                <asp:Label ID="lblDate" runat="server">Date: </asp:Label>
                <asp:TextBox ID="txtDate" runat="server" style="margin-left: 54px; margin-right:1px;"></asp:TextBox>
                <img src="Content/calender.png" style="height:20px;" />
            </div>
        </section>

        <section id="signature">
            <div id="signature-main">
                <div id="sig" class="kbw-signature"></div>
            </div>
        </section>

        <section id="buttons">
            <div id="buttons-main">
                <asp:Button ID="btnCheck" runat="server" Text="Check In" OnClick="btnCheck_Click" style="margin-right:50px;" />
                <asp:Button ID="btnCheckout" runat="server" Text="Check Out" OnClick="btnCheckout_Click" />
                <asp:Button ID="clear" runat="server" Text="Clear" />
                <asp:Button ID="json" runat="server" Text="To JSON" />
                <asp:Button ID="svg" runat="server" Text="To SVG" />
            </div>
        </section>

        <asp:Label ID="lblComplete" runat="server"></asp:Label>
    </div>

        <asp:TextBox ID="txtcompany" runat="server" style="visibility:hidden"></asp:TextBox>
        <asp:TextBox ID="txtname" runat="server" style="visibility:hidden"></asp:TextBox>
        <asp:TextBox ID="txtEmail" runat="server" style="visibility:hidden"></asp:TextBox>
        <asp:TextBox ID="txtCheck" runat="server" style="visibility:hidden"></asp:TextBox>
    </form>
</body>
</html>

<%@ Page Title="View" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="View.aspx.cs" Inherits="VisitorMan.View" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script src="Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="Scripts/jquery.dynDateTime.min.js" type="text/javascript"></script>
    <script src="Scripts/calendar-en.min.js" type="text/javascript"></script>
    <link href="Content/calendar-blue.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        $(document).ready(function () {
            $("#<%=txtSelect.ClientID %>").dynDateTime({
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
    <script type="text/javascript">
        window.addEventListener('unload', function (event) {
            document.cookie = adAuthCookie + '=; expires=Thu, 01 Jan 1970 00:00:01 GMT;';
        });
    </script>
    <h2><%: Title  %>.</h2>
    <h3>View Visitors.</h3>
    <style>
        .panelColor{
            border-top: 1px solid #000;
            border-right: 1px solid #000;
            border-left: 1px solid #000;
            border-bottom: 1px solid #000;
        }
        .center{
            display: block;
            margin: 0 auto;
        }
        .divspacing{
            height:5px;
        }
    </style>
    <div class="divspacing"></div>
    <div>
        <asp:Label ID="DateSelect" runat="server">Select Date:</asp:Label>
        <asp:TextBox ID="txtSelect" runat="server" ReadOnly="false"></asp:TextBox>
        <img src="Content/calender.png" style="height: 20px;" />
        <asp:Label ID="lblBase" runat="server">Select Base:</asp:Label>
        <asp:DropDownList ID="comboBase" runat="server">
            <asp:ListItem Text="All" Value="All"></asp:ListItem>
            <asp:ListItem Text="Stansted" Value="Stansted"></asp:ListItem>
            <asp:ListItem Text="Luton" Value="Luton"></asp:ListItem>
            <asp:ListItem Text="Farnborough" Value="Farnborough"></asp:ListItem>
        </asp:DropDownList>
        <asp:Button ID="btnSelect" runat="server" Text="View" style="width:100px;" OnClick="btnSelect_Click"/>
    </div>
    <div class="divspacing"></div>
    <div>
        <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
        <asp:PlaceHolder ID="PlaceHolder2" runat="server"></asp:PlaceHolder>
    </div>
    <table>
        <tr>
            <td align="center">
                <asp:PlaceHolder ID="DBDataPlaceHolder" runat="server">
                </asp:PlaceHolder>
            </td>
        </tr>
    </table>

    <div>
<%--        <asp:Button ID="btnPrint" runat="server" Text="Print" OnClick="btnPrint_Click" />--%>
    </div>
</asp:Content>


<%--<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
</body>
</html>--%>

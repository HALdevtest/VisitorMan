<%@ Page Title="Edit" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="VisitorMan.Edit" %>

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
                daFormat: "%l,%M %p, %e %m, %Y",
                align: "BR",
                electric: false,
                singleClick: false,
                displayArea: ".siblings('dtcDisplayArea')",
                button: ".next()"
            });
        });
    </script>
    <script type="text/javascript">
        window.addEventListener('unload', function (event) {
            document.cookie = adAuthCookie + '=; expires=Thu, 01 Jan 1970 00:00:01 GMT;';
        });
    </script>
   <%-- <h2><%: Title %>.</h2>--%>
    <h3 style="text-align:left; float:left;">Search Visitor Details.</h3>
    <h3 style="text-align:right; float:right; margin-right:20px;">Edit Visitor Details.</h3>
    <hr style="clear:both;" />
    <style>
        .divspacing{
            height:5px;
        }
    </style>

    <div>
        <asp:Label ID="lblSelect" runat="server" Text="Date: "></asp:Label>
        <asp:TextBox ID="txtSelect" runat="server"></asp:TextBox>
        <img src="Content/calender.png" style="height: 20px" />
        <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click"  />
        <asp:DropDownList ID="comboVisitor" runat="server" AppendDataBoundItems="true" Visible="false">
            <asp:ListItem Text="<Select Visitor>" Value="0"></asp:ListItem>
        </asp:DropDownList>
        <asp:Button ID="btnSelect" runat="server" Text="Select" OnClick="btnSelect_Click" Visible="false"/>

     <%--   <div style="margin-left: 100px; margin-right:1px;">--%>
            <asp:Label ID="lblName" runat="server" Visible="false" style="margin-left: 370px; margin-right:1px;">* Name:</asp:Label>
            <asp:TextBox ID="txtName" runat="server" Visible="false" style="margin-left: 62px; margin-right:1px;"></asp:TextBox>
        <%--</div>--%>
    </div>
    <%--<div class="divspacing"></div>--%>
    <div>
        <asp:TextBox ID="txtUsername" runat="server" Visible="false"></asp:TextBox>
    </div>
 <%--   <div class="divspacing"></div>--%>
    <div class="divspacing"></div>
    <div>
        <%-- Name --%>

    </div>
    <div class="divspacing"></div>
    <div>
        <asp:Label ID="lblCompany" runat="server" Visible="false" style="margin-left:857px; margin-right:1px;">* Company:</asp:Label>
        <asp:TextBox ID="txtCompany" runat="server" Visible="false" style="margin-left: 40px; margin-right: 1px;"></asp:TextBox>
    </div>
    <div class="divspacing"></div>
    <div>
        <asp:Label ID="lblTelephone" runat="server" Visible="false" style="margin-left: 857px; margin-right:1px;">* Telephone:</asp:Label>
        <asp:TextBox ID="txtTelephone" runat="server" Visible="false" style="margin-left: 35px; margin-right:1px;"></asp:TextBox>
    </div>
    <div class="divspacing"></div>
    <div>
        <asp:Label ID="lblArea" runat="server" Visible="false" style="margin-left:857px; margin-right:1px;">* Area:</asp:Label>
        <asp:TextBox ID="txtArea" runat="server" Visible="false" style="margin-left:70px; margin-right:1px;"></asp:TextBox>
    </div>
    <div class="divspacing"></div>
    <div>
        <asp:Label ID="lblReg" runat="server" Visible="false" style="margin-left:857px; margin-right:1px;"> Vehicle Reg:</asp:Label>
        <asp:TextBox ID="txtReg" runat="server" Visible="false" style="margin-left:35px; margin-right:1px;"></asp:TextBox>
    </div>
    <div class="divspacing"></div>
    <div>
        <asp:TextBox ID="txtType" runat="server" Visible="false"></asp:TextBox>
        <asp:Label ID="lblType" runat="server" Visible="false" style="margin-left:857px; margin-right:1px;">* Type:</asp:Label>
        <asp:CheckBoxList ID="chkType" runat="server" Visible="false" style="margin-left: 977px; margin-right: 1px;">
            <asp:ListItem Text="Airside Visitor" Value="Airside"></asp:ListItem>
            <asp:ListItem Text="Landside Visitor" Value="Landside"></asp:ListItem>
            <asp:ListItem Text="Contractor" Value="Con"></asp:ListItem>
        </asp:CheckBoxList>
    </div>
    <div class="divspacing"></div>
    <div>
        <asp:TextBox ID="txtBase" runat="server" Visible="false"></asp:TextBox>
        <asp:Label ID="lblBase" runat="server" Visible="false" style="margin-left: 857px; margin-right:1px;">* Base:</asp:Label>
        <asp:DropDownList ID="comboBase" runat="server" Visible="false" style="margin-left: 70px; margin-right:1px; width:175px;">
            <asp:ListItem Text="Stansted" Value="Stansted"></asp:ListItem>
            <asp:ListItem Text="Luton" Value="Luton"></asp:ListItem>
            <asp:ListItem Text="Farnborough" Value="Farnborough"></asp:ListItem>
        </asp:DropDownList>
    </div>
    <div class="divspacing"></div>
    <div class="divspacing"></div>
    <div class="divspacing"></div>
    <div>
        <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" Visible="false" style="margin-left:980px; margin-right:1px; width:170px; height:30px;"/>
        <asp:TextBox ID="txtID" runat="server" Visible="false" />
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

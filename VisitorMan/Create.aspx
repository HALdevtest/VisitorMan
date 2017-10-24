<%@ Page Title="Create" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Create.aspx.cs" Inherits="VisitorMan.Create"%>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <script src="Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
<script src="Scripts/jquery.dynDateTime.min.js" type="text/javascript"></script>
<script src="Scripts/calendar-en.min.js" type="text/javascript"></script>
<link href="Content/calendar-blue.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
    $(document).ready(function () {
        $("#<%=txtDate.ClientID %>").dynDateTime({
            showsTime: true,
            ifFormat: "%d/%m/%Y",
            daFormat: "%l;%M %p, %e %m,  %Y",
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

<%--<link href="Content/Site.css" rel="stylesheet" type="text/css" />--%>
    <style type="text/css">
        .divspacing{
            height:5px;
        }
    </style>

    <h2><%: Title %>.</h2>
    <h3>Create Visitors.</h3>
    <div>
        <div>
            <asp:Label runat="server">Date:</asp:Label>
            <asp:TextBox ID="txtDate" runat="server" ReadOnly="true" style="margin-left:53px; margin-right:1px;"></asp:TextBox>
            <img src="Content/calender.png" style="height:20px;" />
        </div>
        <div class="divspacing"></div>
        <div>
            <asp:label ID="lblName" runat="server">* Name:</asp:label>
            <asp:TextBox ID="txtName" runat="server" style="margin-left:37px; margin-right:1px;"></asp:TextBox>
        </div>
        <div class="divspacing"></div>
        <div>
            <asp:Label ID="lblCompany" runat="server">* Company:</asp:Label>
            <asp:TextBox ID="txtCompany" runat="server" style="margin-left:14px; margin-right:1px;"></asp:TextBox>
        </div>
        <div class="divspacing"></div>
        <div>
            <asp:Label ID="lblTelephone" runat="server">* Telephone:</asp:Label>
            <asp:TextBox ID="txtTelephone" runat="server" style="margin-left:10px; margin-right:1px;"></asp:TextBox>
        </div>
        <div class="divspacing"></div>
        <div>
            <asp:Label ID="lblArea" runat="server">* Area:</asp:Label>
            <asp:TextBox ID="txtArea" runat="server" style="margin-left:45px; margin-right:1px;"></asp:TextBox>
        </div>
        <div class="divspacing"></div>
        <div>
            <asp:Label ID="lblReg" runat="server">Vehicle Reg:</asp:Label>
            <asp:TextBox id="txtReg" runat="server" style="margin-left:10px; margin-right:1px;"></asp:TextBox>
        </div>
        <div class="divspacing"></div>
        <div>
            <asp:Label ID="lblType" runat="server">* Type:</asp:Label>
            <asp:CheckBoxList ID="chkType" runat="server" style="margin-left:100px; margin-right:1px;">
                <asp:ListItem Text="Airside Visitor" Value="Airside"></asp:ListItem>
                <asp:ListItem Text="Landside Visitor" Value="Landside"></asp:ListItem>
                <asp:ListItem Text="Contractor" Value="Con"></asp:ListItem>
            </asp:CheckBoxList>
        </div>
        <div class="divspacing"></div>
        <div>
            <asp:Label ID="lblBase" runat="server">* Base:</asp:Label>
            <asp:DropDownList ID="comboBase" runat="server" style="margin-left:70px; margin-right:1px;">
                <asp:ListItem Text="Stansted" Value="Stansted"></asp:ListItem>
                <asp:ListItem Text="Luton" Value="Luton"></asp:ListItem>
                <asp:ListItem Text="Farnborough" Value="Farnborough"></asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="divspacing"></div>
        <div>
            <asp:Label ID="lblError" runat="server" style="color: red;" Visible="false">Please fill in all fields that are labelled with an asterisk</asp:Label>            
            <asp:Label ID="lblComplete" runat="server" style="color: green;" Visible="false">Visitor has been created.</asp:Label>
        </div>
        <div class="divspacing"></div>
        <div class="divspacing"></div>
        <asp:Button ID="btnSave" runat="server" Text="Enter" OnClick="btnSave_Click" style="margin-left:157px; margin-right:1px; width:100px;" />
   </div>
    <asp:TextBox ID="txtID" runat="server" Visible="false"></asp:TextBox>
    <asp:TextBox ID="txtLogin" runat="server" Visible="false"></asp:TextBox>
    <asp:TextBox ID="txtCDate" runat="server" Visible="false"></asp:TextBox>
    <asp:TextBox ID="txtEmail" runat="server" Visible="false"></asp:TextBox>

</asp:Content>





<%--<!DOCTYPE html>--%>

<%--<html xmlns="http://www.w3.org/1999/xhtml">
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

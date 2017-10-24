<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="VisitorMan._Default" %>

<script runat="server">

</script>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript">
        window.addEventListener('unload', function (event) {
            document.cookie = adAuthCookie + '=; expires=Thu, 01 Jan 1970 00:00:01 GMT;';
        });
    </script>

    <div class="jumbotron" style="background-color: #cccaa0;">
        <h1>Visitor Management  -  <%: DateTime.Today.ToString("dd MMM") %> </h1>
       <%-- <p class="lead">.</p>--%>
  <%--      <p><a href="" class="btn btn-primary btn-lg">. &raquo;</a></p>--%>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>New Visitor</h2>
            <p>
                --------------------------
            </p>
            <p>
                <a class="btn btn-default" href="Create.aspx">Create new visitor. &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>View Visitors</h2>
            <p>
                --------------------------
            </p>
            <p>
                <a class="btn btn-default" href="View.aspx">View when visitors are expected in. &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Edit Details</h2>
            <p>
               --------------------------
            </p>
            <p>
                <a class="btn btn-default" href="Edit.aspx">Edit details of a created visitor. &raquo;</a>
            </p>
        </div>
    </div>

</asp:Content>

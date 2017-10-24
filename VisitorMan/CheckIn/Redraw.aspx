<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Redraw.aspx.cs" Inherits="VisitorMan.CheckIn.Redraw" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../Scripts/jquery-1.11.1.js"  type="text/javascript"></script>
    <script src="../Scripts/jquery-1.11.1.min.js" type="text/javascript"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js" type="text/javascript"></script>
    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/themes/south-street/jquery-ui.css" type="text/css" rel="stylesheet" />

    <link href="../Content/jquery.signature.css" type="text/css" rel="stylesheet" />
    <script src="../Scripts/jquery.signature.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {


            $('#redrawButton').click(function () {
                $('redrawsignature').signature('enable').
                signature('draw', $('#signatureJSON').val()).
                signature('disable');
            });

            $('#redrawSignature').signature({ disabled: true });

        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div>
            <textarea id="signatureJSON" name="signatureJSON" rows="5" cols="50" ></textarea>
        </div>
        <div>
            <button id="redrawButton" type="button">Redraw</button>
        </div>
        <div id="redrawSignature" class="kbw-signature">
            
        </div>
    </div>
    </form>
</body>
</html>

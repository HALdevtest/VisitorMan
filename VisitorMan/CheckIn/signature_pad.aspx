<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signature_pad.aspx.cs" Inherits="VisitorMan.CheckIn.signature_pad" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title></title>

    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">

    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">

    <script src="../Scripts/jquery-1.11.1.js" type="text/javascript"></script>
    <%--<script src="../Scripts/signature_pad/signature_pad.js" type="text/javascript"></script>--%>
    <script src="https://cdn.jsdelivr.net/npm/signature_pad@2.3.2/dist/signature_pad.min.js"></script>
    <script src="../Scripts/signature_pad/app.js" type="text/javascript"></script>

    <link href="../Scripts/signature_pad/signature-pad.css" type="text/css" rel="stylesheet" />

     <script type="text/javascript">
    var _gaq = _gaq || [];
    _gaq.push(['_setAccount', 'UA-39365077-1']);
    _gaq.push(['_trackPageview']);

    (function() {
      var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
      ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
      var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
    })();
  </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <div id="signature-pad" class="signature-pad">
            <div class="signature-pad--body">
                <canvas></canvas>
            </div>
        </div>

        <div class="signature-pad--actions">
            <div>
                <button type="button" class="button clear" data-action="clear">Clear</button>
                <button type="button" class="button" data-action="change-color">Change color</button>
                <button type="button" class="button" data-action="undo">Undo</button>
           </div>

            <div>
                <button type="button" class="button save" data-action="save-png">Save as PNG</button>
                <button type="button" class="button save" data-action="save-jpg">Save as JPG</button>
                <button type="button" class="button save" data-action="save-svg">Save as SVG</button>
            </div>
        </div>

    </div>
    </form>
</body>
</html>

<%@ Page Title="Test" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="VisitorMan.test" %>

<asp:Content id="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <link type="text/css" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/themes/south-street/jquery-ui.css" rel="stylesheet" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
<%--    <script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.4.2.min.js"></script>--%>
    <link type="text/css" href="Content/jquery.signature.css" rel="stylesheet" />
    <script type="text/javascript" src="Scripts/jquery.signature.js"></script>
    <script>
        $(function () {
            //Initialize
            $('#signature').signature();

            //Clear signature area
            $('#clear').click(function () {
                $('#signature').signature('clear');
            });

            // Get JSON response and show preview
         
            $('#but_prev').click(function () {
                var output = $('#signature').signature('toJSON');
                $('#json_output').val(output);
                $('#prev').signature('draw', $('#json_output').val());
                var text = $('#json_output').val();
                $('#json_text').text() = text;
            });
            $('#prev').signature({ disabled: true });
        });
    </script>
    <script type="text/javascript" src="Scripts/jquery.ui.touch-punch.min.js"></script>
    <script type="text/javascript" src="Scripts/FileSaver.js"></script>
    <style>
        .kbw-signature {width: 400px; height: 200px;}
    </style>

    <div ID="signature" class="kbw-signature"></div>

    <div style="clear: both;">
        <button id="clear">Clear</button>
        <input type="button" id="but_prev"  value="Preview" onclick="Test_Click"/>
        <%--<input type="button" id="but_prev2" runat="server" value="Database Test" onclick="but_prev2_Click" />--%>
        <asp:Button ID="but_prev2" runat="server" Text="Preview 2" OnClick="but_prev2_Click" Visible="true" />
    </div>

     <textarea id="json_output"></textarea><br />
    <asp:TextBox ID="json_text"></asp:TextBox><br />

    <script>
                
    </script>

    <style>
        .canvas_container{
            height:100%;
            position: relative;
            width: 100%;
        }
        .canvas_canvas{
            height:100%;
            position: relative;
            width: 100%;
            z-index: 1;
        }
        .canvas_mirror{
            height: 100%;
            left: 0;
            position:absolute;
            top: 0;
            width: 100%;
        }
    </style>

    <%-- SECOND IMAGE / CANVAS       style="display: none" --%>
    <div id="prev">

    </div>

    <div id="img-out"></div>

    <%--<a id="btn-Convert-Html2Image" href="">Download</a>--%>
    <input type="button" id="btn-Convert-Html2Image"  value="Download"/>

    <script src="Scripts/html2canvas.js"></script>
    <%--<script>
        $(document).ready(function () {
            var element = $("#signature");
            var getCanvas;

            $("#but_prev").on('click', function () {
                html2canvas(element, {
                    background: '#FFFFFF',
                    onrendered: function (canvas) {
                        $("#prev").append(canvas);
                        getCanvas = canvas;
                    }
                });
            });

            $("#btn-Convert-Html2Image").on('click', function () {
                var imgageData = canvas.toDataURL("image/png");
                // Now browser starts downloading it instead of just showing it
                var newData = imgageData.replace('data:image/png;base64,', '');
                //$("#btn-Convert-Html2Image").attr("download", "sig.png").attr("href", newData);

               // var image = document. get

                $.ajax({
                    type : 'POST',
                    url : 'test.aspx/UploadImage',
                    data : 
                        '{"imageData" : "' + newData + '"}',
                    contentType: 'application/json charset=utf-8',
                    dataType: 'json',

                    success: function (msg) {
                        alert('Image saved successfully!');
                    }
                
                });
            });
        });
    </script>--%>

</asp:Content>
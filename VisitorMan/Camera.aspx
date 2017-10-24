<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Camera.aspx.cs" Inherits="VisitorMan.Camera" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

<%--    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>--%>

    <script type="text/javascript" src="Scripts/jquery-1.11.1.js"></script>
    <script type="text/javascript" src="Scripts/jquery-1.11.1.min.js"></script>

        <script type="text/javascript" src="Scripts/jquery.webcam.js"></script>
    <script type="text/javascript" src="Scripts/jquery.webcam.min.js"></script>
  
        <%-- WEBCAM  --%>
        <script type="text/javascript">

            var pos = 0;
            var ctx = null;
            var cam = null;
            var image = null;

            var filter_on = false;
            var filter_id = 0;

            function changeFilter() {
                if (filter_on) {
                    filter_id = (filter_id + 1) & 7;
                }
            }

            function toggleFilter(obj) {
                if (filter_on = !filter_on) {
                    obj.parentNode.style.borderColor = "#c00";
                } else {
                    obj.parentNode.style.borderColor = "#333";
                }
            }


            $('#webcam').webcam({
                width: 320,
                height: 240,
                //mode: "callback",
                mode: "save",
                //swiffle: "@Url.Content()",
                swffile: "Webcam_Plugin/jscam.swf",
                onTick: function (remain) {
                    if (0 == remain) {
                        jQuery("#camStatus").text("Capture");
                    }
                    else {
                        jQuery("#camStatus").text(remain + " seconds remaining...");
                    }
                },
                onSave: function (data) {
                    var col = data.split(";");
                    var img = image;

                    if (false == filter_on) {

                        for(var i = 0; i < 320; i++) {
                            var tmp = parseInt(col[i]);
                            img.data[pos + 0] = (tmp >> 16) & 0xff;
                            img.data[pos + 1] = (tmp >> 8) & 0xff;
                            img.data[pos + 2] = tmp & 0xff;
                            img.data[pos + 3] = 0xff;
                            pos+= 4;
                        }

                    } else {

                        var id = filter_id;
                        var r,g,b;
                        var r1 = Math.floor(Math.random() * 255);
                        var r2 = Math.floor(Math.random() * 255);
                        var r3 = Math.floor(Math.random() * 255);

                        for(var i = 0; i < 320; i++) {
                            var tmp = parseInt(col[i]);

                            /* Copied some xcolor methods here to be faster than calling all methods inside of xcolor and to not serve complete library with every req */

                            if (id == 0) {
                                r = (tmp >> 16) & 0xff;
                                g = 0xff;
                                b = 0xff;
                            } else if (id == 1) {
                                r = 0xff;
                                g = (tmp >> 8) & 0xff;
                                b = 0xff;
                            } else if (id == 2) {
                                r = 0xff;
                                g = 0xff;
                                b = tmp & 0xff;
                            } else if (id == 3) {
                                r = 0xff ^ ((tmp >> 16) & 0xff);
                                g = 0xff ^ ((tmp >> 8) & 0xff);
                                b = 0xff ^ (tmp & 0xff);
                            } else if (id == 4) {

                                r = (tmp >> 16) & 0xff;
                                g = (tmp >> 8) & 0xff;
                                b = tmp & 0xff;
                                var v = Math.min(Math.floor(.35 + 13 * (r + g + b) / 60), 255);
                                r = v;
                                g = v;
                                b = v;
                            } else if (id == 5) {
                                r = (tmp >> 16) & 0xff;
                                g = (tmp >> 8) & 0xff;
                                b = tmp & 0xff;
                                if ((r+= 32) < 0) r = 0;
                                if ((g+= 32) < 0) g = 0;
                                if ((b+= 32) < 0) b = 0;
                            } else if (id == 6) {
                                r = (tmp >> 16) & 0xff;
                                g = (tmp >> 8) & 0xff;
                                b = tmp & 0xff;
                                if ((r-= 32) < 0) r = 0;
                                if ((g-= 32) < 0) g = 0;
                                if ((b-= 32) < 0) b = 0;
                            } else if (id == 7) {
                                r = (tmp >> 16) & 0xff;
                                g = (tmp >> 8) & 0xff;
                                b = tmp & 0xff;
                                r = Math.floor(r / 255 * r1);
                                g = Math.floor(g / 255 * r2);
                                b = Math.floor(b / 255 * r3);
                            }

                            img.data[pos + 0] = r;
                            img.data[pos + 1] = g;
                            img.data[pos + 2] = b;
                            img.data[pos + 3] = 0xff;
                            pos+= 4;
                        }
                    }

                    if (pos >= 0x4B000) {
                        ctx.putImageData(img, 0, 0);
                        pos = 0;
                    }
                },
                onCapture: function () {
                    //webcam.save();
                    document.getElementById('XwebcamXobjectX').save();

                    jQuery("#flash").css("display", "block");
                    jQuery("#flash").fadeOut("fast", function () {
                        jQuery("#flash").css("opacity", 1);
                    });
                },
                debug: function (type, string) {
                    $("camStatus").html(type + ": " + string);
                },
                onLoad: function () {
                    var cams = webcam.getCameraList();
                    for (var i in cams) {
                        jQuery('#cams').append("<li>" + cams[i] + "</li>");
                    }
                }
            });
            function getPageSize() {

                var xScroll, yScroll;

                if (window.innerHeight && window.scrollMaxY) {
                    xScroll = window.innerWidth + window.scrollMaxX;
                    yScroll = window.innerHeight + window.scrollMaxY;
                } else if (document.body.scrollHeight > document.body.offsetHeight) { // all but Explorer Mac
                    xScroll = document.body.scrollWidth;
                    yScroll = document.body.scrollHeight;
                } else { // Explorer Mac...would also work in Explorer 6 Strict, Mozilla and Safari
                    xScroll = document.body.offsetWidth;
                    yScroll = document.body.offsetHeight;
                }

                var windowWidth, windowHeight;

                if (self.innerHeight) { // all except Explorer
                    if (document.documentElement.clientWidth) {
                        windowWidth = document.documentElement.clientWidth;
                    } else {
                        windowWidth = self.innerWidth;
                    }
                    windowHeight = self.innerHeight;
                } else if (document.documentElement && document.documentElement.clientHeight) { // Explorer 6 Strict Mode
                    windowWidth = document.documentElement.clientWidth;
                    windowHeight = document.documentElement.clientHeight;
                } else if (document.body) { // other Explorers
                    windowWidth = document.body.clientWidth;
                    windowHeight = document.body.clientHeight;
                }

                // for small pages with total height less then height of the viewport
                if (yScroll < windowHeight) {
                    pageHeight = windowHeight;
                } else {
                    pageHeight = yScroll;
                }

                // for small pages with total width less then width of the viewport
                if (xScroll < windowWidth) {
                    pageWidth = xScroll;
                } else {
                    pageWidth = windowWidth;
                }

                return [pageWidth, pageHeight];
            }


            window.addEventListener("load", function () {

                jQuery("body").append("<div id=\"flash\"></div>");

                var canvas = document.getElementById("canvas");

                if (canvas.getContext) {
                    ctx = document.getElementById("canvas").getContext("2d");
                    ctx.clearRect(0, 0, 320, 240);

                    var img = new Image();
                    img.src = "/image/logo.gif";
                    img.onload = function () {
                        ctx.drawImage(img, 129, 89);
                    }
                    image = ctx.getImageData(0, 0, 320, 240);
                }

                var pageSize = getPageSize();
                jQuery("#flash").css({ height: pageSize[1] + "px" });

            }, false);

            window.addEventListener("resize", function () {

                var pageSize = getPageSize();
                jQuery("#flash").css({ height: pageSize[1] + "px" });

            }, false);

            function Capture() {
                document.getElementById('XwebcamXobjectX').capture();
            }
            </script>

            <%-- POST FILE  --%>
            <script>


                //function sendFile(file) {
                //    var formData = new FormData();
                //    formData.append('file', $('#canvas')[0].files[0]);
                //    $.ajax({
                //        type: 'post',
                //        url: 'fileUploader.ashx',
                //        data: formdata,
                //        success: function (status) {
                //            if (status != 'error') {
                //                var my_path = "MediaUploader/" + status;
                //                $("#myUploadedImg").attr("src", my_path);
                //            }
                //        },
                //        processData: false,
                //        contentType: false,
                //        error: function () {
                //            alert("Whoops something went wrong!");
                //        }
                //    });
                //}

                //var _URL = window.URL || window.webketURL;
                //$("#canvas").on('change', function () {
                //    var file, img;
                //    if ((file = this.files[0])) {
                //        img = new Image();
                //        img.onload = function () {
                //            sendFile(file);
                //        };
                //        img.onerror = function () {
                //            alert("Not a valid file:" + file.type);
                //        };
                //        img.src = _URL.createObjectURL(file);
                //    }
                //});
            </script>
    <style type="text/css">
        .container{display:inline-block;width:320px;}
        #Cam{background:rgb(255,255,215);}#Prev{background:rgb(255,255,155);}#Saved{background:rgb(255,255,55);}
    </style>
</head>
<body>
    <form id="form1" runat="server" accept-charset="utf-8" method="post">
        <p id="camStatus" style="height: 22px; color:#c00; font-weight:bold;"></p>
        <div id="webcam">
            <object id="XwebcamXobjectX" type="application/x-shockwave-flash" data="Webcam_Plugin/jscam.swf" width="320" height="240">
                <param name="movie" value="Webcam_Plugin/jscam_canvas_only.swf" />
                <param name="FlashVars" value="mode=callback&quality=85" />
                <param name="allowScriptAccess" value="always" />
            </object>
        </div>


        <div id="buttons">
            <p style="width:360px;text-align:center; font-size:12px;">
                <a href="javascript:webcam:Capture(3);changeFilter();void(0);">Take a picture after 3 seconds</a> "|" 
                <a href="javascript:webcam:Capture();changeFilter();void(0);">Take a picture instantly</a>
                <input type="button" id="btnSave" value="Save" onclick="uploadEx()" />
                <%-- <asp:FileUpload ID="fileUpload" runat="server" /> --%>
<%--                <input type="button" onclick="Capture();" value="Capture" />--%>
            </p>
        </div>

        <div id="finalPicture">
            <canvas id="canvas" height="240" width="320"></canvas>

         <%--   <input name="hidden_data" id="hidden_data" type="hidden" />--%>
            <input  type="hidden" name="imageData" id="imageData" />

            <script type="text/javascript">
                $("form").submit(function (e) {
                    e.preventDefault();
                    var imageData = document.getElementById("canvas").toDataURL("image/png");
                    $("#imageData").val(imageData);

                    $(this).submit();
                });
                //function uploadEx() {
                //    var canvas = document.getElementById("canvas");
                //    var dataURL = canvas.toDataURL();
                //    document.getElementById('hidden_data').value = dataURL;
                //    var fd = new FormData(document.forms["form1"]);

                //    var xhr = new XMLHttpRequest();
                //    xhr.open('POST', 'Test/test.php', false);

                //    xhr.upload.onprogress = function (e) {
                //        if (e.lengthComputable) {
                //            var percentComplete = (e.loaded / e.total) * 100;
                //            console.log(percentComplete + '% uploaded');
                //            alert('Succesfully uploaded');
                //        }
                //    };

                //    xhr.onload = function () {

                //    };
                //    xhr.send(fd);
                //};
            </script>
            <%--<script type="text/javascript">
                // Send the canvas image to the server.
                $(function () {
                    $("#btnSave").click(function () {
                        var image = document.getElementById("canvas").toDataURL("image/png");
                        image = image.replace('data:image/png;base64,', '');
                        //'data:image/png;base64,', ''
                        ///^data:image\/(png|jpg);base64,/, ""
                        
                        //alert(image);

                        $.ajax({
                            type: 'POST',
                            url: 'Camera.aspx/UploadImage',
                            data: '{ "imageData" : "' + image + '" }',
                            //ContentType: 'application/json; charset=utf-8',
                            //dataType: 'json',
                            //data: image,
                            //contentType: 'image/png',
                            //header: {
                            //    'Content-Transfer-Encoding' : 'Base64'
                            //},
                            success: function (response, status, xhr) {
                                alert('Image saved successfully !');
                                //window.location.reload();
                                alert(xhr.status);
                            },
                            error: function (xhr, ajaxOptions, thrownError) {
                                alert(xhr.status);
                                alert(ajaxOptions);
                                alert(thrownError);
                            }
                        });
                    });
                });
            </script>--%>

        </div>

        <div>
            <img id="myUploadedImg" alt="Photo" style="width:180px" />
        </div>

        <div id="camlist">
            <ul id="cams"></ul>
        </div>

        <div id="flash" style="height: 6431px; display:none; opacity:1;"></div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Picture.aspx.cs" Inherits="VisitorMan.CheckIn.Picture" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../Scripts/jquery-1.11.1.js" type="text/javascript"></script>
    <script>
        function readURL(input){
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#Picture').attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }
        }

        $('#imgInp').change(function () {
            readURL(this);
        });
    </script>
    <link href="../Content/font-awesome.css" type="text/css" rel="stylesheet" />
    <link href="../Content/CheckIn/Picture.css" type="text/css" rel="stylesheet" />

   <%-- <script type="text/javascript">
        function fileSelected() {
            var count = document.getElementById('imgInp').files.length;

            document.getElementById('details').innerHTML = "";

            for (var index = 0; index < count; index++) {
                var file = document.getElementById('imgInp').files[index];

                var fileSize = 0;

                if (file.size > 1024 * 1024) {
                    fileSize = (Math.round(file.size * 100 / (1024 * 1024)) / 100).toString() + 'MB';

                }
                else {
                    fileSize = (Math.round(file.size * 100 / 1024) / 100).tostring() + 'KB';
                    document.getElementById('details').innerHTML += 'Name: ' + file.name + '<br>Size: ' + fileSize + '<br>Type: ' + file.type;
                    document.getElementById('details').innerHTML += '<p>';
                }
            }
        }

        function uploadFile() {
            var fd = new FormData();

            var count = document.getElementById('imgInp').files.length;
            for (var index = 0; index < count; index++) {
                var file = document.getElementById('imgInp').files[index];
                fd.append('myFile', file);
            }
            var xhr = new XMLHttpRequest();
            xhr.upload.addEventListener("progress", uploadProgress, false);
            xhr.addEventListener("load", uploadComplete, false);
            xhr.addEventListener("error", uploadFailed, false);
            xhr.addEventListener("abort", uploadCanceled, false);
            xhr.open("POST", "savetofile.php");
            xhr.send(fd);
        }

        function uploadProgress(evt) {
            if (evt.lengthComputable) {
                var percentComplete = Math.round(evt.loaded * 100 / evt.total);
                document.getElementById('progress').innerHTML = percentComplete.toString() + '%';
            }
            else {
                document.getElementById('progress').innerHTML = 'unable to compute';
            }
        }

        function uploadComplete(evt) {
            alert(evt.target.responseText);
        }

        function uploadFailed(evt) {
            alert("There was an error attempting to upload the file.");
        }

        function uploadCanceled(evt) {
            alert("The upload has been canceled by the user or the browser dropped the connection");
        }

    </script>--%>
    <script>
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#Picture')
                    .attr('src', e.target.result)
                    .width(800)
                    .height(1100);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data" method="post">
    <div>
        <section id="header">
            <div id="header-main">
                <div id="image-logo">
                    <img src="../Content/Aviation-logo.png" />
                </div>
            </div>
        </section>

        <hr />

<%--        <input type="file" accept="image/*" />--%>
        <section id="content">
            <div id="content-main">
                <input type="file" name="imgInp" id="imgInp" onchange="readURL(this);" accept="image/*" capture="camera" />
                <div id="showPicture" style="width:800px; height:1100px;">
                    <img id="Picture" src="#" alt=""/>
                </div>
<%--                <asp:Button ID="UploadButton" runat="server" Text="Upload" OnClick="UploadButton_Click" />--%>
                <%--<input type="button" onclick="uploadFile()" value="Test Upload" />--%>
                <br /><br />
<%--                <asp:Label id="StatusLabel" runat="server" Text="Upload status:  "></asp:Label>--%>
            </div>
        </section>

        <section id="buttons">
            <div id="buttons-main">
                <button id="btnUploadButton" runat="server" type="submit" onserverclick="UploadButton_Click" class="btnUpload">
                    <span>Upload</span>
                    <i class="fa fa-upload" aria-hidden="true"></i>
                </button>
                <button id="btnNext" runat="server" type="submit" onserverclick="btnNext_ServerClick" class="btnNext">
                    <span>Confirm</span>
                     <i class="fa fa-long-arrow-right" aria-hidden="true"></i>
                </button>
            </div>
        </section>

    </div>
    </form>
</body>
</html>

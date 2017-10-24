<%@ Page Title="Check In Signature"Language="C#" AutoEventWireup="true" CodeBehind="Signature.aspx.cs" Inherits="VisitorMan.CheckIn.Signature" %>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <script type="text/javascript" src="../Scripts/jquery-1.11.1.js"></script>
    <script type="text/javascript" src="../Scripts/jquery-1.11.1.min.js"></script>
    <link type="text/css" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/south-street/jquery-ui.css" rel="stylesheet"> 
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <link href="../Content/font-awesome.css" type="text/css" rel="stylesheet" />

    <link type="text/css" href="../Content/jquery.signature.css" rel="stylesheet" />
    <script type="text/javascript" src="../Scripts/jquery.signature.js"></script>
    <script>
        $(function () {
            $('#sig').signature({ syncField: '#signatureJSON' });
            $('#clear').click(function () {
                $('#sig').signature('clear');
            });
            $('#sig').signature('isEmpty');
            //if ($('#sig').signature('isEmpty')) {
            //    $('lblCheck').val("Empty");
            //}
            $('input[name="syncFormat"]').change(function () {
                var syncFormat = $('input[name="syncFormat"]:checked').val();
                $('#sig').signature('option', 'syncFormat', syncFormat);
            });

            $('#svgStyle').change(function () {
                $('#sig').signature('option', 'svgStyles', $(this).is(':checked'));
            });

            $('#redrawButton').click(function () {
                var myCanvas = document.getElementById('redrawcanvas');
                var ctx = myCanvas.getContext('2d');
                var img = new Image();
                img.src = "data:image/jpeg;base64,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";
                ctx.drawImage(img, 0, 0);
            });
        });

  
    </script>
    <%--<script type="text/javascript">
        $(function () {
            $('#redrawButton').click(function () {
                var myCanvas = document.getElementById('redrawcanvas');
                var ctx = myCanvas.getContext('2d');
                var img = new Image();
                img.src = "data:image/jpeg;base64,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";
                ctx.drawImage(img, 0, 0);
                
                //$('redrawsignature').signature('enable').
                //signature('draw', $('#signatureJSON').val()).
                //signature('disable');
            });
            //$('#redrawSignature').signature({ disable: true });
        });
    </script>--%>
    <script type="text/javascript" src="../Scripts/jquery.ui.touch-punch.min.js"></script>
    <link type="text/css" href="../Content/CheckIn/Signature.css" rel="stylesheet" />

    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <section id="header">
            <div id="header-main">
                <div id="image-logo">
                    <img src="../Content/Aviation-logo.png" />
                </div>
            </div>
        </section>

        <hr />

        <section id="content">
            <div id="panel" runat="server" style="overflow-y:auto; height:700px; border:1px solid black;">
                <h1>SAFETY</h1>
                <p>
                 Harrods Aviation Limited has a legal responsibility for the safety of its employees, visitors, clients and all other third parties.
                 As with all airport environments, certain parts of our business will have many high risk areas, including moving machinery and / or vehicles, chemicals etc.
                 During your visit your host will point out any particular hazards contained in the areas you may be visiting.
                </p>

                <p>
                 You are requested to do nothing that may prevent us from discharging our legal responsibilities, 
                 as any unsafe act or omission could adversely affect the safety or welfare of other people.
                </p>

                <p>
                 If during your visit, you become aware of any potential health and safety problem, please do not hesitate to report it to your host.
                </p>

                <p>
                 All visitors must be accompanied by their host while on site.  Visitors are requested to refrain from entering areas they have no specific need to access.
                 Doors marked as emergency exits/fire doors should only be opened in the event of an emergency.
                </p>

                <p>
                 If you have visited Harrods Aviation before, the company is constantly changing layouts and improving systems.   
                 Please do not presume that areas are the same as your previous visit.
                </p>

                 <p>
                 Harrods Aviation Limited complies with Government and British Airport Authority legislation as amended from time to time.
                </p>

                <h1>FIRE</h1>

                <p>
                    Please take time to familiarise yourself with your surroundings and your nearest means of escape. 
                     In the event of fire alarm activation, an electronic siren will be heard with the buildings.  
                    Should this occur, you must evacuate the building immediately using the nearest fire exit.  
                    Once out of the building, your host will direct you to the nearest assembly point where you should remain until further instructions are issued.  
                    Do not attempt to re-enter the building.  If you have arrived by car and this is in our car park, 
                    please do not attempt to move it unless instructed as this may hamper the emergency services.
                </p>

                <h1>ACCIDENTS/ILLNESS</h1>

                <p>
                    Your host will arrange for a member of staff trained in first aid to attend should you fall ill or have an accident.
                </p>

                <h1>CONTRACTORS ONLY</h1>

                <p>
                    If you are carrying out physical work, advance notice is required and a permit to work must be obtained.  Your host will advise and arrange.
                </p>
                <p>
                    Any waste materials generated by your activities must be removed from site unless agree by your host.  
                    Contractors are not permitted to use Harrods Aviation waste skips or pour any waste into surface drains.
                </p>
                <p>
                    You are asked to comply with all health and safety and operational requirements for the area you are operating in.  
                    For example, personal protective equipment such as goggles, harnesses, hi-visibility clothing etc.  
                    Such items should be provided by yourself.
                </p>

                <h1>SECURITY</h1>

                <p>
                    Whilst on site, the visitor pass you have been issued is to be displayed at all times and is to be returned to reception before you depart.
                </p>

                <p>
                    Photographic equipment of any kind is forbidden unless prior permission has been given. 
                     If you have a mobile camera phone, you are required to declare this to your host.
                </p>

                <p>
                    Visitors wishing to use any radio communications whilst on site must advise the host in order that suitability can be checked.
                </p>

                <p>
                    All visitors are advised that CCTV cameras are in operation in all areas of Harrods Aviation Limited for the protection of our staff and customers.
                </p>
                <p>
                    Harrods Aviation Limited reserves the right to search personnel, bags, toolboxes and vehicles on a random basis. 
                </p>
                <p>
                    Some areas on site are classified as ‘sensitive’, therefore you are prohibited from walking around our facilities without your escort/host.
                </p>

                <p>
                    For any questions, please contact Harrods Aviation security:
                    T: 01279 665313 or 07767 606781
                </p>
            </div>
            <div style="height:15px;">

            </div>
<%--            <textarea id="HS" runat="server" readonly="true" class="textarea"></textarea>--%>
            <asp:Label ID="lblConfirm" runat="server" Text="By Signing below, I have read and understand the above text."></asp:Label>
            <textarea id="lblCheck" runat="server" visible="false"></textarea>
            <br />
            <asp:Label ID="lblError" runat="server" Text="Please tick Agree and Sign below" Visible="false"></asp:Label>

            <asp:CheckBoxList ID="cbl" runat="server" RepeatColumns="2">
                <asp:ListItem Text="Agree" value="agree"></asp:ListItem>
                <asp:ListItem Text="Disagree" Value="disagree"></asp:ListItem>
            </asp:CheckBoxList>

        </section>

        <section id="signature">
            <div id="signature-main">
                <div id="sig" class="kbw-signature"></div>
            </div>
            <div>
                <label>
                    <input type="radio" name="syncFormat" value="JPEG" />
                    " JPEG"
                </label>
            </div>

            <div>
                <textarea id="signatureJSON" name="signatureJSON" rows="5" cols="50"></textarea>
            </div>
            <div>
                <button type="button" id="redrawButton">Re-Draw</button>
            </div>
            <div>
                <div id="redrawSignature" class="kbw-signature kbw-signature-disable">
                    <canvas id="redrawcanvas" style="width:200px; height:200px;"></canvas>
                </div>
            </div>
            <%--<pre><code>$('#redrawButton').click(function(){
                $('#redrawSignature').signature('enable').
                signature('draw', $('#signatureJSON').val()).
                signature('disable');
                });
                $('#redrawSignature').signature({disabled: true});
                 </code></pre>--%>
        </section>

        <section id="buttons">
            <div id="buttons-main">
                <button id="clear"  class="btnClear">
                    <i class="fa fa-eraser" aria-hidden="true"></i>
                    <span>Clear</span>

                </button>
                <button id="Next" runat="server" type="button" class="btnNext" onserverclick="btnNext_ServerClick">
                    <span>Confirm</span>
                    <i class="fa fa-long-arrow-right" aria-hidden="true"></i>
                </button>
            </div>
        </section>
        
    </div>
    </form>
</body>
</html>

<%@ Page Title="Visitor View" Language="C#" AutoEventWireup="true" CodeBehind="VisView.aspx.cs" Inherits="VisitorMan.VisView" %>
<?xml version="1.0" encoding="utf-8" ?>
<!DOCTYPE html>
<html id="html">
    <head runat="server">
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />

        <script type="text/javascript" src="Scripts/jquery-1.11.1.js"></script>
        <script type="text/javascript" src="Scripts/jquery-1.11.1.min.js"></script>
        <script type="text/javascript" src="Scripts/jquery.bxslider.js"></script>
        <%--<script type="text/javascript" src="Scripts/jquery.bxslider.min.js"></script>--%>
        <script type="text/javascript" src="Scripts/screenfull.js"></script>
        <script type="text/javascript" src="Scripts/screenfull.min.js"></script>

        <link type="text/css" href="Content/jquery.bxslider.css" rel="stylesheet" />
        <link type="text/css" href="Content/font-awesome.css" rel="stylesheet" />
        <link type="text/css" href="Content/jquery.signature.css" rel="stylesheet" />
        <link type="text/css" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/south-street/jquery-ui.css" rel="stylesheet"> 
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<%--           <script type="text/javascript" src="../Scripts/jquery.ui.touch-punch.min.js"></script>--%>
        <script type="text/javascript" src="Scripts/jquery.signature.js"></script>

        <link type="text/css" href="Content/VisView.css" rel="stylesheet" />

        <title>
        </title>


  

        <script>
            function startTime() {
                var today = new Date();
                var h = today.getHours();
                var m = today.getMinutes();
                var s = today.getSeconds();
                m = checkTime(m);
                s = checkTime(s);
                document.getElementById('Time').innerHTML =
                h + ":" + m;

                var t = setTimeout(startTime, 500000000000000000000000000000000000);
            }
            function checkTime(i) {
                if (i < 10) { i = "0" + i };  // add zero in front of numbers < 10
                return i;
            }
         
            //$('#body').css('min-height', '100%');
            //$('#body').css('min-height', screen.height);
        </script>

        <script type="text/javascript">
            $(document).ready(function () {
                $('.bxslider').bxSlider({
                    mode: 'fade',
                    auto: true,
                    minSlides: 1,
                    maxSlides: 2,
                    slideMargin: 0,
                    autoControls: false,
                    controls: false,
                    pager: false
                });
            });
        </script>

        <script type="text/javascript">
            //document.getElementById('button').addEventListener('click', () => {
            //    if (screenfull.enabled) {
            //        screenfull.request();
            //    }
            //    else {
            //        alert('Error');
            //    }
            //});
        </script>

    </head>
    
    <body onload="startTime()" class="background">
        <form runat="server">
            <div id="main-div">
                <section id="header">
                    <div id="header-main" class="header-background">
                        <div id="header-time">
<%--                            <div id="Time" runat="server" class="time text"></div>--%>
                        </div>
                        <div id="header-date">
<%--                            <div id="Date" runat="server" class="date text"></div>--%>
                        </div>
                        <div id="image-logo">
                            <img src="Content/Aviation-logo.png" />
                        </div>
                    </div>
                </section>

                           

                <section id="slider" style="width:100%; height:600px;">
                     <ul class="bxslider">
                                <li><img src="Content/150590251756520.jpg" style="width: 100%; height:600px; display:block" /></li>
                                <li><img src="Content/engine_home.jpg" style="width: 100%; height:600px; display:block"/></li>
                     </ul>
                    <!--<div id="slider-images" style="position: relative; left:0px; width:100%; height:100%; overflow:hidden;">
                        <ul style="position: absolute; top:0px; left:0px; width:100%;  z-index: 10; backface-visibility:hidden;">
                            <li><img src="Content/150590251756520.jfif" style="width: 100%; display:block" /></li>
                        </ul>
                    </div>-->
                </section>

                <section id="content">

                    <div id="content-main">
                            <div id="content-title">
                                <asp:Label ID="lblTitle" runat="server" Text="Welcome To Harrods Aviation" CssClass="text welcometext"></asp:Label>
                            </div>
                            
                            <div id="content-main2">
                                <div id="Time" runat="server" class="time text"></div>
                                <div id="Date" runat="server" class="date text"></div>
                            </div>

                            <div id="content-buttons">
                                <button runat="server" ID="btnCheckOut" type="submit" class="checkout_btn" onServerClick="btnCheckOut_Click">
                                    <i class="fa fa-sign-out btn-Check" aria-hidden="true"></i>
                                    <span>Check Out</span>
                                </button>

                                 <%--<button runat="server" ID="btnLanguage" type="submit"  class="lang_btn">
                                        <img src="Content/language icon resized.png" alt=""/>
                                        Change Language
                                 </button>--%>

                                <%--<button runat="server" id="button"></button>--%>

                                <button runat="server" ID="btnCheckIn" type="button" class="checkin_btn" >
                                    <i class="fa fa-sign-in btn-Check" aria-hidden="true"></i>
                                    <span>Check In</span>
                                </button>


                            </div>
                    </div>
                </section>

                <section id="overlay">
                    <div id="overlay-main">
                        <div id="overlay-content" class="overlay-box overlay">
                            <div id="overlay-header">
                                <asp:Label ID="lblHeader" runat="server" Text="Please enter your details"></asp:Label>
                                <button type="button" runat="server" id="btnContinue" class="continue-button">
                                    <span>Continue
                                    <i class="fa fa-arrow-right" aria-hidden="true"></i>
                                        </span>
                                </button>
                                <hr />
                            </div>
                            <asp:Label id="lblName" runat="server" Text="Full Name: " CssClass="test"></asp:Label>
                            <asp:TextBox ID="txtName" runat="server" CssClass="test textbox" style="margin-right:20%; margin-left:10%;"></asp:TextBox>
                            <hr />
                            <asp:Label ID="lblCompany" runat="server" Text="Company: " CssClass="test"></asp:Label>
                            <asp:TextBox ID="txtCompany" runat="server" CssClass="test textbox" style="margin-right:25%; margin-left:11.4%;"></asp:TextBox>
                            <hr />
                            <asp:Label ID="lblVisiting" runat="server" Text="Visiting: " CssClass="test"></asp:Label>
                            <asp:TextBox ID="txtVisiting" runat="server" CssClass="test textbox" style="margin-left:14.3%;"></asp:TextBox>
                        </div>
                                <button type="button" id="test" class="exit"><span>X</span></button>

                        <div id="HandS">
                            <div>
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
                                <hr />
                                </div>
                            <div id="signature">
                                <asp:Label ID="lblSig" runat="server" Text="By signing below, I have read and understood the above text"></asp:Label>
                                <div id="sig" class="kbw-signature">
                                </div>
                            </div>
                        </div>
                       <button type="button" runat="server" id="test2" class="exit"><span>X</span></button>
                    </div>
                </section>

         <%--       <section id="H&S">
                    <div id="safety-main" class="overlay">
                        <div id="safety-content" class="safety-box">
                             <div id="panel" runat="server" style="overflow-y:auto; height:700px; border:1px solid black;" class="panel">
                                 
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
                        </div>
                       <button type="button" runat="server" id="test2" class="exit"><span>X</span></button>
                    </div>
                </section>--%>

            </div>

            <script type="text/javascript">
                      $(function () {
                          $('#sig').signature();
                      });
            </script>

            <script type="text/javascript">
                    $(document).ready(function () {
                        $("#btnCheckIn").click(function () {
                            $("#main-div").addClass("dimmed");
                            $("#overlay-content").fadeIn();
                            $("#test").fadeIn();
                            $("#test2").fadeOut();
                        });
                        $('#test').click(function () {
                            $("#overlay-content").fadeOut();
                            $("#main-div").removeClass("dimmed");
                            $("#test").fadeOut();
                        });
                    });
                </script>

            <script type="text/javascript">
                $(document).ready(function () {
                    $("#btnContinue").click(function () {
                        $("#HandS").fadeToggle("hs");
                        $("#main-div").removeClass("dimmed");
                        $("#HandS").fadeIn();
                        $("#overlay-content").fadeOut();
                        $("#test").fadeOut();
                        $("#test2").fadeIn();
                        //$("#safety-main").toggleClass("overlay");
                    });
                    $("#test2").click(function () {
                        $("#main-div").removeClass("dimmed");
                        $("#HandS").fadeOut();
                        $("#test2").fadeOut();
                        //$("#safety-main").toggleClass("overlay");
                    });
                });
            </script>
            
             
         </form>
      </body>
</html>
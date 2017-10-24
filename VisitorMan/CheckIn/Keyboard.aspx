<%@ Page Title="Keyboard" Language="C#" AutoEventWireup="true" CodeBehind="Keyboard.aspx.cs" Inherits="VisitorMan.Keyboard" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

	<title>Online Keyboard</title>
    <script src="../Scripts/jquery-1.11.1.js" type="text/javascript"></script>
    <script src="../Scripts/keyboard.js" type="text/javascript"></script>

    <link href="../Content/font-awesome.css" type="text/css" rel="stylesheet" />
    <link href="../Content/CheckIn/style.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form runat="server">
    <section id="header">
        <div id="header-main">
            <div id="image-logo">
                <img src="../Content/Aviation-logo.png" />
            </div>
        </div>
    </section>

    <hr />

    <section id="content">
        <div id="content-main">
            <%--<input type="text" ID="write2" placeholder="Enter Name..." ReadOnly="true" />--%>
            <textarea id="write" name="write" placeholder="Enter Name..." readonly="true"></textarea>
        </div>
    </section>

<div id="container">
<%--	<textarea id="write" rows="6" cols="60" readonly="true"></textarea>--%>
    <section id="keyboard-main">
        <ul id="keyboard">
		        
           
                <li class="letter toprow">q</li>
		        <li class="letter toprow">w</li>
		        <li class="letter toprow">e</li>
		        <li class="letter toprow">r</li>
		        <li class="letter toprow">t</li>
		        <li class="letter toprow">y</li>
		        <li class="letter toprow">u</li>
		        <li class="letter toprow">i</li>
		        <li class="letter toprow">o</li>
		        <li class="letter toprow">p</li>
     

		        <li class="capslock">caps lock</li>
		        <li class="letter">a</li>
		        <li class="letter">s</li>
		        <li class="letter">d</li>
		        <li class="letter">f</li>
		        <li class="letter">g</li>
		        <li class="letter">h</li>
		        <li class="letter">j</li>
		        <li class="letter">k</li>
		        <li class="letter">l</li>
                <li class="delete lastitem">delete</li>

		        <li class="left-shift">shift</li>
		        <li class="letter">z</li>
		        <li class="letter">x</li>
		        <li class="letter">c</li>
		        <li class="letter">v</li>
		        <li class="letter">b</li>
		        <li class="letter">n</li>
		        <li class="letter">m</li>
		  
		        <li class="right-shift lastitem">shift</li>
		        <li class="space lastitem">&nbsp;</li>
	    </ul>
    </section>

    <section id="buttons">
        <div id="buttons-main">
                <button runat="server" id="btnNext" type="submit" class="btnNext" onserverclick="btnNext_ServerClick">
                        <span>Next</span>
                        <i class="fa fa-long-arrow-right" aria-hidden="true"></i>
                </button>
        </div>
    </section>
</div>
</form>
</body>
</html>
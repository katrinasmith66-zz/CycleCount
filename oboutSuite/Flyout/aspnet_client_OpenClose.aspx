<%@ Page Language="C#" %>

<!-- Register Flyout component -->
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET"%>


<html>
	<head>
        <title>Client Manually Open and Close</title>
 		    <style type="text/css">
			    body {
				    font:11px Verdana;
				    color:#333333;
			    }
			    a {
				    font:11px Verdana;
				    color:#315686;
				    text-decoration:underline;
			    }
			    a:hover {
				    color:crimson;
			    }
		    </style>          
	</head>
	<body>
	    <a href="Default.aspx?div=aspnet">� Back to examples</a>
        <br /><br /><br /><br />
        <br /><br /><br /><br />
        <input type="button" value="Open" onclick="<%=Flyout1.getClientID()%>.Open();"/>
         <input type="button" value="Close" onclick="<%=Flyout1.getClientID()%>.Close();"/>
        
        <!-- Create a link-->
        <center>
            <a id="ad1" href="http://www.obout.com/calendar/" style="font-family:Verdana;font-size:8pt;">Calendar</a>	

         
	    </center>        
			
		<!-- Create Flyout with basic styles -->
        <obout:Flyout runat="server" ID="Flyout1"  AttachTo="ad1" OpenEvent="NONE" CloseEvent="NONE">
	        <img src="images/calendar.jpg"/>
        </obout:Flyout>			
        
        
	</body>
</html>

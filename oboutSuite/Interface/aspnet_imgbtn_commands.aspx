<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<script type="text/C#" runat="server">
    protected void Btn_Command(object sender, CommandEventArgs e)
    {
        label1.Text = "<br /><br />Button '" + ((OboutImageButton)sender).ID + "' has been pressed.<br />";
        label1.Text += "CommandName: '" + e.CommandName + "' / CommandArgument: '" + e.CommandArgument.ToString() + "'"; 
    }
</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 

<html>
	<head>
		<title>obout Interface examples</title>
		<style type="text/css">
			.tdText {
				font:11px Verdana;
				color:#333333;
			}			
			
			.option2{
				font:11px Verdana;
				color:#0033cc;				
				padding-left:4px;
				padding-right:4px;
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
		<form id="Form1" runat="server">
		
		<br /><br />
		
		<span class="tdText"><b>obout Interface - OboutImageButton - Server-Side Commands</b></span>
		
		<br /><br />
		
		<obout:OboutImageButton runat="server" ID="OboutImageButton1"
		    ImageUrl="images/buy_normal.gif" ImageUrl_Over="images/buy_over.gif"
		    ImageUrl_Focused="images/buy_focused.gif" ImageUrl_Pressed="images/buy_pressed.gif"
		    CommandName="Add" CommandArgument="arg1" OnCommand="Btn_Command"
		    />
		     
		&#160;
		
		<obout:OboutImageButton runat="server" ID="OboutImageButton2"
		    ImageUrl="images/ICQ_normal.gif" ImageUrl_Over="images/ICQ_over.gif"
		    ImageUrl_Focused="images/ICQ_focused.gif" ImageUrl_Pressed="images/ICQ_pressed.gif"
		    CommandName="Edit" CommandArgument="arg2" OnCommand="Btn_Command"
		    />
		
		<span class="tdText">
		    <asp:Literal runat="server" ID="label1" />
		</span>
		  
        <br /><br />
		
		<span class="tdText">
		    Use the <b>CommandName</b> and <b>CommandArgument</b> properties to configure the parameters for the commands raised by the buttons.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">� Back to examples</a>		
		
		</form>    
	</body>
</html>
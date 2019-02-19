<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<script type="text/C#" runat="server">
    OboutButton OboutButton1;
    OboutTextBox OboutTextBox1;

    void Page_load(object sender, EventArgs e)
    {
        OboutTextBox1 = new OboutTextBox();
        OboutTextBox1.ID = "OboutTextBox1";
        OboutTextBox1.FolderStyle = "styles/premiere_blue/OboutTextBox";
        OboutTextBox1.Text = "Some Text";

        PlaceHolder1.Controls.Add(OboutTextBox1);

        OboutButton1 = new OboutButton();
        OboutButton1.ID = "OboutButton1";
        OboutButton1.FolderStyle = "styles/premiere_blue/OboutButton";
        OboutButton1.Text = "Post to other page >>";
        OboutButton1.PostBackUrl = "aspnet_btn_postbackurl_target.aspx";

        PlaceHolder2.Controls.Add(OboutButton1);
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
		
		<span class="tdText"><b>obout Interface - OboutButton - Using the PostBackUrl Property</b></span>
		
		<br /><br />
		
		<asp:PlaceHolder runat="server" ID="PlaceHolder1" />
		
		<br /><br />

		<asp:PlaceHolder runat="server" ID="PlaceHolder2" />
		  
        <br /><br />
		
		<span class="tdText">
		    To post the form to a different page, specify that page using the <b>PostBackUrl</b> property.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=CSHARP">� Back to examples</a>		
		
		</form>    
	</body>
</html>
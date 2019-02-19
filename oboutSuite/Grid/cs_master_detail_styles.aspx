﻿<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<script language="C#" runat="server">
    Grid grid1 = new Grid();
    DetailGrid grid2 = new DetailGrid();
    DetailGrid grid3 = new DetailGrid();

    void Page_load(object sender, EventArgs e)
    {
        // Creating grid1
        grid1.ID = "grid1";
        grid1.CallbackMode = true;
        grid1.Serialize = false;
        grid1.AutoGenerateColumns = false;
        grid1.FolderStyle = "_";
        grid1.AllowAddingRecords = false;
        grid1.DataSourceID = "sds1";
        grid1.AllowPageSizeSelection = false;

        grid1.CssSettings.CSSFolderImages = "resources/custom-styles/black_glass";
        grid1.MasterDetailSettings.LoadingMode = DetailGridLoadingMode.OnCallback;
        
        // creating the columns
        Column oCol1 = new Column();
        oCol1.DataField = "CustomerID";        
        oCol1.HeaderText = "CUSTOMER ID";
        oCol1.Visible = false;
        
        Column oCol2 = new Column();
        oCol2.DataField = "CompanyName";        
        oCol2.HeaderText = "COMPANY NAME";
        oCol2.Width = "250";
        
        Column oCol3 = new Column();
        oCol3.DataField = "ContactName";        
        oCol3.HeaderText = "CONTACT NAME";
        
        Column oCol4 = new Column();
        oCol4.DataField = "Country";        
        oCol4.HeaderText = "COUNTRY";

        // add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1);
        grid1.Columns.Add(oCol2);
        grid1.Columns.Add(oCol3);
        grid1.Columns.Add(oCol4);
        
        
        
        // Creating grid2
        grid2.ID = "grid2";
        grid2.CallbackMode = true;
        grid2.Serialize = false;
        grid2.AutoGenerateColumns = false;
        grid2.FolderStyle = "_";
        grid2.AllowAddingRecords = false;
        grid2.ShowFooter = true;
        grid2.AllowPageSizeSelection = false;
        grid2.AllowPaging = false;
        grid2.DataSourceID = "sds2";
        grid2.ForeignKeys = "CustomerID";

        grid2.CssSettings.CSSFolderImages = "resources/custom-styles/premiere_blue";
        grid2.MasterDetailSettings.LoadingMode = DetailGridLoadingMode.OnCallback;
        
        // creating the columns
        Column oCol2_1 = new Column();
        oCol2_1.DataField = "CustomerID";        
        oCol2_1.HeaderText = "CUSTOMER ID";
        oCol2_1.Visible = false;
        
        Column oCol2_2 = new Column();
        oCol2_2.DataField = "OrderID";        
        oCol2_2.HeaderText = "ORDER ID";
        oCol2_2.Visible = false;
        
        Column oCol2_3 = new Column();
        oCol2_3.DataField = "OrderDate";
        oCol2_3.HeaderText = "ORDER DATE";
        oCol2_3.Width = "215";
        oCol2_3.DataFormatString = "{0:MM/dd/yyyy}";
        
        Column oCol2_4 = new Column();
        oCol2_4.DataField = "ShippedDate";        
        oCol2_4.HeaderText = "SHIPPED DATE";
        oCol2_4.DataFormatString = "{0:MM/dd/yyyy}";
        
        Column oCol2_5 = new Column();
        oCol2_5.DataField = "Freight";        
        oCol2_5.HeaderText = "FREIGHT";
        oCol2_5.DataFormatString = "{0:C2}";

        // add the columns to the Columns collection of the grid
        grid2.Columns.Add(oCol2_1);
        grid2.Columns.Add(oCol2_2);
        grid2.Columns.Add(oCol2_3);
        grid2.Columns.Add(oCol2_4);
        grid2.Columns.Add(oCol2_5);
        
        
        
        // Creating grid3
        grid3.ID = "grid3";
        grid3.CallbackMode = true;
        grid3.Serialize = false;
        grid3.AutoGenerateColumns = false;
        grid3.FolderStyle = "_";
        grid3.AllowAddingRecords = false;
        grid3.ShowFooter = true;
        grid3.AllowPageSizeSelection = false;
        grid3.AllowPaging = false;
        grid3.DataSourceID = "sds3";
        grid3.ForeignKeys = "OrderID";

        grid3.CssSettings.CSSFolderImages = "resources/custom-styles/grand_gray";
        
        // creating the columns
        Column oCol3_1 = new Column();
        oCol3_1.DataField = "OrderID";        
        oCol3_1.HeaderText = "ORDER ID";
        oCol3_1.Visible = false;
        
        Column oCol3_2 = new Column();
        oCol3_2.DataField = "OrderID";        
        oCol3_2.HeaderText = "ORDER ID";
        oCol3_2.Visible = false;
        
        Column oCol3_3 = new Column();
        oCol3_3.DataField = "UnitPrice";
        oCol3_3.HeaderText = "UNIT PRICE";
        oCol3_3.Width = "180";
        oCol3_3.DataFormatString = "{0:C2}";
        
        Column oCol3_4 = new Column();
        oCol3_4.DataField = "Quantity";        
        oCol3_4.HeaderText = "QUANTITY";
        oCol3_4.Width = "180";
        
        Column oCol3_5 = new Column();
        oCol3_5.DataField = "Discount";
        oCol3_5.HeaderText = "DISCOUNT";
        oCol3_5.DataFormatString = "{0:F2}%";
        oCol3_5.Width = "180";

        // add the columns to the Columns collection of the grid
        grid3.Columns.Add(oCol3_1);
        grid3.Columns.Add(oCol3_2);
        grid3.Columns.Add(oCol3_3);
        grid3.Columns.Add(oCol3_4);
        grid3.Columns.Add(oCol3_5);


        grid2.DetailGrids.Add(grid3);
        grid1.DetailGrids.Add(grid2);        
        
            
            
        // add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1);
    }
</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 

<html>
	<head>
		<title>obout ASP.NET Grid examples</title>
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
		<link href="resources/custom-styles/black_glass/style.css" rel="Stylesheet" type="text/css" />	
		<link href="resources/custom-styles/grand_gray/style.css" rel="Stylesheet" type="text/css" />		
		<link href="resources/custom-styles/premiere_blue/style.css" rel="Stylesheet" type="text/css" />		
	</head>
	<body>	
		<form id="Form1" runat="server">					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Master / Detail - Different Styles</b></span>		
		
		<br /><br />
        <div class="master">
            <asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
		</div
		<br /><br />				
		
		<span class="tdText">
		    You can apply different styles for Master and Detail grids by using the CssSettings property or by using custom stylesheets.
		</span>
				
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 3 * FROM [Customers]"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		 
		<asp:SqlDataSource runat="server" ID="sds2" SelectCommand="SELECT * FROM [Orders] WHERE CustomerID = ?"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb">
		    <SelectParameters>
                <asp:Parameter Name="CustomerID" Type="String" />
            </SelectParameters>
		</asp:SqlDataSource>
		
		<asp:SqlDataSource runat="server" ID="sds3" SelectCommand="SELECT * FROM [Order Details] WHERE OrderID = ?"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb">
		    <SelectParameters>
                <asp:Parameter Name="OrderID" Type="Int32" />
            </SelectParameters>
		</asp:SqlDataSource>
		
		<br /><br />
		<span class="tdText">
		You can have Master / Detail Grids with different styles on the same page, by using the CssSettings property <br />or by using custom stylesheets.
        <br /><br />
        CssSettings should be used for minor customizations, custom stylesheets should be used when using many <br />controls with different styles on the same page (as in this example).

		<br /><br />
		See the <a href="http://www.obout.com/grid/grid_tutorials_styles_advanced.aspx">Advanced Styles Tutorial</a>
		</span>
		
		<br /><br /><br />
 
		<a href="Default.aspx?type=CSHARP">« Back to examples</a>
		
		</form>
	</body>
</html>
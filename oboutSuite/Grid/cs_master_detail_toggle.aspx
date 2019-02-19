<%@ Page Language="C#" %>
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
        grid1.FolderStyle = "styles/grand_gray";
        grid1.AllowAddingRecords = false;
        grid1.DataSourceID = "sds1";

        grid1.MasterDetailSettings.LoadingMode = DetailGridLoadingMode.OnLoad;
        
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
        grid2.FolderStyle = "styles/grand_gray";
        grid2.AllowAddingRecords = false;
        grid2.ShowFooter = true;
        grid2.AllowPageSizeSelection = false;
        grid2.AllowPaging = false;
        grid2.DataSourceID = "sds2";
        grid2.ForeignKeys = "CustomerID";
        grid2.PageSize = 1;

        grid2.MasterDetailSettings.LoadingMode = DetailGridLoadingMode.OnLoad;
        
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
        oCol2_3.Width = "225";
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
        grid3.FolderStyle = "styles/grand_gray";
        grid3.AllowAddingRecords = false;
        grid3.ShowFooter = true;
        grid3.AllowPageSizeSelection = false;
        grid3.AllowPaging = false;
        grid3.DataSourceID = "sds3";
        grid3.ForeignKeys = "OrderID";
        
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
        oCol3_3.Width = "185";
        oCol3_3.DataFormatString = "{0:C2}";
        
        Column oCol3_4 = new Column();
        oCol3_4.DataField = "Quantity";        
        oCol3_4.HeaderText = "QUANTITY";
        oCol3_4.Width = "185";
        
        Column oCol3_5 = new Column();
        oCol3_5.DataField = "Discount";
        oCol3_5.HeaderText = "DISCOUNT";
        oCol3_5.DataFormatString = "{0:F2}%";
        oCol3_5.Width = "185";

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

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> <html>
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
			
			input.tdText 
			{
				width: 150px;
			}
		</style>
		<script type="text/javascript">
		    var elementsToExpand;
		    function toggleDetailLevel(level, expand) {
		        var elements = document.getElementsByTagName('IMG');
		        elementsToExpand = new Array();
		        for (var i = 0; i < elements.length; i++) {
		            try {
		                if (elements[i].parentNode.className == 'ob_gDGEB') {
		                    var isExpanded = false;
		                    if (elements[i].src.toString().indexOf('details_btn_open.gif') == -1) {
		                        isExpanded = true;
		                    }

		                    if (isExpanded != expand && level == getDetailGridLevel(elements[i])) {
		                        elementsToExpand.push(elements[i]);
		                        window.setTimeout('toggleDetailGrid(' + (elementsToExpand.length - 1) + ')', 250);
		                    }
		                }
		            } catch (ex) { };
		        }
		    }

		    function toggleDetailGrid(i) {
		        try {
		            elementsToExpand[i].onclick();
		        } catch (ex) { };
		    }

		    function getDetailGridLevel(element) {
		        var level = 0;
		        while (element.parentNode && element.id != grid1.GridBodyContainer.id) {
		            element = element.parentNode;

		            if (element.className == 'ob_gDGCCT') {
		                level++;
		            }
		        }

		        return level;
		    }
		</script>
	</head>
	<body>	
		<form runat="server">					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Master / Detail - Expand / Collapse All Details</b></span>		
		
		<br /><br />

        <asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
		
		<br /><br />
		
		<input type="button" value="Expand 1st level" onclick="toggleDetailLevel(0, true)" class="tdText" /> 
		<input type="button" value="Expand 2nd level" onclick="toggleDetailLevel(1, true)" class="tdText" /> 
		
		<br />
		
		<input type="button" value="Collapse 1st level" onclick="toggleDetailLevel(0, false)" class="tdText" /> 
		<input type="button" value="Collapse 2nd level" onclick="toggleDetailLevel(1, false)" class="tdText" />
		
		<br /><br />
		
		<span class="tdText">
		    You can expand/collapse all detail levels by using a custom JavaScript function: <span class="option2">toggleDetailLevel</span> <br />
		    This feature works with both <b>OnCallback</b> and <b>OnLoad</b> patterns.
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
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=CSHARP">� Back to examples</a>
		
		</form>
	</body>
</html>
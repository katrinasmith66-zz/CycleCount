<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script language="C#" runat="server">
	Grid grid1 = new Grid();
	
	void Page_load(object sender, EventArgs e)		
	{																
		grid1.ID = "grid1";		
		grid1.CallbackMode = true;				
		grid1.Serialize = true;
		grid1.AutoGenerateColumns = false;
		grid1.AllowSorting = true;
		grid1.AllowAddingRecords = false;
        grid1.AllowFiltering = true;
		
		// setting the initial paging properties
		grid1.PageSize = 5;
		grid1.CurrentPageIndex = 5;
		
		
		grid1.FolderStyle = "styles/premiere_blue";		
		
		// creating the columns
		Column oCol1 = new Column();
		oCol1.DataField = "ProductID";
		oCol1.ReadOnly = true;
		oCol1.HeaderText = "Product ID";
        oCol1.Width = "175";
		
		Column oCol2 = new Column();
		oCol2.DataField = "ProductName";		
		oCol2.HeaderText = "Product Name";
        oCol2.Width = "275";
		
		Column oCol3 = new Column();
		oCol3.DataField = "UnitPrice";		
		oCol3.HeaderText = "Unit Price";
        oCol3.Width = "250";
		
		Column oCol4 = new Column();
		oCol4.DataField = "Discontinued";		
		oCol4.HeaderText = "Discontinued";
        oCol4.Width = "150";													

		// add the columns to the Columns collection of the grid
		grid1.Columns.Add(oCol1);
		grid1.Columns.Add(oCol2);
		grid1.Columns.Add(oCol3);
		grid1.Columns.Add(oCol4);
		
		// add the grid to the controls collection of the PlaceHolder
		phGrid1.Controls.Add(grid1);
		
		if (!Page.IsPostBack)
		{
			BindGrid();			
		}		
	}

	void BindGrid()
	{
		OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));

		OleDbCommand myComm = new OleDbCommand("SELECT * FROM Products", myConn);
		myConn.Open();		
		OleDbDataReader myReader = myComm.ExecuteReader();


		grid1.DataSource = myReader;
		grid1.DataBind();

		myConn.Close();	
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
		</style>		
	</head>
	<body>	
		<form runat="server">
		
		<br />
		<span class="tdText"><b>ASP.NET Grid Paging</b></span>
		<br /><br />				
		
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>

		<br /><br />

		<span class="tdText">
			The Grid has two properties for paging:<br />
			<ul>
				<li type="disc">
					<b>PageSize</b> - the number of records per page
				</li>
				<li type="disc">
					<b>CurrentPageIndex</b> - the zero-based index of the page that will be loaded
				</li>
			</ul>
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=CSHARP">� Back to examples</a>
		
		</form>
	</body>
</html>
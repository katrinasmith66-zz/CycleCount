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
        grid1.AllowPageSizeSelection = false;
		grid1.FolderStyle = "styles/grand_gray";
        grid1.AllowFiltering = true;
        grid1.DataSourceID = "sds1";
        grid1.ShowLoadingMessage = true;
        grid1.AllowAddingRecords = false;

        grid1.FilteringSettings.InitialState = GridFilterState.Visible; 
		
		// creating the columns
		Column oCol1 = new Column();
		oCol1.DataField = "OrderID";
		oCol1.ReadOnly = true;
        oCol1.Visible = false;
		oCol1.HeaderText = "ORDER ID";
		oCol1.Width = "100";
		
		Column oCol2 = new Column();
		oCol2.DataField = "ShipName";		
		oCol2.HeaderText = "NAME";
		oCol2.Width = "200";
        oCol2.ShowFilterCriterias = false;
		
		Column oCol3 = new Column();
		oCol3.DataField = "ShipCity";		
		oCol3.HeaderText = "CITY";
		oCol3.Width = "150";
        oCol3.ShowFilterCriterias = false;
		
		Column oCol4 = new Column();
		oCol4.DataField = "ShipPostalCode";		
		oCol4.HeaderText = "POSTAL CODE";
		oCol4.Width = "150";
        oCol4.ShowFilterCriterias = false;
											
		Column oCol5 = new Column();
		oCol5.DataField = "ShipCountry";		
		oCol5.HeaderText = "COUNTRY";
		oCol5.Width = "150";
        oCol5.ShowFilterCriterias = false;

		// add the columns to the Columns collection of the grid
		grid1.Columns.Add(oCol1);
		grid1.Columns.Add(oCol2);
		grid1.Columns.Add(oCol3);
		grid1.Columns.Add(oCol4);
		grid1.Columns.Add(oCol5);
		
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
		</style>
		<script type="text/javascript">
		    window.onload = function() {
		        var elements = document.getElementsByTagName('INPUT');
		        for (var i = 0; i < elements.length; i++) {
		            if (elements[i].type == 'text' && elements[i].id.indexOf('FilterControl') != -1) {
		                attachEventHandler(elements[i], 'blur', applyFilter)
		            }
		        }
		    }

		    function applyFilter() {
		        grid1.filter();
		    }

		    function standardizeEvent(e) {
		        if (!e) var e = window.event;
		        if (!e.target) e.target = e.srcElement
		        return e
		    }

		    function createHandlerFunction(obj, fn) {
		        var o = new Object;
		        o.myObj = obj;
		        o.calledFunc = fn;

		        o.myFunc = function(e) {
		            var e = standardizeEvent(e);
		            return o.calledFunc.call(o.myObj, e);
		        }
		        return o.myFunc;
		    }

		    function attachEventHandler(obj, evType, fn) {
		        var handler = null;

		        if (obj.addEventListener) {
		            var handler = createHandlerFunction(obj, fn);
		            obj.addEventListener(evType, handler, null);
		        } else if (obj.attachEvent) {
		            var handler = createHandlerFunction(obj, fn);
		            obj.attachEvent("on" + evType, handler);
		        }
		    }
		</script>		
	</head>
	<body>	
		<form runat="server">
					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Filter On Blur</b></span>
		<br /><br />
		
		
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
					
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 25 * FROM Orders"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		<br /><br /><br />
		
		<span class="tdText">
    		This example demonstrates the ability to automatically filter the Grid when the filter text boxes lose the focus.<br />
    		Type a search string in one of the filter text boxes and then hit the TAB key or click outside the text box to trigger the filtering.<br /><br />
    		
    		This sample uses custom JavaScript code that attaches <span class="option2">onblur</span> event handlers to the filter text boxes. <br />
    		These event handlers call the client-side "filter" method of the Grid, which performs the filtering.
		</span>
		
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=CSHARP">� Back to examples</a>
		
		</form>
	</body>
</html>
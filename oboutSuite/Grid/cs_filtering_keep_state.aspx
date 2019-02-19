﻿<%@ Page Language="C#" %>
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
        grid1.AllowAddingRecords = false;
        grid1.AllowPageSizeSelection = false;

        grid1.FolderStyle = "styles/premiere_blue";
        grid1.AllowFiltering = true;
        grid1.ShowLoadingMessage = false;

        // setting the event handlers
		grid1.Rebind += new Obout.Grid.Grid.DefaultEventHandler(RebindGrid);
													
		// creating the columns
		Column oCol1 = new Column();
		oCol1.DataField = "SupplierID";
		oCol1.ReadOnly = true;
		oCol1.HeaderText = "ID";
        oCol1.Width = "120";

		Column oCol2 = new Column();
		oCol2.DataField = "CompanyName";
		oCol2.HeaderText = "COMPANY NAME";
		oCol2.Width = "250";
	
		Column oCol3 = new Column();
		oCol3.DataField = "Address";
		oCol3.HeaderText = "COMPANY ADDRESS";
		oCol3.Width = "250";

		Column oCol4 = new Column();
		oCol4.DataField = "Country";
		oCol4.HeaderText = "COUNTRY";
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

		OleDbCommand myComm = new OleDbCommand("SELECT * FROM Suppliers", myConn);
		myConn.Open();		
		OleDbDataReader myReader = myComm.ExecuteReader();

		grid1.DataSource = myReader;
		grid1.DataBind();

		myConn.Close();	
	}

   	void RebindGrid(object sender, EventArgs e)
	{
		BindGrid();
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
				background-color___:#f6f9fc;
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


		    var filterCriteria;
		    function getCookie(c_name) {
		        if (document.cookie.length > 0) {
		            c_start = document.cookie.indexOf(c_name + "=");
		            if (c_start != -1) {
		                c_start = c_start + c_name.length + 1;
		                c_end = document.cookie.indexOf(";", c_start);
		                if (c_end == -1) c_end = document.cookie.length;
		                return unescape(document.cookie.substring(c_start, c_end));
		            }
		        }
		        return "";
		    }

		    function setCookie(c_name, value, expiredays) {
		        var exdate = new Date();
		        exdate.setDate(exdate.getDate() + expiredays);
		        document.cookie = c_name + "=" + escape(value) +
                ((expiredays == null) ? "" : ";expires=" + exdate.toGMTString());
		    }


		    function storeFilter() {
		        var colsCount = grid1.GridBodyContainer.firstChild.firstChild.firstChild.firstChild.childNodes.length;

		        for (var i = 0; i < colsCount; i++) {
		            var filterDdl = eval('ob_ob_grid1FilterContainerFCTb' + i);
		            var filterTxt = eval('ob_grid1FilterControl' + i);

		            if (filterDdl && filterTxt) {
		                setCookie(filterDdl.ID, filterDdl.value(), 365);
		                setCookie(filterTxt.ID, filterTxt.value(), 365);
		            }
		        }
		    }

		    function addLoadEvent(func) {

		        var oldonload = window.onload;
		        if (typeof window.onload != 'function') {
		            window.onload = func;
		        } else {
		            window.onload = function() {
		                if (oldonload) {
		                    oldonload();
		                }
		                func();
		            }
		        }
		    }

		    function initialFilter() {
		        grid1.showFilter();

		        var colsCount = grid1.GridBodyContainer.firstChild.firstChild.firstChild.firstChild.childNodes.length;

		        for (var i = 0; i < colsCount; i++) {
		            var filterDdl = eval('ob_ob_grid1FilterContainerFCTb' + i);
		            var filterTxt = eval('ob_grid1FilterControl' + i);

		            if (filterDdl && filterTxt) {
		                filterDdl.value(getCookie(filterDdl.ID));
		                filterTxt.value(getCookie(filterTxt.ID));
		            }
		        }

		        window.setTimeout("grid1.filter();", 300);

		    }
    </script>
    		
	</head>
	<body>	
		<form id="Form1" runat="server">
					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Filtering - Keeping State</b></span>
		<br /><br />			
			
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
		
		<br /><br /><br />
		
        <span class="tdText">
            The applied filters can be stored in cookies. This allows users to keep their filter when they navigate back to the page. 
        </span>


		<br /><br /><br />
		
		<a href="Default.aspx?type=CSHARP">« Back to examples</a>
		
		</form>
		
		<script type="text/javascript">

		    addLoadEvent(function() {
		        oboutGrid.prototype.filterOld = oboutGrid.prototype.filter;
		        oboutGrid.prototype.filter = function() {
		            storeFilter();
		            this.filterOld();
		        }

		        window.setTimeout('initialFilter()', 500);
		    });
    
</script>
		
	</body>
</html>
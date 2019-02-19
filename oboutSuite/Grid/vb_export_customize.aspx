<%@ Page Language="VB" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script language="VB" runat="server">
	Dim grid1 As Obout.Grid.Grid = New Grid()
	
	Sub Page_load(ByVal sender As Object, ByVal e As EventArgs )
		grid1.ID = "grid1"
		grid1.CallbackMode = True
		grid1.Serialize = True
		grid1.AutoGenerateColumns = False
		
        grid1.FolderStyle = "styles/grand_gray"
        grid1.AllowFiltering = True

		' setting the event handlers
		AddHandler CType(grid1, Grid).InsertCommand, AddressOf InsertRecord
		AddHandler CType(grid1, Grid).DeleteCommand, AddressOf DeleteRecord
		AddHandler CType(grid1, Grid).UpdateCommand, AddressOf UpdateRecord
		AddHandler CType(grid1, Grid).Rebind, AddressOf RebindGrid
		
		' creating the columns
		Dim oCol1 As Column = new Column()
		oCol1.DataField = "OrderID"
		oCol1.ReadOnly = True
		oCol1.HeaderText = "ORDER ID"
		oCol1.Width = "100"

		Dim oCol2 As Column = new Column()
		oCol2.DataField = "ShipName"
		oCol2.HeaderText = "NAME"
        oCol2.Width = "250"

		Dim oCol3 As Column = new Column()
		oCol3.DataField = "ShipCity"
		oCol3.HeaderText = "CITY"
		oCol3.Width = "150"

		Dim oCol4 As Column = new Column()
		oCol4.DataField = "ShipPostalCode"
		oCol4.HeaderText = "POSTAL CODE"
        oCol4.Width = "150"

		Dim oCol5 As Column = new Column()
		oCol5.DataField = "ShipCountry"
		oCol5.HeaderText = "COUNTRY"
		oCol5.Width = "150"

		Dim oCol6 As Column = new Column()
		oCol6.HeaderText = "EDIT"
		oCol6.Width = "125"
        oCol6.AllowEdit = True
        oCol6.AllowDelete = True

		' add the columns to the Columns collection of the grid
		grid1.Columns.Add(oCol1)
		grid1.Columns.Add(oCol2)
		grid1.Columns.Add(oCol3)
		grid1.Columns.Add(oCol4)
		grid1.Columns.Add(oCol5)
		grid1.Columns.Add(oCol6)
		
		' add the grid to the controls collection of the PlaceHolder
		phGrid1.Controls.Add(grid1)
				
		If Not Page.IsPostBack Then
			BindGrid()			
        End If
        
        ' set the styles for the exported file            
        Dim sHeaderStyle As String = ""
        Dim sCellsStyle As String = ""

        
        ' Header
        If chkHeaderBold.Checked = True Then        
            sHeaderStyle = sHeaderStyle + "font-weight: bold;"
        Else        
            sHeaderStyle = sHeaderStyle + "font-weight: normal;"
        End If

        If chkHeaderItalic.Checked = True Then        
            sHeaderStyle = sHeaderStyle + "font-style: italic;"
        Else        
            sHeaderStyle = sHeaderStyle + "font-style: normal;"
        End If

        If chkHeaderUnderline.Checked = True Then        
            sHeaderStyle = sHeaderStyle + "text-decoration: underline;"
        Else        
            sHeaderStyle = sHeaderStyle + "text-decoration: none;"
        End If

        sHeaderStyle = sHeaderStyle + "color: " + ddlHeaderColor.SelectedValue + ";"
        sHeaderStyle = sHeaderStyle + "background-color: " + ddlHeaderBgColor.SelectedValue + ";"
        
        
        
        ' Cells
        If chkCellsBold.Checked = True Then
            sCellsStyle = sCellsStyle + "font-weight: bold;"
        Else       
            sCellsStyle = sCellsStyle + "font-weight: normal;"
        End If

        If chkCellsItalic.Checked = True Then        
            sCellsStyle = sCellsStyle + "font-style: italic;"
        Else
            sCellsStyle = sCellsStyle + "font-style: normal;"
        End If

        If chkCellsUnderline.Checked = True Then        
            sCellsStyle = sCellsStyle + "text-decoration: underline;"
        Else        
            sCellsStyle = sCellsStyle + "text-decoration: none;"
        End If

        sCellsStyle = sCellsStyle + "color: " + ddlCellsColor.SelectedValue + ";"
        sCellsStyle = sCellsStyle + "background-color: " + ddlCellsBgColor.SelectedValue + ";"
        
        
        grid1.CssSettings.CSSExportHeaderCellStyle = sHeaderStyle
        grid1.CssSettings.CSSExportCellStyle = sCellsStyle
    End Sub

	Sub BindGrid()
		Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))

		Dim myComm As OleDbCommand = New OleDbCommand("SELECT TOP 25 * FROM Orders ORDER BY OrderID DESC", myConn)
		myConn.Open()
		'Dim da = new OleDbDataAdapter()
		'Dim ds = new DataSet()
		'da.SelectCommand = myComm
		'da.Fill(ds, "Orders")
		Dim myReader As OleDbDataReader = myComm.ExecuteReader()


		grid1.DataSource = myReader
		grid1.DataBind()

		myConn.Close()
	End Sub
		
	Sub DeleteRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)
		Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))
        myConn.Open()
        
        Dim myComm As OleDbCommand = New OleDbCommand("DELETE FROM Orders WHERE OrderID = @OrderID", myConn)
        
        myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = e.Record("OrderID")
        
		myComm.ExecuteNonQuery()
		myConn.Close()
	End Sub
	
	Sub UpdateRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)
		Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))
        myConn.Open()
        
        Dim myComm As OleDbCommand = New OleDbCommand("UPDATE Orders SET ShipName = @ShipName, ShipCity = @ShipCity, ShipPostalCode=@ShipPostalCode, ShipCountry = @ShipCountry WHERE OrderID = @OrderID", myConn)

        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = e.Record("ShipName")
        myComm.Parameters.Add("@ShipCity", OleDbType.VarChar).Value = e.Record("ShipCity")
        myComm.Parameters.Add("@ShipPostalCode", OleDbType.VarChar).Value = e.Record("ShipPostalCode")
        myComm.Parameters.Add("@ShipCountry", OleDbType.VarChar).Value = e.Record("ShipCountry")
        myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = e.Record("OrderID")
        
        myComm.ExecuteNonQuery()
		myConn.Close()
	End Sub
	
	Sub InsertRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)
		Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))
		myConn.Open()
		
        Dim myComm As OleDbCommand = New OleDbCommand("INSERT INTO Orders (ShipName, ShipCity, ShipPostalCode, ShipCountry) VALUES(@ShipName, @ShipCity, @ShipPostalCode, @ShipCountry)", myConn)
		
        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = e.Record("ShipName")
        myComm.Parameters.Add("@ShipCity", OleDbType.VarChar).Value = e.Record("ShipCity")
        myComm.Parameters.Add("@ShipPostalCode", OleDbType.VarChar).Value = e.Record("ShipPostalCode")
        myComm.Parameters.Add("@ShipCountry", OleDbType.VarChar).Value = e.Record("ShipCountry")
  
        myComm.ExecuteNonQuery()
		myConn.Close()
	End Sub
	
	Sub RebindGrid(ByVal sender As Object, ByVal e As EventArgs)
		BindGrid()
	End Sub
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
		
		function exportToExcel() {		    		    
		    grid1.exportToExcel("OboutGrid", false, false, true)
		}
		
		function exportToWord() {		    
		    grid1.exportToWord("OboutGrid", false, false, true)
		}	
		
		</script>
	</head>
	<body>	
		<form runat="server">
					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Customizing the Exported files</b></span>
		<br /><br />
		
		
		<span class="tdText">Set the style properties for the Header and Cells from the exported file.</span>
		<br /><br />
		<table>
		    <tr>
		    
		        <td valign="top">
		            <table border="0">
		                <tr>
		                    <td class="tdText" valign="middle" colspan="2"><b><u>Header</u></b></td>		        
		                </tr>
		                <tr>		                    
		                    <td class="tdText" valign="middle">Bold</td>
		                    <td class="tdText" valign="middle"><asp:CheckBox runat="server" AutoPostBack="true" id="chkHeaderBold" Checked="true" /></td>
		                </tr>
		                <tr>
		                    <td class="tdText" valign="middle">Italic</td>
		                    <td class="tdText" valign="middle"><asp:CheckBox runat="server" AutoPostBack="true" id="chkHeaderItalic" Checked="true"/></td>		                    
		                </tr>
		                <tr>
		                    <td class="tdText" valign="middle">Underline</td>
		                    <td class="tdText" valign="middle" ><asp:CheckBox runat="server" AutoPostBack="true" id="chkHeaderUnderline" Checked="true"/></td>		                    
		                </tr>
		                <tr>
		                    <td class="tdText" valign="middle" align="left">
		                        Color:
		                    </td>
		                    <td class="tdText">
		                        <asp:DropDownList runat="server" ID="ddlHeaderColor" AutoPostBack="true" CssClass="tdText">
		                            <asp:ListItem Value="#000000">Black</asp:ListItem>
		                            <asp:ListItem Value="#0000FF" Selected="true">Blue</asp:ListItem>
		                            <asp:ListItem Value="#00FF00">Green</asp:ListItem>
		                            <asp:ListItem Value="#FF0000">Red</asp:ListItem>
		                        </asp:DropDownList>
		                    </td>		                    
		                </tr>	
		                <tr>
		                    <td class="tdText" valign="middle" align="left">
		                        Bg Color:
		                    </td>
		                    <td class="tdText">
		                        <asp:DropDownList runat="server" ID="ddlHeaderBgColor" AutoPostBack="true" CssClass="tdText">
		                            <asp:ListItem Value="#FFFFFF">White</asp:ListItem>
		                            <asp:ListItem Value="#0000FF">Blue</asp:ListItem>
		                            <asp:ListItem Value="#00FF00" Selected="true">Green</asp:ListItem>
		                            <asp:ListItem Value="#FF0000">Red</asp:ListItem>
		                        </asp:DropDownList>
		                    </td>		                    
		                </tr>		    		    
		            </table>
		        </td>
		        
                <td width="50">&#160;</td>
                
                <td valign="top">
		            <table border="0">
		                <tr>
		                    <td class="tdText" valign="middle" colspan="2"><b><u>Cells</u></b></td>		        
		                </tr>
		                <tr>		                    
		                    <td class="tdText" valign="middle">Bold</td>
		                    <td class="tdText" valign="middle"><asp:CheckBox runat="server" AutoPostBack="true" id="chkCellsBold"/></td>
		                </tr>
		                <tr>
		                    <td class="tdText" valign="middle">Italic</td>
		                    <td class="tdText" valign="middle"><asp:CheckBox runat="server" AutoPostBack="true" id="chkCellsItalic" Checked="true"/></td>		                    
		                </tr>
		                <tr>
		                    <td class="tdText" valign="middle">Underline</td>
		                    <td class="tdText" valign="middle" ><asp:CheckBox runat="server" AutoPostBack="true" id="chkCellsUnderline"/></td>		                    
		                </tr>
		                <tr>
		                    <td class="tdText" valign="middle" align="left">
		                        Color:
		                    </td>
		                    <td class="tdText">
		                        <asp:DropDownList runat="server" ID="ddlCellsColor" AutoPostBack="true" CssClass="tdText">
		                            <asp:ListItem Value="#000000">Black</asp:ListItem>
		                            <asp:ListItem Value="#0000FF">Blue</asp:ListItem>
		                            <asp:ListItem Value="#00FF00">Green</asp:ListItem>
		                            <asp:ListItem Value="#FF0000" Selected="true">Red</asp:ListItem>
		                        </asp:DropDownList>
		                    </td>		                    
		                </tr>	
		                <tr>
		                    <td class="tdText" valign="middle" align="left">
		                        Bg Color:
		                    </td>
		                    <td class="tdText">
		                        <asp:DropDownList runat="server" ID="ddlCellsBgColor" AutoPostBack="true" CssClass="tdText">
		                            <asp:ListItem Value="#FFFFFF" Selected="true">White</asp:ListItem>
		                            <asp:ListItem Value="#0000FF">Blue</asp:ListItem>
		                            <asp:ListItem Value="#00FF00">Green</asp:ListItem>
		                            <asp:ListItem Value="#FF0000">Red</asp:ListItem>
		                        </asp:DropDownList>
		                    </td>		                    
		                </tr>		    		    
		            </table>
		        </td>		        		        
		    </tr>
		    <tr>
		        <td valign="top" colspan="3">
		            <br /><br />
		            <input type="button" class="tdText" value="Export to Excel" onclick="exportToExcel()" />
		            <input type="button" class="tdText" value="Export to Word" onclick="exportToWord()" />		
		        </td>
		    </tr>
		</table>		
		
		<br /><br />	
			
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
					
		<br /><br /><br />
		
		<span class="tdText">
		Use the <b>CSSExportHeaderCellStyle</b>, <b>CSSExportCellStyle</b> and <b>CSSExportTableStyle</b> properties of the Grid class<br />
		to customize the layout of the file which contains the exported data from the Grid.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=VBNET">� Back to examples</a>
		
		</form>
	</body>
</html>
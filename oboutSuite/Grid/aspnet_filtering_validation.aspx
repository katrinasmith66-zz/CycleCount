<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
	<head>
		<title>obout ASP.NET Grid examples</title>
		<style type="text/css">
			.tdText {
				font:11px Verdana;
				color:#333333;
			}
			.floating
			{
			    float: left;
			    padding-right: 10px;
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
	        function grid1_OnFiltering(sender, filterFields, isFiltering) {
	            // isFiltering = true when the filters are applied
	            // isFiltering = false when the filters are removed

	            if (isFiltering) {
	                if (filterFields['ShipName'].Option != OboutGridFilterCriteria.NoFilter) {
	                    var filterFieldForShipName = filterFields['ShipName'].Controls[0].Control;
	                    if (filterFieldForShipName.value() == '') {
	                        alert('You need to fill in the filter field for the ShipName column.');
	                        return false;
	                    }
	                }

	                if (filterFields['ShipCountry'].Option != OboutGridFilterCriteria.NoFilter) {
	                    var filterFieldForShipCountry = filterFields['ShipCountry'].Controls[0].Control;
	                    if (filterFieldForShipCountry.value() == '') {
	                        alert('You need to fill in the filter field for the ShipCountry column.');
	                        return false;
	                    }
	                }
	            }

	            return true;
	        }	        
	    </script>		
	</head>	
	<body>	
		<form runat="server">					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Validating Filter Fields</b></span>		
		
		<br /><br />
		
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false"
			FolderStyle="styles/black_glass" AllowAddingRecords="false" DataSourceID="sds1" AllowFiltering="true">
			<ClientSideEvents OnFiltering="grid1_OnFiltering" ExposeSender="true" />
			<Columns>
			    <obout:Column ID="Column1" DataField="OrderID" ReadOnly="true" HeaderText="ORDER ID" Width="125" runat="server"/>
				<obout:Column ID="Column2" DataField="ShipName" HeaderText="NAME" Width="200" runat="server"/>				
				<obout:Column ID="Column3" DataField="ShipCity" HeaderText="CITY" Width="150" runat="server" />
				<obout:Column ID="Column4" DataField="ShipPostalCode" HeaderText="POSTAL CODE" Width="150" runat="server" />
				<obout:Column ID="Column5" DataField="ShipCountry" HeaderText="COUNTRY" Width="175" runat="server" />
			</Columns>
			<FilteringSettings InitialState="Visible" FilterPosition="Top" />
		</obout:Grid>
		
		<br />
		<span class="tdText">
		    You can use the <b>OnFiltering</b> client-side event of the Grid to perform validations before filtering the Grid.<br />
		    In the event handler of this event you have access to the selected filter option, the current filter controls and filter values for each column. <br /><br />
		    In this example, the "ShipName" and "ShipCountry" columns are validated - if you select a filter option different than "No filter" <br />
		    you need to specify a value in the filter fields of those columns, otherwise you'll get a pop-up error message.
		</span>
				
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 25 * FROM Orders"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">� Back to examples</a>
		
		</form>
	</body>
</html>
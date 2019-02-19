﻿<%@ Page Language="C#" MasterPageFile="~/ListBox/ListBox.master" AutoEventWireup="true" CodeFile="cs_templates_item.aspx.cs" Inherits="ListBox_cs_templates_item" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ListBox" Assembly="obout_ListBox" %>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <style type="text/css">
        .template-name
        {
            text-decoration: underline;
        }
        
        .template-country
        {
            font-style: italic;
        }
    </style>

    <br />
    
    <span class="tdText"><b>ASP.NET ListBox - Item Templates</b></span>	
    
    <br /><br />
    <asp:PlaceHolder runat="server" ID="ListBox1Container" /> 
    
    
    <asp:SqlDataSource ID="sds1" runat="server" SelectCommand="SELECT TOP 10 CustomerID, CompanyName, Country FROM Customers"
		    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
	
    <br /><br />
    
    <span class="tdText">
        The items of the ListBox can be customized using templates. You can embed any content inside an item template, <br />
        including HTML markup and ASP.NET server controls (any control from the Obout suite may be added to a template).<br /><br />
        
        In order to set up an item template, use the <b>ItemTemplate</b> property of the ListBox.<br />
        To extract data from the data item, use the <b>Eval</b> method which expects as a parameter <br />
        the name of the data field from which to load the data.
    </span>
    
</asp:Content>
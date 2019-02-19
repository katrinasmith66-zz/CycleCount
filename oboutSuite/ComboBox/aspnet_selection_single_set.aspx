﻿<%@ Page Title="" Language="C#" MasterPageFile="~/ComboBox/ComboBox.master" AutoEventWireup="true" CodeFile="aspnet_selection_single_set.aspx.cs" Inherits="ComboBox_aspnet_selection_retrieve" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    
    <span class="tdText"><b>ASP.NET ComboBox - Set Selected Item</b></span>	
    
    <br /><br />
    
    <table>    
        <tr>
            <td>
                <span class="tdText">SelectedIndex="2"</span><br />
                <obout:ComboBox runat="server" ID="ComboBox1" Width="200" Height="200"
                    DataSourceID="sds1" DataTextField="CompanyName" DataValueField="CustomerID"
                    SelectedIndex="2"
                    />
            </td>
            <td width="25">&#160;</td>
            <td>
                <span class="tdText">SelectedValue="ALFKI"</span><br />
                <obout:ComboBox runat="server" ID="ComboBox2" Width="200" Height="200"
                    DataSourceID="sds1" DataTextField="CompanyName" DataValueField="CustomerID"
                    SelectedValue="ALFKI"
                    />
            </td>
            <td width="25">&#160;</td>
            <td>
                <span class="tdText">Item.Selected = true;</span><br />
                <obout:ComboBox runat="server" ID="ComboBox3" Width="200" Height="200"
                    OnItemDataBound="ComboBox3_ItemDataBound"
                    DataSourceID="sds1" DataTextField="CompanyName" DataValueField="CustomerID" />
            </td>
        </tr>
    </table>    
    
    <asp:SqlDataSource ID="sds1" runat="server" SelectCommand="SELECT TOP 25 CustomerID, CompanyName FROM Customers"
	    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
	
    <br /><br />
    
    <span class="tdText">
        The ComboBox control provides multiple ways to set the initial selected item:<br />
        
        <ul>
            <li><b>SelectedIndex</b> - the index of the item to be selected.</li>
            <li><b>SelectedValue</b> - the value of the item to be selected.</li>
            <li><b>Selected</b> - this is a property of the ComboBoxItem class. If set to true, the item will be selected.</li>
        </ul>
    </span>
</asp:Content>


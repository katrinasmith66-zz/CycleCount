﻿<%@ Page Title="" Language="C#" MasterPageFile="~/SuperForm/SuperForm.master" AutoEventWireup="true" CodeFile="aspnet_localization_date_field.aspx.cs" Inherits="SuperForm_aspnet_localization_date_field" %>
<%@ Register TagPrefix="obout" Namespace="Obout.SuperForm" Assembly="obout_SuperForm" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ListBox" Assembly="obout_ListBox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    
    <span class="tdText"><b>ASP.NET SuperForm - Localize Date Fields</b></span>
    
    <br /><br />

    <span class="tdText">Select a country:</span>

    <br />

    <obout:ListBox runat="server" ID="ListBox1" SelectedIndex="0" Width="175" AutoPostBack="true">
        <Items>
            <obout:ListBoxItem ID="ListBoxItem1" runat="server" Text="USA" Value="en-US" ImageUrl="../ListBox/resources/Images/flags/flag_usa.png" />
            <obout:ListBoxItem ID="ListBoxItem2" runat="server" Text="UK" Value="en-GB" ImageUrl="../ListBox/resources/Images/flags/flag_england.png" />
            <obout:ListBoxItem ID="ListBoxItem3" runat="server" Text="Germany" Value="de-DE" ImageUrl="../ListBox/resources/Images/flags/flag_germany.png" />
            <obout:ListBoxItem ID="ListBoxItem4" runat="server" Text="France" Value="fr-FR" ImageUrl="../ListBox/resources/Images/flags/flag_france.png" />
            <obout:ListBoxItem ID="ListBoxItem5" runat="server" Text="Russia" Value="ru-RU" ImageUrl="../ListBox/resources/Images/flags/flag_russia.png" />
            <obout:ListBoxItem ID="ListBoxItem6" runat="server" Text="India" Value="hi-IN" ImageUrl="../ListBox/resources/Images/flags/flag_india.png" />
            <obout:ListBoxItem ID="ListBoxItem7" runat="server" Text="Japan" Value="ja-JP" ImageUrl="../ListBox/resources/Images/flags/flag_japan.png" />
            <obout:ListBoxItem ID="ListBoxItem8" runat="server" Text="China" Value="zh-CN" ImageUrl="../ListBox/resources/Images/flags/flag_china.png" />
            <obout:ListBoxItem ID="ListBoxItem9" runat="server" Text="Spain" Value="es-ES" ImageUrl="../ListBox/resources/Images/flags/flag_spain.png" />
        </Items>
    </obout:ListBox>

    <br /><br />

    <obout:SuperForm ID="SuperForm1" 
        Title="Order Details"
        DataSourceID="SqlDataSource1"
        AutoGenerateRows="False"
        AutoGenerateInsertButton ="True"
        AutoGenerateEditButton="True"
        AutoGenerateDeleteButton="True"
        DataKeyNames="OrderID"
        RunAt="server"
        AllowPaging="True" AllowDataKeysInsert="False" 
        EnableModelValidation="True"
        DefaultMode="Insert">
        <Fields>
            <obout:BoundField DataField="OrderID" HeaderText="Order ID" ReadOnly="true" InsertVisible="false" />
            <obout:BoundField DataField="ShipName" HeaderText="Ship Name" />
            <obout:DateField DataField="OrderDate" HeaderText="Order Date" DataFormatString="{0:MM/dd/yyyy}" ApplyFormatInEditMode="true" />
            <obout:DateField DataField="ShippedDate" HeaderText="Shipped Date" DataFormatString="{0:MM/dd/yyyy}" ApplyFormatInEditMode="true" />
            <obout:DateField DataField="RequiredDate" HeaderText="Required Date" DataFormatString="{0:MM/dd/yyyy}" ApplyFormatInEditMode="true" />
        </Fields>
    </obout:SuperForm>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:NorthwindConnectionString.ProviderName %>" 
        SelectCommand="SELECT OrderID, ShipName, OrderDate, ShippedDate, RequiredDate
                        FROM [Orders] ORDER BY OrderID DESC"
        UpdateCommand="UPDATE Orders SET ShipName=@ShipName, OrderDate=@OrderDate, ShippedDate=@ShippedDate, RequiredDate=@RequiredDate
                       WHERE OrderID=@OrderID"
        InsertCommand="INSERT INTO Orders (ShipName, OrderDate, ShippedDate, RequiredDate)
                        VALUES(@ShipName, @OrderDate, @ShippedDate, @RequiredDate)"
        DeleteCommand="DELETE FROM Orders WHERE OrderID = @OrderID" />
    
    <br /><br />
    
    <span class="tdText">
        Add <b>DateField</b> objects to the <b>Fields</b> collection to manually specify the Date / DateTime fields of a Super Form.<br />
        This type of field will render an OboutTextBox control and an Obout Calendar control in add / edit mode, which will allow end users to modify the underlying data.<br />
        The Calendar control is configured to work in date picker mode and it is linked to the OboutTextBox control.<br /><br />

        In this sample we accessed the fields of the form in the Page_Load method to gain access to the Calendar controls added to the rows.<br />
        Thus we were able to set the <b>CultureName</b> property of the Calendar controls and to make them work with various cultures.
    </span>
</asp:Content>


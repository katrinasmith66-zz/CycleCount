﻿<%@ Page Title="" Language="C#" MasterPageFile="~/SuperForm/SuperForm.master" AutoEventWireup="true" CodeFile="aspnet_commands_editonly.aspx.cs" Inherits="SuperForm_aspnet_commands_editonly" %>
<%@ Register TagPrefix="obout" Namespace="Obout.SuperForm" Assembly="obout_SuperForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    
    <span class="tdText"><b>ASP.NET Super Form - Edit-Only Form</b></span>
    
    <br /><br />
    
    <obout:SuperForm ID="SuperForm1" 
        Title="Order Details"
        DataSourceID="SqlDataSource1"
        AutoGenerateInsertButton ="True"
        AutoGenerateEditButton="True"
        AutoGenerateDeleteButton="True"
        DataKeyNames="Order ID"
        RunAt="server"
        DefaultMode="Edit"
        OnModeChanging="SuperForm1_ModeChaning"
        AllowPaging="false" AllowDataKeysInsert="False">
    </obout:SuperForm>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:NorthwindConnectionString.ProviderName %>" 
        SelectCommand="SELECT OrderID AS [Order ID], ShipName AS [Ship Name], ShipCity AS [Ship City], ShipCountry AS [Ship Country],
                        OrderDate AS [Order Date], Sent FROM [Orders] ORDER BY OrderID DESC"
        UpdateCommand="UPDATE Orders SET ShipName=@ShipName, ShipCity=@ShipCity, ShipCountry=@ShipCountry, 
                       OrderDate=@OrderDate, Sent=@Sent
                       WHERE OrderID=@OrderID"
        InsertCommand="INSERT INTO Orders (ShipName, ShipCity, ShipCountry, OrderDate, Sent)
                        VALUES(@ShipName, @ShipCity, @ShipCountry, @OrderDate, @Sent)"
        DeleteCommand="DELETE FROM Orders WHERE OrderID = @OrderID">
    </asp:SqlDataSource>
    
    <br /><br />
    
    <span class="tdText">
        The Super Form can be used as an edit-only form. To accomplish this we handled the <b>ModeChanging</b> server-side event.<br />
        In the event handler for this event we set the <b>Cancel</b> property of the event argument (the second argument) to <span class="option2">true</span>.
    </span>
</asp:Content>


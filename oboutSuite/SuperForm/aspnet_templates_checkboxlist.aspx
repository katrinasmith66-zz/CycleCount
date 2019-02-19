﻿<%@ Page Title="" Language="C#" MasterPageFile="~/SuperForm/SuperForm.master" AutoEventWireup="true" CodeFile="aspnet_templates_checkboxlist.aspx.cs" Inherits="SuperForm_aspnet_templates_checkboxlist" %>
<%@ Register TagPrefix="obout" Namespace="Obout.SuperForm" Assembly="obout_SuperForm" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ListBox" Assembly="obout_ListBox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    
    <span class="tdText"><b>ASP.NET Super Form - CheckBoxList Field</b></span>
    
    <br /><br />
    
    <obout:SuperForm ID="SuperForm1" 
        DataSourceID="SqlDataSource1"
        AutoGenerateRows="false"
        AutoGenerateInsertButton ="true"
        AutoGenerateEditButton="true"
        AutoGenerateDeleteButton="true"
        AutoGenerateDateFields="true"
        DataKeyNames="CustomerID"
        RunAt="server"
        AllowPaging="true"
        OnDataBound="SuperForm1_DataBound"
        OnItemUpdating="SuperForm1_ItemUpdating"
        OnItemInserting="SuperForm1_ItemInserting"
        DefaultMode="Edit">
        <Fields>
            <obout:BoundField DataField="CustomerID" HeaderText="Customer ID" ReadOnly="true" InsertVisible="true" />
            <obout:BoundField DataField="CompanyName" HeaderText="Company Name" />
            <obout:BoundField DataField="ContactName" HeaderText="Contact Name" />
            <obout:TemplateField HeaderText="Countries">
                <ItemTemplate>
                    <%# GetCountries(Eval("CountryIds").ToString()) %>
                </ItemTemplate>
                <EditItemTemplate>
                    <div style="height: 150px; overflow: auto; position: relative;">
                        <asp:CheckBoxList runat="server" ID="CountryIds" DataSourceID="SqlDataSource2" Height="150"
                            DataValueField="CountryID" DataTextField="CountryName" />
                    </div>
                </EditItemTemplate>
            </obout:TemplateField>
        </Fields>
    </obout:SuperForm>


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:NorthwindConnectionString.ProviderName %>" 
        SelectCommand="SELECT CustomerID, CompanyName, ContactName, CountryIds
                       FROM [Customers] ORDER BY CustomerID DESC"
        UpdateCommand="UPDATE Customers SET CompanyName=@CompanyName, ContactName=@ContactName, CountryIds=@CountryIds
                       WHERE CustomerID=@CustomerID"
        InsertCommand="INSERT INTO Customers (CustomerID, CompanyName, ContactName, CountryIds)
                        VALUES(@CustomerID, @CompanyName, @ContactName, @CountryIds)"
        DeleteCommand="DELETE FROM Customers WHERE CustomerID = @CustomerID">
        <UpdateParameters>
            <asp:Parameter Name="CompanyName" DbType="String" />
            <asp:Parameter Name="ContactName" DbType="String" />
            <asp:Parameter Name="CountryIds" DbType="String" />
            <asp:Parameter Name="CustomerID" DbType="String" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="CustomerID" DbType="String" />
            <asp:Parameter Name="CompanyName" DbType="String" />
            <asp:Parameter Name="ContactName" DbType="String" />
            <asp:Parameter Name="CountryIds" DbType="String" />            
        </InsertParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:NorthwindConnectionString.ProviderName %>"
        SelectCommand="SELECT * FROM Countries ORDER BY CountryName ASC" />
    
    <br /><br />
    
    <span class="tdText">
        Use the <b>TemplateField</b> class to gain full control over the layout of the field.<br /> 
        A TemplateField allows developers to specify different templates for view / add / edit modes.<br /><br />

        This example showcases the use of a TemplateField object for the "Countries" field.<br />
        Using the TemplateField class we can use a CheckBoxList control to edit the data from the field.
    </span>
</asp:Content>


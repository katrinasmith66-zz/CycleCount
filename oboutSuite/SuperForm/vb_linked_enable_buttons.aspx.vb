﻿Imports Obout.SuperForm
Imports System.Data
Imports System.Data.OleDb
Imports System.Collections.Generic
Imports System.Web.UI.WebControls
Imports Obout.Interface
Partial Class SuperForm_vb_linked_enable_buttons
    Inherits System.Web.UI.Page
    Dim SuperForm1 As Obout.SuperForm.SuperForm
    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        SuperForm1 = New SuperForm()
        SuperForm1.ID = "SuperForm1"
        SuperForm1.DataSourceID = "SqlDataSource1"
        SuperForm1.AutoGenerateRows = False
        SuperForm1.AutoGenerateInsertButton = True
        SuperForm1.AutoGenerateEditButton = True
        SuperForm1.AutoGenerateDeleteButton = True
        Dim keyNames1() As String = {"ProductID"}
        SuperForm1.DataKeyNames = keyNames1
        SuperForm1.AllowPaging = True
        SuperForm1.EnableButtonsOnChange = True
        SuperForm1.DefaultMode = DetailsViewMode.Edit
        SuperForm1.EnableButtonsOnChange = True

        Dim field1 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field1.DataField = "ProductID"
        field1.HeaderText = "Product ID"
        field1.ReadOnly = True
        field1.InsertVisible = False

        Dim field2 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field2.DataField = "ProductName"
        field2.HeaderText = "Product Name"
        field2.Required = True

        Dim field3 As Obout.SuperForm.CheckBoxField = New Obout.SuperForm.CheckBoxField()
        field3.DataField = "Discontinued"
        field3.HeaderText = "Discontinued"

        Dim field4 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field4.DataField = "UnitPrice"
        field4.HeaderText = "Unit Price"

        Dim field5 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field5.DataField = "UnitsInStock"
        field5.HeaderText = "Units In Stock"

        Dim field6 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field6.DataField = "UnitsOnOrder"
        field6.HeaderText = "Units On Order"

        SuperForm1.Fields.Add(field1)
        SuperForm1.Fields.Add(field2)
        SuperForm1.Fields.Add(field3)
        SuperForm1.Fields.Add(field4)
        SuperForm1.Fields.Add(field5)
        SuperForm1.Fields.Add(field6)

        SuperForm1Container.Controls.Add(SuperForm1)
    End Sub
    
End Class

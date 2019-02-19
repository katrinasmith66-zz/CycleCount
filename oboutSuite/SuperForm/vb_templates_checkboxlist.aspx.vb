﻿Imports Obout.SuperForm
Imports System.Data
Imports System.Data.OleDb
Imports System.Collections.Generic
Imports System.Web.UI.WebControls
Imports Obout.Interface
Imports Obout.ComboBox
Partial Class SuperForm_vb_templates_checkboxlist
    Inherits System.Web.UI.Page
    Dim SuperForm1 As Obout.SuperForm.SuperForm
    Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
        SuperForm1 = New SuperForm()
        SuperForm1.ID = "SuperForm1"
        SuperForm1.DataSourceID = "SqlDataSource1"
        SuperForm1.AutoGenerateRows = False
        SuperForm1.AutoGenerateInsertButton = True
        SuperForm1.AutoGenerateEditButton = True
        SuperForm1.AutoGenerateDeleteButton = True
        SuperForm1.AutoGenerateDateFields = True
        Dim keyNames1() As String = {"CustomerID"}
        SuperForm1.DataKeyNames = keyNames1
        SuperForm1.AllowPaging = True
        SuperForm1.DefaultMode = DetailsViewMode.Edit
        AddHandler SuperForm1.ItemUpdating, AddressOf SuperForm1_ItemUpdating
        AddHandler SuperForm1.ItemInserting, AddressOf SuperForm1_ItemInserting
        AddHandler SuperForm1.DataBound, AddressOf SuperForm1_DataBound

        Dim field1 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field1.DataField = "CustomerID"
        field1.HeaderText = "Customer ID"
        field1.ReadOnly = True
        field1.InsertVisible = False

        Dim field2 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field2.DataField = "CompanyName"
        field2.HeaderText = "Company Name"

        Dim field3 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field3.DataField = "ContactName"
        field3.HeaderText = "Contact Name"

        Dim field4 As Obout.SuperForm.TemplateField = New Obout.SuperForm.TemplateField()
        field4.HeaderText = "Countries"
        field4.ItemTemplate = New CountriesItemTemplate()
        field4.EditItemTemplate = New CountriesEditItemTemplate()

        SuperForm1.Fields.Add(field1)
        SuperForm1.Fields.Add(field2)
        SuperForm1.Fields.Add(field3)
        SuperForm1.Fields.Add(field4)

        SuperForm1Container.Controls.Add(SuperForm1)

    End Sub
    Public Class CountriesItemTemplate
        Implements ITemplate
        Sub InstantiateIn(ByVal container As Control) Implements ITemplate.InstantiateIn
            Dim templatePlaceHolder As Literal = New Literal()
            container.Controls.Add(templatePlaceHolder)

            AddHandler templatePlaceHolder.DataBinding, AddressOf DataBindTemplate
        End Sub

        Sub DataBindTemplate(ByVal sender As Object, ByVal e As EventArgs)

            Dim templatePlaceHolder As Literal = CType(sender, Literal)
            Dim row As DetailsViewRow = CType(templatePlaceHolder.Parent.Parent, DetailsViewRow)
            Dim Form As SuperForm = CType(row.Parent.Parent, SuperForm)

            templatePlaceHolder.Text = GetCountries(DataBinder.Eval(Form.DataItem, "CountryIds").ToString())
        End Sub
         Function GetCountries(ByVal countryIds As String) As String
            Dim countries As String = ""

            If Not String.IsNullOrEmpty(countryIds) Then
                Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|NorthWind.mdb")

                Dim myComm As OleDbCommand = New OleDbCommand("SELECT CountryName FROM Countries WHERE CountryId IN (" + countryIds + ")", myConn)
                myConn.Open()
                Dim myReader As OleDbDataReader = myComm.ExecuteReader()

                While myReader.Read()

                    If (countries <> "") Then

                        countries += ","
                    End If

                    countries += myReader("CountryName").ToString()
                End While

                myConn.Close()
            End If

            Return countries
        End Function

    End Class
    Public Class CountriesEditItemTemplate
        Implements ITemplate

        Sub InstantiateIn(ByVal container As Control) Implements ITemplate.InstantiateIn

            Dim templatePlaceHolder As PlaceHolder = New PlaceHolder()
            container.Controls.Add(templatePlaceHolder)

            Dim divContainer1 As Literal = New Literal()
            divContainer1.Text = "<div style=""height: 150px; overflow: auto; position: relative;"">"

            Dim CheckBoxList1 As CheckBoxList = New CheckBoxList()
            CheckBoxList1.ID = "CountryIds"
            CheckBoxList1.DataSourceID = "SqlDataSource2"
            CheckBoxList1.Height = Unit.Pixel(150)
            CheckBoxList1.DataValueField = "CountryID"
            CheckBoxList1.DataTextField = "CountryName"

            Dim divContainer2 As Literal = New Literal()
            divContainer2.Text = "</div>"

            templatePlaceHolder.Controls.Add(divContainer1)
            templatePlaceHolder.Controls.Add(CheckBoxList1)
            templatePlaceHolder.Controls.Add(divContainer2)

        End Sub
    End Class
    Sub SuperForm1_DataBound(ByVal sender As Object, ByVal e As EventArgs)

        If SuperForm1.CurrentMode = DetailsViewMode.Edit Then

            Dim selectedCountryIds As String = "," + DataBinder.Eval(SuperForm1.DataItem, "CountryIds").ToString() + ","

            Dim CountryIds As CheckBoxList = CType(CType(SuperForm1.Rows(3), DetailsViewRow).FindControl("CountryIds"), CheckBoxList)

            For Each item As ListItem In CountryIds.Items

                If selectedCountryIds.IndexOf("," + item.Value + ",") <> -1 Then

                    item.Selected = True
                End If

            Next
        End If
    End Sub


    Sub SuperForm1_ItemUpdating(ByVal sender As Object, ByVal e As DetailsViewUpdateEventArgs)

        e.NewValues("CountryIds") = GetSelectedCountries()
    End Sub

    Sub SuperForm1_ItemInserting(ByVal sender As Object, ByVal e As DetailsViewInsertEventArgs)

        e.Values("CountryIds") = GetSelectedCountries()
    End Sub

   Function GetSelectedCountries() As String
        Dim CountryIds As CheckBoxList = CType(CType(SuperForm1.Rows(3), DetailsViewRow).FindControl("CountryIds"), CheckBoxList)

        Dim selectedCountryIds As String = ""

        For Each item As ListItem In CountryIds.Items

            If item.Selected = True Then

                If (selectedCountryIds <> "") Then

                    selectedCountryIds += ","
                End If


                selectedCountryIds += item.Value
            End If
        Next

        Return selectedCountryIds
    End Function

End Class


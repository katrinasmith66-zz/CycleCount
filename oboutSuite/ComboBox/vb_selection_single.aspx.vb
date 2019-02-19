﻿Imports Obout.ComboBox
Imports System.Data
Imports System.Data.OleDb
Imports System.Collections.Generic
Imports System.Web.UI.WebControls
Partial Class ComboBox_vb_selection_single
    Inherits System.Web.UI.Page
    Dim ComboBox1 As ComboBox

     Sub Page_load(ByVal sender As Object, ByVal e As EventArgs) 
        ComboBox1 = New ComboBox()
        ComboBox1.ID = "ComboBox1"
        ComboBox1.Width = Unit.Pixel(200)
        ComboBox1.EmptyText = "Select a single country ..."
        ComboBox1.SelectionMode = ListSelectionMode.Single
        ComboBox1.DataSourceID = "sds1"
        ComboBox1.DataTextField = "CountryName"
        ComboBox1.DataValueField = "CountryID"

        ComboBox1Container.Controls.Add(ComboBox1)
    End Sub
End Class

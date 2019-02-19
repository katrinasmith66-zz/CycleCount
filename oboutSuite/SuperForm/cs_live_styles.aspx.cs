﻿using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.SuperForm;
using Obout.Interface;
using Obout.ListBox;

public partial class SuperForm_cs_live_styles : System.Web.UI.Page
{
    private SuperForm SuperForm1;
    protected void Page_Load(object sender, EventArgs e)
    {
        SuperForm1 = new SuperForm();
        SuperForm1.ID = "SuperForm1";
        SuperForm1.DataSourceID = "SqlDataSource1";
        SuperForm1.AutoGenerateRows = false;
        SuperForm1.AutoGenerateInsertButton = true;
        SuperForm1.AutoGenerateEditButton = true;
        SuperForm1.AutoGenerateDeleteButton = true;
        SuperForm1.Title = "Order Details";
        SuperForm1.DataKeyNames = new string[] { "OrderID" };
        SuperForm1.AllowPaging = true;
        SuperForm1.DefaultMode = DetailsViewMode.Edit;
        SuperForm1.AllowDataKeysInsert = false;
        
         Obout.SuperForm.BoundField field1 = new Obout.SuperForm.BoundField();
        field1.DataField = "OrderID";
        field1.HeaderText = "Order ID";
        field1.ReadOnly = true;
        field1.InsertVisible = false;

        Obout.SuperForm.BoundField field2 = new Obout.SuperForm.BoundField();
        field2.DataField = "ShipName";
        field2.HeaderText = "Ship Name";

        Obout.SuperForm.BoundField field3 = new Obout.SuperForm.BoundField();
        field3.HeaderText = "Ship City";
        field3.DataField = "ShipCity";

        Obout.SuperForm.BoundField field4 = new Obout.SuperForm.BoundField();
        field4.DataField = "ShipRegion";
        field4.HeaderText = "Ship Region";

        Obout.SuperForm.BoundField field5 = new Obout.SuperForm.BoundField();
        field5.DataField = "ShipCountry";
        field5.HeaderText = "Ship Country";

        Obout.SuperForm.BoundField field6 = new Obout.SuperForm.BoundField();
        field6.DataField = "ShipPostalCode";
        field6.HeaderText = "Ship Postal Code";

        Obout.SuperForm.DateField field7 = new Obout.SuperForm.DateField();
        field7.DataField = "OrderDate";
        field7.HeaderText = "Order Date";
        field7.DataFormatString = "{0:MM/dd/yyyy}";
        field7.ApplyFormatInEditMode = true;

        SuperForm1.Fields.Add(field1);
        SuperForm1.Fields.Add(field2);
        SuperForm1.Fields.Add(field3);
        SuperForm1.Fields.Add(field4);
        SuperForm1.Fields.Add(field5);
        SuperForm1.Fields.Add(field6);
        SuperForm1.Fields.Add(field7);

        SuperForm1Container.Controls.Add(SuperForm1);
    }
    protected void ListBox1_SelectedIndexChanged(object sender, ListBoxItemEventArgs e)
    {
        SuperForm1.FolderStyle = "styles/" + e.Item.Value;
        SuperForm1.InterfaceFolderStyle = "../Interface/styles/" + e.Item.Value;
        SuperForm1.DataBind();
    }
}

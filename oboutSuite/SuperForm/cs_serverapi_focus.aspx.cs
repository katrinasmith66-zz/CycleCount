﻿using System;
using System.Collections.Generic;
using Obout.SuperForm;
using Obout.Interface;
using Obout.ComboBox;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SuperForm_cs_serverapi_focus : System.Web.UI.Page
{
    private SuperForm SuperForm1;
    protected void Page_Load(object sender, EventArgs e)
    {
        SuperForm1 = new SuperForm();
        SuperForm1.ID = "SuperForm1";
        SuperForm1.DataSourceID = "SqlDataSource1";
        SuperForm1.Title = "Order Details";
        SuperForm1.AutoGenerateInsertButton = true;
        SuperForm1.AutoGenerateEditButton = true;
        SuperForm1.AutoGenerateDeleteButton = true;
        SuperForm1.DataKeyNames = new string[] { "Order ID" };
        SuperForm1.AllowPaging = true;
        SuperForm1.DefaultMode = DetailsViewMode.Edit;
        SuperForm1.AllowDataKeysInsert = false;
        SuperForm1.DataBound += SuperForm1_DataBound;

        SuperForm1Container.Controls.Add(SuperForm1);
    }
    protected void SuperForm1_DataBound(object sender, EventArgs e)
    {
        if (SuperForm1.CurrentMode == DetailsViewMode.Edit || SuperForm1.CurrentMode == DetailsViewMode.Insert)
        {
            ((OboutTextBox)SuperForm1.Rows[1].Cells[1].Controls[0].Controls[0]).Focus();
        }
    }
}

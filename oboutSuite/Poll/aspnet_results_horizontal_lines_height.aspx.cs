﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Ajax.UI.Poll;
using System.Data.OleDb;

public partial class Poll_aspnet_results_horizontal_lines_height : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Poll1.ResultStyle.HorizontalLinesHeight = Unit.Parse(OboutDropDownList1.SelectedValue);
    }
}
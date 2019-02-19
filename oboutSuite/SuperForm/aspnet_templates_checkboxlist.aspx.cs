﻿using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Interface;
using System.Data.OleDb;
using Obout.ListBox;

public partial class SuperForm_aspnet_templates_checkboxlist : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void SuperForm1_DataBound(object sender, EventArgs e)
    {
        if (SuperForm1.CurrentMode == DetailsViewMode.Edit)
        {
            string selectedCountryIds = "," + DataBinder.Eval(SuperForm1.DataItem, "CountryIds").ToString() + ",";

            CheckBoxList CountryIds = (CheckBoxList)((DetailsViewRow)SuperForm1.Rows[3]).FindControl("CountryIds");

            foreach (ListItem item in CountryIds.Items)
            {
                if (selectedCountryIds.IndexOf("," + item.Value + ",") != -1)
                {
                    item.Selected = true;
                }
            }
        }
    }

    protected void SuperForm1_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        e.NewValues["CountryIds"] = GetSelectedCountries();
    }

    protected void SuperForm1_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        e.Values["CountryIds"] = GetSelectedCountries();
    }

    protected string GetSelectedCountries()
    {
        CheckBoxList CountryIds = (CheckBoxList)((DetailsViewRow)SuperForm1.Rows[3]).FindControl("CountryIds");

        string selectedCountryIds = "";

        foreach (ListItem item in CountryIds.Items)
        {
            if (item.Selected == true)
            {
                if (selectedCountryIds != "")
                {
                    selectedCountryIds += ",";
                }

                selectedCountryIds += item.Value;
            }
        }

        return selectedCountryIds;
    }

    protected string GetCountries(string countryIds)
    {
        string countries = "";

        if (!string.IsNullOrEmpty(countryIds))
        {
            OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/NorthWind.mdb"));

            OleDbCommand myComm = new OleDbCommand("SELECT CountryName FROM Countries WHERE CountryId IN (" + countryIds + ")", myConn);
            myConn.Open();
            OleDbDataReader myReader = myComm.ExecuteReader();

            while (myReader.Read())
            {
                if (countries != "")
                {
                    countries += ",";
                }

                countries += myReader["CountryName"].ToString();
            }

            myConn.Close();
        }

        return countries;
    }
}

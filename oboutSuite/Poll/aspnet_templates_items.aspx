﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Poll/Poll.master" AutoEventWireup="true" CodeFile="aspnet_templates_items.aspx.cs" Inherits="Poll_aspnet_templates_items" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Ajax.UI.Poll" Assembly="Obout.Ajax.UI" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />

    <style type="text/css">
        .ob_pA li img 
        {
            vertical-align: middle;
        }
    </style>
    
    <br />

	<span class="tdText"><b>ASP.NET Poll - Templates - Item Templates</b></span>
    
    <br />
    <br />

    <obout:Poll runat="server" ID="Poll1" DataSourceID="SqlDataSource1"
        VotingMode="SingleAnswer" MinAnswers="1"
        Title="Favorite Movie" Question="What is your favorite movie?" 
        AllowedVotesPerUser="100" OnGetSelectedItem="Poll1_GetSelectedItem" OnSetSelectedItem="Poll1_SetSelectedItem">
        <AnswerTemplate>
            <img src="resources/images/<%# Container.Item.Text %>.jpg" alt="" height="80" />
            <obout:OboutRadioButton ID="OboutRadioButton1" runat="server" Text='<%# Container.Item.Text %>' GroupName="PollItem" />
        </AnswerTemplate>
        <ResultStyle DisplayVotes="true" />
    </obout:Poll>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:PollConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:PollConnectionString.ProviderName %>" 
        SelectCommand="SELECT * FROM [Answers] WHERE PollID = 1"
        UpdateCommand="UPDATE Answers SET Votes = Votes + 1 WHERE AnswerID = @AnswerID" />

    <br /><br /><br />

    <div style="width: 500px;" class="tdText">
        The items of the Poll can be customized using templates. You can embed any content inside an item template, including HTML markup and ASP.NET server controls (any control from the Obout suite may be added to a template).<br /><br />

        In order to set up an item template, use the AnswerTemplate property of the Poll. When using item templates, 
        the <b>OnGetSelectedItem</b> and <b>OnSetSelectedItem</b> events should also be employed for getting/setting the selected answer.

    </div>
</asp:Content>


﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Poll/Poll.master" AutoEventWireup="true" CodeFile="aspnet_voting_singleanswer.aspx.cs" Inherits="Poll_aspnet_voting_single_answer" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Ajax.UI.Poll" Assembly="Obout.Ajax.UI" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager runat="server" />
    
    <br />

	<span class="tdText"><b>ASP.NET Poll - Voting - Single Answer</b></span>
    
    <br />
    <br />

    <obout:Poll runat="server" ID="Poll1" DataSourceID="SqlDataSource1"
        VotingMode="SingleAnswer" MinAnswers="1" 
        Title="Favorite Movie" Question="What is your favorite movie?" 
        AllowedVotesPerUser="100">
    </obout:Poll>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:PollConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:PollConnectionString.ProviderName %>" 
        SelectCommand="SELECT * FROM [Answers] WHERE PollID = 1"
        UpdateCommand="UPDATE Answers SET Votes = Votes + 1 WHERE AnswerID = @AnswerID" />

    <br /><br /><br />

    <div style="width: 400px;" class="tdText">
        The Poll control offers two voting modes, which can be enabled using the <b>VotingMode</b> property:<br />
        <ul>
            <li><b>SingleAnswer</b> - the Poll will display a radio button next to each item and thus the end users may select only one answer;</li>
            <li><b>MultipleAnswers</b> - the Poll will display a check box next to each item and thus the end users may select multiple answers.</li>
        </ul>
    </div>
</asp:Content>


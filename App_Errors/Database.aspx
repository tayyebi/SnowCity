<%@ Page Title="SnowCity - Database Not Responding" Language="C#" MasterPageFile="~/App_MasterPage/ErrorMasterPage.master" AutoEventWireup="true" CodeFile="Database.aspx.cs" Inherits="App_Errors_Database" %>

<asp:Content ID="Content2" ContentPlaceHolderID="DefaultContentPlaceHolder" Runat="Server">
        <asp:Button ID="CheckDatabaseHealth" runat="server" Text="CheckDatabaseHealth" OnClick="CheckDatabaseHealth_Click" CssClass="databasebutton" Enabled="False" />
</asp:Content>



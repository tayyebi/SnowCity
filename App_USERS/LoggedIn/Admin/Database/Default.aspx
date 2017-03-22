<%@ Page   Language="C#" MasterPageFile="~/App_MasterPage/Users-LoggedInMasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="USERS_LoggedIn_Admin_Database_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="DefaultContentPlaceHolder" runat="Server">
    <asp:Button ID="BackToDefaultPage" runat="server" OnClick="BackToDefaultPage_Click" Text="<%$ Resources:Resource, Back %>" />
    <asp:Button ID="CreateTables" runat="server" OnClick="CreateTables_Click" Text="<%$ Resources:Resource, CreateTables %>" Enabled="False" />
    <br />
    <asp:TextBox ID="DatabaseCodeTextBox" runat="server" TextMode="MultiLine"></asp:TextBox>
    <br />
    <asp:Button ID="RunSQL" runat="server" Enabled="False" OnClick="RunSQL_Click" Text="<%$ Resources:Resource, run %>" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="NoAjaxContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" runat="server" contentplaceholderid="head">
    <link href="<%:WebsitePage.WebsiteRoot(true, false)%>/App_StyleSheet/Users/USERS_LoggedIn_Admin_Database_Default.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%:WebsitePage.WebsiteRoot(true, false)%>/App_Scripts/Users/USERS_LoggedIn_Admin_Database_Default.js"></script>
</asp:Content>

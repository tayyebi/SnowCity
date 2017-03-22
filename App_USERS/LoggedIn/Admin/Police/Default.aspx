<%@ Page Language="C#" MasterPageFile="~/App_MasterPage/Users-LoggedInMasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="USERS_LoggedIn_Admin_Police_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="DefaultContentPlaceHolder" Runat="Server">
    <asp:Button ID="btn_BackToAdminsDefaultPage" runat="server" OnClick="btn_BackToAdminsDefaultPage_Click" Text="<%$ Resources:Resource, Back %>" />
    <asp:Button ID="News" runat="server" OnClick="News_Click" Text="<%$ Resources:Resource, News %>" />
    <asp:Button ID="ChatRoom" runat="server" OnClick="ChatRoom_Click" Text="<%$ Resources:Resource, ChatRoom %>" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="NoAjaxContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" runat="server" contentplaceholderid="head">
    <link href="<%:WebsitePage.WebsiteRoot(true, false)%>/App_StyleSheet/Users/USERS_LoggedIn_Admin_Database_Default.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%:WebsitePage.WebsiteRoot(true, false)%>/App_Scripts/Users/USERS_LoggedIn_Admin_Police_Default.js"></script>
</asp:Content>
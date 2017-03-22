<%@ Page Title="<%$ Resources:Resource, UsersDefaultBanner %>" Language="C#" MasterPageFile="~/App_MasterPage/Users-DefaultMasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="USERS_Login" %>
<%@ Register src="../App_UserControl/Users-UserControls/Login.ascx" tagname="Login" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="<%:WebsitePage.WebsiteRoot(true, false)%>/App_StyleSheet/Users/USERS_Login.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%:WebsitePage.WebsiteRoot(true, false)%>/App_Scripts/Users/USERS_Login.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="DefaultContentPlaceHolder" Runat="Server">
    <asp:UpdatePanel ID="LoginUpdatePanel" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
           <uc1:Login ID="Login" runat="server" ViewStateMode="Enabled" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
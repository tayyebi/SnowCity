<%@ Page   Language="C#" MasterPageFile="~/App_MasterPage/Users-DefaultMasterPage.master" AutoEventWireup="true" CodeFile="ChangeLanguage.aspx.cs" Inherits="USERS_ChangeLanguage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="<%:WebsitePage.WebsiteRoot(true, false)%>/App_StyleSheet/Users/USERS_ChangeLanguage.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%:WebsitePage.WebsiteRoot(true, false)%>/App_Scripts/Users/USERS_ChangeLanguage.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="DefaultContentPlaceHolder" Runat="Server">
    <asp:Button ID="PresianLanguageButton" runat="server" OnClick="Button1_Click" Text="زبان را به فارسی تغییر بده" CssClass="persian" />
    <asp:Button ID="EnglishLanguageButton" runat="server" OnClick="EnglishLanguageButton_Click" Text="Set Language To English" CssClass="english" />
</asp:Content>


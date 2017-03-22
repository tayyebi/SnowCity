<%@ Page Language="C#" MasterPageFile="~/App_MasterPage/Users-LoggedInMasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="USERS_LoggedIn_Default" %>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="head">
    <script type="text/javascript">
        $(function () {
            $('.UsersDefault').load('../../../../App_HTML/UsersDefault.html');
            });
    </script>
    <link href="<%:WebsitePage.WebsiteRoot(true, false)%>/App_StyleSheet/Users/USERS_LoggedIn_Default.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%:WebsitePage.WebsiteRoot(true, false)%>/App_Scripts/Users/USERS_LoggedIn_Default.js"></script>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="DefaultContentPlaceHolder">
    <asp:Button ID="Enter" runat="server" OnClick="Enter_Click" Text="<%$ Resources:Resource, Enter %>" CssClass="btn_enter" />
    <div class="UsersDefault"></div>
</asp:Content>

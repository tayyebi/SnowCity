<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UserBanner.ascx.cs" Inherits="App_UserControl_Users_UserControls_UserBanner" %>
<%@ Register src="UsersImage.ascx" tagname="UsersImage" tagprefix="uc1" %>
<div class="UsersBanner">
    <uc1:UsersImage ID="UsersImage" runat="server" />
    [<asp:Label ID="FullnameLable" runat="server"></asp:Label>]
    [<asp:Label ID="TypeLable" runat="server"></asp:Label>]&nbsp;
    [<asp:Label ID="WebsiteName" runat="server" Text="<%$ Resources:Resource, AccountManagementSystem %>"></asp:Label>]
</div>
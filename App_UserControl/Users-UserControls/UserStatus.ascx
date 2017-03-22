<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UserStatus.ascx.cs" Inherits="App_UserControl_Users_UserControls_UserStatus" %>
<div class="UserStatus">
    <asp:Label ID="LastLogInDate" runat="server" Text="<%$ Resources:Resource, LastLoginDate %>"></asp:Label>
    <asp:Label ID="LastLoginDateLable" runat="server"></asp:Label>
    <asp:Button ID="DefaultPage" runat="server" OnClick="DefaultPage_Click" Text="<%$ Resources:Resource, Default %>" />
    <asp:Button ID="LogoutButton" runat="server" OnClick="LogoutButton_Click" Text="<%$ Resources:Resource, Logout %>" TabIndex="2" />
    <asp:Button ID="ChangePassword" runat="server" OnClick="ChangePassword_Click" Text="<%$ Resources:Resource, ChangePassword %>" TabIndex="2" />
    <asp:HyperLink ID="AdminsNews" runat="server" Text="<%$ Resources:Resource, AdminsNews %>"></asp:HyperLink>
    <asp:HyperLink ID="AdminsConverstation" runat="server" Text="<%$ Resources:Resource, Converstation %>"></asp:HyperLink>
</div>
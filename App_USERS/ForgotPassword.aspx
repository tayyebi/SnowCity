<%@ Page   Language="C#" MasterPageFile="~/App_MasterPage/Users-DefaultMasterPage.master" AutoEventWireup="true" CodeFile="ForgotPassword.aspx.cs" Inherits="USERS_ForgotPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="<%:WebsitePage.WebsiteRoot(true, false)%>/App_StyleSheet/Users/USERS_ForgotPassword.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%:WebsitePage.WebsiteRoot(true, false)%>/App_Scripts/Users/USERS_ForgotPassword.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="DefaultContentPlaceHolder" Runat="Server">
    <asp:TextBox ID="ValueTextBox" runat="server" TextMode="MultiLine" CssClass="txt_Value"></asp:TextBox>
    <asp:Button ID="Send" runat="server" Text="<%$ Resources:Resource, Send %>" OnClick="Send_Click" CssClass="btn_Send" />
    <asp:Label ID="MessageSend" runat="server" Text="<%$ Resources:Resource, MessageSend %>" Visible="False" CssClass="lbl_Success"></asp:Label>
    <asp:HyperLink runat="server" Text="<%$ Resources:Resource, Back %>" NavigateUrl="~/App_USERS/Login.aspx"></asp:HyperLink>
</asp:Content>


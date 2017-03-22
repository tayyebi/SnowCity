<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Button.ascx.cs" Inherits="App_UserControl_SocialNetworkingShareButtons" %>
<%@ Register Src="~/App_UserControl/SocialNetworkings/Like/GooglePlus.ascx" TagPrefix="uc1" TagName="GooglePlus" %>
<%@ Register Src="~/App_UserControl/SocialNetworkings/Like/Twitter.ascx" TagPrefix="uc1" TagName="Twitter" %>
<%@ Register Src="~/App_UserControl/SocialNetworkings/Like/LinkedIn.ascx" TagPrefix="uc1" TagName="LinkedIn" %>

<div class="shareIn">
    <uc1:GooglePlus runat="server" ID="GooglePlus" />
    <uc1:Twitter runat="server" ID="Twitter" />
    <uc1:LinkedIn runat="server" ID="LinkedIn" />
</div>
<%@ Page Title="<%$ Resources:Resource, Online %>" Language="C#" AutoEventWireup="true" CodeFile="Statistics.aspx.cs" Inherits="Online" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script type="text/javascript" src="App_Scripts/-jquery.js"></script>
    <link href="<%$ Resources:Resource, StyleSheetStatistics %>" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%:WebsitePage.WebsiteRoot(true, false)%>/App_Scripts/StatisticsJavaScript.js"></script>
    <meta name="description" content="افراد آنلاین" />
    <meta name="description" content="Online visitors" />
</head>
<body>
    <form id="from_Default" runat="server">
        <asp:ScriptManager ID="ScriptManager_Default" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel_Defualt" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:Label ID="_online" CssClass="online" runat="server" Text="<%$ Resources:Resource, Online %>"></asp:Label>:
                <asp:Label ID="lbl_OnlineUsers" runat="server" CssClass="lbl_OnlineUsers"></asp:Label>
                <asp:Timer ID="Timer_Defualt" runat="server" Interval="10000">
                </asp:Timer>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>

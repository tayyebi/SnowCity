<%@ Page Language="C#" Title="<%$ Resources:Resource, ChatRoom %>" AutoEventWireup="true" CodeFile="Default-ChatRoom.aspx.cs" Inherits="ChatRoomDefault" %>

<%@ Register src="App_UserControl/Loading-UserControls/Loading1.ascx" tagname="Loading1" tagprefix="uc1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="<%$ Resources:Resource, StyleSheetChat %>" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%:WebsitePage.WebsiteRoot(true, false)%>/App_Scripts/-jquery.js"></script>
    <script type="text/javascript" src="<%:WebsitePage.WebsiteRoot(true, false)%>/App_Scripts/ChatJavaScript.js"></script>    
    <meta name="description" content="Free Chatroom with public and private chat. Fast and Free. Without admin in private part." />
    <meta name="description" content="اتاق چت (چت روم) رایگان با قبلیت های چت عمومی و خصوصی. چت روم سبک و سریع. بدون ادمین در قسمت خصوصی." />
    <meta name="keywords" content="چت روم,رایگان,بدون ادمین,سریع,خلوت,چت روم فارسی,اتاق چت, چت روم برفی, بدون عضویت" />
</head>
<body>
    <form id="defaultform" runat="server">
        <asp:ScriptManager ID="DefaultScriptManager" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="DefaultUpdatePanel" runat="server">
            <ContentTemplate>
                <asp:UpdateProgress ID="DefaultUpdateProgress" runat="server" DisplayAfter="0">
                    <ProgressTemplate>
                        <uc1:Loading1 ID="Loading1" runat="server" />
                    </ProgressTemplate>
                </asp:UpdateProgress>
                <asp:TextBox ID="NickNameTextBox" runat="server" CssClass="Enter_TextBox" EnableViewState="False" MaxLength="50"></asp:TextBox>
                <asp:Button ID="EnterButton" runat="server" CssClass="Enter_Button" Text="<%$ Resources:Resource, Enter %>" OnClick="EnterButton_Click" EnableViewState="False" />
                <asp:Label ID="ErrorLable" runat="server" Text="<%$ Resources:Resource, ChatRoomNicknameError %>" Visible="False" CssClass="Error"></asp:Label>
                <asp:Label ID="BadNicknameErrorLable" runat="server" Text="<%$ Resources:Resource, ChatRoomBadNicknameError %>" Visible="False" CssClass="Error"></asp:Label>
                <asp:SqlDataSource ID="DefaultSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" InsertCommand="INSERT INTO [Chat-Nickname] (Nickname) VALUES (@Nickname)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>">
                    <InsertParameters>
                        <asp:ControlParameter ControlID="NickNameTextBox" Name="Nickname" PropertyName="Text" />
                    </InsertParameters>
                </asp:SqlDataSource>

            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>

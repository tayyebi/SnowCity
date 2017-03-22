<%@ Page Title="<%$ Resources:Resource, ChatRoom %>" Language="C#" MasterPageFile="~/App_MasterPage/ChatMasterPage.master" AutoEventWireup="true" CodeFile="Chat.aspx.cs" Inherits="App_Page_ChatRoom_Chat" %>

<%@ Register src="../../App_UserControl/Loading-UserControls/Loading2.ascx" tagname="Loading2" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="DefaultContentPlaceHolder" runat="Server">
    <asp:SqlDataSource ID="PoliceDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" InsertCommand="INSERT INTO [Police-ChatPublic] (Value, Nickname) VALUES (@Value, @Nickname)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>">
        <InsertParameters>
            <asp:ControlParameter ControlID="txt_Value" Name="Value" PropertyName="Text" />
            <asp:SessionParameter Name="Nickname" SessionField="ChatRoomNickname" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:UpdatePanel ID="SendPublicUpdatePanel" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="SendCenter">
                <asp:TextBox ID="txt_Value" runat="server"></asp:TextBox>
                <asp:Button ID="btn_Send" runat="server" OnClick="btn_Send_Click" Text="<%$ Resources:Resource, Send %>" />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="PublicUpdatePanel" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:DataList ID="PublicChatDataList" CssClass="PublicChatTable" runat="server" DataKeyField="PublicChatID" DataSourceID="PublicSQLDataSource">
                <ItemTemplate>
                            <asp:Label ID="NicknameLabel" runat="server" CssClass="nickname" Text='<%# Eval("Nickname") %>' />
                            <asp:Label ID="ValueLabel" runat="server" CssClass="value" Text='<%# Eval("Value") %>' />
                </ItemTemplate>
            </asp:DataList>
            <asp:Timer ID="PublicTimer" runat="server" Interval="2000" OnTick="PublicTimer_Tick">
            </asp:Timer>
            <asp:SqlDataSource ID="PublicSQLDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT TOP (10) Value,PublicChatID,Nickname FROM [Chat-Public] ORDER BY PublicChatID DESC"></asp:SqlDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>


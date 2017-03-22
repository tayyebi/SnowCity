<%@ Page Language="C#" MasterPageFile="~/App_MasterPage/Users-LoggedInMasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="USERS_LoggedIn_Admin_Police_ChatRoom_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="DefaultContentPlaceHolder" Runat="Server">
    <asp:MultiView ID="DefaultMultiView" runat="server" ActiveViewIndex="0">
        <asp:View ID="DefaultView" runat="server">
            <asp:Button ID="btn_BackToPoliceDefault" runat="server" OnClick="btn_BackToPoliceDefault_Click" Text="<%$ Resources:Resource, Back %>" />
            <asp:Button ID="PublicChatButton" runat="server" OnClick="PublicChatButton_Click" Text="<%$ Resources:Resource, PublicChat %>" />
            <asp:Button ID="NicknameButton" runat="server" OnClick="NicknameButton_Click" Text="<%$ Resources:Resource, Nickname %>" />
            <asp:Button ID="RejectNicknamesButton" runat="server" Text="<%$ Resources:Resource, Reject %>" OnClick="RejectNicknamesButton_Click" />
        </asp:View>
        <asp:View ID="PublicChat" runat="server">
            <asp:Button ID="btn_BackToDefaultView" runat="server" OnClick="btn_BackToDefaultView_Click" Text="<%$ Resources:Resource, Back %>" />
            <asp:Timer ID="PublicChatTimer" runat="server" OnTick="PublicChatTimer_Tick" Interval="10000">
            </asp:Timer>
            <asp:CheckBox ID="UseTimerCheckBox" runat="server" AutoPostBack="True" OnCheckedChanged="UseTimerCheckBox_CheckedChanged" Text="<%$ Resources:Resource, Timer %>" />
            <asp:Button ID="RefreshGridView" runat="server" OnClick="RefreshGridView_Click" Text="<%$ Resources:Resource, Refresh %>" />
            <asp:GridView ID="PolicePublicChatGridView" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ChatID" DataSourceID="PolicPublicChatSQLDataSource" PageSize="1" SelectedIndex="0" OnSelectedIndexChanged="PolicePublicChatGridView_SelectedIndexChanged" EmptyDataText="<%$ Resources:Resource, NoData %>" CssClass="gv">
                <Columns>
                    <asp:BoundField DataField="ChatID" HeaderText="<%$ Resources:Resource, ID %>" InsertVisible="False" ReadOnly="True" SortExpression="ChatID" />
                    <asp:BoundField DataField="Nickname" HeaderText="<%$ Resources:Resource, Nickname %>" SortExpression="Nickname" />
                </Columns>
            </asp:GridView>
            <table cellpadding="4" cellspacing="0">
                <tr>
                    <td>
                        <asp:Label ID="lbl_Nickname" runat="server" Text="<%$ Resources:Resource, Nickname %>"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Nickname" runat="server" ReadOnly="True"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Value</td>
                    <td>
                        <asp:TextBox ID="txt_Value" runat="server" ReadOnly="True"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <asp:Button ID="btn_Confirm" runat="server" OnClick="btn_Confirm_Click" Text="<%$ Resources:Resource, Confirm %>" />
            <asp:Button ID="btn_Reject" runat="server" OnClick="btn_Reject_Click" Text="<%$ Resources:Resource, Reject %>" />
            <asp:SqlDataSource ID="PolicPublicChatSQLDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT ChatID , Nickname FROM [Police-ChatPublic]" DeleteCommand="DELETE FROM [Police-ChatPublic] WHERE (ChatID = @ChatID)">
                <DeleteParameters>
                    <asp:ControlParameter ControlID="PolicePublicChatGridView" Name="ChatID" PropertyName="SelectedValue" />
                </DeleteParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="PublicChatSQLDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" InsertCommand="INSERT INTO [Chat-Public] (PublicChatID, Value, Nickname) VALUES (@ID, @Value, @Nickname)">
                <InsertParameters>
                    <asp:ControlParameter ControlID="PolicePublicChatGridView" Name="ID" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="hf_Value" Name="Value" PropertyName="Value" />
                    <asp:ControlParameter ControlID="hf_Nickname" Name="Nickname" PropertyName="Value" />
                </InsertParameters>
            </asp:SqlDataSource>
            <asp:HiddenField ID="hf_Nickname" runat="server" Visible="False" />
            <asp:HiddenField ID="hf_Value" runat="server" Visible="False" />
        </asp:View>
        <asp:View ID="NicknameView" runat="server">
            <asp:Button ID="btn_BackToDefaultView0" runat="server" OnClick="btn_BackToDefaultView_Click" Text="<%$ Resources:Resource, Back %>" />
            <asp:Button ID="NicknameViewRefreshButton" runat="server" OnClick="NicknameViewRefreshButton_Click" Text="<%$ Resources:Resource, Refresh %>" />
            <asp:GridView ID="NicknameGridView" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Nickname" DataSourceID="NicknameSqlDataSource" OnSelectedIndexChanged="NicknameGridView_SelectedIndexChanged" EmptyDataText="<%$ Resources:Resource, NoData %>" CssClass="gv">
                <Columns>
                    <asp:CommandField SelectText="<%$ Resources:Resource, Delete %>" ShowSelectButton="True" />
                    <asp:BoundField DataField="Nickname" HeaderText="<%$ Resources:Resource, Nickname %>" ReadOnly="True" SortExpression="Nickname" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="NicknameSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Nickname FROM [Chat-Nickname]" DeleteCommand="DELETE FROM [Chat-Nickname] WHERE (Nickname = @Nickname)">
                <DeleteParameters>
                    <asp:ControlParameter ControlID="NicknameGridView" Name="Nickname" PropertyName="SelectedValue" />
                </DeleteParameters>
            </asp:SqlDataSource>
        </asp:View>
        <asp:View ID="RejectView" runat="server">
            <asp:Button ID="btn_BackToDefaultView1" runat="server" OnClick="btn_BackToDefaultView_Click" Text="<%$ Resources:Resource, Back %>" />
            <asp:GridView ID="RejectedNicknamesGridView" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="RejectedNicknamesSqlDataSource" OnSelectedIndexChanged="RejectedNicknamesGridView_SelectedIndexChanged" EmptyDataText="<%$ Resources:Resource, NoData %>" CssClass="gv">
                <Columns>
                    <asp:CommandField SelectText="<%$ Resources:Resource, Select %>" ShowSelectButton="True" />
                    <asp:BoundField DataField="Value" HeaderText="Value" SortExpression="Value" />
                </Columns>
            </asp:GridView>
            <asp:HiddenField ID="hf_RejectedNickname" runat="server" Visible="False" />
            <asp:SqlDataSource ID="RejectedNicknamesSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Value FROM [Chat-BlockedWords]" DeleteCommand="DELETE FROM [Chat-BlockedWords] WHERE (Value = @Value)" InsertCommand="INSERT INTO [Chat-BlockedWords] (Value) VALUES (@Value)">
                <DeleteParameters>
                    <asp:ControlParameter ControlID="hf_RejectedNickname" Name="Value" PropertyName="Value" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="txt_New" Name="Value" PropertyName="Text" />
                </InsertParameters>
            </asp:SqlDataSource>
            <asp:TextBox ID="txt_New" runat="server"></asp:TextBox><br />
            <asp:Button ID="btn_Add" runat="server" Text="<%$ Resources:Resource, New %>" OnClick="btn_Add_Click" />
            <asp:Button ID="btn_Delete" runat="server" Text="<%$ Resources:Resource, Delete %>" OnClick="btn_Delete_Click" Visible="False" />
        </asp:View>
    </asp:MultiView>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="NoAjaxContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" runat="server" contentplaceholderid="head">
    <link href="<%:WebsitePage.WebsiteRoot(true, false)%>/App_StyleSheet/Users/USERS_LoggedIn_Admin_Police_ChatRoom_Default.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%:WebsitePage.WebsiteRoot(true, false)%>/../App_Scripts/Users/USERS_LoggedIn_Admin_Police_ChatRoom_Default.js"></script>
</asp:Content>
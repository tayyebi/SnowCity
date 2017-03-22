<%@ Page Language="C#" MasterPageFile="~/App_MasterPage/Users-LoggedInMasterPage.master" AutoEventWireup="true" CodeFile="AdminsNews.aspx.cs" Inherits="USERS_LoggedIn_AdminsNews" %>

<asp:Content ID="Content1" ContentPlaceHolderID="DefaultContentPlaceHolder" runat="Server">
    <asp:MultiView ID="DefaultMultiView" runat="server" ActiveViewIndex="0">
        <asp:View ID="ShowNewsView" runat="server">
            <asp:Button ID="Cancel" runat="server" Text="<%$ Resources:Resource, Cancel %>" OnClick="Cancel_Click" />
            <asp:Button ID="Archive" runat="server" OnClick="Archive_Click" Text="<%$ Resources:Resource, Archive %>" />
            <br />
            <asp:DataList ID="ShowTopNewsDataList" runat="server" DataKeyField="NewsID" DataSourceID="ShowTopNewsSqlDataSource" OnSelectedIndexChanged="ShowTopNewsDataList_SelectedIndexChanged" OnItemCommand="ShowTopNewsDataList_ItemCommand" CssClass="dt">
                <ItemTemplate>
                    <asp:Label ID="NewsTitleLabel" runat="server" CssClass="NewsTitle" Text='<%# Eval("NewsTitle") %>' />
                    <asp:Button ID="ShowNewsButton" runat="server" CommandName="select" OnClick="ShowNewsButton_Click" Text="<%$ Resources:Resource, Read %>" />
                    <br />
                    <asp:Label ID="DateLabel" runat="server" Text='<%# Eval("Date") %>' />
                </ItemTemplate>
                <SelectedItemTemplate>
                    <div class="selected">
                        <asp:Button ID="Close" runat="server" CommandName="unselect" Text="<%$ Resources:Resource, Back %>" /><br />
                        <asp:Label ID="ValueLabel" runat="server" Text='<%# Eval("Value") %>' />
                    </div>
                </SelectedItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="ShowTopNewsSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT TOP 3 NewsID , NewsTitle , Date , Value FROM [Users-News] ORDER BY [NewsID] DESC"></asp:SqlDataSource>
        </asp:View>
        <asp:View ID="ShowNewsInGridView" runat="server">
            <asp:Button ID="Cancel1" runat="server" OnClick="Cancel1_Click" Text="<%$ Resources:Resource, Back %>" />
            <asp:GridView ID="ArchiveGridviw" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="NewsID" DataSourceID="ArchiveSqlDataSource" OnSelectedIndexChanged="ArchiveGridviw_SelectedIndexChanged" CssClass="gv">
                <Columns>
                    <asp:CommandField SelectText="<%$ Resources:Resource, Read %>" ShowSelectButton="True" />
                    <asp:BoundField DataField="NewsID" HeaderText="<%$ Resources:Resource, ID%>" InsertVisible="False" ReadOnly="True" SortExpression="NewsID" />
                    <asp:BoundField DataField="NewsTitle" HeaderText="<%$ Resources:Resource, Title%>" SortExpression="NewsTitle" />
                    <asp:BoundField DataField="Date" HeaderText="<%$ Resources:Resource, Date%>" SortExpression="Date" />
                </Columns>
                <RowStyle CssClass="gv_Row" />
            </asp:GridView>
            <asp:SqlDataSource ID="ArchiveSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT NewsID , NewsTitle , Date FROM [Users-News] ORDER BY [NewsID] DESC"></asp:SqlDataSource>
        </asp:View>
        <asp:View ID="ShowNewsDetails" runat="server">
            <asp:Button ID="Cancel0" runat="server" OnClick="Cancel0_Click" Text="<%$ Resources:Resource, Back %>" />
            <br />
            <asp:Label ID="NewsIDLable" runat="server"></asp:Label>
            -<asp:Label ID="NewsTitleLable" runat="server"></asp:Label><br />
            <asp:Label ID="Value" runat="server"></asp:Label>
            -<asp:Label ID="Date" runat="server"></asp:Label>
        </asp:View>
    </asp:MultiView>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="NoAjaxContentPlaceHolder" Runat="Server">
</asp:Content>

<asp:Content ID="Content3" runat="server" contentplaceholderid="head">
    <link href="<%:WebsitePage.WebsiteRoot(true, false)%>/App_StyleSheet/Users/USERS_LoggedIn_AdminsNews.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%:WebsitePage.WebsiteRoot(true, false)%>/App_Scripts/Users/USERS_LoggedIn_AdminsNews.js"></script>
</asp:Content>



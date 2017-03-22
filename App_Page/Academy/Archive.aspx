<%@ Page Title="<%$ Resources:Resource, Archive %>" Language="C#" MasterPageFile="~/App_MasterPage/AccademyMasterPage.master" AutoEventWireup="true" CodeFile="Archive.aspx.cs" Inherits="App_Page_Academy_Archive" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPH_SiteMap" Runat="Server">
    <asp:HyperLink runat="server" NavigateUrl="~/App_Page/Academy/ArchiveSearch.aspx" Text="<%$ Resources:Resource,Search %>"></asp:HyperLink>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="CPH_Board" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="CPH_Default" Runat="Server">
    <asp:GridView ID="DefaultGridView" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CssClass="GridView" DataKeyNames="ArticleID" DataSourceID="DefaultSqlDataSource" OnSelectedIndexChanged="DefaultGridView_SelectedIndexChanged" PageSize="100">
        <Columns>
            <asp:CommandField SelectText="<%$ Resources:Resource, Select %>" ShowSelectButton="True" />
            <asp:BoundField DataField="ArticleID" HeaderText="<%$ Resources:Resource, ID %>" InsertVisible="False" ReadOnly="True" SortExpression="ArticleID" />
            <asp:BoundField DataField="Title" HeaderText="<%$ Resources:Resource, Title %>" SortExpression="Title" />
        </Columns>
        <RowStyle CssClass="GridView_Row" />
    </asp:GridView>
    <asp:SqlDataSource ID="DefaultSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Title,ArticleID FROM [Academy-Article] ORDER BY [ArticleID] DESC"></asp:SqlDataSource>
</asp:Content>


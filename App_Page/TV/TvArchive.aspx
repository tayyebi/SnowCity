<%@ Page Title='<%$ Resources:Resource, Archive %>' Language="C#" MasterPageFile="~/App_MasterPage/TvMasterPage.master" AutoEventWireup="true" CodeFile="TvArchive.aspx.cs" Inherits="App_Page_TV_Tv_Archive" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="DefaultContentPlaceHolder" Runat="Server">
    <asp:GridView ID="Archive" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="ArchiveSqlDataSource" OnSelectedIndexChanged="ArchiveGridView_SelectedIndexChanged" CssClass="GridView" PageSize="100">
        <Columns>
            <asp:CommandField ShowSelectButton="True" SelectText="<%$ Resources:Resource, Play %>" />
            <asp:BoundField DataField="ID" HeaderText="<%$ Resources:Resource, ID %>" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="Date" HeaderText="<%$ Resources:Resource, Date %>" InsertVisible="False" ReadOnly="True" SortExpression="Date" />
            <asp:BoundField DataField="VideoTitle" HeaderText="<%$ Resources:Resource, Title %>" SortExpression="VideoTitle" />
        </Columns>
        <RowStyle CssClass="GridView_Row" />
    </asp:GridView>
    <asp:SqlDataSource ID="ArchiveSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT ID,VideoTitle,Date FROM [News-TV] ORDER BY [ID] DESC"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PlayerContentPlaceHolder" Runat="Server">
    <div class="TvArchive"></div>
</asp:Content>
<asp:Content ID="Content4" runat="server" contentplaceholderid="SiteMapCPH">
    <asp:HyperLink ID="hp_TV" runat="server" NavigateUrl="~/Default-TV.aspx" Text="<%$ Resources:Resource, TV %>"></asp:HyperLink>
    <asp:HyperLink ID="hp_TV0" runat="server" NavigateUrl="~/App_Page/TV/TvArchiveSearch.aspx" Text="<%$ Resources:Resource, Search %>"></asp:HyperLink>
</asp:Content>



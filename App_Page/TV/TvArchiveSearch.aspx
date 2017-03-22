<%@ Page Title="<%$ Resources:Resource, Search %>" Language="C#" MasterPageFile="~/App_MasterPage/TvMasterPage.master" AutoEventWireup="true" CodeFile="TvArchiveSearch.aspx.cs" Inherits="App_Page_TV_TvArchiveSearch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SiteMapCPH" Runat="Server">
    <asp:HyperLink ID="hp_Archive" runat="server" NavigateUrl="~/App_Page/TV/TvArchive.aspx" Text="<%$ Resources:Resource, Archive %>"></asp:HyperLink>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ToolBarCPH" Runat="Server">
    </asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="DefaultContentPlaceHolder" Runat="Server">
    <asp:Label ID="SearchLable" runat="server" Text="<%$ Resources:Resource, Search %>"></asp:Label>
        :<asp:TextBox ID="SearchTextBox" runat="server"></asp:TextBox>
    <asp:Button ID="SearchButton" runat="server" OnClick="SearchButton_Click" Text="<%$ Resources:Resource, Search %>" CssClass="btn_ShowAll" />
    <asp:GridView ID="SearchGridView" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CssClass="GridView" DataKeyNames="ID" DataSourceID="SearchSqlDataSource" EmptyDataText="<%$ Resources:Resource, NoData %>" PageSize="50" OnSelectedIndexChanged="SearchGridView_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ShowSelectButton="True" SelectText="<%$ Resources:Resource, Select %>"/>
            <asp:BoundField DataField="ID" HeaderText="<%$ Resources:Resource, ID %>" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="VideoTitle" HeaderText="<%$ Resources:Resource, Title %>" SortExpression="VideoTitle" />
            <asp:BoundField DataField="Likes" HeaderText="<%$ Resources:Resource, Likes %>" SortExpression="Likes" />
            <asp:BoundField DataField="Views" HeaderText="<%$ Resources:Resource, Views %>" SortExpression="Views" />
            <asp:BoundField DataField="Date" HeaderText="<%$ Resources:Resource, Date %>" SortExpression="Date" />
        </Columns>
        <RowStyle CssClass="GridView_Row" />
    </asp:GridView>
    <asp:SqlDataSource ID="SearchSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT ID,VideoTitle,Likes,Views,Date FROM [News-TV] WHERE ([VideoTitle] LIKE '%' + @VideoTitle + '%')">
        <SelectParameters>
            <asp:ControlParameter ControlID="SearchTextBox" Name="VideoTitle" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="PlayerContentPlaceHolder" Runat="Server">
</asp:Content>


<%@ Page Title="<%$ Resources:Resource, Search %>" Language="C#" MasterPageFile="~/App_MasterPage/AccademyMasterPage.master" AutoEventWireup="true" CodeFile="ArchiveSearch.aspx.cs" Inherits="App_Page_Academy_ArchiveSearch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPH_SiteMap" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="CPH_Board" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="CPH_Default" Runat="Server">
    <asp:Label ID="SearchLable" runat="server" Text="<%$ Resources:Resource, Search %>"></asp:Label>
        :<asp:TextBox ID="SearchTextBox" runat="server"></asp:TextBox>
    <asp:Button ID="SearchButton" runat="server" OnClick="SearchButton_Click" Text="<%$ Resources:Resource, Search %>" />
    <asp:GridView ID="SearchGridView" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CssClass="GridView" DataKeyNames="ArticleID" DataSourceID="SearchSqlDataSource" EmptyDataText="<%$ Resources:Resource, NoData %>" PageSize="50" OnSelectedIndexChanged="SearchGridView_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ShowSelectButton="True" SelectText="<%$ Resources:Resource, Select %>"/>
            <asp:BoundField DataField="ArticleID" HeaderText="<%$ Resources:Resource, ID %>" InsertVisible="False" ReadOnly="True" SortExpression="ArticleID" />
            <asp:BoundField DataField="Title" HeaderText="<%$ Resources:Resource, Title %>" SortExpression="Title" />
            <asp:BoundField DataField="Likes" HeaderText="<%$ Resources:Resource, Likes %>" SortExpression="Likes" />
            <asp:BoundField DataField="Date" HeaderText="<%$ Resources:Resource, Date %>" SortExpression="Date" />
        </Columns>
        <RowStyle CssClass="GridView_Row" />
    </asp:GridView>
    <asp:SqlDataSource ID="SearchSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT ArticleID,Title,Likes,Date FROM [Academy-Article] WHERE ([Title] LIKE '%' + @Title + '%')">
        <SelectParameters>
            <asp:ControlParameter ControlID="SearchTextBox" Name="Title" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>


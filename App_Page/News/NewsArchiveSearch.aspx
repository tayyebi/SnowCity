<%@ Page Title="<%$ Resources:Resource, Search %>" Language="C#" MasterPageFile="~/App_MasterPage/NewsMasterPage.master" AutoEventWireup="true" CodeFile="NewsArchiveSearch.aspx.cs" Inherits="App_Page_News_NewsArchiveSearch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="DefaultContentPlaceHolder" runat="Server">
    <asp:Label ID="SearchLable" runat="server" Text="<%$ Resources:Resource, Search %>"></asp:Label>
    :<asp:TextBox ID="SearchTextBox" runat="server" CssClass="Search"></asp:TextBox>
    <asp:DropDownList ID="SearchDropDownList" runat="server">
        <asp:ListItem Value="Title" Text="<%$ Resources:Resource, Title %>" Selected="True"></asp:ListItem>
        <asp:ListItem Value="Abstract" Text="<%$ Resources:Resource, Abstract %>"></asp:ListItem>
        <asp:ListItem Value="Value" Text="<%$ Resources:Resource, Value %>"></asp:ListItem>
    </asp:DropDownList>
    <asp:Button ID="SearchButton" runat="server" OnClick="SearchButton_Click" Text="<%$ Resources:Resource, Search %>" CssClass="btn_ShowAll" />
    <asp:Panel ID="TitlePanel" runat="server" Visible="False">
        <asp:GridView ID="TitleGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="TitleSqlDataSource" AllowPaging="True" AllowSorting="True" PageSize="20" OnSelectedIndexChanged="SearchGridView_SelectedIndexChanged" CssClass="GridView">
            <Columns>
                <asp:CommandField SelectText="<%$ Resources:Resource, Select %>" ShowSelectButton="True" />
                <asp:BoundField DataField="ID" HeaderText="<%$ Resources:Resource, ID %>" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="Title" HeaderText="<%$ Resources:Resource, Title %>" SortExpression="Title" />
                <asp:BoundField DataField="Abstract" HeaderText="<%$ Resources:Resource, Abstract %>" SortExpression="Abstract" />
            </Columns>
            <RowStyle CssClass="GridView_Row" />
        </asp:GridView>
        <asp:SqlDataSource ID="TitleSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT ID,Title,Abstract FROM [News-News] WHERE ([Title] LIKE '%' + @TITLE + '%') ORDER BY [ID] DESC">
            <SelectParameters>
                <asp:ControlParameter ControlID="SearchTextBox" Name="TITLE" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
    </asp:Panel>
    <asp:Panel ID="AbstractPanel" Visible="false" runat="server">
        <asp:GridView ID="AbstractGridview" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="AbstractSqlDataSource" AllowPaging="True" AllowSorting="True" PageSize="20" OnSelectedIndexChanged="SearchGridView_SelectedIndexChanged" CssClass="GridView">
            <Columns>
                <asp:CommandField SelectText="<%$ Resources:Resource, Select %>" ShowSelectButton="True" />
                <asp:BoundField DataField="ID" HeaderText="<%$ Resources:Resource, ID %>" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="Title" HeaderText="<%$ Resources:Resource, Title %>" SortExpression="Title" />
                <asp:BoundField DataField="Abstract" HeaderText="<%$ Resources:Resource, Abstract %>" SortExpression="Abstract" />
            </Columns>
            <RowStyle CssClass="GridView_Row" />
        </asp:GridView>
        <asp:SqlDataSource ID="AbstractSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT ID,Title,Abstract FROM [News-News] WHERE (Abstract LIKE '%' + @ABSTRACT + '%') ORDER BY [ID] DESC">
            <SelectParameters>
                <asp:ControlParameter ControlID="SearchTextBox" Name="ABSTRACT" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
    </asp:Panel>
    <asp:Panel ID="ValuePanel" Visible="false" runat="server">
        <asp:GridView ID="ValueGridView" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="ValueSqlDataSource" PageSize="20" OnSelectedIndexChanged="SearchGridView_SelectedIndexChanged" CssClass="GridView">
            <Columns>
                <asp:CommandField SelectText="<%$ Resources:Resource, Select %>" ShowSelectButton="True" />
                <asp:BoundField DataField="ID" HeaderText="<%$ Resources:Resource, ID %>" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="Title" HeaderText="<%$ Resources:Resource, Title %>" SortExpression="Title" />
                <asp:BoundField DataField="Abstract" HeaderText="<%$ Resources:Resource, Abstract %>" SortExpression="Abstract" />
            </Columns>
            <RowStyle CssClass="GridView_Row" />
        </asp:GridView>
        <asp:SqlDataSource ID="ValueSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT ID,Title,Abstract FROM [News-News] WHERE ([Value] LIKE '%' + @VALUE + '%') ORDER BY [ID] DESC">
            <SelectParameters>
                <asp:ControlParameter ControlID="SearchTextBox" Name="VALUE" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
    </asp:Panel>
</asp:Content>

<asp:Content ID="Content3" runat="server" contentplaceholderid="ContentPlaceHolderSiteMap">
    <asp:HyperLink ID="hp_NewsRoot" runat="server" NavigateUrl="~/News" Text="<%$ Resources:Resource, News %>"></asp:HyperLink>
    *<asp:HyperLink ID="hp_NewsArchive" runat="server" NavigateUrl="~/News/Archive" Text="<%$ Resources:Resource, Archive %>"></asp:HyperLink>
    *<asp:HyperLink ID="hp_NewsRss" runat="server" NavigateUrl="~/App_Page/News/Rss-NewsDefault.aspx" Text="<%$ Resources:Resource, Feed %>"></asp:HyperLink>
</asp:Content>



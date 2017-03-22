<%@ Page Language="C#" MasterPageFile="~/App_MasterPage/AccademyMasterPage.master" AutoEventWireup="true" CodeFile="Group.aspx.cs" Inherits="App_Page_Academy_Group" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPH_SiteMap" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="CPH_Board" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="CPH_Default" Runat="Server">
        <asp:DataList ID="DefautDataList" runat="server" DataKeyField="ArticleID" DataSourceID="DefaultSqlDataSource" CssClass="DefaultDatalist">
        <ItemTemplate>
            <asp:HyperLink ID="Title" runat="server" Text='<%# Eval("Title") %>' NavigateUrl='<%# Eval("ArticleID","~/App_Page/Academy/Article.aspx?ArticleID={0}") %>' CssClass="ArticleTitle"/>
            <asp:Label ID="Abstract" runat="server" Text='<%# Eval("Abstract") %>' CssClass="ArticleAbstract"/>
        </ItemTemplate>
        <SeparatorTemplate>
            <asp:Image ID="seperatorImage" CssClass="seperator" runat="server" ImageUrl="~/App_Image/Seperator/longline.png" />
        </SeparatorTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="DefaultSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT TOP 10 Title,Abstract,ArticleID FROM [Academy-Article] WHERE (GroupID = @GroupID) ORDER BY ArticleID DESC">
        <SelectParameters>
            <asp:QueryStringParameter Name="GroupID" QueryStringField="GroupID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Button ID="ShowAllButton" runat="server" Text="<%$ Resources:Resource, ShowAll %>" OnClick="ShowAllButton_Click" />
    <asp:Panel ID="ShowAllPanel" runat="server" Visible="False">
        <asp:GridView ID="ShowAllGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="ArticleID" DataSourceID="ShowAllSqlDataSource" PageSize="5" AllowPaging="True" AllowSorting="True" OnSelectedIndexChanged="ShowAllGridView_SelectedIndexChanged" CssClass="GridView">
            <Columns>
                <asp:CommandField SelectText="<%$ Resources:Resource, Select %>" ShowSelectButton="True" />
                <asp:BoundField DataField="ArticleID" HeaderText="<%$ Resources:Resource, ID %>" InsertVisible="False" ReadOnly="True" SortExpression="ArticleID" />
                <asp:BoundField DataField="Title" HeaderText="<%$ Resources:Resource, Title %>" SortExpression="Title" />
                <asp:BoundField DataField="Likes" HeaderText="<%$ Resources:Resource, Like %>" SortExpression="Likes" />
                <asp:BoundField DataField="Date" HeaderText="<%$ Resources:Resource, Date %>" SortExpression="Date" />
            </Columns>
            <RowStyle CssClass="GridView_Row" />
        </asp:GridView>
        <asp:SqlDataSource ID="ShowAllSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT ArticleID,Title,Likes,Date FROM [Academy-Article] WHERE (GroupID = @GroupID) ORDER BY [ArticleID] DESC">
            <SelectParameters>
                <asp:QueryStringParameter Name="GroupID" QueryStringField="GroupID" />
            </SelectParameters>
        </asp:SqlDataSource>
    </asp:Panel>
</asp:Content>


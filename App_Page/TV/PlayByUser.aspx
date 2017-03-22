<%@ Page   Language="C#" MasterPageFile="~/App_MasterPage/TvMasterPage.master" AutoEventWireup="true" CodeFile="PlayByUser.aspx.cs" Inherits="App_Page_TV_PlayByUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SiteMapCPH" Runat="Server">
    <asp:HyperLink ID="hp_Archive" runat="server" NavigateUrl="~/App_Page/TV/TvArchive.aspx" Text="<%$ Resources:Resource, Archive %>"></asp:HyperLink>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ToolBarCPH" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="DefaultContentPlaceHolder" Runat="Server">
        <asp:DataList ID="DefautDataList" runat="server" DataKeyField="ID" DataSourceID="DefaultSqlDataSource">
        <ItemTemplate>
            <asp:HyperLink NavigateUrl='<%# Eval("VideoId", "~/App_Page/TV/Play.aspx?VideoId={0}") %>' ID="headlineHyperLink" runat="server" Text='<%# Eval("VideoTitle") %>' CssClass="VideoTitle" />
        </ItemTemplate>
        <SeparatorTemplate>
            <asp:Image ID="seperatorImage" runat="server" CssClass="seperator" ImageUrl="~/App_Image/Seperator/longline.png" />
        </SeparatorTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="DefaultSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT TOP 10 VideoTitle,VideoId,ID FROM [News-TV] WHERE (UserID = @UserID) ORDER BY ID DESC">
        <SelectParameters>
            <asp:QueryStringParameter Name="UserID" QueryStringField="UserID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Button ID="ShowAllButton" runat="server" Text="<%$ Resources:Resource, ShowAll %>" OnClick="ShowAllButton_Click" CssClass="btn_ShowAll" />
    <asp:Panel ID="ShowAllPanel" runat="server" Visible="False">
        <asp:GridView ID="ShowAllGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="ShowAllSqlDataSource" PageSize="5" AllowPaging="True" AllowSorting="True" OnSelectedIndexChanged="ShowAllGridView_SelectedIndexChanged" CssClass="GridView">
            <Columns>
                <asp:CommandField SelectText="<%$ Resources:Resource, Select %>" ShowSelectButton="True" />
                <asp:BoundField DataField="ID" HeaderText="<%$ Resources:Resource, ID %>" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="VideoTitle" HeaderText="<%$ Resources:Resource, Title %>" SortExpression="VideoTitle" />
                <asp:BoundField DataField="Date" HeaderText="<%$ Resources:Resource, Date %>" SortExpression="Date" />
                <asp:BoundField DataField="Likes" HeaderText="<%$ Resources:Resource, Likes %>" SortExpression="Likes" />
            </Columns>
            <RowStyle CssClass="GridView_Row" />
        </asp:GridView>
        <asp:SqlDataSource ID="ShowAllSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT ID,VideoTitle,Date,Likes FROM [News-TV] WHERE (UserID = @UserID) ORDER BY [ID] DESC">
            <SelectParameters>
                <asp:QueryStringParameter Name="UserID" QueryStringField="UserID" />
            </SelectParameters>
        </asp:SqlDataSource>
    </asp:Panel>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="PlayerContentPlaceHolder" Runat="Server">
</asp:Content>

<asp:Content ID="Content6" runat="server" contentplaceholderid="PageTitleCPH">
    <asp:Label ID="pageTitle" runat="server"></asp:Label>
</asp:Content>



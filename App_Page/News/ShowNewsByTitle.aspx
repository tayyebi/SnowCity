<%@ Page Title="<%$ Resources:Resource, NewsBanner %>" Language="C#" MasterPageFile="~/App_MasterPage/NewsMasterPage.master" AutoEventWireup="true" CodeFile="ShowNewsByTitle.aspx.cs" Inherits="App_Page_News_ShowNews" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="DefaultContentPlaceHolder">
    <asp:DataList ID="DefaultDataList" runat="server" DataKeyField="ID" DataSourceID="DefaultSqlDataSource" CssClass="DefaultDatalist">
        <ItemTemplate>
            <div class="newsItem">
                <asp:Label ID="IDLabel" runat="server" CssClass="serial" Text='<%# Eval("ID") %>' />
                <asp:HyperLink ID="headlineHyperLink" runat="server" CssClass="Title" NavigateUrl='<%# Eval("ID", "~/App_Page/News/ShowNewsByID.aspx?ID={0}") %>' Text='<%# Eval("Title") %>' />
                <asp:Label ID="AbstractLabel" runat="server" Text='<%# Eval("Abstract") %>' CssClass="Abstract" />
            </div>
        </ItemTemplate>
        <SeparatorTemplate>
            <asp:Image ID="seperatorImage" runat="server" CssClass="seperator" ImageUrl="~/App_Image/Seperator/longline.png" />
        </SeparatorTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="DefaultSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT TOP 10 Abstract,Title,ID FROM [News-News] WHERE (Title = @Title) ORDER BY ID DESC">
        <SelectParameters>
            <asp:QueryStringParameter Name="Title" QueryStringField="Title" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Button ID="ShowAllButton" runat="server" Text="<%$ Resources:Resource, ShowAll %>" OnClick="ShowAllButton_Click" CssClass="btn_ShowAll" />
    <asp:Panel ID="ShowAllPanel" runat="server" Visible="False">
        <asp:GridView ID="ShowAllGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="ShowAllSqlDataSource" AllowPaging="True" PageSize="5" AllowSorting="True" OnSelectedIndexChanged="ShowAllGridView_SelectedIndexChanged" CssClass="GridView">
            <Columns>
                <asp:CommandField SelectText="<%$ Resources:Resource, Select %>" ShowSelectButton="True" />
                <asp:BoundField DataField="ID" HeaderText="<%$ Resources:Resource, ID %>" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="Abstract" HeaderText="<%$ Resources:Resource, Abstract %>" SortExpression="Abstract" />
                <asp:BoundField DataField="Views" HeaderText="<%$ Resources:Resource, Views %>" SortExpression="Views" />
                <asp:BoundField DataField="Date" HeaderText="<%$ Resources:Resource, Date %>" SortExpression="Date" />
            </Columns>
            <RowStyle CssClass="GridView_Row" />
        </asp:GridView>
        <asp:SqlDataSource ID="ShowAllSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT ID,Title,Abstract,Views,Date FROM [News-News] WHERE (Title = @Title) ORDER BY [ID] DESC">
            <SelectParameters>
                <asp:QueryStringParameter Name="Title" QueryStringField="Title" />
            </SelectParameters>
        </asp:SqlDataSource>
    </asp:Panel>
</asp:Content>
<asp:Content ID="Content3" runat="server" contentplaceholderid="NoAjax">
</asp:Content>
<asp:Content ID="Content4" runat="server" contentplaceholderid="ContentPlaceHolderSiteMap">
    <asp:HyperLink ID="hp_NewsRoot" runat="server" NavigateUrl="~/News" Text="<%$ Resources:Resource, News %>"></asp:HyperLink>
*<asp:HyperLink ID="hp_NewsArchive" runat="server" NavigateUrl="~/News/Archive" Text="<%$ Resources:Resource, Archive %>"></asp:HyperLink>
</asp:Content>
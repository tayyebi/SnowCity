<%@ Page Title="<%$ Resources:Resource, NewsBanner %>" Language="C#" MasterPageFile="~/App_MasterPage/NewsMasterPage.master" AutoEventWireup="true" CodeFile="ShowNewsByGroup.aspx.cs" Inherits="App_Page_News_ShowNewsByGroup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="DefaultContentPlaceHolder" runat="Server">
    <asp:DataList ID="DefautDataList" runat="server" DataKeyField="ID" DataSourceID="DefaultSqlDataSource" CssClass="DefaultDatalist">
        <ItemTemplate>
            <div class="newsItem">
                <asp:Label ID="IDLabel" runat="server" CssClass="serial" Text='<%# Eval("ID") %>' />
                <asp:HyperLink NavigateUrl='<%# Eval("ID", "~/App_Page/News/ShowNewsByID.aspx?ID={0}") %>' ID="headlineHyperLink" runat="server" Text='<%# Eval("Title") %>' CssClass="Title" />
                <asp:Label ID="AbstractLabel" runat="server" Text='<%# Eval("Abstract") %>' CssClass="Abstract" />
            </div>
        </ItemTemplate>
        <SeparatorTemplate>
            <asp:Image ID="seperatorImage" runat="server" CssClass="seperator" ImageUrl="~/App_Image/Seperator/longline.png" />
        </SeparatorTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="DefaultSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT TOP 10 Abstract,ID,Title FROM [News-News] WHERE (GroupID = @GroupID) ORDER BY [ID] DESC">
        <SelectParameters>
            <asp:QueryStringParameter Name="GroupID" QueryStringField="GroupID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Button ID="ShowAllButton" runat="server" Text="<%$ Resources:Resource, ShowAll %>" OnClick="ShowAllButton_Click" CssClass="btn_ShowAll" />
    <asp:Panel ID="ShowAllPanel" runat="server" Visible="False">
        <asp:GridView ID="ShowAllGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="ShowAllSqlDataSource" AllowPaging="True" PageSize="5" AllowSorting="True" OnSelectedIndexChanged="ShowAllGridView_SelectedIndexChanged" CssClass="GridView">
            <Columns>
                <asp:CommandField SelectText="<%$ Resources:Resource, Select %>" ShowSelectButton="True" />
                <asp:BoundField DataField="ID" HeaderText="<%$ Resources:Resource, ID %>" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="Title" HeaderText="<%$ Resources:Resource, Title %>" SortExpression="Title" />
                <asp:BoundField DataField="Abstract" HeaderText="<%$ Resources:Resource, Abstract %>" SortExpression="Abstract" />
                <asp:BoundField DataField="Views" HeaderText="<%$ Resources:Resource, Views %>" SortExpression="Views" />
                <asp:BoundField DataField="Date" HeaderText="<%$ Resources:Resource, Date %>" SortExpression="Date" />
            </Columns>
            <RowStyle CssClass="GridView_Row" />
        </asp:GridView>
        <asp:SqlDataSource ID="ShowAllSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT ID,Title,Abstract,Views,Date FROM [News-News] WHERE (GroupID = @GroupID) ORDER BY [ID] DESC">
            <SelectParameters>
                <asp:QueryStringParameter Name="GroupID" QueryStringField="GroupID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </asp:Panel>
</asp:Content>
<asp:Content ID="Content3" runat="server" contentplaceholderid="NoAjax">
</asp:Content>
<asp:Content ID="Content4" runat="server" contentplaceholderid="ContentPlaceHolderSiteMap">
<asp:HyperLink ID="hp_NewsRoot" runat="server" NavigateUrl="~/News" Text="<%$ Resources:Resource, News %>"></asp:HyperLink>
*<asp:HyperLink ID="hp_NewsSearch" runat="server" NavigateUrl="~/News/Search" Text="<%$ Resources:Resource, Search %>"></asp:HyperLink>
</asp:Content>
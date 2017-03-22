<%@ Page Title="<%$ Resources:Resource, Archive %>" Language="C#" MasterPageFile="~/App_MasterPage/NewsMasterPage.master" AutoEventWireup="true" CodeFile="NewsArchive.aspx.cs" Inherits="App_Page_News_NewsArchive" %>
<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="<%:WebsitePage.WebsiteRoot(true, false)%>/App_Scripts/-jquery.js" type="text/javascript"></script>
    <script>
        function marquee(e, t) { function s() { if (t.position().right <= -n) { t.css("right", r); s() } else { time = (parseInt(t.position().left, 1e5) - i) * (1e5 / (r - i)); t.animate({ right: -n }, time, "linear", function () { s() }) } } var n = t.width(); var r = e.width(); var i = -n; t.css({ width: n, right: r }); s(e, t); t.mouseover(function () { t.stop(); t.clearQueue() }); t.mouseleave(function () { s(e, t) }) } $(document).ready(function () { marquee($("#tickercontainer"), $("#tickertext")) })
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="DefaultContentPlaceHolder" runat="Server">
    <div id="tickercontainer">
        <marquee id="tickertext">
            <asp:DataList ID="Ticker" runat="server" DataSourceID="TickerDefaultSqlDataSource" RepeatDirection="Horizontal">
            <ItemTemplate>   
                <asp:HyperLink ID="TickerHyperLink" runat="server" class="NewsTickerLink" Text='<%# Eval("Title") %>'  NavigateUrl='<%# Eval("ID", "~/App_Page/News/ShowNewsByID.aspx?ID={0}") %>' ></asp:HyperLink>
            </ItemTemplate>
            </asp:DataList>
        </marquee>
    </div>
    <asp:HyperLink ID="hp_Search" runat="server" NavigateUrl="~/App_Page/News/NewsArchiveSearch.aspx" Text="<%$ Resources:Resource, search %>"></asp:HyperLink>
    <img alt="seperatorImage" src="../../App_Image/Seperator/longline.png" class="seperator" /><asp:GridView ID="DefaultGridView" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="DefaultSqlDataSource" OnSelectedIndexChanged="DefaultGridView_SelectedIndexChanged" PageSize="100" CssClass="GridView">
        <Columns>
            <asp:CommandField SelectText="<%$ Resources:Resource, Select %>" ShowSelectButton="True" />
            <asp:BoundField DataField="ID" HeaderText="<%$ Resources:Resource, ID %>" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="Title" HeaderText="<%$ Resources:Resource, Title %>" SortExpression="Title" />
            <asp:BoundField DataField="Date" HeaderText="<%$ Resources:Resource, Date %>" SortExpression="Date" />
            <asp:BoundField DataField="Views" HeaderText="<%$ Resources:Resource, Views %>" SortExpression="Views" />
        </Columns>
        <RowStyle CssClass="GridView_Row" />
    </asp:GridView>
    <asp:SqlDataSource ID="DefaultSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Date,ID,Views,Title FROM [News-News] ORDER BY [ID] DESC"></asp:SqlDataSource>
    <asp:SqlDataSource ID="TickerDefaultSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT TOP 20 Title,ID FROM [News-News] ORDER BY [ID] DESC"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" runat="server" contentplaceholderid="ContentPlaceHolderSiteMap">
<asp:HyperLink ID="hp_NewsRoot" runat="server" NavigateUrl="~/News" Text="<%$ Resources:Resource, News %>"></asp:HyperLink>
*<asp:HyperLink ID="hp_NewsSearch" runat="server" NavigateUrl="~/News/Search" Text="<%$ Resources:Resource, Search %>"></asp:HyperLink>
</asp:Content>
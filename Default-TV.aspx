<%@ Page Title="<%$ Resources:Resource, TV %>" Language="C#" MasterPageFile="~/App_MasterPage/TvMasterPage.master" AutoEventWireup="true" CodeFile="Default-TV.aspx.cs" Inherits="Default_TV" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="<%:WebsitePage.WebsiteRoot(true, false)%>/App_Scripts/-jquery.js"></script>
    <script type="text/javascript">
        $(function () {
            $('.TvDefault').load('../../App_HTML/TvDefault.html');
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="DefaultContentPlaceHolder" runat="Server">
    <asp:DataList ID="TopDataList" runat="server" DataKeyField="ID" DataSourceID="TopSqlDataSource">
        <ItemTemplate>
            <asp:HyperLink ID="VideoTitle" NavigateUrl='<%# Eval("VideoId", "~/App_Page/TV/Play.aspx?VideoId={0}") %>' runat="server" Text='<%# Eval("VideoTitle") %>' CssClass="VideoTitle" />
        </ItemTemplate>
        <SeparatorTemplate>
            <img src="App_Image/Seperator/longline.png" />
        </SeparatorTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="TopSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT TOP 10 VideoTitle,ID,VideoId FROM [News-TV] ORDER BY ID DESC"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PlayerContentPlaceHolder" Runat="Server">
    <div class="TvDefault">    </div>
</asp:Content>


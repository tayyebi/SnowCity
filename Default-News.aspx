<%@ Page Title="<%$ Resources:Resource, NewsBanner %>" Language="C#" MasterPageFile="~/App_MasterPage/NewsMasterPage.master" AutoEventWireup="true" CodeFile="Default-News.aspx.cs" Inherits="NewsDefault" %>

<%@ Register Src="App_UserControl/News-UserControls/CountNews.ascx" TagName="CountNews" TagPrefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="App_Scripts/-jquery.js"></script>
    <script type="text/javascript">
        $(function () {
            $('#NewsDefault').load('App_HTML/NewsDefault.html');
        });
        $(function () {
            $('#ImageSlider').load('App_UserControl/News-UserControls/Slideshow_tabs/News-ImageLink.aspx');
        });
    </script>
    <meta name="description" content="اخبار در چندین گروه خبری." />
    <meta name="description" content="News in many news groups." />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="DefaultContentPlaceHolder" runat="Server">
    <div id="ImageSlider"></div>
    <uc2:CountNews ID="CountNews" runat="server" />
    <asp:DataList ID="DefaultDatalist" runat="server" DataKeyField="ID" DataSourceID="DefaultDataSource" CssClass="DefaultDatalist">
        <ItemTemplate>
            <div class="newsItem">
                <asp:HyperLink NavigateUrl='<%# Eval("ID", "~/App_Page/News/ShowNewsByID.aspx?ID={0}") %>' ID="headlineHyperLink" runat="server" Text='<%# Eval("Title") %>' CssClass="Title" />
                <asp:Label ID="AbstractLabel" CssClass="Abstract" runat="server" Text='<%# Eval("Abstract") %>' />
            </div>
        </ItemTemplate>
        <SeparatorTemplate>
            <asp:Image ID="img_Seperator" CssClass="seperator" runat="server" ImageUrl="~/App_Image/Seperator/longline.png" />
        </SeparatorTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="DefaultDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT TOP 20 Title,Abstract,ID FROM [News-News] ORDER BY [ID] DESC"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="NoAjax">
</asp:Content>
<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="ContentPlaceHolderSiteMap">
    <asp:HyperLink ID="hp_NewsSearch" runat="server" NavigateUrl="~/News/Search" Text="<%$ Resources:Resource, Search %>"></asp:HyperLink>
    *<asp:HyperLink ID="hp_Archive" runat="server" NavigateUrl="~/News/Archive" Text="<%$ Resources:Resource, Archive %>"></asp:HyperLink>
</asp:Content>
<asp:Content ID="Content5" runat="server" ContentPlaceHolderID="CustomContentPlaceHolder">
</asp:Content>

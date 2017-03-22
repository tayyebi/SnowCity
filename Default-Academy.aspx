<%@ Page Title="<%$ Resources:Resource, Academy %>" Language="C#" MasterPageFile="~/App_MasterPage/AccademyMasterPage.master" AutoEventWireup="true" CodeFile="Default-Academy.aspx.cs" Inherits="Default_Academy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="<%:WebsitePage.WebsiteRoot(true, false)%>/App_Scripts/-jquery.js"></script>
    <script type="text/javascript">
        $(function () {
            $('#AcademyDefault').load('App_HTML/AcademyDefault.html');
        });
    </script>
    <meta name="description" content="آکادمی شهر برفی. دوره های آموزشی." />
    <meta name="description" content="SnowCity Academy In many Courses." />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPH_SiteMap" Runat="Server">
    <asp:HyperLink runat="server" NavigateUrl="~/App_Page/Academy/Archive.aspx" Text="<%$ Resources:Resource,Archive %>"></asp:HyperLink>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="CPH_Default" Runat="Server">
    <asp:DataList ID="DL_Top20" runat="server" DataKeyField="ArticleID" DataSourceID="SDS_Top20" CssClass="DefaultDatalist">
        <ItemTemplate>
            <asp:HyperLink ID="Title" runat="server" Text='<%# Eval("Title") %>' NavigateUrl='<%# Eval("ArticleID","~/App_Page/Academy/Article.aspx?ArticleID={0}") %>' CssClass="ArticleTitle"/>
            <asp:Label ID="Abstract" runat="server" Text='<%# Eval("Abstract") %>' CssClass="ArticleAbstract"/>
        </ItemTemplate>
        <SeparatorTemplate>
            <asp:Image ID="seperatorImage" CssClass="seperator" runat="server" ImageUrl="~/App_Image/Seperator/longline.png" />
        </SeparatorTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SDS_Top20" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT TOP 20 Title,ArticleID,Abstract FROM [Academy-Article] ORDER BY [ArticleID] DESC"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="CPH_Board">
    <div id="AcademyDefault"></div>
</asp:Content>



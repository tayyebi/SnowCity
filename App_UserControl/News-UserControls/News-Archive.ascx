<%@ Control Language="C#" AutoEventWireup="true" CodeFile="News-Archive.ascx.cs" Inherits="App_UserControl_News_UserControls_News_Archive" %>
<div class="news-archive">
    <asp:HyperLink ID="ArchiveLable" runat="server" Text="<%$ Resources:Resource, Archive %>" CssClass="webpartTitle" NavigateUrl="~/App_Page/News/NewsArchive.aspx"></asp:HyperLink>
    <asp:DataList ID="DefaultDataList" runat="server" DataKeyField="ID" DataSourceID="DefaultDataSource">
        <ItemTemplate>
            <asp:HyperLink ID="headlineHyperlink" NavigateUrl='<%# Eval("Title", "~/App_Page/News/ShowNewsByTitle.aspx?Title={0}") %>' runat="server" Text='<%# Eval("Title") %>' CssClass="links" />
        </ItemTemplate>
        <SeparatorTemplate>
            <asp:Image ID="SeperatorImage" runat="server" ImageUrl="~/App_Image/Seperator/shortline.png" />
        </SeparatorTemplate>
    </asp:DataList>
</div>
<div class="news-view">
    <asp:Label ID="ViewLableNewsArchive" runat="server" Text="<%$ Resources:Resource, Views %>" CssClass="webpartTitle"></asp:Label>
    <asp:DataList ID="DefaultDataList0" runat="server" DataKeyField="ID" DataSourceID="DefaultDataSource0">
        <ItemTemplate>
            <asp:HyperLink ID="headlineHyperlink" NavigateUrl='<%# Eval("ID", "~/App_Page/News/ShowNewsByID.aspx?ID={0}") %>' runat="server" Text='<%# Eval("Title") %>' CssClass="links" />
        </ItemTemplate>
        <SeparatorTemplate>
            <asp:Image ID="SeperatorImage" runat="server" ImageUrl="~/App_Image/Seperator/shortline.png" />
        </SeparatorTemplate>
    </asp:DataList>
</div>
<div class="news-like">
    <asp:Label ID="LikeLableNewsArchive" runat="server" Text="<%$ Resources:Resource, Likes %>" CssClass="webpartTitle"></asp:Label>
    <asp:DataList ID="DefaultDataList1" runat="server" DataKeyField="ID" DataSourceID="DefaultDataSource1">
        <ItemTemplate>
            <asp:HyperLink ID="headlineHyperlink" NavigateUrl='<%# Eval("ID", "~/App_Page/News/ShowNewsByID.aspx?ID={0}") %>' runat="server" Text='<%# Eval("Title") %>' CssClass="links" />
        </ItemTemplate>
        <SeparatorTemplate>
            <asp:Image ID="SeperatorImage" runat="server" ImageUrl="~/App_Image/Seperator/shortline.png" />
        </SeparatorTemplate>
    </asp:DataList>
</div>
<asp:SqlDataSource ID="DefaultDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT TOP 10 Title,ID FROM [News-News] ORDER BY [Likes] DESC"></asp:SqlDataSource>
<asp:SqlDataSource ID="DefaultDataSource0" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT TOP 10 Title,ID FROM [News-News] ORDER BY [Views] DESC"></asp:SqlDataSource>
<asp:SqlDataSource ID="DefaultDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT TOP 20 Title,ID FROM [News-News] ORDER BY [ID] DESC"></asp:SqlDataSource>
<%@ Control Language="C#" AutoEventWireup="true" CodeFile="News-Group.ascx.cs" Inherits="App_UserControl_News_UserControls_News_Group" %>
<div class="news-group">
    <asp:Label ID="JornalsLable" runat="server" Text="<%$ Resources:Resource, NewsGroup %>" CssClass="webpartTitle"></asp:Label>
    <asp:DataList ID="DefaultDataList" runat="server" DataKeyField="GroupID" DataSourceID="DefaultDataSource">
        <ItemTemplate>
            <asp:HyperLink ID="GroupHyperlink" runat="server" Text='<%# Eval("Name") %>' NavigateUrl='<%# Eval("GroupID", "~/App_Page/News/ShowNewsByGroup.aspx?GroupID={0}") %>' CssClass="links" />
        </ItemTemplate>
        <SeparatorTemplate>
            <asp:Image ID="SeperatorImage" runat="server" ImageUrl="~/App_Image/Seperator/shortline.png" />
        </SeparatorTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="DefaultDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Name,GroupID FROM [News-Group] ORDER BY Name DESC"></asp:SqlDataSource>
</div>

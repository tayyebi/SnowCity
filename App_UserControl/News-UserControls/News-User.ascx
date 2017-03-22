<%@ Control Language="C#" AutoEventWireup="true" CodeFile="News-User.ascx.cs" Inherits="App_UserControl_News_UserControls_News_User" %>
<div class="news-user">
    <asp:Label ID="JornalsLable" runat="server" Text="<%$ Resources:Resource, Jornals %>" CssClass="webpartTitle"></asp:Label>
    <asp:DataList ID="DefaultDataList" runat="server" DataKeyField="UserID" DataSourceID="DefaultDataSource">
        <ItemTemplate>
            <asp:HyperLink ID="FullnameHyperlink" runat="server" Text='<%# Eval("Fullname") %>' NavigateUrl='<%# Eval("UserID", "~/App_Page/News/ShowNewsByUser.aspx?UserID={0}") %>' CssClass="links" />
        </ItemTemplate>
        <SeparatorTemplate>
            <asp:Image ID="SeperatorImage" runat="server" ImageUrl="~/App_Image/Seperator/shortline.png" />
        </SeparatorTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="DefaultDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Fullname,UserID FROM [Users-Users] WHERE ([MainType]=N'Jornal') ORDER BY Fullname DESC"></asp:SqlDataSource>
</div>

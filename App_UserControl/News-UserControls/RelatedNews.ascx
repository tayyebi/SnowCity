<%@ Control Language="C#" AutoEventWireup="true" CodeFile="RelatedNews.ascx.cs" Inherits="App_UserControl_News_UserControls_RelatedNews" %>
<asp:HiddenField ID="Title" runat="server" Visible="False" />
<asp:HiddenField ID="GroupID" runat="server" Visible="False" />
<asp:HiddenField ID="UserID" runat="server" Visible="False" />
<asp:DataList ID="RelatedDataList" runat="server" DataKeyField="ID" DataSourceID="RelatedSqlDataSource">
    <ItemTemplate>
        <asp:HyperLink ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' NavigateUrl='<%# Eval("ID","~/App_Page/News/ShowNewsByID.aspx?ID={0}") %>' CssClass="relatedtitle" />
    </ItemTemplate>
</asp:DataList>
<asp:SqlDataSource ID="RelatedSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT TOP 5 Title,ID FROM [News-News] WHERE (GroupID=@GroupID) AND (ID<>@ID) ORDER BY [ID] DESC">
    <SelectParameters>
        <asp:ControlParameter ControlID="Title" Name="TITLE" PropertyName="Value" />
        <asp:QueryStringParameter Name="ID" QueryStringField="ID" />
        <asp:ControlParameter ControlID="GroupID" Name="GroupID" PropertyName="Value" />
        <asp:ControlParameter ControlID="UserID" Name="UserID" PropertyName="Value" />
    </SelectParameters>
</asp:SqlDataSource>

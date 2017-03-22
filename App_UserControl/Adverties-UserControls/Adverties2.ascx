<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Adverties2.ascx.cs" Inherits="App_UserControl_Adverties2" %>
<div class="adverties2">
    <asp:DataList ID="Adverties2DataList" runat="server" DataKeyField="AdvertiesID" DataSourceID="Adverties2SsqlDataSource">
        <ItemTemplate>
            <asp:Label ID="AdvertiesFinalCodeLabel" runat="server" Text='<%# Eval("AdvertiesFinalCode") %>' />
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="Adverties2SsqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT AdvertiesFinalCode,AdvertiesID FROM [Adverties-Classic] WHERE ([AdvertiesGroup] = @AdvertiesGroup)">
        <SelectParameters>
            <asp:Parameter DefaultValue="News" Name="AdvertiesGroup" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</div>
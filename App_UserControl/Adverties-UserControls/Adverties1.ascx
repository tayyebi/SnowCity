<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Adverties1.ascx.cs" Inherits="App_UserControl_Adverties1" %>
<div class="adverties1">
    <asp:DataList ID="adverties1DataList" runat="server" DataKeyField="AdvertiesID" DataSourceID="adverties1SsqlDataSource">
        <ItemTemplate>
            <asp:Label ID="AdvertiesFinalCodeLabel" runat="server" Text='<%# Eval("AdvertiesFinalCode") %>' />
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="adverties1SsqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT AdvertiesFinalCode,AdvertiesID FROM [Adverties-Classic] WHERE ([AdvertiesGroup] = @AdvertiesGroup)">
        <SelectParameters>
            <asp:Parameter DefaultValue="TV" Name="AdvertiesGroup" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</div>
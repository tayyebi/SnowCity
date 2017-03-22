<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Adverties6.ascx.cs" Inherits="App_UserControl_Adverties6" %>
<div class="adverties6">
    <asp:DataList ID="Adverties5DataList" runat="server" DataKeyField="AdvertiesID" DataSourceID="Adverties5SqlDataSource">
        <ItemTemplate>
            <asp:Label ID="AdvertiesFinalCodeLabel" runat="server" Text='<%# Eval("AdvertiesFinalCode") %>' />
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="Adverties5SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT AdvertiesFinalCode,AdvertiesID FROM [Adverties-Classic] WHERE ([AdvertiesGroup] = @AdvertiesGroup)">
        <SelectParameters>
            <asp:Parameter DefaultValue="Academy" Name="AdvertiesGroup" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</div>
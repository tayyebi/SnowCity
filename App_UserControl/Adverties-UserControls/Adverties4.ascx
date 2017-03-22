<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Adverties4.ascx.cs" Inherits="App_UserControl_Adverties4" %>
<div class="adverties4">
    <asp:DataList ID="Adverties4DataList" runat="server" DataKeyField="AdvertiesID" DataSourceID="Adverties4SqlDataSource">
        <ItemTemplate>
            <asp:Label ID="AdvertiesFinalCodeLabel" runat="server" Text='<%# Eval("AdvertiesFinalCode") %>' />
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="Adverties4SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT AdvertiesFinalCode,AdvertiesID FROM [Adverties-Classic] WHERE ([AdvertiesGroup] = @AdvertiesGroup)">
        <SelectParameters>
            <asp:Parameter DefaultValue="AdminsAndEmployee" Name="AdvertiesGroup" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</div>
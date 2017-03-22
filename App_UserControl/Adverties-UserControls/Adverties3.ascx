<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Adverties3.ascx.cs" Inherits="App_UserControl_Adverties3" %>
<div class="adverties3">
    <asp:DataList ID="Adverties3DataList" runat="server" DataKeyField="AdvertiesID" DataSourceID="Adverties3SqlDataSource">
        <ItemTemplate>
            <asp:Label ID="AdvertiesFinalCodeLabel" runat="server" Text='<%# Eval("AdvertiesFinalCode") %>' />
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="Adverties3SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT AdvertiesFinalCode,AdvertiesID FROM [Adverties-Classic] WHERE ([AdvertiesGroup] = @AdvertiesGroup)">
        <SelectParameters>
            <asp:Parameter DefaultValue="ChatRoom" Name="AdvertiesGroup" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</div>
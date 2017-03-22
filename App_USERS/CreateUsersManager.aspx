<%@ Page Title="<%$ Resources:Resource, UsersDefaultBanner %>" Language="C#" MasterPageFile="~/App_MasterPage/Users-DefaultMasterPage.master" AutoEventWireup="true" CodeFile="CreateUsersManager.aspx.cs" Inherits="USERS_CreateUsersManager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="<%:WebsitePage.WebsiteRoot(true, false)%>/App_StyleSheet/Users/USERS_CreateUsersManager.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="DefaultContentPlaceHolder" runat="Server">
    <div class="user">
        <asp:Label ID="User" runat="server" Text="<%$ Resources:Resource, UsersManager %>"></asp:Label>
        <asp:GridView ID="UsersManagerGridView" runat="server" AutoGenerateColumns="False" DataSourceID="UsersManagerSqlDataSource" EmptyDataText="<%$ Resources:Resource, NoData %>" CssClass="gv">
            <Columns>
                <asp:BoundField DataField="Fullname" HeaderText="<%$ Resources:Resource, Fullname %>" SortExpression="Fullname" />
            </Columns>
            <EmptyDataTemplate>
                <asp:Button ID="UsersManager" runat="server" OnClick="UsersManager_Click" Text="<%$ Resources:Resource, Create %>" />
            </EmptyDataTemplate>
            <RowStyle CssClass="gv_Row" />
        </asp:GridView>
    </div>
    <div class="Type">
        <asp:Label ID="UsersType" runat="server" Text="<%$ Resources:Resource, UsersType %>"></asp:Label>
        <asp:GridView ID="UsersTypeGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="Type" DataSourceID="UsersTypeSqlDataSource" EmptyDataText="<%$ Resources:Resource, NoData %>" CssClass="gv">
            <Columns>
                <asp:BoundField DataField="Type" HeaderText="<%$ Resources:Resource, Type %>" ReadOnly="True" SortExpression="Type" />
                <asp:BoundField DataField="MainType" HeaderText="<%$ Resources:Resource, MainType %>" SortExpression="MainType" />
            </Columns>
            <EmptyDataTemplate>
                <asp:Button ID="UsersType" runat="server" OnClick="Type_Click" Text="<%$ Resources:Resource, Create %>" />
            </EmptyDataTemplate>
            <RowStyle CssClass="gv_Row" />
        </asp:GridView>
    </div>
    <div class="mainType">
        <asp:Label ID="UsersMainType" runat="server" Text="<%$ Resources:Resource, UsersMainType %>"></asp:Label>
        <asp:GridView ID="UsersMainTypeGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="MainType" DataSourceID="MainTypeSqlDataSource" EmptyDataText="<%$ Resources:Resource, NoData %>" CssClass="gv">
            <Columns>
                <asp:BoundField DataField="MainType" HeaderText="<%$ Resources:Resource, MainType %>" ReadOnly="True" SortExpression="MainType" />
            </Columns>
            <EmptyDataTemplate>
                <asp:Button ID="UsersMainType" runat="server" OnClick="MainType_Click" Text="<%$ Resources:Resource, Create %>" />
            </EmptyDataTemplate>
            <RowStyle CssClass="gv_Row" />
        </asp:GridView>
    </div>
    <asp:SqlDataSource ID="UsersTypeSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT MainType, Type FROM [Users-Type]" InsertCommand="INSERT INTO [Users-Type] (Type, MainType) VALUES (@Type, @MainType)">
        <InsertParameters>
            <asp:Parameter DefaultValue="UsersManager" Name="Type" />
            <asp:Parameter DefaultValue="Manager" Name="MainType" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="MainTypeSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT MainType FROM [Users-MainType] "></asp:SqlDataSource>
    <asp:SqlDataSource ID="UsersManagerSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Fullname FROM [Users-Users] WHERE (Type = N'UsersManager') AND (MainType = N'Manager')" InsertCommand="INSERT INTO [Users-Users] (RandomNumber, Username, Password, Fullname, Firstname, Lastname, Type, LastLoginDate, IsOnline, MainType) VALUES (@RandomNumber, @Username, @Password, @Fullname, @Firstname, @Lastname, @Type, @LastLoginDate, @IsOnline, @MainType)">
        <InsertParameters>
            <asp:Parameter DefaultValue="0000000" Name="RandomNumber" />
            <asp:Parameter DefaultValue="SnowMan" Name="Username" />
            <asp:Parameter DefaultValue="SnowMan" Name="Password" />
            <asp:Parameter DefaultValue="محمدرضا طیبی" Name="Fullname" />
            <asp:Parameter DefaultValue="محمدرضا" Name="Firstname" />
            <asp:Parameter DefaultValue="طیبی" Name="Lastname" />
            <asp:Parameter DefaultValue="UsersManager" Name="Type" />
            <asp:Parameter DefaultValue="FirstLogin" Name="LastLoginDate" />
            <asp:Parameter DefaultValue="Never Online Before" Name="IsOnline" />
            <asp:Parameter DefaultValue="Manager" Name="MainType" />
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>


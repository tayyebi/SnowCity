<%@ Page Language="C#" MasterPageFile="~/App_MasterPage/Users-LoggedInMasterPage.master" AutoEventWireup="true" CodeFile="EditProfile.aspx.cs" Inherits="USERS_LoggedIn_EditProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="DefaultContentPlaceHolder" runat="Server">
    <div class="OldPassword">
        <asp:Label ID="OldPassword" runat="server" Text="<%$ Resources:Resource, OldPassword %>"></asp:Label>
        <asp:TextBox ID="txt_OldPassword" runat="server" TextMode="Password"></asp:TextBox>
    </div>
    <div class="NewPassword">
        <asp:Label ID="NewPassword" runat="server" Text="<%$ Resources:Resource, NewPassword %>"></asp:Label>
        <asp:TextBox ID="txt_NewPassword" runat="server" TextMode="Password"></asp:TextBox>
    </div>
    <asp:Button ID="Cancel" runat="server" OnClick="Cancel_Click" Text="<%$ Resources:Resource, Cancel %>" />
    <asp:Button ID="Edit" runat="server" Text="<%$ Resources:Resource, Edit %>" OnClick="Edit_Click" />
    <asp:SqlDataSource ID="PasswordSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" UpdateCommand="UPDATE [Users-Users] SET Password = @NewPassword  WHERE (Password = @OldPassword) AND (Username = @Username) AND (Fullname = @Fullname)">
        <UpdateParameters>
            <asp:ControlParameter ControlID="txt_NewPassword" Name="NewPassword" PropertyName="Text" />
            <asp:ControlParameter ControlID="txt_OldPassword" Name="OldPassword" PropertyName="Text" />
            <asp:SessionParameter Name="Username" SessionField="Username" />
            <asp:SessionParameter Name="Fullname" SessionField="Fullname" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="NoAjaxContentPlaceHolder" Runat="Server">
</asp:Content>

<asp:Content ID="Content3" runat="server" contentplaceholderid="head">
    <link href="<%:WebsitePage.WebsiteRoot(true, false)%>/App_StyleSheet/Users/USERS_EditProfile.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%:WebsitePage.WebsiteRoot(true, false)%>/App_Scripts/Users/USERS_EditProfile.js"></script>
</asp:Content>



<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Login.ascx.cs" Inherits="App_UserControl_Login" %>
<%@ Register src="../Loading-UserControls/Loading2.ascx" tagname="Loading2" tagprefix="uc2" %>

<div class="Login">
    <asp:MultiView ID="LoginMultiView" runat="server" ActiveViewIndex="0">
        <asp:View ID="LoginView" runat="server">
            <div class="username">
                <asp:Label ID="UsernameLable" runat="server" Text="<%$ Resources:Resource, Username %>"></asp:Label>
                <asp:TextBox ID="UsernameTextBox" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UsernameTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
            </div>
            <div class="password">
                <asp:Label ID="PasswordLable" runat="server" Text="<%$ Resources:Resource, Password %>"></asp:Label>
                <asp:TextBox ID="PasswordTextBox" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="PasswordTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
            </div>
            <asp:Button ID="AuthenticateButton" runat="server" OnClick="Authenticate_Click" Text="<%$ Resources:Resource, Authenticate %>" />
            <asp:HyperLink ID="ForgotPassword" runat="server" NavigateUrl="~/App_USERS/ForgotPassword.aspx" Text="<%$ Resources:Resource, ForgotPassword %>"></asp:HyperLink>
            <asp:TextBox ID="RandomNumberTextBox" runat="server" ReadOnly="True" />
            <asp:Label ID="LoginError" runat="server" Text="<%$ Resources:Resource, LoginError %>" Visible="False"></asp:Label>
            <asp:Label ID="LoginBadError" runat="server" Text="<%$ Resources:Resource, LoginBadError %>" Visible="False"></asp:Label>
            <asp:HyperLink ID="IsProblemFromDatabase" runat="server" NavigateUrl="~/App_USERS/CreateUsersManager.aspx" Text="<%$ Resources:Resource, IsProblemFromDatabase %>" Visible="False"></asp:HyperLink>
        </asp:View>
        <asp:View ID="SelectTypeView" runat="server">
            <asp:DropDownList ID="UserIdDropDownList" runat="server" DataSourceID="UsersIdSqlDataSource" DataTextField="MainType" DataValueField="UserID">
            </asp:DropDownList><br />
            <asp:Button ID="LoginButton" runat="server" OnClick="LoginButton_Click" Text="<%$ Resources:Resource, Login %>" />
        </asp:View>
    </asp:MultiView>
</div>
<asp:HiddenField ID="usernamehiddenfield" runat="server" Visible="False" />
<asp:HiddenField ID="passwordhiddenfield" runat="server" Visible="False" />
<asp:SqlDataSource ID="UsersIdSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT MainType, UserID FROM [Users-Users] WHERE (Username = @Username)">
    <SelectParameters>
        <asp:ControlParameter ControlID="UsernameTextBox" Name="Username" PropertyName="Text" Type="String" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="LoginDatesSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" InsertCommand="INSERT INTO [Users-LoginDate] (UserID, LoginDate) VALUES (@UserID, @LoginDate)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>">
    <InsertParameters>
        <asp:ControlParameter ControlID="UserIdDropDownList" Name="UserID" PropertyName="SelectedValue" />
        <asp:ControlParameter ControlID="LoginDateHiddenField" Name="LoginDate" PropertyName="Value" />
    </InsertParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="LoginDateSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" UpdateCommand="UPDATE [Users-Users] SET LastLoginDate = @LastLoginDate, IsOnline = @IsOnline, RandomNumber = @RandomNumber WHERE (UserID = @UserID)">
    <UpdateParameters>
        <asp:ControlParameter ControlID="LoginDateHiddenFiled" Name="LastLoginDate" PropertyName="Value" />
        <asp:ControlParameter ControlID="IsOnlineHiddenFiled" Name="IsOnline" PropertyName="Value" />
        <asp:ControlParameter ControlID="UserIdDropDownList" Name="UserID" PropertyName="SelectedValue" />
        <asp:ControlParameter ControlID="RandomNumberTextBox" Name="RandomNumber" PropertyName="Text" />
    </UpdateParameters>
</asp:SqlDataSource>
<asp:HiddenField ID="LoginDateHiddenFiled" runat="server" Visible="False" />
<asp:HiddenField ID="IsOnlineHiddenFiled" runat="server" Value="False" />
<asp:HiddenField ID="LoginDateHiddenField" runat="server" />
                        


<%@ Page   Language="C#" MasterPageFile="~/App_MasterPage/Users-LoggedInMasterPage.master" AutoEventWireup="true" CodeFile="AppErrors.aspx.cs" Inherits="USERS_LoggedIn_Admin_Manager_AppErrors" %>

<asp:Content ID="Content1" ContentPlaceHolderID="DefaultContentPlaceHolder" runat="Server">
    <asp:HyperLink ID="Back" runat="server" NavigateUrl="~/App_USERS/LoggedIn/Admin/Manager/Default.aspx" Text="<%$ Resources:Resource, Back %>"></asp:HyperLink>
    <asp:GridView ID="DefaultGridView" runat="server" AutoGenerateColumns="False" DataSourceID="DefaultSqlDataSource" OnSelectedIndexChanged="DefaultGridView_SelectedIndexChanged" SelectedIndex="0" CssClass="gv">
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="<%$ Resources:Resource, ID%>" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="ProblemType" HeaderText="<%$ Resources:Resource, Type %>" SortExpression="ProblemType" />
            <asp:BoundField DataField="ProblemAdress" HeaderText="<%$ Resources:Resource, Adress %>" SortExpression="ProblemAdress" />
            <asp:BoundField DataField="ProblemDate" HeaderText="<%$ Resources:Resource, Date %>" SortExpression="ProblemDate" />
        </Columns>
    </asp:GridView>
    <asp:TextBox ID="IdTextBox" runat="server" ReadOnly="True" Width="100%"></asp:TextBox>
    <asp:SqlDataSource ID="DefaultSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM Problem WHERE (ID = @ID)" SelectCommand="SELECT TOP 1 ID , ProblemType , ProblemAdress , ProblemDate FROM [Problem] ORDER BY [ID] DESC">
        <DeleteParameters>
            <asp:ControlParameter ControlID="IdTextBox" Name="ID" PropertyName="Text" />
        </DeleteParameters>
    </asp:SqlDataSource>
    <asp:TextBox ID="ValueTextBox" runat="server" OnTextChanged="ValueTextBox_TextChanged" TextMode="MultiLine"></asp:TextBox>
    <asp:Button ID="DeleteAndNext" runat="server" OnClick="DeleteAndNext_Click" Text="<%$ Resources:Resource, Delete %>" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="NoAjaxContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" runat="server" contentplaceholderid="head">
    <link href="<%:WebsitePage.WebsiteRoot(true, false)%>/App_StyleSheet/Users/USERS_LoggedIn_Admin_Manager_AppErrors.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%:WebsitePage.WebsiteRoot(true, false)%>/App_Scripts/Users/USERS_LoggedIn_Admin_Manager_AppErrors.js"></script>
</asp:Content>



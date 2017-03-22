<%@ Page Language="C#" MasterPageFile="~/App_MasterPage/Users-LoggedInMasterPage.master" AutoEventWireup="true" CodeFile="Converstation.aspx.cs" Inherits="USERS_LoggedIn_Converstation" %>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="head">
    <link href="<%:WebsitePage.WebsiteRoot(true, false)%>/App_StyleSheet/Users/USERS_LoggedIn_Converstation.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%:WebsitePage.WebsiteRoot(true, false)%>/App_Scripts/Users/USERS_LoggedIn_Converstation.js"></script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="DefaultContentPlaceHolder" runat="Server">
    <asp:MultiView ID="DefaultMultiView" runat="server" ActiveViewIndex="0">
        <asp:View ID="DefaultView" runat="server">
            <div class="default">
            <asp:Button ID="Cancel" runat="server" OnClick="Cancel_Click" Text="<%$ Resources:Resource, Back %>" />
            <asp:Button ID="Start" runat="server" Text="<%$ Resources:Resource, New %>" OnClick="Start_Click" />
            <asp:GridView ID="DefaultGridView" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="DefaultSqlDataSource" OnSelectedIndexChanged="DefaultGridView_SelectedIndexChanged" CssClass="gv">
                <Columns>
                    <asp:CommandField SelectText="<%$ Resources:Resource, Read %>" ShowSelectButton="True" />
                    <asp:BoundField DataField="ID" HeaderText="<%$ Resources:Resource, ID%>" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="Title" HeaderText="<%$ Resources:Resource, Title%>" SortExpression="Title" />
                    <asp:BoundField DataField="ToFullname" HeaderText="<%$ Resources:Resource, To%>" SortExpression="ToFullname" />
                    <asp:BoundField DataField="FromFullname" HeaderText="<%$ Resources:Resource, From%>" SortExpression="FromFullname" />
                </Columns>
                <RowStyle CssClass="gv_Row" />
            </asp:GridView>
            <asp:SqlDataSource ID="DefaultSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT ID , Title , ToFullname , FromFullname FROM [Users-Converstation] WHERE (ToID = @ToID) OR (FromID = @FromID) ORDER BY [ID] DESC">
                <SelectParameters>
                    <asp:SessionParameter Name="ToID" SessionField="UserID" />
                    <asp:SessionParameter Name="FromID" SessionField="UserID" />
                </SelectParameters>
            </asp:SqlDataSource>
            </div>
        </asp:View>
        <asp:View ID="ConverstationView" runat="server">
            <div class="view">
            <asp:TextBox ID="SendTextBox" runat="server"></asp:TextBox>
            <asp:Button ID="SendMessage0" runat="server" OnClick="SendMessage_Click" Text="<%$ Resources:Resource, Send %>" />
                <asp:Label ID="lbl_Title" runat="server"></asp:Label>
            <asp:GridView ID="ConverstationGridView" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="ConverstationSqlDataSource" CssClass="gv" ShowHeader="False">
                <Columns>
                    <asp:BoundField DataField="Value" SortExpression="Value" ShowHeader="False" />
                </Columns>
                <EmptyDataTemplate>
                </EmptyDataTemplate>
                <RowStyle CssClass="gv_Row" />
            </asp:GridView>
            <asp:Label ID="emptyvalidator" runat="server" Text="*" Visible="False"></asp:Label>
            <asp:SqlDataSource ID="ConverstationSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT ID, Value FROM [Users-Converstation] WHERE (Title = @Title) AND (ToID = @ToID) ORDER BY ID DESC" InsertCommand="INSERT INTO [Users-Converstation] (FromFullname, ToFullname, FromID, ToID, Title, Value) VALUES (@FromFullname, @ToFullname, @FromId, @ToId, @Title, @Value)" DeleteCommand="DELETE FROM [Users-Converstation] WHERE (Title = @Title) AND (FromID = @UserID) OR (Title = @Title) AND (ToID = @UserID)">
                <DeleteParameters>
                    <asp:ControlParameter ControlID="lbl_Title" Name="Title" PropertyName="Text" />
                    <asp:SessionParameter Name="UserID" SessionField="UserID" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="FromFullnameLable" Name="FromFullname" PropertyName="Text" />
                    <asp:ControlParameter ControlID="ToFullnameDropDownList" Name="ToFullname" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="FromIdLable" Name="FromId" PropertyName="Text" />
                    <asp:ControlParameter ControlID="ToIdDropDownList" Name="ToId" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="TitleTextBox" Name="Title" PropertyName="Text" />
                    <asp:ControlParameter ControlID="ValueTextBox" Name="Value" PropertyName="Text" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="lbl_Title" Name="Title" PropertyName="Text" />
                    <asp:SessionParameter Name="ToID" SessionField="UserID" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SendMessageSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" InsertCommand="INSERT INTO [Users-Converstation] (FromFullname, ToFullname, FromID, ToID, Title, Value) VALUES (@FromFullname, @ToFullname, @FromId, @ToId, @Title, @Value)">
                <InsertParameters>
                    <asp:ControlParameter ControlID="hf_From" Name="FromFullname" PropertyName="Value" />
                    <asp:ControlParameter ControlID="hf_To" Name="ToFullname" PropertyName="Value" />
                    <asp:ControlParameter ControlID="hf_FromId" Name="FromId" PropertyName="Value" />
                    <asp:ControlParameter ControlID="hf_ToId" Name="ToId" PropertyName="Value" />
                    <asp:ControlParameter ControlID="lbl_Title" Name="Title" PropertyName="Text" />
                    <asp:ControlParameter ControlID="SendTextBox" Name="Value" PropertyName="Text" />
                </InsertParameters>
            </asp:SqlDataSource>
            <asp:Button ID="Cancel0" runat="server" OnClick="Cancel0_Click" Text="<%$ Resources:Resource, Back %>" />
            <asp:Button ID="Databind" runat="server" OnClick="Databind_Click" Text="<%$ Resources:Resource, Refresh %>" />
            <asp:Button ID="Delete" runat="server" OnClick="Delete_Click" Text="<%$ Resources:Resource, Delete %>" />
                </div>
        </asp:View>
        <asp:View ID="NewConverstationView" runat="server">
            <div class="new">
                <asp:Button ID="Cancel1" runat="server" OnClick="Cancel0_Click" Text="<%$ Resources:Resource, Back %>" />
                <asp:Button ID="SendButton" runat="server" OnClick="SendButton_Click" Text="<%$ Resources:Resource, Send %>" />
                <br />
                <asp:Label ID="From" runat="server" Text="<%$ Resources:Resource, From %>"></asp:Label>
                :<asp:Label ID="FromFullnameLable" runat="server"></asp:Label>
                -<asp:Label ID="FromIdLable" runat="server"></asp:Label>
                <br />
                <asp:Label ID="To" runat="server" Text="<%$ Resources:Resource, To %>"></asp:Label>
                :<asp:DropDownList ID="ToFullnameDropDownList" runat="server" AutoPostBack="True" DataSourceID="UsersSqlDataSource" DataTextField="Fullname" DataValueField="Fullname">
                </asp:DropDownList>
                -<asp:DropDownList ID="ToIdDropDownList" runat="server" DataSourceID="UsersIdSqlDataSource" DataTextField="UserID" DataValueField="UserID">
                </asp:DropDownList>
                <asp:SqlDataSource ID="UsersIdSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [UserID], [Fullname] FROM [Users-Users] WHERE ([Fullname] = @Fullname)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ToFullnameDropDownList" Name="Fullname" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="UsersSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Fullname], [UserID] FROM [Users-Users] WHERE (UserID=@UserID)">
                    <SelectParameters>
                        <asp:SessionParameter Name="UserID" SessionField="UserID" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                <asp:Label ID="TitleLable" runat="server" Text="<%$ Resources:Resource, Title %>"></asp:Label>
                :<asp:TextBox ID="TitleTextBox" runat="server"></asp:TextBox>
                <asp:Label ID="emptyvalidator0" runat="server" Text="*" Visible="False"></asp:Label>
                <br />
                <asp:Label ID="emptyvalidator1" runat="server" Text="*" Visible="False"></asp:Label>
                <asp:TextBox ID="ValueTextBox" runat="server" TextMode="MultiLine" Width="100%"></asp:TextBox>
            </div>
        </asp:View>
    </asp:MultiView>
    <asp:HiddenField ID="IDHiddenField" runat="server" ViewStateMode="Enabled" />
    <asp:HiddenField ID="hf_From" runat="server" />
    <asp:HiddenField ID="hf_FromId" runat="server" />
    <asp:HiddenField ID="hf_To" runat="server" />
    <asp:HiddenField ID="hf_ToId" runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="NoAjaxContentPlaceHolder" Runat="Server">
</asp:Content>
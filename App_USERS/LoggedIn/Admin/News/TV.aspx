<%@ Page Language="C#" MasterPageFile="~/App_MasterPage/Users-LoggedInMasterPage.master" AutoEventWireup="true" CodeFile="TV.aspx.cs" Inherits="USERS_LoggedIn_TV" %>

<asp:Content ID="Content1" ContentPlaceHolderID="DefaultContentPlaceHolder" runat="Server">
    <asp:MultiView ID="DefaultMultiView" runat="server" ActiveViewIndex="0">
        <asp:View ID="MonitorView" runat="server">
            <asp:HiddenField ID="hf_Date" runat="server" Value="Date" Visible="False" />
            <asp:Button ID="Back" runat="server" OnClick="Back_Click" Text="<%$ Resources:Resource, Back %>" />
            <asp:Button ID="Insert" runat="server" OnClick="Insert_Click" Text="<%$ Resources:Resource, Insert %>" />
            <asp:Button ID="Edit" runat="server" Enabled="False" OnClick="Edit_Click" Text="<%$ Resources:Resource, Edit %>" />
            <asp:GridView ID="DefaultGridView" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="DefaultSqlDataSource" OnSelectedIndexChanged="DefaultGridView_SelectedIndexChanged" CssClass="gv" EmptyDataText="<%$ Resources:Resource, NoData %>">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" SelectText="<%$ Resources:Resource, Select %>" />
                    <asp:BoundField DataField="ID" HeaderText="<%$ Resources:Resource, ID%>" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="VideoTitle" HeaderText="<%$ Resources:Resource, Title %>" SortExpression="VideoTitle" />
                    <asp:BoundField DataField="VideoId" HeaderText="<%$ Resources:Resource, Adress %>" SortExpression="VideoId" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="DefaultSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT ID , VideoTitle , VideoID FROM [News-TV] WHERE (UserID = @UserID) ORDER BY ID DESC" DeleteCommand="DELETE FROM [News-TV] WHERE (ID = @ID)" InsertCommand="INSERT INTO [News-TV] (VideoTitle, VideoDescription, VideoId, UserID,GroupID,Date) VALUES (@Title, @Description, @URL, @UserID,@GroupID,@Date)" UpdateCommand="UPDATE [News-TV] SET VideoTitle = @Title, VideoDescription = @Description, VideoId = @URL, UserID = @UserID,GroupID=@GroupID WHERE (ID = @ID)">
                <DeleteParameters>
                    <asp:ControlParameter ControlID="txt_ID0" Name="ID" PropertyName="Text" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="txt_Title" Name="Title" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txt_Description" Name="Description" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txt_URL" Name="URL" PropertyName="Text" />
                    <asp:SessionParameter Name="UserID" SessionField="UserID" />
                    <asp:ControlParameter ControlID="ddl_Group" Name="GroupID" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="hf_Date" Name="Date" PropertyName="Value" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="UserID" SessionField="UserID" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="txt_Title0" Name="Title" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txt_Description0" Name="Description" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txt_URL0" Name="URL" PropertyName="Text" />
                    <asp:SessionParameter Name="UserID" SessionField="UserID" />
                    <asp:ControlParameter ControlID="txt_ID0" Name="ID" PropertyName="Text" />
                    <asp:ControlParameter ControlID="ddl_Group0" Name="GroupID" PropertyName="SelectedValue" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="GroupSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT GroupID , Name FROM [News-Group]"></asp:SqlDataSource>
        </asp:View>
        <asp:View ID="InsertView" runat="server">
            <asp:Button ID="BackToDefaultView" runat="server" OnClick="BackToDefaultView_Click" Text="<%$ Resources:Resource, Back %>" />
            <asp:Button ID="Insert0" runat="server" OnClick="Insert0_Click" Text="<%$ Resources:Resource, Insert %>" />
            <table cellpadding="4" cellspacing="0">
                <tr>
                    <td style="width: 43px">
                        <asp:Label runat="server" ID="Title" Text="<%$ Resources:Resource, Title %>"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Title" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 43px; height: 31px;">
                        <asp:Label ID="URL" runat="server" Text="URL"></asp:Label>
                    </td>
                    <td style="height: 31px">
                        <asp:TextBox ID="txt_URL" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Group" runat="server" Text="<%$ Resources:Resource, Group %>"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddl_Group" runat="server" DataSourceID="GroupSqlDataSource" DataTextField="Name" DataValueField="GroupID">
                        </asp:DropDownList>
                    </td>
                </tr>

                <tr>
                    <td colspan="2">
                        <asp:Label ID="Description" runat="server" Text="<%$ Resources:Resource, Description %>"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:TextBox ID="txt_Description" runat="server" TextMode="MultiLine" Width="100%"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="EditView" runat="server">
            <asp:Button ID="BackToDefaultView0" runat="server" OnClick="BackToDefaultView_Click" Text="<%$ Resources:Resource, Back %>" />
            <asp:Button ID="Delete" runat="server" OnClick="Delete0_Click" Text="<%$ Resources:Resource, Delete %>" />
            <asp:Button ID="Update" runat="server" OnClick="Update0_Click" Text="<%$ Resources:Resource, Edit %>" />
            <table cellpadding="4" cellspacing="0">
                <tr>
                    <td style="width: 43px">
                        <asp:Label ID="ID0" runat="server" Text="<%$ Resources:Resource, ID %>"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_ID0" runat="server" ReadOnly="True"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 43px">
                        <asp:Label ID="Title0" runat="server" Text="<%$ Resources:Resource, Title %>"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Title0" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 43px">
                        <asp:Label ID="URL0" runat="server" Text="URL"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_URL0" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Group0" runat="server" Text="<%$ Resources:Resource, Group %>"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddl_Group0" runat="server" DataSourceID="GroupSqlDataSource" DataTextField="Name" DataValueField="GroupID">
                        </asp:DropDownList>
                    </td>
                </tr>

                <tr>
                    <td colspan="2">
                        <asp:Label ID="Description0" runat="server" Text="<%$ Resources:Resource, Description %>"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:TextBox ID="txt_Description0" runat="server" TextMode="MultiLine" Width="100%"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </asp:View>
    </asp:MultiView>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="NoAjaxContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" runat="server" contentplaceholderid="head">
    <link href="<%:WebsitePage.WebsiteRoot(true, false)%>/App_StyleSheet/Users/USERS_LoggedIn_Admin_News_TV.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%:WebsitePage.WebsiteRoot(true, false)%>/App_Scripts/Users/USERS_LoggedIn_Admin_News_Tv.js"></script>
</asp:Content>
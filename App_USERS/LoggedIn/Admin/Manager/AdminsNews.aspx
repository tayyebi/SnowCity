<%@ Page   Language="C#" MasterPageFile="~/App_MasterPage/Users-LoggedInMasterPage.master" AutoEventWireup="true" CodeFile="AdminsNews.aspx.cs" Inherits="USERS_LoggedIn_Admin_Manager_AdminsNews" %>

<%@ Register assembly="SnowCity.HtmlEditor" namespace="SnowCity.HtmlEditor" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="DefaultContentPlaceHolder" runat="Server">
    <asp:MultiView ID="DefaultMultiView" runat="server" ActiveViewIndex="0">
        <asp:View ID="DefaultView" runat="server">
            <asp:HyperLink ID="Back" runat="server" NavigateUrl="~/App_USERS/LoggedIn/Admin/Manager/Default.aspx" Text="<%$ Resources:Resource, Back %>"></asp:HyperLink>
            <asp:Button ID="New" runat="server" Text="<%$ Resources:Resource, New %>" OnClick="New_Click" />
            <asp:Button ID="Edit" runat="server" Text="<%$ Resources:Resource, Edit %>" OnClick="Edit_Click" Enabled="False" EnableTheming="True" />
            <asp:Button ID="Delete" runat="server" Text="<%$ Resources:Resource, Delete %>" OnClick="Delete_Click" Enabled="False" />
            <asp:GridView ID="DefaultGridView" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="NewsID" DataSourceID="DefaultSqlDataSource" OnSelectedIndexChanged="DefaultGridView_SelectedIndexChanged" CssClass="gv">
                <Columns>
                    <asp:CommandField SelectText="<%$ Resources:Resource, Select %>" ShowSelectButton="True" />
                    <asp:BoundField DataField="NewsID" HeaderText="<%$ Resources:Resource, ID %>" InsertVisible="False" ReadOnly="True" SortExpression="NewsID" />
                    <asp:BoundField DataField="NewsTitle" HeaderText="<%$ Resources:Resource, Title %>" SortExpression="NewsTitle" />
                    <asp:BoundField DataField="Date" HeaderText="<%$ Resources:Resource, Date %>" SortExpression="Date" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="DefaultSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT NewsID , NewsTitle , Date FROM [Users-News] WHERE (SenderID = @SenderID) ORDER BY NewsID DESC" InsertCommand="INSERT INTO [Users-News] (NewsTitle, Value, SenderID, Date) VALUES (@title, @Value, @UserID, @Date)" UpdateCommand="UPDATE [Users-News] SET NewsTitle = @Title, Value = @Value WHERE (NewsID = @Id)" DeleteCommand="DELETE FROM [Users-News] WHERE (NewsID = @ID)">
                <DeleteParameters>
                    <asp:ControlParameter ControlID="txt_Serial" Name="ID" PropertyName="Text" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="txt_Title" Name="title" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txt_Value" Name="Value" PropertyName="Text" />
                    <asp:SessionParameter Name="UserID" SessionField="UserID" />
                    <asp:ControlParameter ControlID="lbl_Date" Name="Date" PropertyName="Text" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="SenderID" SessionField="UserID" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="txt_Title2" Name="Title" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txt_Value0" Name="Value" PropertyName="Text" />
                    <asp:ControlParameter ControlID="DefaultGridView" Name="Id" PropertyName="SelectedValue" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </asp:View>
        <asp:View ID="InsertView" runat="server">
            <asp:Button ID="btn_Back" runat="server" OnClick="btn_Back_Click" Text="<%$ Resources:Resource, Back %>" />
            <table cellpadding="4" cellspacing="0">
                <tr>
                    <td>
                        <asp:Label ID="lbl_Title" runat="server" Text="<%$ Resources:Resource, Title %>"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Title" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="height: 27px">
                        <asp:Label ID="lbl_Value" runat="server" Text="<%$ Resources:Resource, Value %>"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <cc1:HtmlEditor ID="txt_Value" runat="server" AllowedAttributes="class,href,target,src,align,valign,color,size,face,dir,alt,title" Toolbars="ForeColor,BackColor:Bold,Italic,Underline:Left,Center,Right:Link,Image" ToggleMode="None" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="lbl_Date" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;&nbsp;<asp:Button ID="btn_Insert" runat="server" OnClick="btn_Insert_Click" Text="<%$ Resources:Resource, Insert %>" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="EditView" runat="server">
            <asp:Button ID="btn_Back0" runat="server" OnClick="btn_Back_Click" Text="<%$ Resources:Resource, Back %>" />
            <table cellpadding="4" cellspacing="0">
                <tr>
                    <td>
                        <asp:Label ID="lbl_Title2" runat="server" Text="<%$ Resources:Resource, Title %>"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Title2" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="height: 27px">
                        <asp:Label ID="lbl_Value0" runat="server" Text="<%$ Resources:Resource, Value %>"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <cc1:HtmlEditor ID="txt_Value0" runat="server" AllowedAttributes="class,href,target,src,align,valign,color,size,face,dir,alt,title" Toolbars="ForeColor,BackColor:Bold,Italic,Underline:Left,Center,Right:Link,Image" HtmlModeEditable="False" ToggleMode="None" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="lbl_Date0" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;&nbsp;<asp:Button ID="btn_Update" runat="server" OnClick="btn_Update_Click" Text="<%$ Resources:Resource, edit %>" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="DeleteView" runat="server">
            <asp:Button ID="btn_Back1" runat="server" OnClick="btn_Back_Click" Text="<%$ Resources:Resource, Back %>" />
            <table cellpadding="4" cellspacing="0">
                <tr>
                    <td>
                        <asp:Label ID="lbl_Serial" runat="server" Text="<%$ Resources:Resource, ID %>"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Serial" runat="server" ReadOnly="True"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lbl_Title1" runat="server" Text="<%$ Resources:Resource, Title %>"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Title1" runat="server" ReadOnly="True"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btn_Delete" runat="server" Text="<%$ Resources:Resource, Delete %>" OnClick="btn_Delete_Click" />
                    </td>
                </tr>
            </table>
        </asp:View>
    </asp:MultiView>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="NoAjaxContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" runat="server" contentplaceholderid="head">
    <link href="<%:WebsitePage.WebsiteRoot(true, false)%>/App_StyleSheet/Users/USERS_LoggedIn_Admin_Manager_AdminsNews.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%:WebsitePage.WebsiteRoot(true, false)%>/App_Scripts/Users/USERS_LoggedIn_Admin_Manager_AdminsNews.js"></script>
</asp:Content>

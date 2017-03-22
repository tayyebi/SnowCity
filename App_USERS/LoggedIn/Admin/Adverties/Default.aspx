<%@ Page   Language="C#" MasterPageFile="~/App_MasterPage/Users-LoggedInMasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="USERS_LoggedIn_Admin_Adverties_Default" %>

<%@ Register assembly="FreeTextBox" namespace="FreeTextBoxControls" tagprefix="FTB" %>

<%@ Register assembly="SnowCity.HtmlEditor" namespace="SnowCity.HtmlEditor" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="DefaultContentPlaceHolder" runat="Server">
    <asp:MultiView ID="DefaultMultiView" runat="server" ActiveViewIndex="0">
        <asp:View ID="DefaultView" runat="server">
            <asp:Button ID="BackToDefaultPage" runat="server" OnClick="BackToDefaultPage_Click" Text="<%$ Resources:Resource, Back %>" />
            <asp:Button ID="ClassicAdverties" runat="server" Text="<%$ Resources:Resource, ClassicAdverties %>" OnClick="ClassicAdverties_Click" />
            <asp:Button ID="InteligentAdverties" runat="server" Text="<%$ Resources:Resource, InteligentAdverties %>" />
            <br />
        </asp:View>
        <asp:View ID="Classic_DefaultView" runat="server">
            <asp:Button ID="BackToDefaultView" runat="server" OnClick="BackToDefaultView_Click" Text="<%$ Resources:Resource, Back %>" />
            <asp:Button ID="Insert" runat="server" OnClick="Insert_Click" Text="<%$ Resources:Resource, Insert %>" />
            <asp:Button ID="Edit" runat="server" OnClick="Edit_Click" Text="<%$ Resources:Resource, Edit %>" Enabled="False" />
            <asp:Button ID="Delete" runat="server" OnClick="Delete_Click" Text="<%$ Resources:Resource, Delete %>" Enabled="False" />
            <asp:GridView ID="ClassicGridView" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="AdvertiesID" DataSourceID="ClassicSqlDataSource" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CssClass="gv" EmptyDataText="<%$ Resources:Resource, NoData %>">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" SelectText="<%$ Resources:Resource, Select %>" />
                    <asp:BoundField DataField="AdvertiesID" HeaderText="<%$ Resources:Resource, ID %>" InsertVisible="False" ReadOnly="True" SortExpression="AdvertiesID" />
                    <asp:BoundField DataField="AdvertiesName" HeaderText="<%$ Resources:Resource, Name %>" SortExpression="AdvertiesName" />
                    <asp:BoundField DataField="AdvertiesGroup" HeaderText="<%$ Resources:Resource, Group %>" SortExpression="AdvertiesGroup" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="ClassicSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT AdvertiesID , AdvertiesName , AdvertiesGroup FROM [Adverties-Classic]" InsertCommand="INSERT INTO [Adverties-Classic] (AdvertiesName, AdvertiesFinalCode, AdvertiesGroup) VALUES (@Name, @Source, @Group )" DeleteCommand="DELETE FROM [Adverties-Classic] WHERE (AdvertiesID = @ID)" UpdateCommand="UPDATE [Adverties-Classic] SET AdvertiesName = @Name, AdvertiesFinalCode = @Code, AdvertiesGroup = @Group WHERE (AdvertiesID = @ID)">
                <DeleteParameters>
                    <asp:ControlParameter ControlID="Classic_txt_ID" Name="ID" PropertyName="Text" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="Classic_txt_Name" Name="Name" PropertyName="Text" />
                    <asp:ControlParameter ControlID="Classic_txt_Source" Name="Source" PropertyName="Text" />
                    <asp:ControlParameter ControlID="Classic_ddl_Group" Name="Group" PropertyName="SelectedValue" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="Classic_txt_Name0" Name="Name" PropertyName="Text" />
                    <asp:ControlParameter ControlID="Classic_txt_Source0" Name="Code" PropertyName="Text" />
                    <asp:ControlParameter ControlID="Classic_ddl_Group0" Name="Group" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="ClassicGridView" Name="ID" PropertyName="SelectedValue" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </asp:View>
        <asp:View ID="Classic_InsertView" runat="server">
            <asp:Button ID="BackToClassicView" runat="server" OnClick="BackToClassicView_Click" Text="<%$ Resources:Resource, Cancel %>" />
            <asp:Button ID="Classic_Insert" runat="server" Text="<%$ Resources:Resource, Insert %>" OnClick="Classic_Insert_Click" />
            <table cellpadding="4" cellspacing="0">
                <tr>
                    <td>
                        <asp:Label ID="Classic_lbl_Name" runat="server" Text="<%$ Resources:Resource, Name %>"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="Classic_txt_Name" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Classic_lbl_Group" runat="server" Text="<%$ Resources:Resource, Group %>"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="Classic_ddl_Group" runat="server">
                            <asp:ListItem>Society</asp:ListItem>
                            <asp:ListItem>News</asp:ListItem>
                            <asp:ListItem>ChatRoom</asp:ListItem>
                            <asp:ListItem>AdminsAndEmployee</asp:ListItem>
                            <asp:ListItem>NewsShowByID</asp:ListItem>
                            <asp:ListItem>TV</asp:ListItem>
                            <asp:ListItem>Academy</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Classic_lbl_Code" runat="server" Text="<%$ Resources:Resource, Source %>"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:TextBox ID="Classic_txt_Source" runat="server" TextMode="MultiLine" Width="100%"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="Classic_EditView" runat="server">
            <asp:Button ID="BackToClassicView0" runat="server" OnClick="BackToClassicView_Click" Text="<%$ Resources:Resource, Cancel %>" />
            <asp:Button ID="Classic_Edit" runat="server" Text="<%$ Resources:Resource, Edit %>" OnClick="Classic_Edit_Click" />
            <table cellpadding="4" cellspacing="0">
                <tr>
                    <td>
                        <asp:Label ID="Classic_lbl_Name0" runat="server" Text="<%$ Resources:Resource, Name %>"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="Classic_txt_Name0" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Classic_lbl_Group0" runat="server" Text="<%$ Resources:Resource, Group %>"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="Classic_txt_Group0" runat="server" ReadOnly="True"></asp:TextBox>
                        &lt;&gt;<asp:DropDownList ID="Classic_ddl_Group0" runat="server">
                            <asp:ListItem>Society</asp:ListItem>
                            <asp:ListItem>News</asp:ListItem>
                            <asp:ListItem>ChatRoom</asp:ListItem>
                            <asp:ListItem>AdminsAndEmployee</asp:ListItem>
                            <asp:ListItem>NewsShowByID</asp:ListItem>
                            <asp:ListItem>TV</asp:ListItem>
                            <asp:ListItem>Academy</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Classic_lbl_Code0" runat="server" Text="<%$ Resources:Resource, Source %>"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:TextBox ID="Classic_txt_Source0" runat="server" TextMode="MultiLine" Width="100%"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="Classic_DeleteView" runat="server">
            <asp:Button ID="BackToClassicView1" runat="server" OnClick="BackToClassicView_Click" Text="<%$ Resources:Resource, Cancel %>" />
            <asp:Button ID="Classic_Delete" runat="server" Text="<%$ Resources:Resource, Delete %>" OnClick="Classic_Delete_Click" />
            <table cellpadding="4" cellspacing="0">
                <tr>
                    <td>
                        <asp:Label ID="Classic_lbl_Name1" runat="server" Text="<%$ Resources:Resource, Name %>"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="Classic_txt_Name1" runat="server" ReadOnly="True"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Classic_lbl_ID" runat="server" Text="<%$ Resources:Resource, ID %>"></asp:Label>
                    </td>
                    <td style="margin-left: 40px">
                        <asp:TextBox ID="Classic_txt_ID" runat="server" ReadOnly="True"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </asp:View>
    </asp:MultiView>
</asp:Content>
<asp:Content ID="Content3" runat="server" contentplaceholderid="head">
    <link href="<%:WebsitePage.WebsiteRoot(true, false)%>/App_StyleSheet/Users/USERS_LoggedIn_Admin_Adverties_Default.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%:WebsitePage.WebsiteRoot(true, false)%>/App_Scripts/Users/USERS_LoggedIn_Admin_Adverties_Default.js"></script>
</asp:Content>



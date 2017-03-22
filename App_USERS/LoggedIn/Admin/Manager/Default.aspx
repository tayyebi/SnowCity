<%@ Page   Language="C#" MasterPageFile="~/App_MasterPage/Users-LoggedInMasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="USERS_LoggedIn_Admin_Manager_Default" %>


<%@ Register src="../../../../App_UserControl/Users-UserControls/UsersImage.ascx" tagname="UsersImage" tagprefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="DefaultContentPlaceHolder" runat="Server">
    <table cellpadding="4" cellspacing="0">
        <tr>
            <td>
                <asp:MultiView ID="DefaultMultiView" runat="server" ActiveViewIndex="0">

                    <asp:View ID="DefaultView" runat="server">
                        <asp:Button ID="BackToDefaultPage" runat="server" OnClick="BackToDefaultPage_Click" Text="<%$ Resources:Resource, Back %>" />
                        <asp:Button ID="Insert" runat="server" OnClick="Button1_Click" Text="<%$ Resources:Resource, Insert %>" />
                        <asp:Button ID="Edit" runat="server" OnClick="Edit_Click" Text="<%$ Resources:Resource, Edit %>" Enabled="False" />
                        <asp:Button ID="Delete" runat="server" Enabled="False" OnClick="Delete_Click" Text="<%$ Resources:Resource, Delete %>" />
                        <asp:Button ID="MultiPlace" runat="server" OnClick="MultiPlace_Click" Text="<%$ Resources:Resource, MultiPlace %>" Enabled="False" />
                        <asp:Button ID="Type" runat="server" OnClick="Type_Click" Text="<%$ Resources:Resource, Type %>" />
                        <asp:Button ID="MainType" runat="server" OnClick="MainType_Click" Text="<%$ Resources:Resource, MainType %>" />
                        <asp:Button ID="LoginDates" runat="server" OnClick="LoginDates_Click" Text="<%$ Resources:Resource, LoginDates %>" />
                        <asp:HyperLink ID="AdminsNews" runat="server" NavigateUrl="~/App_USERS/LoggedIn/Admin/Manager/AdminsNews.aspx" Text="<%$ Resources:Resource, AdminsNews %>"></asp:HyperLink>
                        <asp:HyperLink ID="AppErrors" runat="server" NavigateUrl="~/App_USERS/LoggedIn/Admin/Manager/AppErrors.aspx" Text="<%$ Resources:Resource, Error %>"></asp:HyperLink>
                        <asp:GridView ID="DefaultGridView" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="UserID" DataSourceID="DefaultSqlDataSource" OnSelectedIndexChanged="DefaultGridView_SelectedIndexChanged" CssClass="gv" EmptyDataText="<%$ Resources:Resource, NoData %>">
                            <Columns>
                                <asp:CommandField SelectText="<%$ Resources:Resource, Select %>" ShowSelectButton="True" />
                                <asp:BoundField DataField="Username" HeaderText="<%$ Resources:Resource, Username %>" SortExpression="Username" />
                                <asp:BoundField DataField="Firstname" HeaderText="<%$ Resources:Resource, Firstname %>" SortExpression="Firstname" />
                                <asp:BoundField DataField="Lastname" HeaderText="<%$ Resources:Resource, Lastname %>" SortExpression="Lastname" />
                                <asp:BoundField DataField="MainType" HeaderText="<%$ Resources:Resource, MainType %>" SortExpression="MainType" />
                                <asp:BoundField DataField="Type" HeaderText="<%$ Resources:Resource, Type %>" SortExpression="Type" />
                                <asp:BoundField DataField="UserID" HeaderText="<%$ Resources:Resource, UserID %>" SortExpression="UserID" />
                            </Columns>
                        </asp:GridView>
                        <asp:Label ID="ChooseItemErrorLable" runat="server" Text="<%$ Resources:Resource, ChooseItemError %>" Visible="False"></asp:Label>
                        <asp:SqlDataSource ID="DefaultSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM  [Users-Users] WHERE (UserID = @UserID)  AND (Username = @Username)" InsertCommand="INSERT INTO [Users-Users] (RandomNumber, Username, Password, Fullname, Firstname, Lastname, MainType, Type, Description, LastLoginDate, IsOnline) VALUES (@RandomNumber, @Username, @Password, @Fullname, @Firtname, @Lastname, @MainType, @Type, @Description, @LastLoginDate, @IsOnline)" SelectCommand="SELECT Username , Firstname , Lastname , MainType , Type , UserID FROM [Users-Users]" UpdateCommand="UPDATE [Users-Users] SET Username = @Username,
 Password = @Password,
 Fullname = @Fullname,
 Firstname = @Firstname,
 Lastname = @Lastname,
 MainType = @MainType,
 Type = @Type, 
Description = @Description
 WHERE (UserID = @UserID)">
                            <DeleteParameters>
                                <asp:ControlParameter ControlID="DeleteUserIDHiddenField" Name="UserID" PropertyName="Value" />
                                <asp:ControlParameter ControlID="DeleteUsernameTextbox" Name="Username" PropertyName="Text" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:ControlParameter ControlID="InsertRandomNumberHiddenField" Name="RandomNumber" PropertyName="Value" />
                                <asp:ControlParameter ControlID="InsertUsernameTextbox" Name="Username" PropertyName="Text" />
                                <asp:ControlParameter ControlID="InsertPasswordTextBox" Name="Password" PropertyName="Text" />
                                <asp:ControlParameter ControlID="InsertFullnameHiddenField" Name="Fullname" PropertyName="Value" />
                                <asp:ControlParameter ControlID="InsertFirstnameTextBox" Name="Firtname" PropertyName="Text" />
                                <asp:ControlParameter ControlID="InsertLastnameTextBox" Name="Lastname" PropertyName="Text" />
                                <asp:ControlParameter ControlID="InsertMainTypeDropDownList" Name="MainType" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="InsertTypeDropDownList" Name="Type" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="InsertDescriptionTextBox" Name="Description" PropertyName="Text" />
                                <asp:ControlParameter ControlID="InsertLastloginDateHiddenField" Name="LastLoginDate" PropertyName="Value" />
                                <asp:ControlParameter ControlID="InsertIsOnlineHiddenFiled" Name="IsOnline" PropertyName="Value" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:SessionParameter Name="UserID" SessionField="UserID" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:ControlParameter ControlID="EditUsernameTextbox" Name="Username" PropertyName="Text" />
                                <asp:ControlParameter ControlID="EditPasswordTextBox" Name="Password" PropertyName="Text" />
                                <asp:ControlParameter ControlID="EditFullnameHiddenField" Name="Fullname" PropertyName="Value" />
                                <asp:ControlParameter ControlID="EditFirstnameTextBox" Name="Firstname" PropertyName="Text" />
                                <asp:ControlParameter ControlID="EditLastnameTextBox" Name="Lastname" PropertyName="Text" />
                                <asp:ControlParameter ControlID="EditMainTypeDropDownList" Name="MainType" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="EditTypeDropDownList" Name="Type" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="EditDescriptionTextBox" Name="Description" PropertyName="Text" />
                                <asp:ControlParameter ControlID="EditUserIDHiddenField" Name="UserID" PropertyName="Value" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="MainTypeSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT MainType FROM [Users-MainType]"></asp:SqlDataSource>
                    </asp:View>
                    <asp:View ID="InsertView" runat="server">
                        <table cellpadding="4" cellspacing="0">
                            <tr>
                                <td>
                                    <asp:Label ID="InsertUsernameLable" runat="server" Text="<%$ Resources:Resource, Username %>"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="InsertUsernameTextbox" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="InsertFirstnameLable" runat="server" Text="<%$ Resources:Resource, Firstname %>"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="InsertFirstnameTextBox" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="InsertLastnameLable" runat="server" Text="<%$ Resources:Resource, Lastname %>"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="InsertLastnameTextBox" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="height: 27px">
                                    <asp:Label ID="InsertMainTypeLable" runat="server" Text="<%$ Resources:Resource, MainType %>"></asp:Label>
                                </td>
                                <td style="height: 27px">
                                    <asp:DropDownList ID="InsertMainTypeDropDownList" runat="server" AutoPostBack="True" DataSourceID="MainTypeSqlDataSource" DataTextField="MainType" DataValueField="MainType" OnSelectedIndexChanged="InsertMainTypeDropDownList_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td style="height: 27px">
                                    <asp:Label ID="InsertTypeLable" runat="server" Text="<%$ Resources:Resource, Type %>"></asp:Label>
                                </td>
                                <td style="height: 27px">
                                    <asp:DropDownList ID="InsertTypeDropDownList" runat="server" DataSourceID="InsertTypeSqlDataSource" DataTextField="Type" DataValueField="Type" OnSelectedIndexChanged="InsertTypeDropDownList_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="InsertTypeSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Type  FROM [Users-Type] WHERE (MainType=@MainType)">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="InsertMainTypeDropDownList" Name="MainType" PropertyName="SelectedValue" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="InsertDescriptionLable" runat="server" Text="<%$ Resources:Resource, Description %>"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="InsertDescriptionTextBox" runat="server" TextMode="MultiLine"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="InsertPasswordLable" runat="server" Text="<%$ Resources:Resource, Password %>"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="InsertPasswordTextBox" runat="server" TextMode="Password"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Button ID="InsertButton" runat="server" OnClick="InsertButton_Click" Text="<%$ Resources:Resource, Insert %>" />
                                    <asp:Button ID="Cancel" runat="server" OnClick="Cancel_Click" Text="<%$ Resources:Resource, Cancel %>" />
                                    <asp:Label ID="InsertError" runat="server" Text="<%$ Resources:Resource, InsertError %>" Visible="False"></asp:Label>
                                    <asp:HiddenField ID="InsertRandomNumberHiddenField" runat="server" Visible="False" />
                                    <asp:HiddenField ID="InsertLastloginDateHiddenField" runat="server" Visible="False" />
                                    <asp:HiddenField ID="InsertIsOnlineHiddenFiled" runat="server" Visible="False" />
                                    <asp:HiddenField ID="InsertFullnameHiddenField" runat="server" Visible="False" />
                                </td>
                            </tr>
                        </table>
                    </asp:View>
                    <asp:View ID="EditView" runat="server">
                        <table cellpadding="4" cellspacing="0">
                            <tr>
                                <td>
                                    <asp:Label ID="EditUsernameLable" runat="server" Text="<%$ Resources:Resource, Username %>"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="EditUsernameTextbox" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="EditFirstnameLable" runat="server" Text="<%$ Resources:Resource, Firstname %>"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="EditFirstnameTextBox" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="EditLastnameLable" runat="server" Text="<%$ Resources:Resource, Lastname %>"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="EditLastnameTextBox" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="height: 27px">
                                    <asp:Label ID="EditMainTypeLable" runat="server" Text="<%$ Resources:Resource, MainType %>"></asp:Label>
                                </td>
                                <td style="height: 27px">
                                    <asp:TextBox ID="EditMainTypeTextBox" runat="server" Enabled="False" ReadOnly="True"></asp:TextBox>
                                    &lt;-&gt;<asp:DropDownList ID="EditMainTypeDropDownList" runat="server" AutoPostBack="True" DataSourceID="MainTypeSqlDataSource" DataTextField="MainType" DataValueField="MainType" OnSelectedIndexChanged="EditMainTypeDropDownList_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td style="height: 27px">
                                    <asp:Label ID="EditTypeLable" runat="server" Text="<%$ Resources:Resource, Type %>"></asp:Label>
                                </td>
                                <td style="height: 27px">
                                    <asp:TextBox ID="EditTypeTextBox" runat="server" Enabled="False" ReadOnly="True"></asp:TextBox>
                                    &lt;-&gt;<asp:DropDownList ID="EditTypeDropDownList" runat="server" DataSourceID="EditTypeSqlDataSource" DataTextField="Type" DataValueField="Type">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="EditTypeSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Type FROM [Users-Type] WHERE ([MainType] = @MainType)">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="EditMainTypeDropDownList" Name="MainType" PropertyName="SelectedValue" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <asp:Label ID="EditDescriptionLable" runat="server" Text="<%$ Resources:Resource, Description %>"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="EditDescriptionTextBox" runat="server" TextMode="MultiLine"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="EditPasswordLable" runat="server" Text="<%$ Resources:Resource, Password %>"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="EditPasswordTextBox" runat="server" TextMode="Password"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Button ID="EditButton" runat="server" OnClick="EditButton_Click" Text="<%$ Resources:Resource, Edit %>" />
                                    <asp:Button ID="Cancel1" runat="server" OnClick="Cancel_Click" Text="<%$ Resources:Resource, Cancel %>" />
                                    <asp:Label ID="EditError" runat="server" Text="<%$ Resources:Resource, EditError %>" Visible="False"></asp:Label>
                                    <asp:HiddenField ID="EditFullnameHiddenField" runat="server" Visible="False" />
                                    <asp:HiddenField ID="EditUserIDHiddenField" runat="server" Visible="False" />
                                </td>
                            </tr>
                        </table>
                    </asp:View>
                    <asp:View ID="DeleteView" runat="server">
                        <table cellpadding="4" cellspacing="0">
                            <tr>
                                <td>
                                    <asp:Label ID="DeleteUsernameLable" runat="server" Text="<%$ Resources:Resource, Username %>"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="DeleteUsernameTextbox" runat="server" ReadOnly="True"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="DeleteFirstnameLable" runat="server" Text="<%$ Resources:Resource, Firstname %>"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="DeleteFirstnameTextBox" runat="server" ReadOnly="True"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="DeleteLastnameLable" runat="server" Text="<%$ Resources:Resource, Lastname %>"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="DeleteLastnameTextBox" runat="server" ReadOnly="True"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="height: 27px">
                                    <asp:Label ID="DeleteMainTypeLable" runat="server" Text="<%$ Resources:Resource, MainType %>"></asp:Label>
                                </td>
                                <td style="height: 27px">
                                    <asp:TextBox ID="DeleteMainTypeTextbox" runat="server" ReadOnly="True"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="height: 27px">
                                    <asp:Label ID="DeleteTypeLable" runat="server" Text="<%$ Resources:Resource, Type %>"></asp:Label>
                                </td>
                                <td style="height: 27px">
                                    <asp:TextBox ID="DeleteTypeTextbox" runat="server" ReadOnly="True"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="DeleteDescriptionLable" runat="server" Text="<%$ Resources:Resource, Description %>"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="DeleteDescriptionTextBox" runat="server" ReadOnly="True" TextMode="MultiLine"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Button ID="DeleteButton" runat="server" OnClick="DeleteButton_Click" Text="<%$ Resources:Resource, Delete %>" />
                                    <asp:Button ID="Cancel0" runat="server" OnClick="Cancel_Click" Text="<%$ Resources:Resource, Cancel %>" />
                                    <asp:Label ID="DeleteError" runat="server" Text="<%$ Resources:Resource, DeleteError %>" Visible="False"></asp:Label>
                                    <asp:HiddenField ID="DeleteUserIDHiddenField" runat="server" Visible="False" />
                                </td>
                            </tr>
                        </table>
                    </asp:View>
                    <asp:View ID="TypeView" runat="server">
                        <asp:Panel ID="TypeViewDefaultPanel" runat="server">
                            <asp:Button ID="Back" runat="server" OnClick="Back_Click" Text="<%$ Resources:Resource, Back %>" />
                            <asp:Button ID="InsertTypeButton" runat="server" OnClick="InsertTypeButton_Click" Text="<%$ Resources:Resource, Insert %>" />
                            <asp:Button ID="EditTypeButton" runat="server" Enabled="False" OnClick="EditTypeButton_Click" Text="<%$ Resources:Resource, Edit %>" />
                            <asp:Button ID="DeleteTypeButton" runat="server" Enabled="False" OnClick="DeleteTypeButton_Click" Text="<%$ Resources:Resource, Delete %>" />
                            <asp:GridView ID="TypeViewGridView" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Type" DataSourceID="TypeViewSqlDataSource" OnSelectedIndexChanged="TypeViewGridView_SelectedIndexChanged">
                                <Columns>
                                    <asp:CommandField SelectText="<%$ Resources:Resource, Select %>" ShowSelectButton="True" />
                                    <asp:BoundField DataField="Type" HeaderText="<%$ Resources:Resource, Type %>" ReadOnly="True" SortExpression="Type" />
                                    <asp:BoundField DataField="MainType" HeaderText="<%$ Resources:Resource, MainType %>" SortExpression="MainType" />
                                </Columns>
                            </asp:GridView>
                            <asp:Label ID="TypeViewChooseItemErrorLable" runat="server" Text="<%$ Resources:Resource, ChooseItemError %>" Visible="False"></asp:Label>
                            <asp:SqlDataSource ID="TypeViewSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Users-Type] WHERE (Type = @Type)" InsertCommand="INSERT INTO [Users-Type] (Type, Description, MainType) VALUES (@Type, @Description, @MainType)" SelectCommand="SELECT Type , MainType FROM [Users-Type]" UpdateCommand="UPDATE [Users-Type] SET Type = @NewType, MainType = @MainType, Description = @Description WHERE (Type = @OldType)">
                                <DeleteParameters>
                                    <asp:ControlParameter ControlID="TypeViewSelectedTypeHiddenField" Name="Type" PropertyName="Value" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:ControlParameter ControlID="TypeViewInsertTypeTypeTextBox" Name="Type" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="TypeViewInsertTypeDescriptionTextBox" Name="Description" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="TypeViewInserTypeMainTypeDrpDownList" Name="MainType" PropertyName="SelectedValue" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:ControlParameter ControlID="TypeViewEditTypeTypeTextBox" Name="NewType" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="TypeViewEditTypeMaintTypeDropDownList" Name="MainType" PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="TypeViewEditTypeDescriptionTextBox" Name="Description" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="TypeViewSelectedTypeHiddenField" Name="OldType" PropertyName="Value" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                            <asp:HiddenField ID="TypeViewSelectedTypeHiddenField" runat="server" Visible="False" />
                        </asp:Panel>
                        <asp:Panel ID="TypeViewInsertPanel" runat="server" GroupingText="<%$ Resources:Resource, Insert %>">
                            <table cellpadding="4" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label ID="TypeViewInsertTypeTypeLable" runat="server" Text="<%$ Resources:Resource, Type %>"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TypeViewInsertTypeTypeTextBox" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="TypeViewInsertTypeMainTypeLable" runat="server" Text="<%$ Resources:Resource, MainType %>"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="TypeViewInserTypeMainTypeDrpDownList" runat="server" DataSourceID="TypeViewInsertTypeMainTypeSqlDataSource" DataTextField="MainType" DataValueField="MainType">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="TypeViewInsertTypeMainTypeSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT MainType FROM [Users-MainType]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="TypeViewInsertTypeDescriptionLable" runat="server" Text="<%$ Resources:Resource, Description %>"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TypeViewInsertTypeDescriptionTextBox" runat="server" TextMode="MultiLine"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:Button ID="TypeViewInsertButton" runat="server" OnClick="TypeViewInsertButton_Click" Text="<%$ Resources:Resource, Insert %>" />
                                        <asp:Label ID="TypeViewInsertError" runat="server" Text="<%$ Resources:Resource, InsertError %>" Visible="False"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <asp:Panel ID="TypeViewEditPanel" runat="server" GroupingText="<%$ Resources:Resource, Edit %>">
                            <table cellpadding="4" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label ID="TypeViewEditTypeTypeLable" runat="server" Text="<%$ Resources:Resource, Type %>"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TypeViewEditTypeTypeTextBox" runat="server" EnableViewState="False"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="TypeViewEditTypeMainTypeLable" runat="server" Text="<%$ Resources:Resource, MainType %>"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="TypeViewEditTypeMaintTypeDropDownList" runat="server" DataSourceID="TypeViewEditTypeMainTypeSqlDataSource" DataTextField="MainType" DataValueField="MainType" EnableViewState="False">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="TypeViewEditTypeMainTypeSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT MainType FROM [Users-MainType]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="margin-left: 80px">
                                        <asp:Label ID="TypeViewInsertTypeDescriptionLable0" runat="server" Text="<%$ Resources:Resource, Description %>"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TypeViewEditTypeDescriptionTextBox" runat="server" EnableViewState="False" TextMode="MultiLine"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:Button ID="TypeViewEditButton" runat="server" OnClick="TypeViewEditButton_Click" Text="<%$ Resources:Resource, Edit %>" />
                                        <asp:Label ID="TypeViewEditError" runat="server" Text="<%$ Resources:Resource, EditError %>" Visible="False"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <asp:Panel ID="TypeViewDeletePanel" runat="server" GroupingText="<%$ Resources:Resource, Delete %>">
                            <table cellpadding="4" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label ID="TypeViewDeleteTypeTypeLable" runat="server" Text="<%$ Resources:Resource, Type %>"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TypeViewDeleteTypeTypeTextBox" runat="server" Enabled="False" EnableViewState="False" ReadOnly="True"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="TypeViewDeleteTypeMainTypeLable" runat="server" Text="<%$ Resources:Resource, MainType %>"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TypeViewDeleteTypeMainTypeTextBox" runat="server" Enabled="False" EnableViewState="False" ReadOnly="True"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="TypViewDeleteTypeDescriptionLable" runat="server" Text="<%$ Resources:Resource, Description %>"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TypViewDeleteTypeDescriptionTextBox" runat="server" Enabled="False" EnableViewState="False" ReadOnly="True" TextMode="MultiLine"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:Button ID="TypeViewDeleteButton" runat="server" OnClick="TypeViewDeleteButton_Click" Text="<%$ Resources:Resource, Delete %>" />
                                        <asp:Label ID="TypeViewDeleteTypeError" runat="server" Text="<%$ Resources:Resource, DeleteError %>" Visible="False"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </asp:View>
                    <asp:View ID="MainTypeView" runat="server">
                        <asp:Panel ID="MainTypeViewDefaultPanel" runat="server">
                            <asp:Button ID="Back0" runat="server" OnClick="Back_Click" Text="<%$ Resources:Resource, Back %>" />
                            <asp:Button ID="InsertMainTypeButton" runat="server" OnClick="InsertMainTypeButton_Click" Text="<%$ Resources:Resource, Insert %>" />
                            <asp:Button ID="EditMainTypeButton" runat="server" Enabled="False" OnClick="EditMainTypeButton_Click" Text="<%$ Resources:Resource, Edit %>" />
                            <asp:Button ID="DeleteMainTypeButton" runat="server" Enabled="False" OnClick="DeleteMainButton_Click" Text="<%$ Resources:Resource, Delete %>" />
                            <asp:GridView ID="MainTypeViewGridView" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="MainType" DataSourceID="MainTypeViewSQLDataSource" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" EmptyDataText="<%$ Resources:Resource, NoData %>">
                                <Columns>
                                    <asp:CommandField SelectText="<%$ Resources:Resource, Select %>" ShowSelectButton="True" />
                                    <asp:BoundField DataField="MainType" HeaderText="<%$ Resources:Resource, MainType %>" ReadOnly="True" SortExpression="MainType" />
                                    <asp:BoundField DataField="Description" HeaderText="<%$ Resources:Resource, Description %>" SortExpression="Description" />
                                </Columns>
                            </asp:GridView>
                            <asp:Label ID="MainTypeViewChooseItemErrorLable" runat="server" Text="<%$ Resources:Resource, ChooseItemError %>" Visible="False"></asp:Label>
                            <asp:SqlDataSource ID="MainTypeViewSQLDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Users-MainType] WHERE (MainType = @MainType)" InsertCommand="INSERT INTO [Users-MainType] (MainType, Description) VALUES (@MainType, @Description)" SelectCommand="SELECT MainType , Description FROM [Users-MainType]" UpdateCommand="UPDATE [Users-MainType] SET MainType = @MainType, Description = @Description WHERE (MainType = @OldMainType)">
                                <DeleteParameters>
                                    <asp:ControlParameter ControlID="MainTypeViewDeleteMainTypeMainTypeTextBox" Name="MainType" PropertyName="Text" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:ControlParameter ControlID="MainTypeViewInsertMainTypeMainTypeTextBox" Name="MainType" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="MainTypeViewInsertMainTypeDescriptionTextBox" Name="Description" PropertyName="Text" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:ControlParameter ControlID="MainTypeViewEditMainTypeMainTypeTextBox" Name="MainType" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="MainTypeViewEditMainTypeDescriptionTextBox" Name="Description" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="MainTypeViewSelectedMainTypeHiddenField" Name="OldMainType" PropertyName="Value" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                            <asp:HiddenField ID="MainTypeViewSelectedMainTypeHiddenField" runat="server" Visible="False" />
                        </asp:Panel>
                        <asp:Panel ID="MainTypeViewInsertMainTypePanel" runat="server" Enabled="False" GroupingText="<%$ Resources:Resource, Insert %>">
                            <table cellpadding="4" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label ID="MainTypeViewInsertMainTypeMainTypeLable" runat="server" Text="<%$ Resources:Resource, MainType %>"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="MainTypeViewInsertMainTypeMainTypeTextBox" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="MainTypViewInsertMainTypeMainTypeLable" runat="server" Text="<%$ Resources:Resource, Description %>"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="MainTypeViewInsertMainTypeDescriptionTextBox" runat="server" TextMode="MultiLine"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:Button ID="MainTypeViewInsertButton" runat="server" OnClick="MainTypeViewInsertButton_Click" Text="<%$ Resources:Resource, Insert %>" />
                                        <asp:Label ID="MainTypeViewInsertError" runat="server" Text="<%$ Resources:Resource, InsertError %>" Visible="False"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <asp:Panel ID="MainTypeViewEditMainTypePanel" runat="server" GroupingText="<%$ Resources:Resource, Edit %>">
                            <table cellpadding="4" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label ID="MainTypeViewEditMainTypeMainTypeLable" runat="server" Text="<%$ Resources:Resource, MainType %>"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="MainTypeViewEditMainTypeMainTypeTextBox" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="MainTypViewInsertMainTypeMainTypeLable0" runat="server" Text="<%$ Resources:Resource, Description %>"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="MainTypeViewEditMainTypeDescriptionTextBox" runat="server" TextMode="MultiLine"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:Button ID="MainTypeViewEditButton" runat="server" OnClick="MainTypeViewEditButton_Click" Text="<%$ Resources:Resource, Edit %>" />
                                        <asp:Label ID="MainTypeViewEditError" runat="server" Text="<%$ Resources:Resource, EditError %>" Visible="False"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <asp:Panel ID="MainTypeViewDeleteMainTypePanel" runat="server" GroupingText="<%$ Resources:Resource, Delete %>">
                            <table cellpadding="4" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label ID="MainTypeViewDeleteMainTypeMainTypeLable" runat="server" Text="<%$ Resources:Resource, MainType %>"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="MainTypeViewDeleteMainTypeMainTypeTextBox" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="MainTypeViewDeleteMainTypeDescriptionLable" runat="server" Text="<%$ Resources:Resource, Description %>"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="MainTypeViewDeleteMainTypeDescriptionTextBox" runat="server" TextMode="MultiLine"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:Button ID="MainTypeViewDeleteButton" runat="server" OnClick="MainTypeViewEditButton0_Click" Text="<%$ Resources:Resource, Delete %>" />
                                        <asp:Label ID="MainTypeViewDeleteError" runat="server" Text="<%$ Resources:Resource, DeleteError %>" Visible="False"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </asp:View>
                    <asp:View ID="LoginDatesView" runat="server">
                        <asp:Button ID="Back1" runat="server" OnClick="Back_Click" Text="<%$ Resources:Resource, Back %>" />
                        <br />
                        <asp:Button ID="LoginDatesViewDeleteLoginDates" runat="server" Text="<%$ Resources:Resource, Delete %>" OnClick="LoginDatesViewDeleteLoginDates_Click" Enabled="False" />
                        <br />
                        <table cellpadding="4" cellspacing="0">
                            <tr>
                                <td>
                                    <asp:ListBox ID="LoginDatesListBox" runat="server" AutoPostBack="True" DataSourceID="FullnameSqlDataSource" DataTextField="Fullname" DataValueField="UserID" Rows="140"></asp:ListBox>
                                </td>
                                <td>
                                    <asp:GridView ID="LoginDatesGridView" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="LoginDatesSqlDataSource" PageSize="1000" CssClass="gv" EmptyDataText="<%$ Resources:Resource, NoData %>">
                                        <Columns>
                                            <asp:BoundField DataField="LoginDate" HeaderText="<%$ Resources:Resource, Date %>" SortExpression="LoginDate" />
                                        </Columns>
                                    </asp:GridView>
                                </td>
                            </tr>
                        </table>
                        <asp:SqlDataSource ID="LoginDatesSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT TOP 100 UserID, LoginDate FROM [Users-LoginDate] WHERE (UserID = @UserID)" DeleteCommand="DELETE FROM [Users-LoginDate] WHERE (UserID = @UserID)">
                            <DeleteParameters>
                                <asp:ControlParameter ControlID="LoginDatesListBox" Name="UserID" PropertyName="SelectedValue" />
                            </DeleteParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="LoginDatesListBox" Name="UserID" PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="FullnameSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT UserID , Fullname FROM [Users-Users]"></asp:SqlDataSource>
                    </asp:View>
                    <asp:View ID="MultiPlaceView" runat="server">
                        <asp:Button ID="Back3" runat="server" OnClick="Back_Click" Text="<%$ Resources:Resource, Back %>" />
                        <asp:Button ID="DeleteMultiPlace" runat="server" Enabled="False" Text="<%$ Resources:Resource, Delete %>" />
                        <asp:Button ID="InsertMultiPlace" runat="server" Text="<%$ Resources:Resource, Insert %>" />
                        <br />
                    </asp:View>
                </asp:MultiView>
            </td>
        </tr>
    </table>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="NoAjaxContentPlaceHolder">
</asp:Content>
<asp:Content ID="Content3" runat="server" contentplaceholderid="head">
    <link href="<%:WebsitePage.WebsiteRoot(true, false)%>/App_StyleSheet/Users/USERS_LoggedIn_Admin_Manager_Default.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%:WebsitePage.WebsiteRoot(true, false)%>/App_Scripts/Users/USERS_LoggedIn_Admin_Manager_Default.js"></script>
</asp:Content>


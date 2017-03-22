<%@ Page   Language="C#" MasterPageFile="~/App_MasterPage/Users-LoggedInMasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="USERS_LoggedIn_Admin_News_Default" %>

<%@ Register assembly="FreeTextBox" namespace="FreeTextBoxControls" tagprefix="FTB" %>

<asp:Content ID="Content1" ContentPlaceHolderID="DefaultContentPlaceHolder" runat="Server">
    <asp:MultiView ID="DefaultMultiView" runat="server" ActiveViewIndex="0">
        <asp:View ID="DefaultView" runat="server">
            <asp:Button ID="BackToDefaultPage" runat="server" OnClick="BackToDefaultPage_Click" Text="<%$ Resources:Resource, Back %>" />
            <asp:Button ID="Insert" runat="server" Text="<%$ Resources:Resource, Insert %>" OnClick="Button1_Click" />
            <asp:Button ID="Edit" runat="server" Enabled="False" OnClick="Edit_Click" Text="<%$ Resources:Resource, Edit %>" />
            <asp:Button ID="Delete" runat="server" Enabled="False" OnClick="Delete_Click" Text="<%$ Resources:Resource, Delete %>" />
            <asp:Button ID="Group" runat="server" Text="<%$ Resources:Resource, Group %>" OnClick="Group_Click" />
            <asp:Button ID="ImageLink" runat="server" OnClick="ImageLink_Click" Text="<%$ Resources:Resource, Image %>" />
            <asp:Button ID="UsersNewsButton" runat="server" Text="<%$ Resources:Resource, News %>" OnClick="UsersNewsButton_Click" />
            <asp:HyperLink ID="TV" runat="server" Text="<%$ Resources:Resource, TV %>"></asp:HyperLink>
            <div class="notification">
                <asp:Label ID="Likes" runat="server" Text="<%$ Resources:Resource, Like %>"></asp:Label>
                :<asp:HyperLink ID="hp_Likes" runat="server" Target="_search">[hp_Likes]</asp:HyperLink>
                &nbsp;-
               <asp:Label ID="Hates" runat="server" Text="<%$ Resources:Resource, Hate %>"></asp:Label>
                :<asp:HyperLink ID="hp_Hates" runat="server" Target="_search">[hp_Hates]</asp:HyperLink>
                &nbsp;-
               <asp:Label ID="News" runat="server" Text="<%$ Resources:Resource, News %>"></asp:Label>
                :<asp:HyperLink ID="hp_News" runat="server" Target="_search">[hp_News]</asp:HyperLink>
            </div>
            <asp:GridView ID="NewsGridView" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="NewsSqlDataSource" OnSelectedIndexChanged="NewsGridView_SelectedIndexChanged" EmptyDataText="<%$ Resources:Resource, NoData %>" CssClass="gv">
                <Columns>
                    <asp:CommandField SelectText="<%$ Resources:Resource, Select %>" ShowSelectButton="True" />
                    <asp:BoundField DataField="ID" HeaderText="<%$ Resources:Resource,ID %>" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="Title" HeaderText="<%$ Resources:Resource,Title %>" SortExpression="Title" />
                    <asp:BoundField DataField="UserID" HeaderText="<%$ Resources:Resource,UserID %>" SortExpression="UserID" />
                    <asp:BoundField DataField="GroupID" HeaderText="<%$ Resources:Resource,GroupID %>" SortExpression="GroupID" />
                    <asp:BoundField DataField="Date" HeaderText="<%$ Resources:Resource,Date %>" SortExpression="Date" />
                    <asp:TemplateField HeaderText="<%$ Resources:Resource, Read %>" SortExpression="ID">
                        <ItemTemplate>
                            <asp:HyperLink ID="Read" runat="server" Text="<%$ Resources:Resource, Read %>" NavigateUrl='<%# Eval("ID","~/App_Page/News/ShowNewsByID.aspx?ID={0}") %>' Target="_search" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="NewsSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT ID, Title , UserID , GroupID , Date FROM [News-News] WHERE (UserID = @UserID) ORDER BY [ID] DESC" InsertCommand="INSERT INTO [News-News] (Title, Abstract, Value, UserID, GroupID, Date, Source) VALUES (@title, @Abstract, @Value, @UserID, @GroupID, @Date, @Source)" DeleteCommand="DELETE FROM [News-News] WHERE (ID = @ID)" UpdateCommand="UPDATE [News-News] SET Title = @Title, Abstract = @Abstract, Value = @Value, Date = @Date, GroupID = @GroupID, Source = @Source WHERE (ID = @ID)">
                <DeleteParameters>
                    <asp:ControlParameter ControlID="NewsGridView" Name="ID" PropertyName="SelectedValue" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="txt_Title" Name="title" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txt_Abstract" Name="Abstract" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txt_Value" Name="Value" PropertyName="Text" />
                    <asp:SessionParameter Name="UserID" SessionField="UserID" />
                    <asp:ControlParameter ControlID="dd_Group" Name="GroupID" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="lbl_Date" Name="Date" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txt_Source" Name="Source" PropertyName="Text" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="UserID" SessionField="UserID" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="txt_Title0" Name="Title" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txt_Abstract0" Name="Abstract" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txt_Value0" Name="Value" PropertyName="Text" />
                    <asp:ControlParameter ControlID="lbl_Date0" Name="Date" PropertyName="Text" />
                    <asp:ControlParameter ControlID="NewsGridView" Name="ID" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="dd_Group0" Name="GroupID" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="txt_Source0" Name="Source" PropertyName="Text" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="GroupSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Name , GroupID FROM [News-Group]"></asp:SqlDataSource>
        </asp:View>
        <asp:View ID="InsertView" runat="server">
            <table cellpadding="4" cellspacing="0">
                <tr>
                    <td style="margin-left: 40px">
                        <asp:Label ID="lbl_Title" runat="server" Text="<%$ Resources:Resource, title %>"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Title" runat="server"></asp:TextBox>
                        <asp:Label ID="RequiredFieldValidator2" runat="server" Text="*" Visible="False"></asp:Label>
                        <asp:Button ID="InsertTitleCheck" runat="server" OnClick="InsertTitleCheck_Click" Text="<%$ Resources:Resource, Check %>" />
                        <asp:GridView ID="CheckNewsGridView" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="CheckNewsSqlDataSource" Visible="False" EmptyDataText="<%$ Resources:Resource, NoData %>" CssClass="gv">
                            <Columns>
                                <asp:BoundField DataField="ID" HeaderText="<%$ Resources:Resource,ID %>" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                                <asp:BoundField DataField="Title" HeaderText="<%$ Resources:Resource,Title %>" SortExpression="Title" />
                                <asp:BoundField DataField="UserID" HeaderText="<%$ Resources:Resource,UserID %>" SortExpression="UserID" />
                                <asp:BoundField DataField="GroupID" HeaderText="<%$ Resources:Resource,GroupID %>" SortExpression="GroupID" />
                                <asp:BoundField DataField="Date" HeaderText="<%$ Resources:Resource,Date %>" SortExpression="Date" />
                                <asp:TemplateField HeaderText="<%$ Resources:Resource, Read %>" SortExpression="ID">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:HyperLink ID="Read0" runat="server" NavigateUrl='<%# Eval("ID","~/App_Page/News/ShowNewsByID.aspx?ID={0}") %>' Target="_search" Text="<%$ Resources:Resource, Read %>" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="CheckNewsSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [News-News] WHERE (ID = @ID)" InsertCommand="INSERT INTO [News-News] (Title, Abstract, Value, UserID, GroupID, Date, Source) VALUES (@title, @Abstract, @Value, @UserID, @GroupID, @Date, @Source)" SelectCommand="SELECT ID , Title , UserID , GroupID , Date FROM [News-News] WHERE (Title LIKE '%'+@Title+'%') ORDER BY [ID] DESC" UpdateCommand="UPDATE [News-News] SET Title = @Title, Abstract = @Abstract, Value = @Value, Date = @Date, GroupID = @GroupID, Source = @Source WHERE (ID = @ID)">
                            <DeleteParameters>
                                <asp:ControlParameter ControlID="NewsGridView" Name="ID" PropertyName="SelectedValue" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:ControlParameter ControlID="txt_Title" Name="title" PropertyName="Text" />
                                <asp:ControlParameter ControlID="txt_Abstract" Name="Abstract" PropertyName="Text" />
                                <asp:ControlParameter ControlID="txt_Value" Name="Value" PropertyName="Text" />
                                <asp:SessionParameter Name="UserID" SessionField="UserID" />
                                <asp:ControlParameter ControlID="dd_Group" Name="GroupID" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="lbl_Date" Name="Date" PropertyName="Text" />
                                <asp:ControlParameter ControlID="txt_Source" Name="Source" PropertyName="Text" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="txt_Title" Name="Title" PropertyName="Text" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:ControlParameter ControlID="txt_Title0" Name="Title" PropertyName="Text" />
                                <asp:ControlParameter ControlID="txt_Abstract0" Name="Abstract" PropertyName="Text" />
                                <asp:ControlParameter ControlID="txt_Value0" Name="Value" PropertyName="Text" />
                                <asp:ControlParameter ControlID="lbl_Date0" Name="Date" PropertyName="Text" />
                                <asp:ControlParameter ControlID="NewsGridView" Name="ID" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="dd_Group0" Name="GroupID" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="txt_Source0" Name="Source" PropertyName="Text" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td style="margin-left: 40px">
                        <asp:Label ID="lbl_Abstract" runat="server" Text="<%$ Resources:Resource, Abstract %>"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Abstract" runat="server" TextMode="MultiLine" Width="100%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="margin-left: 40px">
                        <asp:Label ID="lbl_Value" runat="server" Text="<%$ Resources:Resource, Value %>"></asp:Label>
                    </td>
                    <td>
                        <FTB:FreeTextBox ID="txt_Value" runat="server">
                        </FTB:FreeTextBox>
                    </td>
                </tr>
                <tr>
                    <td style="margin-left: 40px">
                        <asp:Label ID="lbl_Group" runat="server" Text="<%$ Resources:Resource, Group %>"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="dd_Group" runat="server" DataSourceID="GroupSqlDataSource" DataTextField="Name" DataValueField="GroupID">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="height: 27px">
                        <asp:Label ID="lbl_Source" runat="server" Text="<%$ Resources:Resource, Source %>"></asp:Label>
                    </td>
                    <td style="height: 27px">
                        <asp:TextBox ID="txt_Source" runat="server">شهر برفی</asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="margin-left: 40px">
                        <asp:Button ID="btn_Cancel" runat="server" OnClick="btn_Cancel_Click" Text="<%$ Resources:Resource, Cancel %>" />
                        <asp:Button ID="btn_Insert" runat="server" Text="<%$ Resources:Resource, Insert %>" OnClick="btn_Insert_Click" />
                        <asp:Label ID="lbl_Date" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="EditView" runat="server">
            <table cellpadding="4" cellspacing="0">
                <tr>
                    <td style="margin-left: 40px">
                        <asp:Label ID="lbl_Title0" runat="server" Text="<%$ Resources:Resource, title %>"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Title0" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_Title0" ErrorMessage="*"></asp:RequiredFieldValidator>
                        <asp:Button ID="EditTitleCheck" runat="server" OnClick="EditTitleCheck_Click" Text="<%$ Resources:Resource, Check %>" />
                        <asp:GridView ID="CheckNewsGridView0" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="CheckNewsSqlDataSource0" Visible="False" EmptyDataText="<%$ Resources:Resource, NoData %>" CssClass="gv">
                            <Columns>
                                <asp:BoundField DataField="ID" HeaderText="<%$ Resources:Resource,ID %>" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                                <asp:BoundField DataField="Title" HeaderText="<%$ Resources:Resource,Title %>" SortExpression="Title" />
                                <asp:BoundField DataField="UserID" HeaderText="<%$ Resources:Resource,UserID %>" SortExpression="UserID" />
                                <asp:BoundField DataField="GroupID" HeaderText="<%$ Resources:Resource,GroupID %>" SortExpression="GroupID" />
                                <asp:BoundField DataField="Date" HeaderText="<%$ Resources:Resource,Date %>" SortExpression="Date" />
                                <asp:TemplateField HeaderText="<%$ Resources:Resource, Read %>" SortExpression="ID">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:HyperLink ID="Read1" runat="server" NavigateUrl='<%# Eval("ID","~/App_Page/News/ShowNewsByID.aspx?ID={0}") %>' Target="_search" Text="<%$ Resources:Resource, Read %>" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="CheckNewsSqlDataSource0" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [News-News] WHERE (ID = @ID)" InsertCommand="INSERT INTO [News-News] (Title, Abstract, Value, UserID, GroupID, Date) VALUES (@title, @Abstract, @Value, @UserID, @GroupID, @Date)" SelectCommand="SELECT ID , Title , UserID , GroupID , Date FROM [News-News] WHERE (Title LIKE '%'+@Title+'%') ORDER BY [ID] DESC" UpdateCommand="UPDATE [News-News] SET Title = @Title, Abstract = @Abstract, Value = @Value, Date = @Date, GroupID = @GroupID WHERE (ID = @ID)">
                            <DeleteParameters>
                                <asp:ControlParameter ControlID="NewsGridView" Name="ID" PropertyName="SelectedValue" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:ControlParameter ControlID="txt_Title" Name="title" PropertyName="Text" />
                                <asp:ControlParameter ControlID="txt_Abstract" Name="Abstract" PropertyName="Text" />
                                <asp:ControlParameter ControlID="txt_Value" Name="Value" PropertyName="Text" />
                                <asp:SessionParameter Name="UserID" SessionField="UserID" />
                                <asp:ControlParameter ControlID="dd_Group" Name="GroupID" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="lbl_Date" Name="Date" PropertyName="Text" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="txt_Title0" Name="Title" PropertyName="Text" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:ControlParameter ControlID="txt_Title0" Name="Title" PropertyName="Text" />
                                <asp:ControlParameter ControlID="txt_Abstract0" Name="Abstract" PropertyName="Text" />
                                <asp:ControlParameter ControlID="txt_Value0" Name="Value" PropertyName="Text" />
                                <asp:ControlParameter ControlID="lbl_Date0" Name="Date" PropertyName="Text" />
                                <asp:ControlParameter ControlID="NewsGridView" Name="ID" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="dd_Group0" Name="GroupID" PropertyName="SelectedValue" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td style="margin-left: 40px">
                        <asp:Label ID="lbl_Abstract0" runat="server" Text="<%$ Resources:Resource, Abstract %>"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Abstract0" runat="server" TextMode="MultiLine" Width="100%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="margin-left: 40px">
                        <asp:Label ID="lbl_Value0" runat="server" Text="<%$ Resources:Resource, Value %>"></asp:Label>
                    </td>
                    <td>
                        <FTB:FreeTextBox ID="txt_Value0" runat="server">
                        </FTB:FreeTextBox>
                    </td>
                </tr>
                <tr>
                    <td style="margin-left: 40px">
                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:Resource, Group %>"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="dd_Group0" runat="server" DataSourceID="GroupSqlDataSource" DataTextField="Name" DataValueField="GroupID">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lbl_Source0" runat="server" Text="<%$ Resources:Resource, Source %>"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Source0" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="margin-left: 40px">
                        <asp:Button ID="btn_Cancel0" runat="server" OnClick="btn_Cancel_Click" Text="<%$ Resources:Resource, Cancel %>" />
                        <asp:Button ID="btn_Edit" runat="server" Text="<%$ Resources:Resource, Edit %>" OnClick="btn_Edit_Click" />
                        <asp:Label ID="lbl_Date0" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="DeleteView" runat="server">
            <table cellpadding="4" cellspacing="0">
                <tr>
                    <td style="margin-left: 40px">
                        <asp:Label ID="lbl_Title1" runat="server" Text="<%$ Resources:Resource, title %>"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Title1" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lbl_ID" runat="server" Text="<%$ Resources:Resource, ID %>"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="txt_ID" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="margin-left: 40px">
                        <asp:Button ID="btn_Cancel1" runat="server" OnClick="btn_Cancel_Click" Text="<%$ Resources:Resource, Cancel %>" />
                        <asp:Button ID="btn_Delete" runat="server" Text="<%$ Resources:Resource, Delete %>" OnClick="btn_Delete_Click" />

                    </td>
                </tr>

            </table>
        </asp:View>
        <asp:View ID="AdminPermissionForGroup" runat="server">
            <table cellpadding="4" cellspacing="0">
                <tr>
                    <td>
                        <asp:Label ID="AdminPermissionForGroupPasswordLable" runat="server" Text="<%$ Resources:Resource, Password %>"></asp:Label>
                        :</td>
                    <td>
                        <asp:TextBox ID="AdminPermissionForGroupPasswordTextBox" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="AdminPermissionForGroupLoginButton" runat="server" OnClick="AdminPermissionForGroupLoginButton_Click" Text="<%$ Resources:Resource, Login %>" />
                        <asp:Button ID="AdminPermissionForGroupLoginCancelButton" runat="server" OnClick="AdminPermissionForGroupLoginCancelButton_Click" Text="<%$ Resources:Resource, Cancel %>" />
                        <asp:Label ID="AdminPermissionForGroupProblemErrorLable" runat="server" Text="<%$ Resources:Resource, ProblemWithSelectingData %>" Visible="False"></asp:Label>
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="GroupView" runat="server">
            <asp:Button ID="btn_Cancel2" runat="server" OnClick="btn_Cancel_Click" Text="<%$ Resources:Resource, Cancel %>" />
            <asp:GridView ID="GroupGridView" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="GroupEditViewDeleteSqlDataSource" AutoGenerateColumns="False" DataKeyNames="GroupID" OnSelectedIndexChanged="GroupGridView_SelectedIndexChanged" EmptyDataText="<%$ Resources:Resource, NoData %>" CssClass="gv">
                <Columns>
                    <asp:CommandField SelectText="<%$ Resources:Resource, Select %>" ShowSelectButton="True" />
                    <asp:BoundField DataField="GroupID" HeaderText="<%$ Resources:Resource, ID %>" InsertVisible="False" ReadOnly="True" SortExpression="GroupID" />
                    <asp:BoundField DataField="Name" HeaderText="<%$ Resources:Resource, Name %>" SortExpression="Name" />
                    <asp:BoundField DataField="Description" HeaderText="<%$ Resources:Resource, Description %>" SortExpression="Description" />
                </Columns>
            </asp:GridView>
            <asp:Button ID="btnInsertGroup" runat="server" OnClick="btnInsertGroup_Click" Text="<%$ Resources:Resource, Insert %>" />
            <asp:Button ID="btnEditGroup" runat="server" OnClick="btnEditGroup_Click" Text="<%$ Resources:Resource, Edit %>" />
            <asp:Button ID="btnDeleteGroup" runat="server" OnClick="btnDeleteGroup_Click" Text="<%$ Resources:Resource, Delete %>" />
            <asp:SqlDataSource ID="GroupEditViewDeleteSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT GroupID , Name , Description FROM [News-Group]" DeleteCommand="DELETE FROM [News-Group] WHERE (GroupID = @Group )" InsertCommand="INSERT INTO [News-Group] (Name, Description) VALUES (@name, @Description)" UpdateCommand="UPDATE [News-Group] SET Description = @Description, Name = @Name WHERE (GroupID = @GroupID)">
                <DeleteParameters>
                    <asp:ControlParameter ControlID="GroupGridView" Name="Group" PropertyName="SelectedValue" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="txtGroupName" Name="name" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtGroupDescription" Name="Description" PropertyName="Text" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="txtGroupDescription0" Name="Description" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtGroupName0" Name="Name" PropertyName="Text" />
                    <asp:ControlParameter ControlID="GroupGridView" Name="GroupID" PropertyName="SelectedValue" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:Panel ID="InsertPanel" runat="server" GroupingText="<%$ Resources:Resource, Insert %>">
                <table cellpadding="4" cellspacing="0">
                    <tr>
                        <td>
                            <asp:Label ID="lbl_GROUPEDITDELETEINSERT" runat="server" Text="<%$ Resources:Resource, Name %>"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtGroupName" runat="server"></asp:TextBox>
                            <asp:Label ID="GroupEmptyTextValidator" runat="server" Text="*"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lbl_GroupDescription" runat="server" Text="<%$ Resources:Resource, Description %>"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtGroupDescription" runat="server" TextMode="MultiLine" Width="100%"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <asp:Panel ID="InsertPanel0" runat="server" GroupingText="<%$ Resources:Resource, Edit %>" Enabled="False" Visible="False">
                <table cellpadding="4" cellspacing="0">
                    <tr>
                        <td>
                            <asp:Label ID="lbl_GROUPEDITDELETEINSERT0" runat="server" Text="<%$ Resources:Resource, Name %>"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtGroupName0" runat="server"></asp:TextBox>
                            <asp:Label ID="GroupEmptyTextValidator0" runat="server" Text="*"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lbl_GroupDescription0" runat="server" Text="<%$ Resources:Resource, Description %>"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtGroupDescription0" runat="server" TextMode="MultiLine" Width="100%"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <asp:Panel ID="InsertPanel1" runat="server" GroupingText="<%$ Resources:Resource, Delete %>" Enabled="False" Visible="False">
                <table cellpadding="4" cellspacing="0">
                    <tr>
                        <td>
                            <asp:Label ID="lbl_GROUPEDITDELETEINSERT1" runat="server" Text="<%$ Resources:Resource, Name %>"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtGroupName1" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lbl_GroupDescription1" runat="server" Text="<%$ Resources:Resource, Description %>"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtGroupDescription1" runat="server" TextMode="MultiLine" Width="100%"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </asp:View>
        <asp:View ID="AdminPermissionForImageLink" runat="server">
            <table cellpadding="4" cellspacing="0">
                <tr>
                    <td>
                        <asp:Label ID="AdminPermissionForGroupPasswordLable0" runat="server" Text="<%$ Resources:Resource, Password %>"></asp:Label>
                        :</td>
                    <td>
                        <asp:TextBox ID="AdminPermissionForGroupPasswordTextBox0" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="AdminPermissionForGroupLoginButton0" runat="server" OnClick="AdminPermissionForGroupLoginButton0_Click" Text="<%$ Resources:Resource, Login %>" />
                        <asp:Button ID="AdminPermissionForGroupLoginCancelButton0" runat="server" OnClick="AdminPermissionForGroupLoginCancelButton_Click" Text="<%$ Resources:Resource, Cancel %>" />
                        <asp:Label ID="AdminPermissionForGroupProblemErrorLable0" runat="server" Text="<%$ Resources:Resource, ProblemWithSelectingData %>" Visible="False"></asp:Label>
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="ImageLinkView" runat="server">
            <asp:Button ID="btn_Cancel3" runat="server" OnClick="btn_Cancel_Click" Text="<%$ Resources:Resource, Cancel %>" />
            <asp:Button ID="ImageLinkNew" runat="server" OnClick="Button1_Click1" Text="<%$ Resources:Resource, New %>" />
            <asp:GridView ID="ImageLinkGridView" runat="server" AutoGenerateColumns="False" DataSourceID="ImageLinkSqlDataSource" OnSelectedIndexChanged="ImageLinkGridView_SelectedIndexChanged" EmptyDataText="<%$ Resources:Resource, ThisGridViewIsEmpty %>">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="ID" HeaderText="<%$ Resources:Resource, ID%>" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                    <asp:TemplateField HeaderText="<%$ Resources:Resource, Adress %>" SortExpression="LinkURL">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox" runat="server" Text='<%# Bind("LinkURL") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:HyperLink ID="ReadLink" runat="server" NavigateUrl='<%# Bind("LinkURL") %>' Target="_search" Text="<%$ Resources:Resource, Read %>"></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Title" HeaderText="<%$ Resources:Resource, Title%>" SortExpression="Title" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="ImageLinkSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" InsertCommand="INSERT INTO [News-ImageLink] (LinkURL, ImageURL, Description, Title, UserID) VALUES (@URL, @Image, @Description, @Title, @UserID)" SelectCommand="SELECT TOP 3 LinkURL , ID , Title FROM [News-ImageLink] WHERE (UserID=@UserID) ORDER BY [ID] DESC " DeleteCommand="DELETE FROM [News-ImageLink] WHERE (ID = @ID)" UpdateCommand="UPDATE [News-ImageLink] SET Title = @Title, ImageURL = @ImageURL, LinkURL = @LinkURL, Description = @Description WHERE (ID = @ID)">
                <DeleteParameters>
                    <asp:ControlParameter ControlID="ImageLinkID" Name="ID" PropertyName="Value" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="imageLink2" Name="Image" PropertyName="Text" />
                    <asp:ControlParameter ControlID="ImageLink4" Name="Description" PropertyName="Text" />
                    <asp:ControlParameter ControlID="ImageLink1" Name="Title" PropertyName="Text" />
                    <asp:ControlParameter ControlID="ImageLink3" Name="URL" PropertyName="Text" />
                    <asp:SessionParameter Name="UserID" SessionField="UserID" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="UserID" SessionField="UserID" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="ImageLink5" Name="Title" PropertyName="Text" />
                    <asp:ControlParameter ControlID="ImageLink6" Name="LinkURL" PropertyName="Text" />
                    <asp:ControlParameter ControlID="ImageLink7" Name="ImageURL" PropertyName="Text" />
                    <asp:ControlParameter ControlID="ImageLink8" Name="Description" PropertyName="Text" />
                    <asp:ControlParameter ControlID="ImageLinkID" Name="ID" PropertyName="Value" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:HiddenField ID="ImageLinkID" runat="server" Visible="False" />
            <asp:Panel ID="ImageLinkInsert" runat="server">
                <table cellpadding="4" cellspacing="0">
                    <tr>
                        <td>
                            <asp:Label ID="ImageLinkTitle" runat="server" Text="<%$ Resources:Resource, Title %>"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="ImageLink1" runat="server"></asp:TextBox>
                            <asp:Label ID="valuevalidator" runat="server" Text="*"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="ImageLinkImageURL" runat="server" Text="<%$ Resources:Resource, ImageURL %>"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="imageLink2" runat="server"></asp:TextBox>
                            <asp:Label ID="valuevalidator0" runat="server" Text="*"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="ImageLinkURL" runat="server" Text="URL"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="ImageLink3" runat="server"></asp:TextBox>
                            <asp:Label ID="valuevalidator1" runat="server" Text="*"></asp:Label>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <asp:Label ID="ImageLinkDescription" runat="server" Text="<%$ Resources:Resource, Description %>"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="ImageLink4" runat="server" MaxLength="1000"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Button ID="ImageLinkButtonInsert" runat="server" Text="<%$ Resources:Resource, Insert %>" OnClick="ImageLinkButtonInsert_Click" />
                            <asp:Button ID="ImgaeLinkCancel" runat="server" OnClick="ImgaeLinkCancel_Click" Text="<%$ Resources:Resource, Cancel %>" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <asp:Panel ID="ImageLinkEdit" runat="server">
                <table cellpadding="4" cellspacing="0">
                    <tr>
                        <td>
                            <asp:Label ID="ImageLinkTitle0" runat="server" Text="<%$ Resources:Resource, Title %>"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="ImageLink5" runat="server"></asp:TextBox>
                            <asp:Label ID="valuevalidator2" runat="server" Text="*"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="URL"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="ImageLink6" runat="server"></asp:TextBox>
                            <asp:Label ID="valuevalidator3" runat="server" Text="*"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="ImageLinkImageURL0" runat="server" Text="<%$ Resources:Resource, ImageURL %>"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="ImageLink7" runat="server"></asp:TextBox>
                            <asp:Label ID="valuevalidator4" runat="server" Text="*"></asp:Label>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <asp:Label ID="ImageLinkDescription0" runat="server" Text="<%$ Resources:Resource, Description %>"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="ImageLink8" runat="server" MaxLength="1000"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Button ID="ImageLinkButtonEdit" runat="server" Text="<%$ Resources:Resource, Edit %>" OnClick="ImageLinkButtonEdit_Click" />
                            <asp:Button ID="ImgaeLinkCancel0" runat="server" OnClick="ImgaeLinkCancel_Click" Text="<%$ Resources:Resource, Cancel %>" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <asp:Panel ID="ImageLinkDelete" runat="server">
                <asp:Button ID="ImageLinkDeleteButton" runat="server" OnClick="ImageLinkDeleteButton_Click" Text="<%$ Resources:Resource, Delete %>" />
                <asp:Button ID="ImgaeLinkCancel1" runat="server" OnClick="ImgaeLinkCancel_Click" Text="<%$ Resources:Resource, Cancel %>" />
            </asp:Panel>
        </asp:View>
        <asp:View ID="AdminPermissionForUsersNews" runat="server">
            <table cellpadding="4" cellspacing="0">
                <tr>
                    <td>
                        <asp:Label ID="AdminPermissionForGroupPasswordLable1" runat="server" Text="<%$ Resources:Resource, Password %>"></asp:Label>
                        :</td>
                    <td>
                        <asp:TextBox ID="AdminPermissionForGroupPasswordTextBox1" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="AdminPermissionForGroupLoginButton1" runat="server" OnClick="AdminPermissionForGroupLoginButton1_Click" Text="<%$ Resources:Resource, Login %>" />
                        <asp:Button ID="AdminPermissionForGroupLoginCancelButton1" runat="server" OnClick="AdminPermissionForGroupLoginCancelButton_Click" Text="<%$ Resources:Resource, Cancel %>" />
                        <asp:Label ID="AdminPermissionForGroupProblemErrorLable1" runat="server" Text="<%$ Resources:Resource, ProblemWithSelectingData %>" Visible="False"></asp:Label>
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="UsersNews" runat="server">
            <asp:GridView ID="UsersNewsGridView" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="UsersNewsSqlDataSource" CssClass="gv" EmptyDataText="<%$ Resources:Resource, NoData %>">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="ID" HeaderText="<%$ Resources:Resource, ID%>" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="Views" HeaderText="<%$ Resources:Resource, Views %>" SortExpression="Views" />
                    <asp:BoundField DataField="Hates" HeaderText="<%$ Resources:Resource, Hates %>" SortExpression="Hates" />
                    <asp:BoundField DataField="Likes" HeaderText="<%$ Resources:Resource, Likes %>" SortExpression="Likes" />
                    <asp:TemplateField HeaderText="<%$ Resources:Resource, Read %>" SortExpression="ID">
                        <ItemTemplate>
                            <asp:HyperLink ID="Read" runat="server" Text="<%$ Resources:Resource, Read %>" NavigateUrl='<%# Eval("ID","~/App_Page/News/ShowNewsByID.aspx?ID={0}") %>' Target="_search" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="UsersNewsSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT ID , Views , Likes , Hates FROM [News-News] WHERE (UserID&lt;&gt;@UserID)">
                <SelectParameters>
                    <asp:SessionParameter Name="UserID" SessionField="UserID" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:Label ID="UsersNewsToLable" runat="server" Text="<%$ Resources:Resource, To %>"></asp:Label>
            :<asp:DropDownList ID="UsersNewsDropDownList" runat="server" DataSourceID="UsersNewsSqlDataSource2" DataTextField="Fullname" DataValueField="UserID">
            </asp:DropDownList>
            <br />
            <asp:Label ID="UsersNewsTitleLable" runat="server" Text="<%$ Resources:Resource, Title %>"></asp:Label>
            :<asp:DropDownList ID="TitleDropDownList" runat="server">
                <asp:ListItem Value="Caution1">هشدار: اخباری که ارسال کردید مقدار زیادی رای تنفر داشته است.</asp:ListItem>
                <asp:ListItem Value="Caution2">هشدار: اخباری که ارسال کردید بازدید پایینی داشته است.</asp:ListItem>
                <asp:ListItem Value="Caution3">هشدار: اخباری که ارسال کردید بدون بازدید هستند.</asp:ListItem>
                <asp:ListItem Value="Caution4">هشدار: اخباری که ارسال کردید نتوانسته رای زیادی را جذب کند.</asp:ListItem>
                <asp:ListItem Value="Caution5">هشدار: به اخباری که ارسال کردید هیچ ابراز علاقه ای انجام نشده است.</asp:ListItem>
                <asp:ListItem Value="Caution6">هشدار: اخطار در رابطه با سبک نوشتار شما.</asp:ListItem>
                <asp:ListItem Value="Caution7">هشدار: اخطار در رابطه با مشکلات فنی اخبار ارسال شده توسط شما.</asp:ListItem>
                <asp:ListItem Value="Caution8">هشدار: اخطار در رابطه با محتوای ارسال شده توسط شما.</asp:ListItem>
            </asp:DropDownList>
            &nbsp;<asp:Label ID="UsersNewsValue" runat="server" Text="<%$ Resources:Resource, Value %>"></asp:Label>
            :<asp:TextBox ID="UsersNewsCautionValueTextBox" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="btn_UsersNewsSend" runat="server" OnClick="btn_UsersNewsSend_Click" Text="<%$ Resources:Resource, Send %>" />
            <asp:SqlDataSource ID="UsersNewsSqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT UserID , Fullname FROM [Users-Users] WHERE ([UserID] &lt;&gt; @UserID) AND (MainType = N'Jornal')">
                <SelectParameters>
                    <asp:SessionParameter Name="UserID" SessionField="UserID" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="ConverstationSqlDataSource" runat="server" InsertCommand="INSERT INTO [Users-Converstation] (FromFullname, ToFullname, FromID, ToID, Title, Value) VALUES (@FromFullname, @ToFullname, @FromId, @ToId, @Title, @Value)" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>">
                <InsertParameters>
                    <asp:SessionParameter Name="FromFullname" SessionField="Fullname" />
                    <asp:ControlParameter ControlID="UsersNewsToHiddenField" Name="ToFullname" PropertyName="Value" />
                    <asp:SessionParameter Name="FromId" SessionField="UserID" />
                    <asp:ControlParameter ControlID="UsersNewsDropDownList" Name="ToId" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="UsersNewsTitleHiddenField" Name="Title" PropertyName="Value" />
                    <asp:ControlParameter ControlID="UsersNewsCautionValueTextBox" Name="Value" PropertyName="Text" />
                </InsertParameters>
            </asp:SqlDataSource>
            <asp:HiddenField ID="UsersNewsTitleHiddenField" runat="server" Visible="False" />
            <asp:HiddenField ID="UsersNewsToHiddenField" runat="server" Visible="False" />
        </asp:View>
    </asp:MultiView>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="NoAjaxContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" runat="server" contentplaceholderid="head">
    <link href="<%:WebsitePage.WebsiteRoot(true, false)%>/App_StyleSheet/Users/USERS_LoggedIn_Admin_News_Default.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%:WebsitePage.WebsiteRoot(true, false)%>/App_Scripts/Users/USERS_LoggedIn_Admin_News_Default.js"></script>
</asp:Content>

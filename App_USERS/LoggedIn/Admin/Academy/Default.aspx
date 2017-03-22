<%@ Page Language="C#" MasterPageFile="~/App_MasterPage/Users-LoggedInMasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="USERS_LoggedIn_Admin_Academy_Default" %>

<%@ Register assembly="SnowCity.HtmlEditor" namespace="SnowCity.HtmlEditor" tagprefix="cc1" %>

<asp:Content ID="Content" ContentPlaceHolderID="DefaultContentPlaceHolder" runat="Server">
    <asp:MultiView ID="DefaultMultiView" runat="server" ActiveViewIndex="0">
        <asp:View ID="DefaultView" runat="server">
            <asp:Button ID="BackToDefaultPage" runat="server" OnClick="BackToDefaultPage_Click" Text="<%$ Resources:Resource, Back %>" />
            <asp:Button ID="btn_Article" runat="server" OnClick="btn_Article_Click" Text="<%$ Resources:Resource, Article %>" />
            <asp:Button ID="Course" runat="server" OnClick="Course_Click" Text="<%$ Resources:Resource, Course %>" />
            `<asp:Button ID="Question" runat="server" Text="<%$ Resources:Resource, Question %>" OnClick="Question_Click" />
            <asp:Label ID="CountQuestions" runat="server"></asp:Label>
        </asp:View>
        <asp:View ID="view_Article" runat="server">
            <asp:MultiView ID="mView_Article" runat="server" ActiveViewIndex="0">
                <asp:View ID="view_article_Default" runat="server">
                    <asp:Button ID="Back" runat="server" OnClick="Back_Click" Text="<%$ Resources:Resource, Back %>" />
                    <asp:Button ID="Insert" runat="server" OnClick="Insert_Click" Text="<%$ Resources:Resource, Insert %>" />
                    <asp:Button ID="Edit" runat="server" OnClick="Button2_Click" Text="<%$ Resources:Resource, Edit %>" Enabled="False" />
                    <asp:Button ID="Delete" runat="server" OnClick="Button3_Click" Text="<%$ Resources:Resource, Delete %>" Enabled="False" />
                    <asp:GridView ID="gView_article_Default" runat="server" EmptyDataText="<%$ Resources:Resource, NoData %>" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ArticleID" DataSourceID="ArticleSqlDataSource" OnSelectedIndexChanged="gView_article_Default_SelectedIndexChanged" CssClass="gv">
                        <Columns>
                            <asp:CommandField SelectText="<%$ Resources:Resource, SELECT %>" ShowSelectButton="True" />
                            <asp:BoundField DataField="ArticleID" HeaderText="<%$ Resources:Resource, ID %>" InsertVisible="False" ReadOnly="True" SortExpression="ArticleID" />
                            <asp:BoundField DataField="Title" HeaderText="<%$ Resources:Resource, Title %>" SortExpression="Title" />
                            <asp:BoundField DataField="Date" HeaderText="<%$ Resources:Resource, Date %>" SortExpression="Date" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="ArticleSqlDataSource" InsertCommand="INSERT INTO [Academy-Article] (Title, Abstract, Value, Date, UserID, GroupID, VideoId) VALUES (@Title, @Abstract, @Value, @Date, @UserID, @GroupID, @VideoId)" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT ArticleID , Title , Date FROM [Academy-Article] WHERE (UserID=@UserID) ORDER BY [ArticleID] DESC" UpdateCommand="UPDATE [Academy-Article] SET Title = @Title, Abstract = @Abstract, Value = @Value, Date = @Date, GroupID = @GroupID, VideoId = @VideoId WHERE (ArticleID = @ArticleID)" DeleteCommand="DELETE FROM [Academy-Article] WHERE (ArticleID = @ArticleID)">
                        <InsertParameters>
                            <asp:ControlParameter ControlID="txt_Title" Name="Title" PropertyName="Text" />
                            <asp:ControlParameter ControlID="txt_Abstract" Name="Abstract" PropertyName="Text" />
                            <asp:ControlParameter ControlID="txt_Value" Name="Value" PropertyName="Text" />
                            <asp:ControlParameter ControlID="lbl_Date" Name="Date" PropertyName="Text" />
                            <asp:SessionParameter Name="UserID" SessionField="UserID" />
                            <asp:ControlParameter ControlID="ddl_Group" Name="GroupID" PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="txt_Video" Name="VideoId" PropertyName="Text" />
                        </InsertParameters>

                        <DeleteParameters>
                            <asp:ControlParameter ControlID="lbl_ArticleID0" Name="ArticleID" PropertyName="Text" />
                        </DeleteParameters>
                        <SelectParameters>
                            <asp:SessionParameter Name="UserID" SessionField="UserID" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:ControlParameter ControlID="txt_Title0" Name="Title" PropertyName="Text" />
                            <asp:ControlParameter ControlID="txt_Abstract0" Name="Abstract" PropertyName="Text" />
                            <asp:ControlParameter ControlID="txt_Value0" Name="Value" PropertyName="Text" />
                            <asp:ControlParameter ControlID="lbl_Date0" Name="Date" PropertyName="Text" />
                            <asp:ControlParameter ControlID="ddl_Group0" Name="GroupID" PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="lbl_ArticleID" Name="ArticleID" PropertyName="Text" />
                            <asp:ControlParameter ControlID="txt_Video0" Name="VideoId" PropertyName="Text" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="ArticleGroupSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT Name , GroupID FROM [Academy-Group]" DeleteCommand="DELETE FROM [Academy-Group] WHERE (GroupID = @GroupID)" InsertCommand="INSERT INTO [Academy-Group] (Name) VALUES (@Name)" UpdateCommand="UPDATE [Academy-Group] SET Name = @Name WHERE (GroupID = @GroupID)">
                        <DeleteParameters>
                            <asp:ControlParameter ControlID="lbl_Group_GroupID0" Name="GroupID" PropertyName="Text" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:ControlParameter ControlID="txt_Group_Insert" Name="Name" PropertyName="Text" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:ControlParameter ControlID="txt_Group_Edit" Name="Name" PropertyName="Text" />
                            <asp:ControlParameter ControlID="lbl_Group_GroupID" Name="GroupID" PropertyName="Text" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </asp:View>
                <asp:View ID="view_article_Insert" runat="server">
                    <asp:Button ID="Back0" runat="server" OnClick="btn_Article_Click" Text="<%$ Resources:Resource, Back %>" />
                    <asp:Button ID="btn_Insert" runat="server" Text="<%$ Resources:Resource, Insert %>" OnClick="btn_Insert_Click" />
                    <table cellpadding="4" cellspacing="0">
                        <tr>
                            <td>
                                <asp:Label ID="Title" runat="server" Text="<%$ Resources:Resource, Title %>"></asp:Label>
                            </td>
                            <td style="margin-left: 40px">
                                <asp:TextBox ID="txt_Title" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Group" runat="server" Text="<%$ Resources:Resource, Group %>"></asp:Label>
                            </td>
                            <td style="margin-left: 40px">
                                <asp:DropDownList ID="ddl_Group" runat="server" DataSourceID="ArticleGroupSqlDataSource" DataTextField="Name" DataValueField="GroupID">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Abstract" runat="server" Text="<%$ Resources:Resource, Abstract %>"></asp:Label>
                            </td>
                            <td style="margin-left: 40px">
                                <asp:TextBox ID="txt_Abstract" runat="server" TextMode="MultiLine" Width="100%"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Value" runat="server" Text="<%$ Resources:Resource, Value %>"></asp:Label>
                            </td>
                            <td style="margin-left: 40px">
                                <cc1:HtmlEditor ID="txt_Value" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Date" runat="server" Text="<%$ Resources:Resource, Date %>"></asp:Label>
                            </td>
                            <td style="margin-left: 40px">
                                <asp:Label ID="lbl_Date" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Video" runat="server" Text="<%$ Resources:Resource, Video %>"></asp:Label>
                            </td>
                            <td style="margin-left: 40px">
                                <asp:TextBox ID="txt_Video" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </asp:View>
                <asp:View ID="view_article_Edit" runat="server">
                    <asp:Button ID="Back1" runat="server" OnClick="btn_Article_Click" Text="<%$ Resources:Resource, Back %>" />
                    <asp:Button ID="btn_Edit" runat="server" OnClick="btn_Edit_Click" Text="<%$ Resources:Resource, Edit %>" />
                    :<asp:Label ID="lbl_ArticleID" runat="server"></asp:Label>
                    <table cellpadding="4" cellspacing="0">
                        <tr>
                            <td>
                                <asp:Label ID="Title0" runat="server" Text="<%$ Resources:Resource, Title %>"></asp:Label>
                            </td>
                            <td style="margin-left: 40px">
                                <asp:TextBox ID="txt_Title0" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Group0" runat="server" Text="<%$ Resources:Resource, Group %>"></asp:Label>
                            </td>
                            <td style="margin-left: 40px">
                                <asp:DropDownList ID="ddl_Group0" runat="server" DataSourceID="ArticleGroupSqlDataSource" DataTextField="Name" DataValueField="GroupID">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Abstract0" runat="server" Text="<%$ Resources:Resource, Abstract %>"></asp:Label>
                            </td>
                            <td style="margin-left: 40px">
                                <asp:TextBox ID="txt_Abstract0" runat="server" TextMode="MultiLine" Width="100%"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Value0" runat="server" Text="<%$ Resources:Resource, Value %>"></asp:Label>
                            </td>
                            <td style="margin-left: 40px">
                                <cc1:HtmlEditor ID="txt_Value0" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Date0" runat="server" Text="<%$ Resources:Resource, Date %>"></asp:Label>
                            </td>
                            <td style="margin-left: 40px">
                                <asp:Label ID="lbl_Date0" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Video0" runat="server" Text="<%$ Resources:Resource, Video %>"></asp:Label>
                            </td>
                            <td style="margin-left: 40px">
                                <asp:TextBox ID="txt_Video0" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </asp:View>
                <asp:View ID="view_article_Delete" runat="server">
                    <asp:Button ID="Back2" runat="server" OnClick="btn_Article_Click" Text="<%$ Resources:Resource, Back %>" />
                    <asp:Button ID="btn_Delete" runat="server" OnClick="btn_Delete_Click" Text="<%$ Resources:Resource, Delete %>" />
                    :<asp:Label ID="lbl_ArticleID0" runat="server"></asp:Label>
                    <table cellpadding="4" cellspacing="0">
                        <tr>
                            <td>
                                <asp:Label ID="Title1" runat="server" Text="<%$ Resources:Resource, Title %>"></asp:Label>
                            </td>
                            <td style="margin-left: 40px">
                                <asp:TextBox ID="txt_Title1" runat="server" Enabled="False" ReadOnly="True"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Abstract1" runat="server" Text="<%$ Resources:Resource, Abstract %>"></asp:Label>
                            </td>
                            <td style="margin-left: 40px">
                                <asp:TextBox ID="txt_Abstract1" runat="server" TextMode="MultiLine" Enabled="False" ReadOnly="True" Width="100%"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Date1" runat="server" Text="<%$ Resources:Resource, Date %>"></asp:Label>
                            </td>
                            <td style="margin-left: 40px">
                                <asp:Label ID="lbl_Date1" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </asp:View>
            </asp:MultiView>
        </asp:View>
        <asp:View ID="view_Group" runat="server">
            <asp:MultiView ID="mv_Group" runat="server">
                <asp:View ID="Group_Permission" runat="server">
                    <table cellpadding="4" cellspacing="0">
                        <tr>
                            <td>
                                <asp:Label ID="password" runat="server" Text="<%$ Resources:Resource, password %>"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_Password" runat="server" TextMode="Password"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Button ID="btn_Login" runat="server" OnClick="btn_Login_Click" Text="<%$ Resources:Resource, Authenticate %>" />
                                <asp:Button ID="Back5" runat="server" OnClick="Back_Click" Text="<%$ Resources:Resource, Back %>" />
                            </td>
                        </tr>
                    </table>
                </asp:View>
                <asp:View ID="Group_Default" runat="server">
                    <asp:Button ID="Back3" runat="server" OnClick="Back_Click" Text="<%$ Resources:Resource, Back %>" />
                    <asp:Button ID="Insert0" runat="server" OnClick="Insert0_Click" Text="<%$ Resources:Resource, Insert %>" />
                    <asp:Button ID="Edit0" runat="server" Enabled="False" OnClick="Edit0_Click" Text="<%$ Resources:Resource, Edit %>" />
                    <asp:Button ID="Delete0" runat="server" Enabled="False" OnClick="Delete0_Click" Text="<%$ Resources:Resource, Delete %>" />
                    <asp:GridView ID="GroupGridView" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="GroupID" DataSourceID="ArticleGroupSqlDataSource" OnSelectedIndexChanged="GroupGridView_SelectedIndexChanged" CssClass="gv" EmptyDataText="<%$ Resources:Resource, NoData %>">
                        <Columns>
                            <asp:CommandField SelectText="<%$ Resources:Resource, Select %>" ShowSelectButton="True" />
                            <asp:BoundField DataField="GroupID" HeaderText="<%$ Resources:Resource, ID %>" InsertVisible="False" ReadOnly="True" SortExpression="GroupID" />
                            <asp:BoundField DataField="Name" HeaderText="<%$ Resources:Resource, Name %>" SortExpression="Name" />
                        </Columns>
                    </asp:GridView>
                </asp:View>
                <asp:View ID="Group_Insert" runat="server">
                    <asp:Button ID="Back4" runat="server" OnClick="BackToGroupDefault_Click" Text="<%$ Resources:Resource, Back %>" />
                    <asp:TextBox ID="txt_Group_Insert" runat="server"></asp:TextBox>
                    <asp:Button ID="btn_Insert0" runat="server" Text="<%$ Resources:Resource, Insert %>" OnClick="btn_Insert0_Click" />
                </asp:View>
                <asp:View ID="Group_Edit" runat="server">
                    <asp:Button ID="Back6" runat="server" OnClick="BackToGroupDefault_Click" Text="<%$ Resources:Resource, Back %>" />
                    <asp:TextBox ID="txt_Group_Edit" runat="server"></asp:TextBox>
                    <asp:Button ID="btn_Edit0" runat="server" Text="<%$ Resources:Resource, Edit %>" OnClick="btn_Edit0_Click" />
                    <asp:Label ID="lbl_Group_GroupID" runat="server"></asp:Label>
                </asp:View>
                <asp:View ID="Group_Delete" runat="server">
                    <asp:Button ID="Back7" runat="server" OnClick="BackToGroupDefault_Click" Text="<%$ Resources:Resource, Back %>" />
                    <asp:TextBox ID="txt_Group_Delete" runat="server" ReadOnly="True"></asp:TextBox>
                    <asp:Button ID="btn_Delete0" runat="server" Text="<%$ Resources:Resource, Delete %>" OnClick="btn_Delete0_Click" />
                    <asp:Label ID="lbl_Group_GroupID0" runat="server"></asp:Label>
                </asp:View>
            </asp:MultiView>
        </asp:View>
        <asp:View ID="view_Questions" runat="server">
            <asp:MultiView ID="mv_Questions" runat="server" ActiveViewIndex="0">
                <asp:View ID="view_Questions_Default" runat="server">
                    <asp:Button ID="Back8" runat="server" OnClick="Back_Click" Text="<%$ Resources:Resource, Back %>" />
                    <asp:Button ID="QuestionLater" runat="server" OnClick="QuestionLater_Click" Text="<%$ Resources:Resource, Later %>" />
                    <asp:Button ID="QuestionsArchive" runat="server" OnClick="QuestionsArchive_Click" Text="<%$ Resources:Resource, Archive %>" />
                    <asp:GridView ID="gv_Questions" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="QuestionID" DataSourceID="sds_Questions" OnSelectedIndexChanged="gv_Questions_SelectedIndexChanged" PageSize="2" CssClass="gv" EmptyDataText="<%$ Resources:Resource, NoData %>">
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" SelectText="<%$ Resources:Resource,Select %>" />
                            <asp:BoundField DataField="QuestionID" HeaderText="<%$ Resources:Resource,ID %>" InsertVisible="False" ReadOnly="True" SortExpression="QuestionID" />
                            <asp:BoundField DataField="Email" HeaderText="<%$ Resources:Resource,From %>" SortExpression="Email" />
                            <asp:TemplateField HeaderText="<%$ Resources:Resource,Article %>" SortExpression="ArticleID">
                                <ItemTemplate>
                                    <asp:HyperLink ID="ArticleID" runat="server" Text="<%$ Resources:Resource,Read %>" NavigateUrl='<%# Eval("ArticleID","~/App_Page/Academy/Article.aspx?ArticleID={0}") %>' Target="_search"></asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="sds_Questions" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT QuestionID , Email , ArticleID FROM [Academy-BlockedQuestion] WHERE (([UserID] = @UserID) AND ([IsReaded] = @IsReaded))">
                        <SelectParameters>
                            <asp:SessionParameter Name="UserID" SessionField="UserID" Type="Int32" />
                            <asp:Parameter DefaultValue="false" Name="IsReaded" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </asp:View>
                <asp:View ID="view_Questions_Select" runat="server">
                    <table cellpadding="4" cellspacing="0">
                        <tr>
                            <td>
                                <asp:Label ID="Article" runat="server" Text="<%$ Resources:Resource, Article %>"></asp:Label>
                            </td>
                            <td>
                                <asp:HyperLink ID="hp_Article" runat="server" Target="_search" Text="<%$ Resources:Resource, Read %>"></asp:HyperLink>
                                #<asp:Label ID="lbl_ArticleID2" runat="server"></asp:Label>
                                #<asp:Label ID="lbl_QuestionBlockedId" runat="server"></asp:Label>
                                #<asp:Label ID="lbl_GroupID" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Sender" runat="server" Text="<%$ Resources:Resource, From %>"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lbl_From" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Label ID="Comment" runat="server" Text="<%$ Resources:Resource, Question %>"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Literal ID="lbl_Comment" runat="server"></asp:Literal>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:MultiView ID="mv_Questions_Select" runat="server" ActiveViewIndex="0">
                                    <asp:View ID="Questions_Select_Default" runat="server">
                                        <asp:Button ID="Answer" runat="server" Text="<%$ Resources:Resource, Answer %>" OnClick="Answer_Click" />
                                        <asp:Button ID="Delete2" runat="server" Text="<%$ Resources:Resource, Delete %>" OnClick="Delete2_Click" />
                                        <asp:Button ID="Later" runat="server" Text="<%$ Resources:Resource, Later %>" OnClick="Later_Click" />
                                    </asp:View>
                                    <asp:View ID="Questions_Select_Answer" runat="server">
                                        <cc1:HtmlEditor ID="txt_Answer" runat="server" AllowedAttributes="href,target,src,align,valign,color,size,style,face,dir,alt,title" BorderColor="White" BorderStyle="Solid" Height="300px" ToggleMode="None" Toolbars="Bold,Italic:Center,Right|OrderedList,BulletedList|Indent,Outdent|Rule|Link" />
                                        <asp:Button ID="btn_Answer" runat="server" OnClick="btn_Answer_Click" Text="<%$ Resources:Resource, Answer %>" />
                                        <asp:Button ID="Cancel" runat="server" OnClick="Cancel_Click" Text="<%$ Resources:Resource, Cancel %>" />
                                    </asp:View>
                                </asp:MultiView>
                            </td>
                        </tr>
                    </table>
                </asp:View>
                <asp:View ID="view_Questions_Later" runat="server">
                    <asp:Button ID="Back10" runat="server" OnClick="BackToQuestionsDefault_Click" Text="<%$ Resources:Resource, Back %>" />
                    <asp:GridView ID="gView_Questions_Later" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="QuestionID" DataSourceID="sds_Questions_Later" OnSelectedIndexChanged="gView_Questions_Later_SelectedIndexChanged" PageSize="20" EmptyDataText="<%$ Resources:Resource, NoData %>">
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" SelectText="<%$ Resources:Resource,Select %>" />
                            <asp:BoundField DataField="QuestionID" HeaderText="<%$ Resources:Resource,ID %>" InsertVisible="False" ReadOnly="True" SortExpression="QuestionID" />
                            <asp:BoundField DataField="Email" HeaderText="<%$ Resources:Resource,From %>" SortExpression="Email" />
                            <asp:TemplateField HeaderText="<%$ Resources:Resource,Article %>" SortExpression="ArticleID">
                                <ItemTemplate>
                                    <asp:HyperLink ID="ArticleID" runat="server" Text="<%$ Resources:Resource,Read %>" NavigateUrl='<%# Eval("ArticleID","~/App_Page/Academy/Article.aspx?ArticleID={0}") %>' Target="_search"></asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="sds_Questions_Later" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT QuestionID , Email , ArticleID FROM [Academy-BlockedQuestion] WHERE (([UserID] = @UserID) AND ([IsReaded] = @IsReaded))">
                        <SelectParameters>
                            <asp:SessionParameter Name="UserID" SessionField="UserID" Type="Int32" />
                            <asp:Parameter DefaultValue="true" Name="IsReaded" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </asp:View>
            </asp:MultiView>
        </asp:View>
    </asp:MultiView>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="NoAjaxContentPlaceHolder" Runat="Server">
</asp:Content>

<asp:Content ID="Content3" runat="server" contentplaceholderid="head">
    <link href="<%:WebsitePage.WebsiteRoot(true, false)%>/App_StyleSheet/Users/USERS_LoggedIn_Admin_Academy_Default.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%:WebsitePage.WebsiteRoot(true, false)%>/App_Scripts/Users/USERS_LoggedIn_Admin_Academy_Default.js"></script>
</asp:Content>



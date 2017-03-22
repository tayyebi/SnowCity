<%@ Page Language="C#" MasterPageFile="~/App_MasterPage/Users-LoggedInMasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="USERS_LoggedIn_Admin_Police_News_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="DefaultContentPlaceHolder" Runat="Server">
    <asp:MultiView ID="DefaultMultiView" runat="server" ActiveViewIndex="0">
        <asp:View ID="DefaultView" runat="server">
            <asp:Button ID="btn_BackToPoliceDefault" runat="server" OnClick="btn_BackToPoliceDefault_Click" Text="<%$ Resources:Resource, Back %>" />
            <asp:Button ID="Comments" runat="server" Text="<%$ Resources:Resource, Comment %>" OnClick="Comments_Click" />
        </asp:View>
        <asp:View ID="CommentsView" runat="server">
            <asp:Button ID="btn_Back" runat="server" OnClick="btn_Back_Click" Text="<%$ Resources:Resource, Back %>" /><br />
            <asp:GridView ID="CommentGridView" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="PoliceNewsCommentSqlDataSource" CssClass="gv" EmptyDataText="<%$ Resources:Resource, NoData %>">
                <Columns>
                    <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="<%$ Resources:Resource, ID%>">
                        <EditItemTemplate>
                            <asp:DynamicControl ID="DynamicControl1" runat="server" DataField="" Mode="Edit" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="SelectCheckBox" runat="server" Text='<%# Bind("ID") %>'/>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="NewsID" HeaderText="<%$ Resources:Resource, News%>" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="Email" HeaderText="<%$ Resources:Resource, Email%>" SortExpression="Email" />
                    <asp:BoundField DataField="Value" HeaderText="<%$ Resources:Resource, Value%>" SortExpression="Value" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="PoliceNewsCommentSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT ID , NewsID , Email , Value FROM [Police-Comment]" DeleteCommand="DELETE FROM [Police-Comment] WHERE (ID = @ID)">
                <DeleteParameters>
                    <asp:ControlParameter ControlID="hf_InsertCommentID" Name="ID" PropertyName="Value" />
                </DeleteParameters>
            </asp:SqlDataSource>
            <asp:Button ID="btn_AcceptCommentSelection" runat="server" Text="<%$ Resources:Resource, Apply %>" OnClick="btn_AcceptCommentSelection_Click" /><br />
            <asp:ListBox ID="CommentSelectedDataList" runat="server" Enabled="False" Rows="10"></asp:ListBox>
            <br />
            <asp:Button ID="btn_Confirm" runat="server" Text="<%$ Resources:Resource, Confirm %>" OnClick="btn_Confirm_Click" />
            <asp:Button ID="btn_Reject" runat="server" Text="<%$ Resources:Resource, Reject %>" OnClick="btn_Reject_Click" />
            <asp:SqlDataSource ID="NewsCommentSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" InsertCommand="INSERT INTO [News-Comment] (NewsID, ID, Email, Value) VALUES (@NewsID, @ID, @Email, @Value)">
                <InsertParameters>
                    <asp:ControlParameter ControlID="hf_InsertCommentNewsID" Name="NewsID" PropertyName="Value" />
                    <asp:ControlParameter ControlID="hf_InsertCommentID" Name="ID" PropertyName="Value" />
                    <asp:ControlParameter ControlID="hf_InsertCommentEmail" Name="Email" PropertyName="Value" />
                    <asp:ControlParameter ControlID="hf_InsertCommentValue" Name="Value" PropertyName="Value" />
                </InsertParameters>
            </asp:SqlDataSource>
            <asp:HiddenField ID="hf_InsertCommentID" runat="server" Visible="False" />
            <asp:HiddenField ID="hf_InsertCommentEmail" runat="server" Visible="False" />
            <asp:HiddenField ID="hf_InsertCommentValue" runat="server" Visible="False" />
            <asp:HiddenField ID="hf_InsertCommentNewsID" runat="server" Visible="False" />
        </asp:View>
    </asp:MultiView>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="NoAjaxContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" runat="server" contentplaceholderid="head">
    <link href="<%:WebsitePage.WebsiteRoot(true, false)%>/App_StyleSheet/Users/USERS_LoggedIn_Admin_Police_News_Default.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%:WebsitePage.WebsiteRoot(true, false)%>/../App_Scripts/Users/USERS_LoggedIn_Admin_Police_News_Default.js"></script>
</asp:Content>
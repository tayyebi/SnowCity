<%@ Page Language="C#" MasterPageFile="~/App_MasterPage/AccademyMasterPage.master" AutoEventWireup="true" CodeFile="Question.aspx.cs" Inherits="App_Page_Academy_Question" %>
<%@ Register src="../../App_UserControl/Academy-UserControls/QuestionReader.ascx" tagname="QuestionReader" tagprefix="uc1" %>
<asp:Content ID="Content1" runat="server" contentplaceholderid="CPH_Default">
    <asp:DataList ID="dl_QA" runat="server" DataSourceID="SDS_QA">
        <ItemTemplate><uc1:QuestionReader ID="Question" Text='<%#Eval("Comment")%>' QuestionId='<%#Eval("QuestionID")%>' runat="server" />
        </ItemTemplate>
        <SeparatorTemplate>
            <asp:Image ID="seperatorImage" CssClass="seperator" runat="server" ImageUrl="~/App_Image/Seperator/longline.png" />
        </SeparatorTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SDS_QA" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT QuestionID,Comment FROM [Academy-Question] WHERE ([ArticleID] = @ArticleID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="ArticleID" QueryStringField="ArticleID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>


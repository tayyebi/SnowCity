<%@ Page Language="C#" MasterPageFile="~/App_MasterPage/AccademyMasterPage.master" AutoEventWireup="true" CodeFile="Article.aspx.cs" Inherits="App_Page_Academy_Article" %>


<%@ Register assembly="SnowCity.HtmlEditor" namespace="SnowCity.HtmlEditor" tagprefix="cc1" %>

<%@ Register src="../../App_UserControl/Academy-UserControls/ArticleReader.ascx" tagname="ArticleReader" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPH_SiteMap" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="CPH_Board" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="CPH_Default" runat="Server">
    <asp:DataList ID="DL_Article" runat="server" DataKeyField="ArticleID" DataSourceID="DefaultSqlDataSource" CssClass="DefaultDatalist">
        <ItemTemplate>
            <h1>
                <asp:Label ID="Title" runat="server" CssClass="ArticleTitle" Text='<%# Eval("Title") %>'/>
            </h1>
            <h2>
                <asp:Label ID="Abstract" runat="server" Text='<%# Eval("Abstract") %>' CssClass="ArticleAbstract"/>
            </h2>
            <hr />
            <uc1:ArticleReader ID="ArticleReader1" runat="server" />
        </ItemTemplate>
    </asp:DataList>
    <div class="questionDiv">
        <asp:Label ID="Label1" runat="server" Text="<%$Resources:Resource,Email %>"></asp:Label>
        :
        <asp:TextBox ID="txt_Email" CssClass="Email" runat="server"></asp:TextBox>
        <asp:Label ID="Label2" runat="server" Text="<%$Resources:Resource,Question %>"></asp:Label>
        :
        <cc1:HtmlEditor ID="txt_Question" runat="server" AllowedAttributes="href,target,src,align,valign,color,size,style,face,dir,alt,title" BorderColor="White" BorderStyle="Solid" Height="300px" ToggleMode="None" Toolbars="Bold,Italic:Center,Right|OrderedList,BulletedList|Indent,Outdent|Rule|Link" />
        <br />
        <asp:Button ID="Ask" runat="server" OnClick="Ask_Click" Text="<%$Resources:Resource,Ask %>" CssClass="btn_Send" />
        *<asp:HyperLink ID="Questions" runat="server" NavigateUrl="~/App_Page/Academy/Question.aspx" Text="<%$ Resources:Resource, Question %>"></asp:HyperLink>
    </div>
    <asp:SqlDataSource ID="DefaultSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Academy-Article] WHERE ([ArticleID] = @ArticleID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="ArticleID" QueryStringField="ArticleID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SDS_Question" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" InsertCommand="INSERT INTO [Academy-BlockedQuestion] (Email, Comment, ArticleID, UserID, GroupID, IsReaded) VALUES (@Email, @Comment, @ArticleID, @UserID, @GroupID, N'false')" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>">
        <InsertParameters>
            <asp:ControlParameter ControlID="txt_Email" Name="Email" PropertyName="Text" />
            <asp:ControlParameter ControlID="txt_Question" DefaultValue="" Name="Comment" PropertyName="Text" />
            <asp:QueryStringParameter Name="ArticleID" QueryStringField="ArticleID" />
            <asp:ControlParameter ControlID="hf_UserID" Name="UserID" PropertyName="Value" />
            <asp:ControlParameter ControlID="hf_GroupID" Name="GroupID" PropertyName="Value" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:HiddenField ID="hf_UserID" runat="server" Visible="False" />
    <asp:HiddenField ID="hf_GroupID" runat="server" Visible="False" />
</asp:Content>


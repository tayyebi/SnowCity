<%@ Page   Language="C#" MasterPageFile="~/App_MasterPage/NewsMasterPage.master" AutoEventWireup="true" CodeFile="ShowNewsByID.aspx.cs" Inherits="App_Page_News_ShowNewsByID" %>

<%@ Register src="../../App_UserControl/News-UserControls/NewsReader.ascx" tagname="NewsReader" tagprefix="uc1" %>
<%@ Register src="../../App_UserControl/News-UserControls/RelatedNews.ascx" tagname="RelatedNews" tagprefix="uc2" %>
<%@ Register src="../../App_UserControl/Adverties-UserControls/Adverties5.ascx" tagname="Adverties5" tagprefix="uc3" %>
<%@ Register src="../../App_UserControl/News-UserControls/CountNews.ascx" tagname="CountNews" tagprefix="uc4" %>
<%@ Register Src="~/App_UserControl/News-UserControls/NewsFader.ascx" TagPrefix="uc1" TagName="NewsFader" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="<%:WebsitePage.WebsiteRoot(true, false)%>/App_Scripts/-jquery.js" type="text/javascript"></script>
    <script>
        $(function () {
            runEffect();
            function runEffect() {
                $(".youmaylike").toggle();
            };
            $("#youmaylike").click(function () {
                runEffect();
                return false;
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="DefaultContentPlaceHolder" runat="Server">
    <asp:DataList ID="DefaultDataList" runat="server" DataKeyField="ID" DataSourceID="DefaultSqlDataSource" CssClass="DefaultDatalist">
        <ItemTemplate>
            <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' CssClass="serial" />
            <h1>
                <asp:Label ID="TitleLabel" runat="server" CssClass="Title" Text='<%# Eval("Title") %>' />
            </h1>
            <h2>
                <asp:Label ID="AbstractLabel" runat="server" CssClass="Abstract" Text='<%# Eval("Abstract") %>' />
            </h2>
            <asp:Label ID="lbl_Source" runat="server" CssClass="Source" Text='<%# Eval("Source") %>'></asp:Label>
            <hr />
            <uc1:NewsReader ID="NewsLable" Text='<%# Eval("Value") %>' runat="server" />
        </ItemTemplate>
    </asp:DataList>
    <asp:HyperLink ID="UserIDLabel" runat="server" CssClass="User" />
    <asp:HyperLink ID="GroupIDLabel" runat="server" CssClass="Group" />
    <div>
        <asp:SqlDataSource ID="DefaultSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [News-News] WHERE ([ID] = @ID)">
            <SelectParameters>
                <asp:QueryStringParameter Name="ID" QueryStringField="ID" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <uc3:Adverties5 ID="Adverties51" runat="server" />
    </div>
    <asp:Image ID="seperator" runat="server" ImageUrl="~/App_Image/Seperator/longline.png" CssClass="seperator" />
    <br />
    <div>
        <asp:DataList ID="CommentDataList" runat="server" DataKeyField="ID" DataSourceID="CommentSQLDataSource">
            <ItemTemplate>
                <asp:HyperLink ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                <br />
                <asp:Label ID="ValueLabel" runat="server" Text='<%# Eval("Value") %>' />
                <br />
            </ItemTemplate>
            <SeparatorTemplate>
                <asp:Image ID="Image1" runat="server" ImageUrl="~/App_Image/Seperator/shortline.png" />
            </SeparatorTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="CommentSQLDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [News-Comment] WHERE ([NewsID] = @NewsID)" InsertCommand="INSERT INTO [News-Comment] (NewsID, Email, Value) VALUES (@NewsID, @Email, @Value)">
            <InsertParameters>
                <asp:QueryStringParameter Name="NewsID" QueryStringField="ID" />
                <asp:ControlParameter ControlID="txt_Email" Name="Email" PropertyName="Text" />
                <asp:ControlParameter ControlID="txt_Value" Name="Value" PropertyName="Text" />
            </InsertParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="NewsID" QueryStringField="ID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="PoliceCommentSQLDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" InsertCommand="INSERT INTO [Police-Comment] (NewsID, Email, Value) VALUES (@NewsID, @Email, @Value)">
            <InsertParameters>
                <asp:QueryStringParameter Name="NewsID" QueryStringField="ID" />
                <asp:ControlParameter ControlID="txt_Email" Name="Email" PropertyName="Text" />
                <asp:ControlParameter ControlID="txt_Value" Name="Value" PropertyName="Text" />
            </InsertParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="NewsID" QueryStringField="ID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <div class="newsItem">
            <asp:Label ID="lbl_Email" runat="server" Text="<%$ Resources:Resource, Email %>"></asp:Label>:<asp:TextBox CssClass="Email" ID="txt_Email" runat="server"></asp:TextBox>
            <asp:Label ID="lbl_Value" runat="server" Text="<%$ Resources:Resource, Comment %>"></asp:Label>
            <asp:TextBox ID="txt_Value" runat="server" CssClass="Value" TextMode="MultiLine"></asp:TextBox>
            <asp:Button ID="btn_Send" runat="server" OnClick="btn_Send_Click" Text="<%$ Resources:Resource, Send %>" CssClass="btn_Send" />
            <asp:Button ID="btn_MessageSend" runat="server" Enabled="False" Text="<%$ Resources:Resource, MessageSend %>" Visible="False" CssClass="btn_Send" />
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ContentPlaceHolderSiteMap">
    <asp:HyperLink ID="hp_Group" runat="server">[hp_Group]</asp:HyperLink>
    *<asp:HyperLink ID="hp_Title" runat="server">[hp_Title]</asp:HyperLink>
    *<asp:HyperLink ID="hp_User" runat="server">[hp_User]</asp:HyperLink>
    *<input id="youmaylike" class="Toggle" type="button"/>
</asp:Content>
<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="CustomContentPlaceHolder">
    <div class="youmaylike">
        <uc2:RelatedNews ID="DefaultRelatedNews" runat="server" />
    </div>
    <uc1:NewsFader runat="server" ID="NewsFader" />
</asp:Content>
<asp:Content ID="Content5" runat="server" contentplaceholderid="NoAjax">
</asp:Content>

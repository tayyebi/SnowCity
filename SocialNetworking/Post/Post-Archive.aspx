<%@ Page Title="آرشیو پست ها" Language="C#" MasterPageFile="~/SocialNetworking/Post/Post.master" AutoEventWireup="true" CodeFile="Post-Archive.aspx.cs" Inherits="SocialNetworking_Post_Post_Archive" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="Post-archive.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_Banner" Runat="Server">
    آرشیو پست های
    <asp:Label ID="lbl_Fullname" runat="server" CssClass="lbl_Fullname"></asp:Label>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cph_SideContent1" runat="Server">
        <asp:DataList ID="dl_RecentPosts" runat="server" DataKeyField="PostID" DataSourceID="sds_RecentPosts">
            <ItemTemplate>
                <asp:HyperLink ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' NavigateUrl='<%# Eval("PostID","~/SocialNetworking/Post/Post-View.aspx?PostID={0}") %>'/>
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="sds_RecentPosts" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT TOP 10 [PostID], [Title] FROM [Social-Post] WHERE ([username] = @username) ORDER BY [PostID] DESC">
            <SelectParameters>
                <asp:QueryStringParameter Name="username" QueryStringField="username" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cph_Post" Runat="Server">
    <asp:GridView ID="gv_Default" runat="server" AllowPaging="True" AutoGenerateColumns="False" CssClass="gv_Default" DataKeyNames="PostID" DataSourceID="sds_Default" EmptyDataText="هیچ پستی توسط این کاربر ثبت نشده است!" PageSize="100" ShowHeader="False">
        <Columns>
            <asp:TemplateField SortExpression="Title" InsertVisible="False" ShowHeader="False">
                <ItemTemplate>
                    <asp:Hyperlink ID="hp_Title" CssClass="hp_Title" runat="server" Text='<%# Bind("Title") %>' Target="_blank" ToolTip='<%# Eval("date") %>' NavigateUrl='<%# Eval("PostID","~/SocialNetworking/Post/Post-View.aspx?PostID={0}") %>'></asp:Hyperlink>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <PagerStyle CssClass="pager" />
        <RowStyle CssClass="gv_Default_Row" />
    </asp:GridView>
    <asp:SqlDataSource ID="sds_Default" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Title], [PostID], [date] FROM [Social-Post] WHERE ([username] = @username) ORDER BY [PostID] DESC">
        <SelectParameters>
            <asp:QueryStringParameter Name="username" QueryStringField="username" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>


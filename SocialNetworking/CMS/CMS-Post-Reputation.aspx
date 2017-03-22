<%@ Page Title="امتیازات پست ها" Language="C#" MasterPageFile="~/SocialNetworking/CMS/CMS.master" AutoEventWireup="true" CodeFile="CMS-Post-Reputation.aspx.cs" Inherits="SocialNetworking_CMS_CMS_Post_Reputation" %>

<%@ Register src="Reputation.ascx" tagname="Reputation" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="CMS-Post-Reputation.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_Default" Runat="Server">

    <asp:GridView ID="gv_Default" runat="server" AutoGenerateColumns="False" CssClass="gv_archive" DataKeyNames="PostID" DataSourceID="sds_Default" AllowPaging="True" PageSize="200">
        <Columns>
            <asp:BoundField DataField="PostID" HeaderText="سریال" InsertVisible="False" ReadOnly="True" SortExpression="PostID" />
            <asp:TemplateField HeaderText="عنوان" SortExpression="Title">
                <ItemTemplate>
                    <asp:HyperLink ID="Title" runat="server" Text='<%# Bind("Title") %>' NavigateUrl='<%# Eval("PostID","~/SocialNetworking/Post/Post-View.aspx?PostID={0}") %>' Target="_blank"></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="علاقه مندی ها">
                <ItemTemplate>
                    <uc1:Reputation ID="PostReputation" PostID='<%# Eval("PostID") %>' runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <RowStyle CssClass="gv_archive_Row" />
    </asp:GridView>
    <asp:SqlDataSource ID="sds_Default" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Social-Post] WHERE ([username] = @username) ORDER BY [PostID] DESC">
        <SelectParameters>
            <asp:SessionParameter Name="username" SessionField="username" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>


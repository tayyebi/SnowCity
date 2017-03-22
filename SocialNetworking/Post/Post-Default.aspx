<%@ Page   Language="C#" MasterPageFile="~/SocialNetworking/Post/Post.master" AutoEventWireup="true" CodeFile="Post-Default.aspx.cs" Inherits="SocialNetworking_Post_Default" %>

<%@ Register Assembly="SnowLabel" Namespace="SnowLabel" TagPrefix="cc1" %>
<%@ Register assembly="SnowWebPageTitleSaver" namespace="SnowWebPageTitleSaver" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="Post-Default.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_Post" runat="Server">
    <div class="cph_Post">
        <asp:DataList ID="dl_RecentPosts" runat="server" DataKeyField="PostID" DataSourceID="sds_RecentPosts">
            <ItemTemplate>
                <asp:HyperLink ID="hp_Title" runat="server" Text='<%# Eval("Title") %>' CssClass="hp_Title" NavigateUrl='<%# Eval("PostID", "~/SocialNetworking/Post/Post-View.aspx?PostID={0}" ) %>' />
                <br />
                <div class="abstractArea">
                    <cc1:SnowAbstractLabel ID="lbl_Abstract" runat="server" Text='<%# Eval("Value") %>' />
                </div>
                <hr />
                <asp:Label ID="timeLabel" runat="server" Text='<%# Eval("time") %>' CssClass="lbl_Time" />
                <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date") %>' CssClass="lbl_Date" />
            </ItemTemplate>
        </asp:DataList>
    </div>
    <asp:SqlDataSource ID="sds_RecentPosts" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT TOP 10 * FROM [Social-Post] WHERE ([username] = @username) ORDER BY [PostID] DESC">
        <SelectParameters>
            <asp:QueryStringParameter Name="username" QueryStringField="Username" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

<asp:Content ID="Content3" runat="server" contentplaceholderid="cph_Banner">
    <asp:Label ID="lbl_Fullname" runat="server"></asp:Label>
</asp:Content>


<asp:Content ID="Content4" runat="server" contentplaceholderid="cph_SideContent1">
        <asp:DataList ID="dl_ExnternalLink" runat="server" DataKeyField="LinkID" DataSourceID="sds_ExternalLinks">
            <ItemTemplate>
                <asp:UpdatePanel ID="up_externalLink" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:UpdateProgress ID="uprog_externalLink" runat="server" DisplayAfter="0">
                            <ProgressTemplate>
                                <div class="uprog_externalLink"></div>
                            </ProgressTemplate>
                        </asp:UpdateProgress>
                        <cc1:WebPageTitleSaver ID="Link" runat="server" URL='<%# Eval("URL") %>' />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="sds_ExternalLinks" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Social-ExternalLink] WHERE ([username] = @username)">
            <SelectParameters>
                <asp:QueryStringParameter Name="username" QueryStringField="username" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
</asp:Content>




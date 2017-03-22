<%@ Page Title="" Language="C#" MasterPageFile="~/SocialNetworking/Post/Post.master" AutoEventWireup="true" CodeFile="Post-View.aspx.cs" Inherits="SocialNetworking_Post_Post_View" %>

<%@ Register Src="~/SocialNetworking/Post/Comment.ascx" TagPrefix="uc1" TagName="Comment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="Post-View.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_Post" runat="Server">
    <asp:HyperLink id="hp_Archive" Text="آرشیو پست ها" runat="server" CssClass="hp_Archive"></asp:HyperLink>
    <div class="cph_Post">
        <asp:Panel ID="p_NoPermission" runat="server" CssClass="p_NoPermission">
            <asp:Label ID="lbl_NoAccessToThisPost" runat="server" Text="شما اجازه دسترسی به این پست را ندارید!"></asp:Label>
        </asp:Panel>
        <asp:Panel ID="P_ReadPost" runat="server" Visible="False" CssClass="P_ReadPost">
            <div class="div_Value">
                <asp:Label ID="lbl_Value" CssClass="lbl_Value" runat="server" />
            </div>
            <asp:Label ID="lbl_Time" runat="server" CssClass="lbl_Time"></asp:Label>
            <asp:Label ID="lbl_Date" runat="server" CssClass="lbl_Date"></asp:Label>
        </asp:Panel>
        <asp:UpdatePanel ID="up_Reputation" runat="server">
            <ContentTemplate>
                <div class="Reputation">
                    <asp:Label ID="lbl_CantVote" runat="server" Text="شما نمیتوانید به پست خود رای بدهید!" CssClass="lbl_CantVote" EnableViewState="False" Visible="False"></asp:Label>
                    <asp:Button ID="btn_Like" runat="server" CssClass="btn_Like" OnClick="btn_Like_Click" Text="دوست دارم" />
                    <asp:Label ID="lbl_Likes" runat="server" CssClass="lbl_Likes"></asp:Label>
                    <asp:Label ID="lbl_Hates" runat="server" CssClass="lbl_Hates"></asp:Label>
                    <asp:Button ID="btn_Hate" runat="server" CssClass="btn_Hate" OnClick="btn_Hate_Click" Text="دوست ندارم" />
                    <asp:Button ID="btn_UnVote" runat="server" OnClick="btn_UnVote_Click" Text="رای اشتباه داده ام!" Visible="False" />
                    <asp:UpdateProgress ID="uprog_Reputation" runat="server" AssociatedUpdatePanelID="up_Reputation" DisplayAfter="0">
                        <ProgressTemplate>
                            <div class="loading1"></div>
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <div class="comment">
        <asp:UpdatePanel ID="up_Comment" runat="server">
            <ContentTemplate>
                <asp:TextBox ID="txt_Comment" runat="server" CssClass="txt_Comment" TextMode="MultiLine"></asp:TextBox>
                <asp:Button ID="btn_SendComment" runat="server" CssClass="btn_SendComment" OnClick="btn_SendComment_Click" Text="ارسال" />
                <div class="dl_commentList">
                    <asp:DataList ID="dl_Comment" runat="server" DataKeyField="CommentID" DataSourceID="sds_comment">
                        <ItemTemplate>
                            <div class="div_CommentText">
                                <uc1:Comment ID="Comment" CommentID='<%# Eval("CommentID").ToString() %>' runat="server"/>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:SqlDataSource ID="sds_comment" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Social-Comment] WHERE ([PostID] = @PostID)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="PostID" QueryStringField="PostID" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                <asp:UpdateProgress ID="uprogr_Comment" runat="server" AssociatedUpdatePanelID="up_Comment" DisplayAfter="0">
                    <ProgressTemplate>
                        <div class="loading1"></div>
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="cph_Banner">
    <asp:Label ID="lbl_Title" runat="server" CssClass="lbl_Title"></asp:Label>
</asp:Content>



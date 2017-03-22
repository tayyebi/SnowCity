<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Comment.ascx.cs" Inherits="SocialNetworking_Post_Comment" %>
<asp:panel id="CommentContainer" runat="server">
    <asp:Label ID="lbl_CommentID" runat="server" CssClass="lbl_CommentID"></asp:Label>
    <asp:Panel ID="p_CommentValue" runat="server" CssClass="commentValue">
        <asp:Label ID="lbl_CommentValue" runat="server" CssClass="lbl_CommentValue"></asp:Label>
    </asp:Panel>
    <asp:Panel ID="p_ManageComment" runat="server" CssClass="p_ManageComment" Visible="False">
        <asp:MultiView ID="mv_Comment" runat="server" ActiveViewIndex="0">
            <asp:View ID="v_Default" runat="server">
                <asp:Button ID="btn_Comment_delete0" runat="server" CssClass="btn_Comment_delete" OnClick="btn_Comment_delete_Click" Text="حذف نظر" ToolTip="حذف نظر" />
                <asp:Button ID="btn_Comment_edit0" runat="server" CssClass="btn_Comment_edit" OnClick="btn_Comment_edit0_Click" Text="ویرایش نظر" ToolTip="ویرایش نظر" />
            </asp:View>
            <asp:View ID="v_Edit" runat="server">
                <asp:Button ID="btn_back" runat="server" OnClick="btn_back_Click" Text="بازگشت" ToolTip="انصراف از ویرایش نظر" />
                <asp:Button ID="btn_edit" runat="server" Text="ویرایش" ToolTip="انصراف از ویرایش نظر" OnClick="btn_edit_Click"/>
                <asp:TextBox ID="txt_EditComment" runat="server" ToolTip="کامنت خود را ویرایش کنید" CssClass="txt_EditComment" TextMode="MultiLine"></asp:TextBox>
            </asp:View>
            <asp:View ID="v_Delete" runat="server">
                <asp:Button ID="btn_back0" runat="server" OnClick="btn_back_Click" Text="بازگشت" ToolTip="انصراف از حذف نظر" />
                <asp:Button ID="btn_delete" runat="server" OnClick="btn_delete_Click" Text="حذف" />
            </asp:View>
        </asp:MultiView>
    </asp:Panel>
</asp:panel>
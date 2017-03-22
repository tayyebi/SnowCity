using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SocialNetworking_Post_Comment : System.Web.UI.UserControl
{
    private string _CommentID;
    public string CommentID
    {
        get
        {
            return _CommentID;
        }
        set
        {
            _CommentID = value;
            //lbl_CommentID.Text = "<div id=" + "\"" + _CommentID + "\"" + ">" + _CommentID + "</div>";
            lbl_CommentID.Text = _CommentID;
            if (Session["username"].ToString() == SocialNetworkingPost.getCommentUsername(lbl_CommentID.Text))
            {
                p_ManageComment.Visible = true;
            }
            lbl_CommentValue.Text = SocialNetworkingPost.getCommentValue(lbl_CommentID.Text);
        }
    }

    protected void btn_Comment_delete_Click(object sender, EventArgs e)
    {
        mv_Comment.ActiveViewIndex = 2;
    }
    protected void btn_Comment_edit0_Click(object sender, EventArgs e)
    {
        txt_EditComment.Text = lbl_CommentValue.Text;
        mv_Comment.ActiveViewIndex = 1;
    }
    protected void btn_back_Click(object sender, EventArgs e)
    {
        mv_Comment.ActiveViewIndex = 0;
    }
    protected void btn_delete_Click(object sender, EventArgs e)
    {
        SocialNetworkingPost.deleteComment(lbl_CommentID.Text);
        CommentContainer.Visible = false;
        mv_Comment.ActiveViewIndex = 0;
    }
    protected void btn_edit_Click(object sender, EventArgs e)
    {
        SocialNetworkingPost.editComment(lbl_CommentID.Text, txt_EditComment.Text);
        mv_Comment.ActiveViewIndex = 0;
        lbl_CommentValue.Text = txt_EditComment.Text;
        txt_EditComment.Text = "";
    }
}
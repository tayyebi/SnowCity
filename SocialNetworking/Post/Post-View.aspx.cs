using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SocialNetworking_Post_Post_View : SocialNetworkingPage
{
    public string PostId;

    public void ViewPostValues()
    {
        lbl_Title.Text = SocialNetworkingPost.GetPostTitle(PostId);
        if (lbl_Title.Text == "404")
        {
            Response.Redirect(socialnetworkingroot + "Post/Post-Default.aspx?username=" + Session["username"].ToString());
        }
        else
        {
            hp_Archive.NavigateUrl = "~/SocialNetworking/Post/Post-Archive.aspx?username=" + SocialNetworkingPost.GetPostUsername(Request.QueryString["PostID"].ToString());
            this.Title = PostId + "[" + lbl_Title.Text + "]";
            lbl_Value.Text = SocialNetworkingPost.GetPostValue(PostId);
            lbl_Date.Text = SocialNetworkingPost.GetPostDate(PostId);
            lbl_Time.Text = SocialNetworkingPost.GetPostTime(PostId);
            P_ReadPost.Visible = true;
            p_NoPermission.Visible = false;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        btn_UnVote.Visible = false;
        btn_Like.Visible = btn_Hate.Visible = true;
        try
        {
            if (SocialNetworkingPost.IsUserVoted(Session["username"].ToString(), Request.QueryString["PostID"].ToString()) == true)
            {
                btn_Like.Visible = btn_Hate.Visible = false;
                btn_UnVote.Visible = true;
            }
        }
        catch
        {
            btn_Like.Visible = btn_Hate.Visible = false;
            btn_UnVote.Visible = false;
        }
        if (Request.QueryString["PostID"] == null)
            Response.Redirect(socialnetworkingroot + "Login.aspx");
        if (Request.QueryString["PostID"] == "")
            Response.Redirect(socialnetworkingroot + "Login.aspx");
        try
        {
            lbl_Likes.Text = SocialNetworkingPost.GetPostLikes(Request.QueryString["PostID"].ToString());
            lbl_Hates.Text = SocialNetworkingPost.GetPostHates(Request.QueryString["PostID"].ToString());
        }
        catch
        {
            Response.Redirect(socialnetworkingroot + "Login.aspx");
        }
        try
        {
            PostId = Request.QueryString["PostID"].ToString();
        }
        catch
        {
            Response.Redirect(SocialNetworkingPage.socialnetworkingroot + "Post/Post-Default.aspx?username="+Session["username"].ToString());
        }
        try
        {
            SocialNetworkingPost.GetUserPermission(Session["username"].ToString(), SocialNetworkingPost.GetPostUsername(PostId.ToString()));
        }
        catch
        {
            if (SocialNetworkingPost.PostPermission == "all")
            {
                ViewPostValues();
            }
        }
        SocialNetworkingPost.GetPostPermission(PostId);
        if (SocialNetworkingPost.PostPermission == SocialNetworkingPost.UsernamePermission)
        {
            ViewPostValues();
        }
        else if (SocialNetworkingPost.PostPermission == "all")
        {
            ViewPostValues();
        }
        else if (Session["username"].ToString() == SocialNetworkingPost.GetPostUsername(PostId.ToString()))
        {
            ViewPostValues();
        }
        else
        {
            P_ReadPost.Visible = false;
            btn_Hate.Visible = btn_Like.Visible = btn_UnVote.Visible = false;
            p_NoPermission.Visible = true;
        }
    }

    protected void btn_Hate_Click(object sender, EventArgs e)
    {
        if (Session["username"].ToString() == SocialNetworkingPost.GetPostUsername(Request.QueryString["PostID"].ToString()))
        {
            lbl_CantVote.Visible = true;
            btn_Like.Visible = btn_Hate.Visible = false;
            btn_UnVote.Visible = !true;
        }
        else if (Session["username"].ToString() != SocialNetworkingPost.GetPostUsername(Request.QueryString["PostID"].ToString()))
        {
            try
            {
                SocialNetworkingPost.SetHate(Session["username"].ToString(), SocialNetworkingPost.GetPostUsername(Request.QueryString["PostID"]), Request.QueryString["PostID"]);
                btn_Like.Visible = btn_Hate.Visible = false;
                btn_UnVote.Visible = true;
            }
            catch { }
        }
        lbl_Hates.Text = SocialNetworkingPost.GetPostHates(Request.QueryString["PostID"].ToString());
    }
    protected void btn_Like_Click(object sender, EventArgs e)
    {
        if (Session["username"].ToString() == SocialNetworkingPost.GetPostUsername(Request.QueryString["PostID"].ToString()))
        {
            lbl_CantVote.Visible = true;
            btn_Like.Visible = btn_Hate.Visible = false;
            btn_UnVote.Visible = !true;
        }
        else if (Session["username"].ToString() != SocialNetworkingPost.GetPostUsername(Request.QueryString["PostID"].ToString()))
        {

            try
            {
                SocialNetworkingPost.SetLike(Session["username"].ToString(), SocialNetworkingPost.GetPostUsername(Request.QueryString["PostID"]), Request.QueryString["PostID"]);
                btn_Like.Visible = btn_Hate.Visible = false;
                btn_UnVote.Visible = true;
            }
            catch { }
        }
        lbl_Likes.Text = SocialNetworkingPost.GetPostLikes(Request.QueryString["PostID"].ToString());
    }
    protected void btn_UnVote_Click(object sender, EventArgs e)
    {
        try
        {
            SocialNetworkingPost.UnVote(Session["username"].ToString(), Request.QueryString["PostID"].ToString());
            btn_Like.Visible = btn_Hate.Visible = true;
            btn_UnVote.Visible = false;
        }
        catch { }
        lbl_Hates.Text = SocialNetworkingPost.GetPostHates(Request.QueryString["PostID"].ToString());
        lbl_Likes.Text = SocialNetworkingPost.GetPostLikes(Request.QueryString["PostID"].ToString());
    }
    protected void btn_SendComment_Click(object sender, EventArgs e)
    {
        btn_SendComment.Enabled = false;
        txt_Comment.Enabled = false;
        SocialNetworkingPost.setComment(Session["username"].ToString(), Request.QueryString["PostID"].ToString(), txt_Comment.Text.ToString());
        dl_Comment.DataBind();
        txt_Comment.Text = string.Empty;
        btn_SendComment.Enabled = true;
        txt_Comment.Enabled = true;
    }
}
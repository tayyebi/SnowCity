using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SocialNetworking_CMS_CMS_Comment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void gv_Default_SelectedIndexChanged(object sender, EventArgs e)
    {
        string CommentID = gv_Default.SelectedRow.Cells[1].Text.ToString();
        lbl_AnswersCount.Text = SocialNetworkingPost.countCommentAnswers(CommentID);
        mv_Answer.Visible = true;
    }
    protected void btn_Answer_Click(object sender, EventArgs e)
    {

    }
}
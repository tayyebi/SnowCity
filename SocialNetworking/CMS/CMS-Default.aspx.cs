using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SocialNetworking_CMS_Default : SocialNetworkingPage
{
    protected void Page_InitComplete(object sender, EventArgs e)
    {
        Page.Title = Session["username"].ToString();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        lbl_like_rate.Text = SocialNetworkingPage.GetLike(Session["username"].ToString());
        lbl_hate_rate.Text = SocialNetworkingPage.GetHate(Session["username"].ToString());
    }
}
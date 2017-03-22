using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SocialNetworking_CMS_CMS_ExternalLink : SocialNetworkingPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string example=SocialNetworkingPage.PDP+"Login";
        txt_insert.ToolTip = "(e.g->"+example+")";
    }

    protected void btn_Insert_Click(object sender, EventArgs e)
    {
        SocialNetworkingExternalLink.InsertExternalLink(Session["username"].ToString(), txt_insert.Text);
        txt_insert.Text = string.Empty;
        gv_Default.DataBind();
    }
}
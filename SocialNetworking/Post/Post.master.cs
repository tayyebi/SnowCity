using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SocialNetworking_Post_Post : System.Web.UI.MasterPage
{
    protected void ibtn_CMS_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect(SocialNetworkingPage.socialnetworkingroot+"CMS/CMS-Default.aspx");
    }
    protected void Page_PreRender(object sender, EventArgs e)
    {
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SocialNetworking_Post_Post_Archive : SocialNetworkingPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (SocialNetworkingPage.IsUsernameExist(Request.QueryString["username"].ToString()) == true)
            {
                this.Title = lbl_Fullname.Text = SocialNetworkingPage.GetUserFullname(Request.QueryString["username"].ToString());
            }
            else
            {
                Response.Redirect(socialnetworkingroot + "Post/Post-Default.aspx" + "?username=" + Session["username"].ToString());
            }
        }
        catch
        {
            Response.Redirect(socialnetworkingroot + "Post/Post-Default.aspx" + "?username=" + Session["username"].ToString());
        }
    }
}
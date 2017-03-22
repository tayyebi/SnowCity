using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SocialNetworking_CMS_CMS :System.Web.UI.MasterPage
{
    protected void Page_Init(object sender, EventArgs e)
    {
        lbl_pagetitle.Text = Page.Title.ToString();

    }
    protected void Page_Load(object sender, EventArgs e)
    {
        //try
        //{
            lbl_fullname.Text = SocialNetworkingPage.GetUserFullname(Session["username"].ToString());
            if (SocialNetworkingPage.GetUserGender(Session["username"].ToString()) == "male")
                lbl_gender.Text = "آقای";
            else if (SocialNetworkingPage.GetUserGender(Session["username"].ToString()) == "female")
                lbl_gender.Text = "خانم";
        //}
        //catch
        //{
        //    Response.Redirect(SocialNetworkingPage.socialnetworkingroot + "Login.aspx");
        //}
    }
    protected void Page_PreRender(object sender, EventArgs e)
    {
    }
    protected void ibtn_ViewPost_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect(SocialNetworkingPage.socialnetworkingroot+"Post/Post-Default.aspx"+"?"+"username="+Session["username"].ToString());
    }
}

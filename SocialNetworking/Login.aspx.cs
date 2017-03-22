using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SocialNetworking_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] != null)
        {
            if (Session["username"] != "")
            {
                if (SocialNetworkingPage.GetUserLoggedIn(Session["Username"].ToString()) == true)
                {
                    if (Request.QueryString["Redirect"] != null)
                    {
                        Response.Redirect(Request.QueryString["Redirect"].ToString());
                    }
                    else
                        Response.Redirect(SocialNetworkingPage.socialnetworkingroot + "Default.aspx");
                }
            }
        }
    }
    protected void btn_Login_Click(object sender, EventArgs e)
    {
        lbl_loginerror.Visible = false;
        SocialNetworkingPage.login(txt_Username.Text, txt_Password.Text);
        if (SocialNetworkingPage.GetUserLoggedIn(txt_Username.Text) == true)
        {
            Session["username"] = txt_Username.Text;
            if (Request.QueryString["Redirect"] != null)
            {
                Response.Redirect(Request.QueryString["Redirect"].ToString());
            }
            else{
                Response.Redirect(SocialNetworkingPage.socialnetworkingroot + "Default.aspx");
            }
        }
        lbl_loginerror.Visible = true;
    }
}
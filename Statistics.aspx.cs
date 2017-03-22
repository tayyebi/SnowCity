using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Online :WebsitePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lbl_OnlineUsers.Text = Application["OnlineUsers"].ToString();
        //lbl_OnlineUsers.Text = WebsitePage.WebsiteRoot(true, true);
    }
}
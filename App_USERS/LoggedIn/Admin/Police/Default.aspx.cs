using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class USERS_LoggedIn_Admin_Police_Default :WebsitePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void News_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/App_USERS/LoggedIn/Admin/Police/News/Default.aspx");
    }
    protected void btn_BackToAdminsDefaultPage_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/App_USERS/LoggedIn/Default.aspx");
    }
    protected void ChatRoom_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/App_USERS/LoggedIn/Admin/Police/ChatRoom/Default.aspx");
    }
}
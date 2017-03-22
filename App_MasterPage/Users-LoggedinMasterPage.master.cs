using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class App_MasterPage_Users_LoggedInMasterPage : System.Web.UI.MasterPage
{
    protected void Page_Prerender(object sender, EventArgs e)
    {
        Page.Title = LoginSecurity.PageTitle;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
    }
}

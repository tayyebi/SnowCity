using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class App_UserControl_Users_UserControls_UserBanner : System.Web.UI.UserControl
{
    protected void Page_Prerender(object sender, EventArgs e)
    {
        try
        {
            if (Session["Fullname"] != null)
                FullnameLable.Text = Session["Fullname"].ToString();
            if (Session["Type"] != null)
                TypeLable.Text = Session["Type"].ToString();
        }
        catch { }
    }
}
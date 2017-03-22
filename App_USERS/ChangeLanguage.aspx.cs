using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class USERS_ChangeLanguage : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = "انتخاب زبان * Choose Language";
        if (Session["Language"] != null)
        {
            this.Title = Session["Language"].ToString();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Session["Language"] = "fa-IR";
        Response.Redirect("LoggedIn/Default.aspx");
    }
    protected void EnglishLanguageButton_Click(object sender, EventArgs e)
    {
        Session["Language"] = "en-US";
        Response.Redirect("LoggedIn/Default.aspx");
    }
}
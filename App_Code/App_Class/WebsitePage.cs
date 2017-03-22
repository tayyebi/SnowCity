using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Routing;
using System.Web.UI;
public class WebsitePage:System.Web.UI.Page
{
    static public string WebsiteRoot(bool Port, bool ToUpper)
    {
        string _porotocol = HttpContext.Current.Request.Url.Scheme.ToString() + "://";
        string _host = HttpContext.Current.Request.Url.Host.ToString();
        string _port = string.Empty;
        if (Port == true)
        {
            _port = ":" + HttpContext.Current.Request.Url.Port.ToString();
        }

        string _return = _porotocol + _host + _port;
        if (ToUpper == true)
        {
            _return = _return.ToUpper();
        }

        return _return;
    }
    public void redirecttonewsdefault()
    {
        Response.Redirect("~/Default-News.aspx");
    }
    public void redirecttoTVdefault()
    {
        Response.Redirect("~/Default-TV.aspx");
    }
    public void redirecttoacademydefault()
    {
        Response.Redirect("~/Default-Academy.aspx");
    }
    protected override void InitializeCulture()
    {
        base.InitializeCulture();

        if (Session["Language"] != null)
        {
            Page.Culture = Session["Language"].ToString();
            Page.UICulture = Session["Language"].ToString();
        }
        else
        {
            Session["Language"] = "fa-IR";
            Page.Culture = Session["Language"].ToString();
            Page.UICulture = Session["Language"].ToString();
        }

    }
    protected void Page_Init(object sender, EventArgs e)
    {
        Control QrPage = Page.LoadControl("~/App_UserControl/Qr/QrPage.ascx");
        QrPage.ID = "SnowCode";
        Page.Controls.Add(QrPage);
    }
}
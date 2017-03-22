using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Net;

public partial class Redirect : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            string porotocol = RouteData.Values["porotocol"].ToString() + "://";
            string host = RouteData.Values["host"].ToString();
            string port = ":" + RouteData.Values["port"].ToString();
            string page = RouteData.Values["page"].ToString();
            string format = "." + RouteData.Values["format"].ToString();
            string query = "?" + Request.Url.Query.ToString();

            if (RouteData.Values["page"].ToString() == null || RouteData.Values["page"].ToString() == "-") { page = format = null; }
            if (RouteData.Values["format"].ToString() == null || RouteData.Values["format"].ToString() == "-") { format = null; }
            if (Request.Url.Query == null) { query = null; }

            string adress = porotocol + host + port + "/" + page + format + query;

            WebClient webclient_ = new WebClient();
            string source = webclient_.DownloadString(HttpUtility.UrlDecode(adress));

            Response.Write(source);
        }
        catch {
            Response.Redirect("~/Error");
        }
    }
}
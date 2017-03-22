using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SnowWebPageTitleSaver
{
    [DefaultProperty("Text")]
    [ToolboxData("<{0}:WebPageTitleSaver runat=server></{0}:WebPageTitleSaver>")]
    public class WebPageTitleSaver : WebControl
    {
        [Bindable(true)]
        [Category("TitleSaver")]
        [DefaultValue("")]
        [Localizable(true)]
        public string URL
        {
            get
            {
                String s = (String)ViewState["URL"];
                return ((s == null) ? "[" + this.ID + "]" : s);
            }

            set
            {
                ViewState["URL"] = value;
            }
        }

        protected override void RenderContents(HtmlTextWriter output)
        {
            try
            {
                using (WebClient wc = new WebClient())
                {
                    string final = "Error 404 - No title found!";
                    string WebPageSource = wc.DownloadString(URL);
                    MatchCollection col = Regex.Matches(WebPageSource, @"<title[^>]*>(.*?)</title>");
                    foreach (Match match in col)
                    {
                        final = match.Value;
                    }
                    final = Regex.Replace(final, @"<[^>]*>", " " + "");
                    if (final == "Error 404 - No title found!")
                    {
                        final = URL.ToString();
                    }
                    output.Write("<a href=\"" + URL + "\">" + final + "</a>");
                }
            }
            catch {
                output.Write("<a href=\"" + URL + "\">" + URL + "</a>");
            }
        }
    }
}
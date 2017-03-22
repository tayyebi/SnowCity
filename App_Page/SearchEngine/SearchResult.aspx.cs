using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class App_Page_SearchEngine_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string searchvalue = HttpUtility.HtmlEncode(Request.QueryString["Search"].ToString());
        this.Title = searchvalue;

        string[] words1 = searchvalue.Split(' ');
        string final = "";
        foreach (string word1 in words1)
        {
            final += word1 + "+";
        }

        string[] words2 = final.Split('+');
        final = "";
        foreach (string word2 in words2)
        {
            final += word2 + "*";
        }
        Response.Write(final);
    }
}
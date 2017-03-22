using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class Default_SearchEngine : WebsitePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btn_Search_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/App_Page/SearchEngine/SearchResult.aspx" + "?Search=" + txt_SearchValue.Text.ToString());
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class App_Page_Academy_Archive :WebsitePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void DefaultGridView_SelectedIndexChanged(object sender, EventArgs e)
    {
        Response.Redirect("~/App_Page/Academy/Article.aspx?ArticleID="+DefaultGridView.SelectedRow.Cells[1].Text.ToString());
    }
}
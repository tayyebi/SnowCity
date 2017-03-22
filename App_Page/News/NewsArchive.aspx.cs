using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

public partial class App_Page_News_NewsArchive : WebsitePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void DefaultGridView_SelectedIndexChanged(object sender, EventArgs e)
    {
        Response.Redirect("~/App_Page/News/ShowNewsByID.aspx?ID=" + DefaultGridView.SelectedRow.Cells[1].Text.ToString());
    }
    protected void ReadButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/App_Page/News/ShowNewsByID.aspx?ID=" + DefaultGridView.SelectedRow.Cells[1].Text.ToString());
    }
}
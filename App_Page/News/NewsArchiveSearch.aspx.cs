using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class App_Page_News_NewsArchiveSearch : WebsitePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void SearchButton_Click(object sender, EventArgs e)
    {
        if (SearchDropDownList.SelectedItem.Value == "Title")
        {
            TitleGridView.DataBind();
            TitlePanel.Visible = true;
            AbstractPanel.Visible = false;
            ValuePanel.Visible = false;
        }
        if (SearchDropDownList.SelectedItem.Value == "Abstract")
        {
            AbstractGridview.DataBind();
            TitlePanel.Visible = false;
            AbstractPanel.Visible = true;
            ValuePanel.Visible = false;
        }
        if (SearchDropDownList.SelectedItem.Value == "Value")
        {
            ValueGridView.DataBind();
            TitlePanel.Visible = false;
            AbstractPanel.Visible = false;
            ValuePanel.Visible = true;
        }
    }
    protected void SearchGridView_SelectedIndexChanged(object sender, EventArgs e)
    {
        Response.Redirect("~/App_Page/News/ShowNewsByID.aspx?ID=" + (sender as GridView).SelectedRow.Cells[1].Text.ToString());
    }
}
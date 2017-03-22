using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class App_MasterPage_ErrorMasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void send_button_Click(object sender, EventArgs e)
    {
        if (value_textbox.Text != "")
        {
            Problem.sendproblem(Page.Title.ToString(), Request.Url.AbsoluteUri.ToString(), value_textbox.Text.ToString());
        }
    }
}

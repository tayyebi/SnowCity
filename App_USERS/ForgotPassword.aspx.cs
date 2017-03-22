using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class USERS_ForgotPassword :WebsitePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Send_Click(object sender, EventArgs e)
    {
        try
        {
            string adress = Request.Url.AbsoluteUri.ToString().ToUpper();
            Problem.sendproblem("ForgotPassword", adress, ValueTextBox.Text.ToString());
            ValueTextBox.Text = string.Empty;
            (sender as Button).Visible = false;
            MessageSend.Visible = true;
        }
        catch { }
    }
}
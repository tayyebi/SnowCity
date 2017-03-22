using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class App_Page_ChatRoom_Chat :WebsitePage
{

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btn_Send_Click(object sender, EventArgs e)
    {
        PoliceDataSource.Insert();
        txt_Value.Text = string.Empty;
        txt_Value.Focus();
    }
    protected void PublicTimer_Tick(object sender, EventArgs e)
    {
        PublicChatDataList.DataBind();
    }
}
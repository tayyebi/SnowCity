using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class USERS_LoggedIn_Default : WebsitePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Enter_Click(object sender, EventArgs e)
    {
        if (Session["MainType"].ToString() == "Jornal")
            Response.Redirect("~/App_USERS/LoggedIn/Admin/News/Default.aspx");
        else if (Session["MainType"].ToString() == "DatabaseManager")
            Response.Redirect("~/App_USERS/LoggedIn/Admin/Database/Default.aspx");
        else if (Session["MainType"].ToString() != "Jornal" & Session["MainType"].ToString() != "DatabaseManager")
        {
            Response.Redirect("~/App_USERS/LoggedIn/Admin/" + Session["MainType"].ToString() + "/Default.aspx");
        }
            
    }
}
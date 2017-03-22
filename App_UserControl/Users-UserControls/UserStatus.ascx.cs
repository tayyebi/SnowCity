using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
public partial class App_UserControl_Users_UserControls_UserStatus : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["LastLoginDate"] != null)
            {
                LastLoginDateLable.Text = Session["LastLoginDate"].ToString();
                AdminsNews.NavigateUrl = "~/App_USERS/LoggedIn/AdminsNews.aspx";
                AdminsConverstation.NavigateUrl = "~/App_USERS/LoggedIn/Converstation.aspx";
            }
        }
        catch { }
    }
    protected void LogoutButton_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con4 = new SqlConnection();
            con4.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con4.Open();
            SqlCommand com4 = new SqlCommand();
            com4.Connection = con4;
            com4.CommandText = "UPDATE [Users-Users] SET IsOnline = @IsOnline WHERE (UserID = @UserID)";
            com4.Parameters.AddWithValue("UserID", Session["UserID"].ToString());
            com4.Parameters.AddWithValue("IsOnline", "False");//FALSE means that user didnt log out normally but False shows that user logged out normaly
            com4.ExecuteNonQuery();
            Response.Cookies["LoginCookie"].Expires = DateTime.Now.AddDays(-1);
        }
        catch { }
        Response.Redirect("~/App_USERS/Login.aspx");
    }
    protected void ChangePassword_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/App_USERS/LoggedIn/EditProfile.aspx");
    }
    protected void DefaultPage_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/App_USERS/LoggedIn/Default.aspx");
    }
}
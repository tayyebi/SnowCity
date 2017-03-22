using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;


public partial class USERS_LoggedIn_EditProfile :WebsitePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Cancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/App_USERS/LoggedIn/Default.aspx");
    }
    protected void Edit_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con.Open();
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "SELECT UserID FROM [Users-Users] WHERE UserID=@UserID AND Password=@Password AND Username=@Username ";
            com.Parameters.AddWithValue("UserID", Session["UserID"].ToString());
            com.Parameters.AddWithValue("Password", txt_OldPassword.Text);
            com.Parameters.AddWithValue("Username", Session["Username"].ToString());
            SqlDataReader data = com.ExecuteReader();
            if (data.Read())
            {
                PasswordSqlDataSource.Update();
                Response.Redirect("~/App_USERS/LoggedIn/Default.aspx");
            }
        }
        catch
        {
        }
    }
}
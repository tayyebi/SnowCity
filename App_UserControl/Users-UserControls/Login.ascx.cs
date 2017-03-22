using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.WebControls;


public partial class App_UserControl_Login : System.Web.UI.UserControl
{
    string Fullname;
    string Username;
    string UserID;
    string Password;
    string Firstname;
    string Lastname;
    string ImageURL;
    string LastLoginDate;
    string IsOnline;
    string Type;
    string RandomNumber;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Random RandomNumberINT = new Random();
            RandomNumberTextBox.Text = RandomNumberINT.Next().ToString();
        }
    }
    protected void Authenticate_Click(object sender, EventArgs e)
    {
        LoginError.Visible = false;
        LoginBadError.Visible = false;
        IsProblemFromDatabase.Visible = false;
        try
        {
            LoginBadError.Visible = IsProblemFromDatabase.Visible = LoginError.Visible = false;
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlCommand com = new SqlCommand();
            con.Open();
            com.Connection = con;
            com.CommandText = "SELECT UserID FROM [Users-Users] WHERE (Password=@Password) AND (Username=@Username) ";
            com.Parameters.AddWithValue("Password", PasswordTextBox.Text);
            com.Parameters.AddWithValue("Username", UsernameTextBox.Text);
            SqlDataReader data = com.ExecuteReader();
            if (data.Read())
            {
                passwordhiddenfield.Value = PasswordTextBox.Text;
                usernamehiddenfield.Value = UsernameTextBox.Text;
                LoginMultiView.ActiveViewIndex = 1;
            }
            else
            {
                LoginError.Visible = true;
                IsProblemFromDatabase.Visible = true;
            }
        }
        catch
        {
            LoginBadError.Visible = true;
            IsProblemFromDatabase.Visible = true;
        }
    }

    protected void LoginButton_Click(object sender, EventArgs e)
    {
        try
        {
            LoginBadError.Visible = IsProblemFromDatabase.Visible = LoginError.Visible = false;
            LoginButton.Visible = false;
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlCommand com = new SqlCommand();
            con.Open();
            com.Connection = con;
            com.CommandText = "SELECT * FROM [Users-Users] WHERE (Password=@Password) AND (Username=@Username) AND (UserID=@UserID)";
            com.Parameters.AddWithValue("UserID", UserIdDropDownList.SelectedValue.ToString());
            com.Parameters.AddWithValue("Password", passwordhiddenfield.Value.ToString());
            com.Parameters.AddWithValue("Username", usernamehiddenfield.Value.ToString());
            SqlDataReader data = com.ExecuteReader();
            if (data.Read())
            {
                Type = data["Type"].ToString();
                Fullname = data["Fullname"].ToString();
                Username = data["Username"].ToString();
                UserID = data["UserID"].ToString();
                Password = data["Password"].ToString();
                Firstname = data["Firstname"].ToString();
                Lastname = data["Lastname"].ToString();
                LoginBadError.Visible = IsProblemFromDatabase.Visible = LoginError.Visible = false;
                LoginDateHiddenField.Value = DateTime.Now.ToString();
                IsOnlineHiddenFiled.Value = "True";
                LoginDateHiddenFiled.Value = DateTime.Now.ToString();
                LastLoginDate = LoginDateHiddenFiled.Value.ToString();
                IsOnline = IsOnlineHiddenFiled.Value.ToString();
                RandomNumber = RandomNumberTextBox.Text;
                LoginDateSqlDataSource.Update();
                LoginDatesSqlDataSource.Insert();
                string MainType = UserIdDropDownList.SelectedItem.Text;
                HttpCookie loginCookie = new HttpCookie("LoginCookie");
                loginCookie.Expires = DateTime.Now.AddHours(1);
                loginCookie.Values.Add("RandomNumber", RandomNumber);
                loginCookie.Values.Add("Fullname", Fullname);
                loginCookie.Values.Add("Username", Username);
                loginCookie.Values.Add("UserID", UserID);
                loginCookie.Values.Add("Firstname", Firstname);
                loginCookie.Values.Add("Lastname", Lastname);
                loginCookie.Values.Add("MainType", MainType);
                loginCookie.Values.Add("LastLoginDate", LastLoginDate);
                loginCookie.Values.Add("IsOnline", IsOnline);
                loginCookie.Values.Add("Type", Type);
                Response.Cookies.Add(loginCookie);
                Session["RandomNumber"] = RandomNumber;
                Session["Fullname"] = Fullname;
                Session["Username"] = Username;
                Session["UserID"] = UserID;
                Session["Firstname"] = Firstname;
                Session["Lastname"] = Lastname;
                Session["MainType"] = MainType;
                Session["Type"] = Type;
                Session["LastLoginDate"] = LastLoginDate;
                Session["IsOnline"] = IsOnline;
                Session["Password"] = Password;
                LoginSecurity.RandomNumber = RandomNumber;
                LoginSecurity.Fullname = Fullname;
                LoginSecurity.username = Username;
                LoginSecurity.UserID = UserID;
                LoginSecurity.Firstname = Firstname;
                LoginSecurity.Lastname = Lastname;
                LoginSecurity.MainType = MainType;
                LoginSecurity.ImageURL = ImageURL;
                LoginSecurity.LastLoginDate = LastLoginDate;
                LoginSecurity.IsOnline = IsOnline;
                LoginSecurity.Password = Password;
                LoginSecurity.Type = Type;
                Response.Redirect("~/App_USERS/LoggedIn/Default.aspx");
            }
            else
            {
                LoginMultiView.ActiveViewIndex = 0;
            }
        }
        catch
        {
            LoginMultiView.ActiveViewIndex = 0;
            LoginBadError.Visible = true;
        }
    }
}
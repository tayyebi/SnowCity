using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.HtmlControls;
using System.Web.Configuration;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
public class SocialNetworkingPage:System.Web.UI.Page
{
    #region properties
    static public string PDP = HttpContext.Current.Request.Url.Scheme+"://" + HttpContext.Current.Request.Url.Host.ToString().ToUpper() +":"+ HttpContext.Current.Request.Url.Port.ToString() + "/";
    static public string socialnetworkingroot = HttpContext.Current.Request.Url.Scheme + "://" + HttpContext.Current.Request.Url.Host.ToString().ToUpper() + ":" + HttpContext.Current.Request.Url.Port.ToString() + "/SocialNetworking/";
    #endregion
    #region page init
    protected void Page_Init(object sender, EventArgs e)
    {
        //security
        if (Session["username"] == null)
        {
            Response.Redirect(socialnetworkingroot + "Login.aspx?Redirect=" + PDP + HttpContext.Current.Request.Url.AbsolutePath + Request.Url.Query.ToString());
        }
        else if (Session["username"] == "")
        {
            Response.Redirect(socialnetworkingroot + "Login.aspx?Redirect=" + PDP + HttpContext.Current.Request.Url.AbsolutePath + Request.Url.Query.ToString());
        }
        HtmlLink css = new HtmlLink();
        css.Href = PDP+"SocialNetworking/All.css";
        css.Attributes["rel"] = "stylesheet";
        css.Attributes["type"] = "text/css";
        //css.Attributes["media"] = "all";
        Page.Header.Controls.Add(css);
    }
    #endregion
    #region page load
    protected void Page_PreLoad(object sender, EventArgs e)
    {
        if (Session["username"] == null)
            Response.Redirect(socialnetworkingroot + "Login.aspx");
        else if (Session["username"] == "")
            Response.Redirect(socialnetworkingroot + "Login.aspx");
        if (Session["username"] == null)
            Response.Redirect(socialnetworkingroot + "Login.aspx");
    }
    #endregion
    #region login
    static public void login(string username, string password)
    {
        try
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlCommand com = new SqlCommand();
            con.Open();
            com.Connection = con;
            com.CommandText = "SELECT * FROM [Social-User] WHERE (username=@username) ";
            com.Parameters.AddWithValue("username", username);
            SqlDataReader data = com.ExecuteReader();
            if (data.Read())
            {
                if (SocialNetworkingHashCode.comparehashvalues(password, data["password"].ToString()) == true)
                {
                    SqlConnection con2 = new SqlConnection();
                    con2.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                    con2.Open();
                    SqlCommand com2 = new SqlCommand();
                    com2.Connection = con2;
                    com2.CommandText = "UPDATE [Social-User] SET numberoflogins=@numberoflogins+1, loggedIn=@loggedIn WHERE (username=@username)";
                    com2.Parameters.AddWithValue("username", data["username"]);
                    com2.Parameters.AddWithValue("numberoflogins", data["numberoflogins"].ToString());
                    com2.Parameters.AddWithValue("loggedIn", "true");
                    com2.ExecuteNonQuery();
                    con2.Close();
                }
            }
        }
        catch
        {

        }
    }
    #endregion
    #region check username
    static public bool IsUsernameExist(string username)
    {
        bool output = false;
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlCommand com = new SqlCommand();
        con.Open();
        com.Connection = con;
        com.CommandText = "SELECT username FROM [Social-User] WHERE (username=@username) ";
        com.Parameters.AddWithValue("username", username);
        SqlDataReader data = com.ExecuteReader();
        if (data.Read())
        {
            output = true;
        }
        else
        {
            output = false;
        }
        return output;
    }
    #endregion
    #region check email
    static public bool isEmailExist = false;
    static public void checkEmail(string email)
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlCommand com = new SqlCommand();
        con.Open();
        com.Connection = con;
        com.CommandText = "SELECT * FROM [Social-User] WHERE (email=@email) ";
        com.Parameters.AddWithValue("email", email);
        SqlDataReader data = com.ExecuteReader();
        if (data.Read())
            isEmailExist = true;
        else if (!data.Read())
            isEmailExist = false;

    }
    #endregion
    #region check sms
    static public bool isSMSExist = false;
    static public void checkSMS(string sms)
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlCommand com = new SqlCommand();
        con.Open();
        com.Connection = con;
        com.CommandText = "SELECT * FROM [Social-User] WHERE (phonenumber=@sms) ";
        com.Parameters.AddWithValue("sms",sms);
        SqlDataReader data = com.ExecuteReader();
        if (data.Read())
            isSMSExist = true;
        else if (!data.Read())
            isSMSExist = false;

    }
    #endregion
    #region register new user
    static public void register(string name, string lastname, string gender, string email, string password, string username, string phonenumber)
    {
        try
        {
            SqlConnection con2 = new SqlConnection();
            con2.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlCommand com2 = new SqlCommand();
            con2.Open();
            com2.Connection = con2;
            com2.CommandText = "SELECT * FROM [Social-User] WHERE (username=@username) ";
            com2.Parameters.AddWithValue("username", username);
            SqlDataReader data2 = com2.ExecuteReader();
            if (data2.Read())
            {
            }
            else if (!data2.Read())
            {
                int numberoflogins = 0;
                string fullname = name + " " + lastname;
                SqlConnection con = new SqlConnection();
                con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                con.Open();
                SqlCommand com = new SqlCommand();
                com.Connection = con;
                com.CommandText = "INSERT INTO [Social-User] (name,lastname,numberoflogins,email,fullname,password,gender,username,register,phonenumber) values (@name,@Lastname,@numberoflogins,@email,@fullname,@password,@gender,@Username,@register,@phonenumber)";
                com.Parameters.AddWithValue("name", name);
                com.Parameters.AddWithValue("lastname", lastname);
                com.Parameters.AddWithValue("numberoflogins", numberoflogins);
                com.Parameters.AddWithValue("email", email);
                com.Parameters.AddWithValue("fullname", fullname);
                com.Parameters.AddWithValue("password", password);
                com.Parameters.AddWithValue("gender", gender);
                com.Parameters.AddWithValue("Username", username);
                com.Parameters.AddWithValue("register", DateTime.Now);
                com.Parameters.AddWithValue("phonenumber", phonenumber);
                com.ExecuteNonQuery();
                con.Close();
            }
        }
        catch { }
    }
    #endregion
    #region getuserinformation
    static public string GetUserPhoneNumber(string username)
    {
        string output;
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlCommand com = new SqlCommand();
        con.Open();
        com.Connection = con;
        com.CommandText = "SELECT phonenumber FROM [Social-User] WHERE (username=@username)";
        com.Parameters.AddWithValue("username", username);
        SqlDataReader data = com.ExecuteReader();
        if (data.Read())
        {
            output = data["phonenumber"].ToString();
        }
        else
        {
            output = "404";
        }
        return output;
    }
    static public string GetUserRegisterDate(string username)
    {
        string output;
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlCommand com = new SqlCommand();
        con.Open();
        com.Connection = con;
        com.CommandText = "SELECT registerdate FROM [Social-User] WHERE (username=@username)";
        com.Parameters.AddWithValue("username", username);
        SqlDataReader data = com.ExecuteReader();
        if (data.Read())
        {
            output = data["registerdate"].ToString();
        }
        else
        {
            output = "404";
        }
        return output;
    }
    static public string GetUserNumberOfLogins(string username)
    {
        string output;
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlCommand com = new SqlCommand();
        con.Open();
        com.Connection = con;
        com.CommandText = "SELECT numberoflogins FROM [Social-User] WHERE (username=@username)";
        com.Parameters.AddWithValue("username", username);
        SqlDataReader data = com.ExecuteReader();
        if (data.Read())
        {
            output = data["numberoflogins"].ToString();
        }
        else
        {
            output = "404";
        }
        return output;
    }
    static public string GetUserEmail(string username)
    {
        string output;
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlCommand com = new SqlCommand();
        con.Open();
        com.Connection = con;
        com.CommandText = "SELECT email FROM [Social-User] WHERE (username=@username)";
        com.Parameters.AddWithValue("username", username);
        SqlDataReader data = com.ExecuteReader();
        if (data.Read())
        {
            output = data["email"].ToString();
        }
        else
        {
            output = "404";
        }
        return output;
    }

    static public bool GetUserLoggedIn(string username)
    {
        string output;
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlCommand com = new SqlCommand();
        con.Open();
        com.Connection = con;
        com.CommandText = "SELECT loggedIn FROM [Social-User] WHERE (username=@username)";
        com.Parameters.AddWithValue("username", username);
        SqlDataReader data = com.ExecuteReader();
        if (data.Read())
        {
            output = data["loggedIn"].ToString();
        }
        else
        {
            output = "404";
        }
        if (output == "true")
            return true;
        else
            return false;
    }
    static public string GetUserLastname(string username)
    {
        string output;
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlCommand com = new SqlCommand();
        con.Open();
        com.Connection = con;
        com.CommandText = "SELECT lastname FROM [Social-User] WHERE (username=@username)";
        com.Parameters.AddWithValue("username", username);
        SqlDataReader data = com.ExecuteReader();
        if (data.Read())
        {
            output = data["lastname"].ToString();
        }
        else
        {
            output = "404";
        }
        return output;
    }
    static public string GetUserGender(string username)
    {
        string output;
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlCommand com = new SqlCommand();
        con.Open();
        com.Connection = con;
        com.CommandText = "SELECT gender FROM [Social-User] WHERE (username=@username)";
        com.Parameters.AddWithValue("username", username);
        SqlDataReader data = com.ExecuteReader();
        if (data.Read())
        {
            output = data["gender"].ToString();
        }
        else
        {
            output = "404";
        }
        return output;
    }

    static public string GetUserFullname(string username)
    {
        string output;
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlCommand com = new SqlCommand();
        con.Open();
        com.Connection = con;
        com.CommandText = "SELECT fullname FROM [Social-User] WHERE (username=@username)";
        com.Parameters.AddWithValue("username", username);
        SqlDataReader data = com.ExecuteReader();
        if (data.Read())
        {
            output = data["fullname"].ToString();
        }
        else
        {
            output = "404";
        }
        return output;
    }
    #endregion
    #region GetLikeAndHate
    static public string GetLike(string username)
    {
        int output = 0;
        SqlConnection con1 = new SqlConnection();
        con1.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        con1.Open();
        SqlCommand com1 = new SqlCommand();
        com1.Connection = con1;
        com1.CommandText = "SELECT * FROM [Social-Post-Like] WHERE (LikeToUsername=@username)";
        com1.Parameters.AddWithValue("username", username);
        SqlDataReader likesDataReader1 = com1.ExecuteReader();
        if (likesDataReader1.HasRows)
        {
            while (likesDataReader1.Read())
            {
                output++;
            }
        }
        likesDataReader1.Close();
        con1.Close();


        return output.ToString();
    }
    static public string GetHate(string username)
    {
        int output = 0;
        SqlConnection con1 = new SqlConnection();
        con1.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        con1.Open();
        SqlCommand com1 = new SqlCommand();
        com1.Connection = con1;
        com1.CommandText = "SELECT * FROM [Social-Post-Hate] WHERE (HateToUsername=@username)";
        com1.Parameters.AddWithValue("username", username);
        SqlDataReader HatesDataReader1 = com1.ExecuteReader();
        if (HatesDataReader1.HasRows)
        {
            while (HatesDataReader1.Read())
            {
                output++;
            }
        }
        HatesDataReader1.Close();
        con1.Close();


        return output.ToString();
    }
    #endregion
    #region logout
    static public void logout(string username)
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlCommand com = new SqlCommand();
        con.Open();
        com.Connection = con;
        com.CommandText = "SELECT * FROM [Social-User] WHERE (username=@username)";
        com.Parameters.AddWithValue("username", username);
        SqlDataReader data = com.ExecuteReader();
        if (data.Read())
        {
            SqlConnection con2 = new SqlConnection();
            con2.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con2.Open();
            SqlCommand com2 = new SqlCommand();
            com2.Connection = con2;
            com2.CommandText = "UPDATE [Social-User] SET loggedIn=@loggedIn WHERE (username=@username)";
            com2.Parameters.AddWithValue("username", data["username"]);
            com2.Parameters.AddWithValue("loggedIn", "false");
            com2.ExecuteNonQuery();
            con2.Close();
        }
    }
    #endregion
}
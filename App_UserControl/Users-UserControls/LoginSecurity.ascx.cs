#region
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Routing;

public partial class App_UserControl_Users_UserControls_LoginSecurity : System.Web.UI.UserControl
{
    public void redirecttologinpage()
    {
        Response.Redirect("~/App_USERS/Login.aspx");
    }
    public string PageTitle = "UNSECURE";
    protected void Page_Init(object sender, EventArgs e)
    {
        try
        {
            //Cookie
            string RandomNumber1 = Request.Cookies["LoginCookie"].Values["RandomNumber"].ToString();
            string Fullname1 = Request.Cookies["LoginCookie"].Values["Fullname"].ToString();
            string Username1 = Request.Cookies["LoginCookie"].Values["Username"].ToString();
            string UserID1 = Request.Cookies["LoginCookie"].Values["UserID"].ToString();
            string Firstname1 = Request.Cookies["LoginCookie"].Values["Firstname"].ToString();
            string Lastname1 = Request.Cookies["LoginCookie"].Values["Lastname"].ToString();
            string MainType1 = Request.Cookies["LoginCookie"].Values["MainType"].ToString();
            string Type1 = Request.Cookies["LoginCookie"].Values["Type"].ToString();
            string LastLoginDate1 = Request.Cookies["LoginCookie"].Values["LastLoginDate"].ToString();
            string IsOnline1 = Request.Cookies["LoginCookie"].Values["IsOnline"].ToString();
            //Class
            string RandomNumber2 = LoginSecurity.RandomNumber;
            string Fullname2 = LoginSecurity.Fullname;
            string Username2 = LoginSecurity.username;
            string UserID2 = LoginSecurity.UserID;
            string Firstname2 = LoginSecurity.Firstname;
            string Lastname2 = LoginSecurity.Lastname;
            string MainType2 = LoginSecurity.MainType;
            string Type2 = LoginSecurity.Type.ToString();
            string ImageURL2 = LoginSecurity.ImageURL;
            string LastLoginDate2 = LoginSecurity.LastLoginDate;
            string IsOnlie = LoginSecurity.IsOnline;
            //Session
            string RandomNumber3 = Session["RandomNumber"].ToString();
            string Password3 = Session["Password"].ToString();
            string Fullname3 = Session["Fullname"].ToString();
            string Username3 = Session["Username"].ToString();
            string UserID3 = Session["UserID"].ToString();
            string Firstname3 = Session["Firstname"].ToString();
            string Lastname3 = Session["Lastname"].ToString();
            string MainType3 = Session["MainType"].ToString();
            string Type3 = Session["Type"].ToString();
            string LastLoginDate3 = Session["LastLoginDate"].ToString();
            string IsOnline3 = Session["IsOnline"].ToString();
            //_________________________________________________________________________________________________________________________________________________________________________________________________
            if (MainType3 == null) redirecttologinpage();
            //if (MainType3 != MainType4) redirecttologinpage();
            //if (MainType3 != MainType2) redirecttologinpage();
            //if (MainType3 != MainType1) redirecttologinpage();

            if (RandomNumber3 == null) redirecttologinpage();
            //if (RandomNumber3 != RandomNumber1) redirecttologinpage();
            //if (RandomNumber3 != RandomNumber2) redirecttologinpage();
            //if (RandomNumber3 != RandomNumber4) redirecttologinpage();

            if (Password3 == null) redirecttologinpage();

            if (Fullname3 == null) redirecttologinpage();
            //if (Fullname3 != Fullname1) redirecttologinpage();
            //if (Fullname3 != Fullname2) redirecttologinpage();
            //if (Fullname3 != Fullname4) redirecttologinpage();

            if (Username3 == null) redirecttologinpage();
            //if (Username3 != Username1) redirecttologinpage();
            //if (Username3 != Username2) redirecttologinpage();

            if (UserID3 == null) redirecttologinpage();
            //if (UserID3 != UserID1) redirecttologinpage();
            //if (UserID3 != UserID2) redirecttologinpage();
            //if (UserID3 != UserID4) redirecttologinpage();

            if (Firstname3 == null) redirecttologinpage();
            //if (Firstname3 != Firstname1) redirecttologinpage();
            //if (Firstname3 != Firstname2) redirecttologinpage();

            if (Lastname3 == null) redirecttologinpage();
            //if (Lastname3 != Lastname1) redirecttologinpage();
            //if (Lastname3 != Lastname2) redirecttologinpage();

            if (Type3 == null) redirecttologinpage();
            //if (Type3 != Type1) redirecttologinpage();
            //if (Type3 != Type2) redirecttologinpage();
            //if (Type3 != Type4) redirecttologinpage();

            if (LastLoginDate3 == null) redirecttologinpage();
            //if (LastLoginDate3 != LastLoginDate1) redirecttologinpage();
            //if (LastLoginDate3 != LastLoginDate2) redirecttologinpage();

            if (IsOnline3 == null) redirecttologinpage();
            //if (IsOnline3 != IsOnline1) redirecttologinpage();

            PageTitle = "[" + Type3 + "]" + " " + "[" + Fullname3 + "]";

            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con.Open();
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "SELECT Password FROM [Users-Users] WHERE (UserID=@UserID) AND (Username=@Username) ";
            com.Parameters.AddWithValue("UserID", UserID3);
            com.Parameters.AddWithValue("Username", Username3);
            SqlDataReader data = com.ExecuteReader();
            //If
            if (data.Read())
            {
                if (Password3 != data["Password"].ToString()) redirecttologinpage();
            }
            else
            {
                redirecttologinpage();
            }

        }
        catch
        {
            redirecttologinpage();
        }
    }
}
#endregion
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

public partial class App_UserControl_UsersImage : System.Web.UI.UserControl
{
    private string UserID;
    public string _UserID
    {
        get
        {
            return UserID;
        }
        set
        {
            UserID = value;
        }
    }
    public void setImage()
    {
        if (UserID == null)
            UserID = Session["UserID"].ToString();
        SqlConnection userimagecon = new SqlConnection();
        userimagecon.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        userimagecon.Open();
        SqlCommand userimagecom = new SqlCommand();
        userimagecom.Connection = userimagecon;
        userimagecom.CommandText = "SELECT UserID,Fullname FROM [Users-Users] WHERE (UserID=@UserID)";
        userimagecom.Parameters.AddWithValue("UserID", UserID);
        SqlDataReader userimagedata = userimagecom.ExecuteReader();
        if (userimagedata.Read())
        {
            string imageUrl = "~/App_Handler/UsersImageThumb.ashx?fn=" + userimagedata["UserID"].ToString() + "-" + userimagedata["Fullname"].ToString();
            UserImage.ImageUrl = imageUrl;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        setImage();
    }
}
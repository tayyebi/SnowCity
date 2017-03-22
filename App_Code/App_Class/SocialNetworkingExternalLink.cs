using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.HtmlControls;
using System.Web.Configuration;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public class SocialNetworkingExternalLink
{
	public SocialNetworkingExternalLink()
	{
	}
    static public void InsertExternalLink(string username, string URL)
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "INSERT INTO [Social-ExternalLink] (URL,username) values (@URL,@username)";
        com.Parameters.AddWithValue("URL", URL);
        com.Parameters.AddWithValue("username", username);
        com.ExecuteNonQuery();
        con.Close();
    }
    static public void DeleteExternalLink(int LinkID)
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "DELETE FROM [Social-ExternalLink] WHERE (LinkID=@LinkID)";
        com.Parameters.AddWithValue("LinkID", LinkID);
        com.ExecuteNonQuery();
        con.Close();
    }
    static public void UpdateExternalLink(int LinkID, string NewURL)
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "UPDATE [Social-ExternalLink] SET (URL=@URL) WHERE (LinkID=@LinkID)";
        com.Parameters.AddWithValue("LinkID", LinkID);
        com.Parameters.AddWithValue("URL", NewURL);
        com.ExecuteNonQuery();
        con.Close();
    }
}
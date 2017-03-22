using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class App_Page_News_NewsRss : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            string connString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection sqlConn = new SqlConnection();
            sqlConn.ConnectionString = connString;
            string sqlQuery = "SELECT TOP 20 * FROM [News-News] ORDER BY [ID] DESC";
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = sqlConn;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = sqlQuery;
            sqlConn.Open();
            RepeaterRSS.DataSource = cmd.ExecuteReader();
            RepeaterRSS.DataBind();
            sqlConn.Close();
        }
        catch
        {
            Response.Redirect("~/Default-News.aspx");
        }
    }  
    protected string RemoveIllegalCharacters(object input)
    {
        string data = input.ToString();
        data = data.Replace("&", "&amp;");
        data = data.Replace("\"", "&quot;");
        data = data.Replace("'", "&apos;");
        data = data.Replace("<", "&lt;");
        data = data.Replace(">", "&gt;");
        return data;
    }
    protected string GetGroupName(object input)
    {
        string data = input.ToString();
        try
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con.Open();
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "SELECT Name FROM [News-Group] WHERE (GroupID=@GroupID)";
            com.Parameters.AddWithValue("GroupID", data);
            SqlDataReader datareader = com.ExecuteReader();
            if (datareader.Read())
            {
                data = datareader["Name"].ToString();
            }
            datareader.Close();
        }
        catch
        {
            data = "Server error. Please try later.";
        }
        return data;
    }
    protected string GetUserFullName(object input)
    {

        string data = input.ToString();
        try
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con.Open();
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "SELECT Fullname FROM [Users-Users] WHERE (UserID=@UserID)";
            com.Parameters.AddWithValue("UserID", data);
            SqlDataReader datareader = com.ExecuteReader();
            if (datareader.Read())
            {
                data = datareader["Fullname"].ToString();
            }
            datareader.Close();
        }
        catch
        {
            data = "Server error. Please try later";
        }
        return data;
    }

}
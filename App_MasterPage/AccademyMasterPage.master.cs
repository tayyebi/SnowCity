using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

public partial class App_MasterPage_AccademyMasterPage : System.Web.UI.MasterPage
{
    public void insertmetatag(string querystring, string output , string DatabaseTable)
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        con.Open();
        com.CommandText = "SELECT Title,Abstract,UserID,GroupID FROM ["+DatabaseTable+"] WHERE " + "([" + output + "]=@" + output + ")" + " ORDER BY ["+output+"] DESC";
        com.Parameters.AddWithValue(output, querystring);
        SqlDataReader data = com.ExecuteReader();
        if (data.Read())
        {
            try //description
            {
                HtmlMeta description = new HtmlMeta();
                description.Name = "description";
                description.Content = data["Abstract"].ToString();
                Page.Header.Controls.Add(description);
            }
            catch { }
            try  //keywords
            {
                HtmlMeta keywords = new HtmlMeta();
                keywords.Name = "keywords";
                keywords.Content = data["Title"].ToString();
                string[] words = keywords.Content.Split(' ');
                keywords.Content = "";
                foreach (string word in words)
                {
                    keywords.Content += word + ",";
                }
                Page.Header.Controls.Add(keywords);
            }
            catch { }
            try  //author
            {
                HtmlMeta author = new HtmlMeta();
                author.Name = "author";
                SqlConnection userscon = new SqlConnection();
                userscon.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                SqlCommand usercom = new SqlCommand();
                usercom.Connection = userscon;
                userscon.Open();
                usercom.CommandText = "SELECT * FROM [Users-Users] WHERE (UserID=@UserID)";
                usercom.Parameters.AddWithValue("UserID", data["UserID"].ToString());
                SqlDataReader usersdata = usercom.ExecuteReader();
                if (usersdata.Read())
                {
                    author.Content = usersdata["Fullname"].ToString();
                    Page.Header.Controls.Add(author);
                }
            }
            catch { }
        }
        con.Close();
    }
    protected void Page_Init(object sender, EventArgs e)
    {
        try
        {
            if (Request.QueryString["ArticleID"] != null)
                insertmetatag(Request.QueryString["ArticleID"].ToString(), "ArticleID", "Academy-Article");
        }
        catch { }
    }

}

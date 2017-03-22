using System;
using System.Collections.Generic;
using System.Linq;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class App_Page_Academy_Question : WebsitePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        try
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con.Open();
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "SELECT * FROM [Academy-Article] WHERE ArticleID=@ArticleID";
            com.Parameters.AddWithValue("ArticleID", Request.QueryString["ArticleID"]);
            SqlDataReader data = com.ExecuteReader();
            if (data.Read())
            {
                this.Title = data["Title"].ToString();
            }
            else redirecttoacademydefault();
        }
        catch
        {
            redirecttoacademydefault();
        }
    }
}
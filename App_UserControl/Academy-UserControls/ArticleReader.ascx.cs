using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;
using System.Net;
using System.Web.WebPages;
using System.Web.UI.HtmlControls;
using System.Web.Script;
using System.Windows.Forms;
using System.Security.Cryptography;
using OnBarcode.Barcode.ASPNET;
using System.Text.RegularExpressions;

public partial class App_UserControl_NewsReader : System.Web.UI.UserControl
{
    private string _Text;
    public string Text
    {
        get
        {
            return _Text;
        }
        set
        {
            _Text = value;
            string pattern = @"(class|id)=[""']?((?:.(?![""']?\s+(?:\S+)=|[>""']))+.)[""']?";
            lbl_ArticleText.Text = Regex.Replace(value, pattern, String.Empty, RegexOptions.IgnoreCase | RegexOptions.Singleline);
            lbl_ArticleText.Text = value.Replace("<img", "<img class=\"slide\"");
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
    private int ArticleID;
    protected void Page_Load(object sender, EventArgs e)
    {
        ArticleID = Convert.ToInt32(Request.QueryString["ArticleID"]);
        if (!Page.IsPostBack)
        {
            SqlConnection statuscon = new SqlConnection();
            statuscon.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            statuscon.Open();
            SqlCommand statuscom = new SqlCommand();
            statuscom.Connection = statuscon;
            statuscom.CommandText = "SELECT Views,Likes,Hates,ArticleID FROM [Academy-Article] WHERE ArticleID=@ArticleID";
            statuscom.Parameters.AddWithValue("ArticleID", ArticleID.ToString());
            SqlDataReader data = statuscom.ExecuteReader();
            if (data.Read())
            {
                Like.Text +=" + "+ data["Likes"].ToString();
                Hate.Text +=" - "+ data["Hates"].ToString();
                SqlConnection statuscon2 = new SqlConnection();
                statuscon2.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                statuscon2.Open();
                SqlCommand statuscom2 = new SqlCommand();
                statuscom2.Connection = statuscon2;
                statuscom2.CommandText = "UPDATE [Academy-Article] SET Views=@Views+1 WHERE (ArticleID=@ArticleID)";
                statuscom2.Parameters.AddWithValue("Views", data["Views"].ToString());
                statuscom2.Parameters.AddWithValue("ArticleID", ArticleID.ToString());
                statuscom2.ExecuteNonQuery();
                statuscon2.Close();
                Views.Text = data["Views"].ToString();
            }
        }
    }

    protected void Like_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con.Open();
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "SELECT Views,Likes,Hates,ArticleID FROM [Academy-Article] WHERE ArticleID=@ArticleID";
            com.Parameters.AddWithValue("ArticleID", ArticleID.ToString());
            SqlDataReader data = com.ExecuteReader();
            if (data.Read())
            {
                SqlConnection con2 = new SqlConnection();
                con2.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                con2.Open();
                SqlCommand com2 = new SqlCommand();
                com2.Connection = con2;
                com2.CommandText = "UPDATE [Academy-Article] SET Likes=@Likes+1 WHERE (ArticleID=@ArticleID)";
                com2.Parameters.AddWithValue("Likes", data["Likes"].ToString());
                com2.Parameters.AddWithValue("ArticleID", ArticleID.ToString());
                com2.ExecuteNonQuery();
                con2.Close();
                Hate.Enabled = Like.Enabled = false;
                Like.Text = " + " + data["Likes"].ToString();
                Hate.Text = " - " + data["Hates"].ToString();
                Views.Text = data["Views"].ToString();
            }
        }
        catch { }
    }
    protected void Hate_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con.Open();
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "SELECT Views,Likes,Hates,ArticleID FROM [Academy-Article] WHERE ArticleID=@ArticleID";
            com.Parameters.AddWithValue("ArticleID", ArticleID.ToString());
            SqlDataReader data = com.ExecuteReader();
            if (data.Read())
            {
                SqlConnection con2 = new SqlConnection();
                con2.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                con2.Open();
                SqlCommand com2 = new SqlCommand();
                com2.Connection = con2;
                com2.CommandText = "UPDATE [Academy-Article] SET Hates=@Hates+1 WHERE (ArticleID=@ArticleID)";
                com2.Parameters.AddWithValue("Hates", data["Hates"].ToString());
                com2.Parameters.AddWithValue("ArticleID", ArticleID.ToString());
                com2.ExecuteNonQuery();
                con2.Close();
                Hate.Enabled = Like.Enabled = false;
                Like.Text = " + " + data["Likes"].ToString();
                Hate.Text = " - " + data["Hates"].ToString();
                Views.Text = data["Views"].ToString();
            }
        }
        catch { }
    }
}
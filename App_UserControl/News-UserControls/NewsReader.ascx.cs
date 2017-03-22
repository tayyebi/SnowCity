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
            lbl_NewsText.Text = Regex.Replace(value, pattern, String.Empty, RegexOptions.IgnoreCase | RegexOptions.Singleline);
            lbl_NewsText.Text = value.Replace("<img", "<img class=\"slide\"");
        }
    }
    private int NewsID;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            SendByEmailHyperLink.NavigateUrl = "~/App_Page/News/SendNewsByEmail.aspx?ID=" + Page.Request.QueryString["ID"].ToString();
            NewsID = Convert.ToInt32(Request.QueryString["ID"]);
            if (!Page.IsPostBack)
            {
                SqlConnection statuscon = new SqlConnection();
                statuscon.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                statuscon.Open();
                SqlCommand statuscom = new SqlCommand();
                statuscom.Connection = statuscon;
                statuscom.CommandText = "SELECT * FROM [News-News] WHERE ID=@ID";
                statuscom.Parameters.AddWithValue("ID", NewsID.ToString());
                SqlDataReader data = statuscom.ExecuteReader();
                if (data.Read())
                {
                    Like.Text += " + " + data["Likes"].ToString();
                    Hate.Text += " - " + data["Hates"].ToString();
                    SqlConnection statuscon2 = new SqlConnection();
                    statuscon2.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                    statuscon2.Open();
                    SqlCommand statuscom2 = new SqlCommand();
                    statuscom2.Connection = statuscon2;
                    statuscom2.CommandText = "UPDATE [News-News] SET Views=@Views+1 WHERE (ID=@ID)";
                    statuscom2.Parameters.AddWithValue("Views", data["Views"].ToString());
                    statuscom2.Parameters.AddWithValue("ID", NewsID.ToString());
                    statuscom2.ExecuteNonQuery();
                    statuscon2.Close();
                    Views.Text = data["Views"].ToString();
                }
            }
        }
        catch
        {
            Like.Text = Hate.Text = Views.Text = "";
        }
    }
    protected void Like_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT * FROM [News-News] WHERE ID=@ID";
        com.Parameters.AddWithValue("ID", NewsID.ToString());
        SqlDataReader data = com.ExecuteReader();
        if (data.Read())
        {
            SqlConnection con2 = new SqlConnection();
            con2.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con2.Open();
            SqlCommand com2 = new SqlCommand();
            com2.Connection = con2;
            com2.CommandText = "UPDATE [News-News] SET Likes=@Likes+1 WHERE (ID=@ID)";
            com2.Parameters.AddWithValue("Likes", data["Likes"].ToString());
            com2.Parameters.AddWithValue("ID", NewsID.ToString());
            com2.ExecuteNonQuery();
            con2.Close();
            Hate.Enabled = Like.Enabled = false;
            Like.Text = " + " + data["Likes"].ToString();
            Hate.Text = " - " + data["Hates"].ToString();
            Views.Text = data["Views"].ToString();
        }
    }
    protected void Hate_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT * FROM [News-News] WHERE ID=@ID";
        com.Parameters.AddWithValue("ID", NewsID.ToString());
        SqlDataReader data = com.ExecuteReader();
        if (data.Read())
        {
            SqlConnection con2 = new SqlConnection();
            con2.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con2.Open();
            SqlCommand com2 = new SqlCommand();
            com2.Connection = con2;
            com2.CommandText = "UPDATE [News-News] SET Hates=@Hates+1 WHERE (ID=@ID)";
            com2.Parameters.AddWithValue("Hates", data["Hates"].ToString());
            com2.Parameters.AddWithValue("ID", NewsID.ToString());
            com2.ExecuteNonQuery();
            con2.Close();
            Hate.Enabled = Like.Enabled = false;
            Like.Text = " + " + data["Likes"].ToString();
            Hate.Text = " - " + data["Hates"].ToString();
            Views.Text = data["Views"].ToString();
        }

    }
}
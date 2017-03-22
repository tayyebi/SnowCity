using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class App_Page_TV_Play : WebsitePage
{
    public int RECORDID;
    protected void Like_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con.Open();
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "SELECT Likes,Hates FROM [News-TV] WHERE ID=@ID";
            com.Parameters.AddWithValue("ID", RECORDID.ToString());
            SqlDataReader data = com.ExecuteReader();
            if (data.Read())
            {
                SqlConnection con2 = new SqlConnection();
                con2.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                con2.Open();
                SqlCommand com2 = new SqlCommand();
                com2.Connection = con2;
                com2.CommandText = "UPDATE [News-TV] SET Likes=@Likes+1 WHERE (ID=@ID)";
                com2.Parameters.AddWithValue("Likes", data["Likes"].ToString());
                com2.Parameters.AddWithValue("ID", RECORDID.ToString());
                com2.ExecuteNonQuery();
                con2.Close();
                Hate.Enabled = Like.Enabled = false;
                Like.Text = " + " + data["Likes"].ToString();
                Hate.Text = " - " + data["Hates"].ToString();
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
            com.CommandText = "SELECT Likes,Hates FROM [News-TV] WHERE ID=@ID";
            com.Parameters.AddWithValue("ID", RECORDID.ToString());
            SqlDataReader data = com.ExecuteReader();
            if (data.Read())
            {
                SqlConnection con2 = new SqlConnection();
                con2.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                con2.Open();
                SqlCommand com2 = new SqlCommand();
                com2.Connection = con2;
                com2.CommandText = "UPDATE [News-TV] SET Hates=@Hates+1 WHERE (ID=@ID)";
                com2.Parameters.AddWithValue("Hates", data["Hates"].ToString());
                com2.Parameters.AddWithValue("ID", RECORDID.ToString());
                com2.ExecuteNonQuery();
                con2.Close();
                Hate.Enabled = Like.Enabled = false;
                Like.Text = " + " + data["Likes"].ToString();
                Hate.Text = " - " + data["Hates"].ToString();
            }
        }
        catch { }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["VideoId"] == null)
        {
            Response.Redirect("~/Default-TV.aspx");
        }
        else
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            con.Open();
            com.CommandText = "SELECT Date,ID,VideoDescription,VideoTitle,GroupID,UserID FROM [News-TV] WHERE (VideoId=@VideoId)";
            com.Parameters.AddWithValue("VideoId", Request.QueryString["VideoId"].ToString());
            SqlDataReader data = com.ExecuteReader();
            if (data.Read())
            {
                Date.Text = data["Date"].ToString();
                RECORDID = Convert.ToInt32(data["ID"]);
                #region meta
                try //meta description
                {
                    lbl_Description.Text = data["VideoDescription"].ToString();
                    HtmlMeta description = new HtmlMeta();
                    description.Name = "description";
                    description.Content = data["VideoDescription"].ToString();
                    Page.Header.Controls.Add(description);
                }
                catch { }
                try //meta keywords
                {
                    HtmlMeta keywords = new HtmlMeta();
                    keywords.Name = "keywords";
                    keywords.Content = data["VideoTitle"].ToString();
                    string[] words = keywords.Content.Split(' ');
                    keywords.Content = "";
                    foreach (string word in words)
                    {
                        keywords.Content += word + ",";
                    }
                    Page.Header.Controls.Add(keywords);
                }
                catch { }
                //title
                this.Title = pageTitle.Text = data["VideoTitle"].ToString();
                try//meta author
                {
                    HtmlMeta author = new HtmlMeta();
                    author.Name = "author";
                    SqlConnection userscon = new SqlConnection();
                    userscon.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                    SqlCommand usercom = new SqlCommand();
                    usercom.Connection = userscon;
                    userscon.Open();
                    usercom.CommandText = "SELECT Fullname FROM [Users-Users] WHERE (UserID=@UserID)";
                    usercom.Parameters.AddWithValue("UserID", data["UserID"].ToString());
                    SqlDataReader usersdata = usercom.ExecuteReader();
                    if (usersdata.Read())
                    {
                        author.Content = usersdata["Fullname"].ToString();
                        User.Text = usersdata["Fullname"].ToString();
                        User.NavigateUrl = "~/App_Page/TV/PlayByUser.aspx?UserID=" + usersdata["UserID"].ToString();
                        Page.Header.Controls.Add(author);
                        SqlConnection userimagecon = new SqlConnection();
                        string imageUrl = "~/App_Handler/UsersImageThumb.ashx?fn=" + data["UserID"].ToString() + "-" + data["Fullname"].ToString();
                        UserImage.ImageUrl = imageUrl;
                        p_UserImage.Visible = true;
                    }
                }
                catch { }
                #endregion
                #region hates,likes and views
                if (!Page.IsPostBack)
                {
                    try
                    {
                        SqlConnection statuscon2 = new SqlConnection();
                        statuscon2.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                        statuscon2.Open();
                        SqlCommand statuscom2 = new SqlCommand();
                        statuscom2.Connection = statuscon2;
                        statuscom2.CommandText = "UPDATE [News-TV] SET Views=@Views+1 WHERE (ID=@ID)";
                        statuscom2.Parameters.AddWithValue("Views", data["Views"].ToString());
                        statuscom2.Parameters.AddWithValue("ID", RECORDID.ToString());
                        statuscom2.ExecuteNonQuery();
                        statuscon2.Close();
                        Views.Text = data["Views"].ToString();
                        Like.Text += " + " + data["Likes"].ToString();
                        Hate.Text += " - " + data["Hates"].ToString();
                    }
                    catch { }
                }
                #endregion
                #region Links and lables
                /*---------------------------   Group   ---------------------------*/
                SqlConnection con3 = new SqlConnection();
                con3.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                con3.Open();
                SqlCommand com3 = new SqlCommand();
                com3.Connection = con3;
                com3.CommandText = "SELECT Name,GroupID FROM [News-Group] WHERE (GroupID=@GroupID)";
                com3.Parameters.AddWithValue("GroupID", data["GroupID"].ToString());
                SqlDataReader data3 = com3.ExecuteReader();
                if (data3.Read())
                {
                    Group.NavigateUrl = "~/App_Page/TV/PlayByGroup.aspx?GroupID=" + data["GroupID"].ToString();
                    Group.Text = data3["Name"].ToString();
                }
                #endregion
            }
            else
            {
                lbl_Description.Text = this.Title = "404";
                lbl_Description.ForeColor = System.Drawing.Color.Red;
                lbl_Description.BackColor = System.Drawing.Color.White;
                Hate.Enabled = Hate.Visible = Like.Enabled = Like.Visible = Views.Visible = Views.Enabled = Group.Visible = User.Visible = false; ;
                Date.Text = DateTime.Now.ToShortDateString() + "   +   " + DateTime.Now.ToShortTimeString();
            }
        }
    }
}
    
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class App_Page_News_SendNewsByEmail :WebsitePage
{
    string domainandport = HttpContext.Current.Request.Url.Scheme.ToString().ToLower()+"://"+HttpContext.Current.Request.Url.Host.ToString().ToUpper() + ":" + HttpContext.Current.Request.Url.Port.ToString().ToLower();
    string newstitle;
    string newsvalue;
    string newsabstract;
    string newsdate;
    string finalemail;
    string newsgrouplink;
    string newstitlelink;
    string newslink;
    string newsuserlink;
    private void updatesaveandsenddata()
    {
        try
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con.Open();
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "SELECT * FROM [News-News] WHERE ID=@ID";
            com.Parameters.AddWithValue("ID", Request.QueryString["ID"]);
            SqlDataReader data = com.ExecuteReader();
            if (data.Read())
            {
                newstitle = data["Title"].ToString();
                newsabstract = data["Abstract"].ToString();
                newsvalue = data["Value"].ToString();
                newsdate = data["Date"].ToString();
                newsgrouplink = domainandport + "/News/Group/?GroupID=" + data["GroupID"].ToString();
                newsuserlink = domainandport + "/News/User/?UserID=" + data["UserID"].ToString();
                newslink = domainandport + "/News/ID/?ID=" + data["ID"].ToString();
                newstitlelink = domainandport + "/News/Title/?Title=" + data["Title"].ToString();
                #region -finalemail
                //finalemail = "<html><head><link href=\""+domainandport+"/App_StyleSheet/EmailStyleSheet.css\" rel=\"stylesheet\" type=\"text/css\" /></head><html>";
                finalemail += "<div>" + newstitle + "</div>" + "<br/>" + "<div>" + newsabstract + "</div><br/>" + "<div>" + newsvalue + "</div><hr/>";
                finalemail += "<a href=\"" + newsgrouplink + "\"> Group | گروه </a><br/>";
                finalemail += "<a href=\"" + newstitlelink + "\"> Title | عنوان </a><br/>";
                finalemail += "<a href=\"" + newslink + "\">View this on SnowNews | در اسنونیوز نمایش بده </a><br/>";
                finalemail += "<img class=\"Logo\" src=\"" + domainandport + "/Logo.png\" alt=\"SnowCity\" />";
                #endregion
            }
        }
        catch { }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        updatesaveandsenddata();
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT Title,ID,UserID,GroupID FROM [News-News] WHERE ID=@ID";
        com.Parameters.AddWithValue("ID", Request.QueryString["ID"]);
        SqlDataReader data = com.ExecuteReader();
        if (data.Read())
        {
            hp_ID.NavigateUrl = hp_Back.NavigateUrl = "~/News/ID/?ID=" + Request.QueryString["ID"].ToString();
            hp_ID.Text = Request.QueryString["ID"].ToString();
            this.Title = newstitle + "-" + Request.QueryString["ID"].ToString();
            /*---------------------------   Title   ---------------------------*/
            hp_Title.NavigateUrl = "~/News/Title/?Title=" + data["Title"].ToString();
            hp_Title.Text = data["Title"].ToString();
            /*---------------------------   User   ---------------------------*/
            SqlConnection con2 = new SqlConnection();
            con2.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con2.Open();
            SqlCommand com2 = new SqlCommand();
            com2.Connection = con2;
            com2.CommandText = "SELECT UserID,Fullname FROM [Users-Users] WHERE (UserID=@UserID)";
            com2.Parameters.AddWithValue("UserID", data["UserID"].ToString());
            SqlDataReader data2 = com2.ExecuteReader();
            if (data2.Read())
            {
                hp_User.Text = data2["Fullname"].ToString();
                hp_User.NavigateUrl = "~/News/User/?UserID=" + data["UserID"].ToString();
            }
            /*---------------------------   Group   ---------------------------*/
            SqlConnection con3 = new SqlConnection();
            con3.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con3.Open();
            SqlCommand com3 = new SqlCommand();
            com3.Connection = con3;
            com3.CommandText = "SELECT GroupID,Name FROM [News-Group] WHERE (GroupID=@GroupID)";
            com3.Parameters.AddWithValue("GroupID", data["GroupID"].ToString());
            SqlDataReader data3 = com3.ExecuteReader();
            if (data3.Read())
            {
                hp_Group.Text = data3["Name"].ToString();
                hp_Group.NavigateUrl = "~/News/Group/?GroupID=" + data["GroupID"].ToString();
            }
        }
        else if (!data.Read())
        {
            this.Title = "404";
        }

    }
    protected void btn_Send_Click(object sender, EventArgs e)
    {
        if (this.Title != "404")
        {
            try
            {
                updatesaveandsenddata();
                finalemail += "<br/>Here's comment for you:<br/>" + txt_Comment.Text;
                btn_Send.Enabled = false;
                btn_Send.Text = "...";
                EMail.SendMailMessage(txt_From.Text.ToString(), txt_To.Text.ToString(), "", "", newstitle, finalemail);
                btn_Send.Visible = false;
                Response.Redirect("~/App_Page/News/ShowNewsByID.aspx?ID=" + Request.QueryString["ID"].ToString());
            }
            catch { }
        }
    }
}
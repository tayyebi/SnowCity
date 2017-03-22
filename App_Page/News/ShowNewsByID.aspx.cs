using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

public partial class App_Page_News_ShowNewsByID :WebsitePage
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
            com.CommandText = "SELECT Title,UserID,GroupID FROM [News-News] WHERE ID=@ID";
            com.Parameters.AddWithValue("ID", Request.QueryString["ID"]);
            SqlDataReader data = com.ExecuteReader();
            if (data.Read())
            {
                this.Title = data["Title"].ToString();
                hp_Title.Text = data["Title"].ToString();
                hp_Title.NavigateUrl = "~/News/Title/?Title=" + data["Title"].ToString();
                SqlConnection con2 = new SqlConnection();
                con2.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                con2.Open();
                SqlCommand com2 = new SqlCommand();
                com2.Connection = con2;
                com2.CommandText = "SELECT Fullname FROM [Users-Users] WHERE (UserID=@UserID)";
                com2.Parameters.AddWithValue("UserID", data["UserID"].ToString());
                SqlDataReader data2 = com2.ExecuteReader();
                if (data2.Read())
                {
                    UserIDLabel.Text = data2["Fullname"].ToString();
                    hp_User.Text = data2["Fullname"].ToString();
                    UserIDLabel.NavigateUrl = "~/App_Page/News/ShowNewsByUser.aspx?UserID="+data["UserID"].ToString();
                    hp_User.NavigateUrl = "~/News/User/?UserID=" + data["UserID"].ToString();
                }
                SqlConnection con3 = new SqlConnection();
                con3.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                con3.Open();
                SqlCommand com3 = new SqlCommand();
                com3.Connection = con3;
                com3.CommandText = "SELECT Name FROM [News-Group] WHERE (GroupID=@GroupID)";
                com3.Parameters.AddWithValue("GroupID", data["GroupID"].ToString());
                SqlDataReader data3 = com3.ExecuteReader();
                if (data3.Read())
                {
                    GroupIDLabel.Text = data3["Name"].ToString();
                    hp_Group.Text = data3["Name"].ToString();
                    GroupIDLabel.NavigateUrl = "~/App_Page/News/ShowNewsByGroup.aspx?GroupID=" + data["GroupID"].ToString();
                    hp_Group.NavigateUrl = "~/News/Group/?GroupID=" + data["GroupID"].ToString();
                }
            }
            else if (!data.Read())
            {
                Response.Redirect("~/App_Errors/404.aspx");
            }
        }
        catch
        {
            redirecttonewsdefault();
        }
    }
    string finalemail; 
    string domainandport = HttpContext.Current.Request.Url.Scheme.ToString().ToLower() + HttpContext.Current.Request.Url.Host.ToString().ToLower() + ":" + HttpContext.Current.Request.Url.Port.ToString().ToLower();
    string fromEmail = "no-reply@" + HttpContext.Current.Request.Url.Host.ToString().ToUpper();
    protected void btn_Send_Click(object sender, EventArgs e)
    {
        if (txt_Email.Text == null) txt_Email.Text = "***";
        if (txt_Value.Text != null)
        {
            try
            {
                PoliceCommentSQLDataSource.Insert();
                btn_Send.Visible = false;
                btn_MessageSend.Visible = true;
            }
            catch { }
            try
            {
                finalemail = "<html><head><link href=\"" + domainandport + "/App_StyleSheet/EmailStyleSheet.css\" rel=\"stylesheet\" type=\"text/css\" /></head><html>";
                finalemail += "Your comment sent successfuly.Thank you for your feedback.PLEASE DON'T REPLY THIS EMAIL.";
                finalemail += "<hr/>" + txt_Value.Text.ToString();
                finalemail += "<hr/><img class=\"Logo\" src=\"" + domainandport + "/Logo.png\" alt=\"SnowCity\" />";
                EMail.SendMailMessage(fromEmail, txt_Email.Text.ToString(), "", "", "sent comment to" + HttpContext.Current.Request.Url.Host.ToString().ToUpper(), finalemail + "<br/> date:" + DateTime.Now.ToLongTimeString());
            }
            catch { }
        }
    }
}
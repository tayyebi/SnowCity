using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class ChatRoomDefault :WebsitePage{
    protected void Page_Load(object sender, EventArgs e)
    {
        BadNicknameErrorLable.ForeColor = Color.Black;
        BadNicknameErrorLable.Visible = false;
        ErrorLable.ForeColor = Color.Black;
        ErrorLable.Visible = false;
        if (Session["ChatRoomNickname"] != null)
        {
            Response.Redirect("~/App_Page/ChatRoom/Chat.aspx");
        }
    }
    protected void EnterButton_Click(object sender, EventArgs e)
    {

        try
        {
            if (Session["ChatRoomNickname"] != null && Session["ChatRoomNickname"] != "")
            {
                //__________________________________________________Clear Chat History
                SqlConnection con2 = new SqlConnection();
                con2.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                con2.Open();
                SqlCommand com2 = new SqlCommand();
                com2.Connection = con2;
                com2.CommandText = "DELETE FROM [Chat-Value] WHERE (Nickname = @Nickname)";
                com2.Parameters.AddWithValue("@Nickname", Session["ChatRoomNickname"].ToString());
                com2.ExecuteNonQuery();
                //__________________________________________________Clear Chat Histoy
                SqlConnection con1 = new SqlConnection();
                con1.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                con1.Open();
                SqlCommand com1 = new SqlCommand();
                com1.Connection = con1;
                com1.CommandText = "DELETE FROM [Chat-Value] WHERE (ReciverNickname = @ReciverNickname)";
                com1.Parameters.AddWithValue("@ReciverNickname", Session["ChatRoomNickname"].ToString());
                com1.ExecuteNonQuery();
                //__________________________________________________Clear Nickname Database
                SqlConnection con3 = new SqlConnection();
                con3.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                con3.Open();
                SqlCommand com3 = new SqlCommand();
                com3.Connection = con3;
                com3.CommandText = "DELETE FROM [Chat-Nickname] WHERE (Nickname = @Nickname)";
                com3.Parameters.AddWithValue("@Nickname", Session["ChatRoomNickname"].ToString());
                com3.ExecuteNonQuery();
            }
            Session.Remove("ChatRoomNickname");
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con.Open();
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "SELECT Value FROM [Chat-BlockedWords] WHERE (Value =@Value)";
            com.Parameters.AddWithValue("Value", NickNameTextBox.Text);
            SqlDataReader data = com.ExecuteReader();
            if (data.Read())
            {
                BadNicknameErrorLable.ForeColor = Color.Red;
                BadNicknameErrorLable.Visible = true;
            }
            else
            {
           
                try
                {
                    DefaultSqlDataSource.Insert();
                    ErrorLable.ForeColor = Color.Black;
                    ErrorLable.Visible = false;
                    Session["ChatRoomNickname"] = NickNameTextBox.Text.ToString();
                    Response.Redirect("~/App_Page/ChatRoom/Chat.aspx");
                }
  
                catch
                {
                    NickNameTextBox.Text = string.Empty;
                    ErrorLable.ForeColor = Color.Red;
                    ErrorLable.Visible = true;
                }
            }
        }
        catch
        {
            ErrorLable.ForeColor = Color.Red;
            ErrorLable.Visible = true;
        }
    }

}
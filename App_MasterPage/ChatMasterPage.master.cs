using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class App_MasterPage_ChatMasterPage : System.Web.UI.MasterPage
{
    private void logout()
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
        if (Session["UserID"] != null)
        {
            //  _________________________________________________Edit Is Online
            SqlConnection con4 = new SqlConnection();
            con4.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con4.Open();
            SqlCommand com4 = new SqlCommand();
            com4.Connection = con4;
            com4.CommandText = "UPDATE [Users-Users] SET IsOnline = @IsOnline WHERE (UserID = @UserID)";
            com4.Parameters.AddWithValue("UserID", Session["UserID"].ToString());
            com4.Parameters.AddWithValue("IsOnline", "FALSE");//FALSE means that user didnt log out normally but False shows that user logged out normaly
            com4.ExecuteNonQuery();
        }
        Session.Abandon();
        Response.Redirect("~/Default-ChatRoom.aspx");
    }
    protected void Page_Close(object sender,EventArgs e)
    {
        logout();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["ChatRoomNickname"] != null)
        {
            NicknameLable.Text = Session["ChatRoomNickname"].ToString();
        }
        else
        {
            Response.Redirect("~/Default-ChatRoom.aspx");
        }
    }
    protected void LogoutButton_Click(object sender, EventArgs e)
    {
        logout();
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        ContactLable.Text = NicknameGridView.SelectedRow.Cells[1].Text;
        MessageTextBox.Enabled = true;
        SendUpdatePanel.Update();
        SendMessageUpdatePanel.Update();
        MessageTextBox.Focus();
    }
    protected void NicknameTimer_Tick(object sender, EventArgs e)
    {
        NicknameGridView.DataBind();
        NicknameUpdatePanel.Update();
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT Nickname FROM [Chat-Nickname] WHERE Nickname=@Nickname";
        com.Parameters.AddWithValue("Nickname", NicknameLable.Text);
        SqlDataReader data = com.ExecuteReader();
        if (data.Read())
        { }
        else
        {
            Session.Remove("ChatRoomNickname");
            Response.Redirect("~/Default-ChatRoom.aspx");
        }
    }
    protected void MessageTimer_Tick(object sender, EventArgs e)
    {
        MessageDataList.DataBind();
    }
    protected void SendButton_Click(object sender, EventArgs e)
    {
        try
        {
            if (ContactLable.Text != null && MessageTextBox.Text != "")
            {
                MessageSqlDataSource.Insert();
                MessageTextBox.Text = string.Empty;
                InsertErrorLable.Visible = false;
                MessageTextBox.Enabled = true;
                MessageTextBox.Focus();
                SendButton.Enabled = true;
            }
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con.Open();
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "SELECT ChatID FROM [Chat-Value] WHERE (Nickname = @Nickname) OR (ReciverNickname = @Nickname)";
            com.Parameters.AddWithValue("@Nickname", Session["ChatRoomNickname"].ToString());
            SqlDataReader data = com.ExecuteReader();
            int i = 0;
            if (data.HasRows)
            {
                while (data.Read())
                {
                    i++;
                    if (i > 10)
                    {
                        for (int n = i; n > 10; n--)
                        {
                            SqlConnection con2 = new SqlConnection();
                            con2.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                            con2.Open();
                            SqlCommand com2 = new SqlCommand();
                            com2.Connection = con2;
                            com2.CommandText = "DELETE TOP(1) FROM [Chat-Value] WHERE (Nickname = @Nickname) OR (ReciverNickname = @Nickname)";
                            com2.Parameters.AddWithValue("@Nickname", Session["ChatRoomNickname"].ToString());
                            com2.ExecuteNonQuery();
                        }
                    }
                }
            }
        }
        catch { }
    }

    protected void MessageDataList_SelectedIndexChanged(object sender, EventArgs e)
    {
        MessageDataList.DataBind();
    }

    protected void Smiley_Click(object sender, ImageClickEventArgs e)
    {
        MessageTextBox.Text += "`" + (sender as ImageButton).ID.ToString() + "`";
    }
    protected void smiley_Click(object sender, EventArgs e)
    {
        if (pan_smileys.Visible == true)
            pan_smileys.Visible = false;
        else pan_smileys.Visible = true;
    }

}

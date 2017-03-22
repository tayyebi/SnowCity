using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class USERS_LoggedIn_Admin_Police_ChatRoom_Default :WebsitePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (UseTimerCheckBox.Checked == true)
        {
            PublicChatTimer.Enabled = true;
            RefreshGridView.Visible = false;
        }
        if (UseTimerCheckBox.Checked == false)
        {
            PublicChatTimer.Enabled = false;
            RefreshGridView.Visible = true;
        }
    }
    protected void btn_BackToPoliceDefault_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/App_USERS/LoggedIn/Admin/Police/Default.aspx");
    }
    protected void btn_BackToDefaultView_Click(object sender, EventArgs e)
    {
        DefaultMultiView.ActiveViewIndex = 0;
        readpublicchat();
    }
    protected void PublicChatButton_Click(object sender, EventArgs e)
    {
        readpublicchat();
        DefaultMultiView.ActiveViewIndex = 1;
    }

    protected void PublicChatTimer_Tick(object sender, EventArgs e)
    {
        readpublicchat();
    }
    protected void btn_Confirm_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con.Open();
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "SELECT * FROM [Police-ChatPublic] WHERE ChatID=@ChatID ";
            com.Parameters.AddWithValue("ChatID", PolicePublicChatGridView.SelectedRow.Cells[0].Text);
            SqlDataReader data = com.ExecuteReader();
            if (data.Read())
            {
                hf_Nickname.Value = data["Nickname"].ToString();
                hf_Value.Value = data["Value"].ToString();
            }
            PublicChatSQLDataSource.Insert();
            PolicPublicChatSQLDataSource.Delete();
            PolicePublicChatGridView.DataBind();
        }
        catch { }
        readpublicchat();
    }
    protected void UseTimerCheckBox_CheckedChanged(object sender, EventArgs e)
    {
        if (UseTimerCheckBox.Checked == true)
        {
            PublicChatTimer.Enabled = true;
            RefreshGridView.Visible = false;
        }
        if (UseTimerCheckBox.Checked == false)
        {
            PublicChatTimer.Enabled = false;
            RefreshGridView.Visible = true;
        }
    }
    protected void RefreshGridView_Click(object sender, EventArgs e)
    {
        PolicePublicChatGridView.DataBind();
    }
    protected void btn_Reject_Click(object sender, EventArgs e)
    {
        try
        {
            PolicPublicChatSQLDataSource.Delete();
            PolicePublicChatGridView.DataBind();
        }
        catch { }
        readpublicchat();
    }
    protected void NicknameButton_Click(object sender, EventArgs e)
    {
        DefaultMultiView.ActiveViewIndex = 2;
    }
    protected void NicknameGridView_SelectedIndexChanged(object sender, EventArgs e)
    {
        NicknameSqlDataSource.Delete();
    }
    protected void RejectNicknamesButton_Click(object sender, EventArgs e)
    {
        DefaultMultiView.ActiveViewIndex = 3;
    }
    protected void btn_Delete_Click(object sender, EventArgs e)
    {
        try
        {
            RejectedNicknamesSqlDataSource.Delete();
            RejectedNicknamesGridView.DataBind();
            txt_New.Text = string.Empty;
        }
        catch
        {
        }
    }
    protected void btn_Add_Click(object sender, EventArgs e)
    {
        try
        {
            RejectedNicknamesSqlDataSource.Insert();
            RejectedNicknamesGridView.DataBind();
            txt_New.Text = string.Empty;
        }
        catch
        {
        }
    }
    protected void RejectedNicknamesGridView_SelectedIndexChanged(object sender, EventArgs e)
    {
        hf_RejectedNickname.Value = RejectedNicknamesGridView.SelectedRow.Cells[1].Text;
        btn_Delete.Visible = true;
    }
    protected void NicknameViewRefreshButton_Click(object sender, EventArgs e)
    {
        NicknameGridView.DataBind();
    }
    protected void PolicePublicChatGridView_SelectedIndexChanged(object sender, EventArgs e)
    {
        readpublicchat();
    }
    public void readpublicchat()
    {
        txt_Nickname.Text = txt_Value.Text = "";
        try
        {
            PolicePublicChatGridView.DataBind();
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con.Open();
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "SELECT * FROM [Police-ChatPublic] WHERE ChatID=@ChatID ";
            com.Parameters.AddWithValue("ChatID", PolicePublicChatGridView.SelectedRow.Cells[0].Text);
            SqlDataReader data = com.ExecuteReader();
            if (data.Read())
            {
                txt_Nickname.Text = data["Nickname"].ToString();
                txt_Value.Text = data["Value"].ToString();
            }
        }
        catch { }
    }
}
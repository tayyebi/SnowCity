using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class USERS_LoggedIn_TV : WebsitePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        hf_Date.Value = DateTime.Now.ToLongDateString() + "   |   " + DateTime.Now.ToLongTimeString();
    }
    protected void Back_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/App_USERS/LoggedIn/Default.aspx");
    }
    protected void BackToDefaultView_Click(object sender, EventArgs e)
    {
        DefaultMultiView.ActiveViewIndex = 0;
        Edit.Enabled = false;
    }
    protected void Insert_Click(object sender, EventArgs e)
    {
        DefaultMultiView.ActiveViewIndex = 1;
        Edit.Enabled = false;

    }
    protected void Edit_Click(object sender, EventArgs e)
    {
        DefaultMultiView.ActiveViewIndex = 2;
        Edit.Enabled = false;
    }
    protected void Insert0_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            con.Open();
            com.CommandText = "SELECT * FROM [News-TV] WHERE (VideoId=@VideoId)";
            com.Parameters.AddWithValue("VideoId",txt_URL.Text.ToString());
            SqlDataReader data = com.ExecuteReader();
            if (data.Read())
            {
                txt_Title.Text = "*********";
            }
            else
            {
                DefaultSqlDataSource.Insert();
                DefaultMultiView.ActiveViewIndex = 0;
                txt_Description.Text = txt_Title.Text = txt_URL.Text = "";
                Edit.Enabled = false;
            }
            data.Close();
            con.Close();
        }
        catch { }
    }
    protected void Delete0_Click(object sender, EventArgs e)
    {
        try
        {
            DefaultSqlDataSource.Delete();
            DefaultMultiView.ActiveViewIndex = 0;
            Edit.Enabled = false;
        }
        catch { }
    }
    protected void Update0_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            con.Open();
            com.CommandText = "SELECT * FROM [News-TV] WHERE (VideoId=@VideoId)";
            com.Parameters.AddWithValue("VideoId", txt_URL0.Text.ToString());
            SqlDataReader data = com.ExecuteReader();
            if (data.Read())
            {
                txt_Title0.Text = "*********";
            }
            else
            {
                DefaultSqlDataSource.Update();
                DefaultMultiView.ActiveViewIndex = 0;
                Edit.Enabled = false;
            }
            data.Close();
            con.Close();

        }
        catch { }
    }
    protected void DefaultGridView_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            Edit.Enabled = false;
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con.Open();
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "SELECT * FROM [News-TV] WHERE (ID=ID) AND (UserID=@UserID)";
            com.Parameters.AddWithValue("UserID",Session["UserID"].ToString());
            com.Parameters.AddWithValue("ID",DefaultGridView.SelectedRow.Cells[1].Text.ToString());
            SqlDataReader data=com.ExecuteReader();
            if (data.Read())
            {
                txt_Title0.Text=data["VideoTitle"].ToString();
                txt_Description0.Text=data["VideoDescription"].ToString();
                txt_URL0.Text=data["VideoId"].ToString();
                txt_ID0.Text=data["ID"].ToString();
                Edit.Enabled = true;
            }
        }
        catch { }
    }
}
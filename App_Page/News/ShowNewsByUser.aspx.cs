using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class App_Page_News_ShowNewsByUser :WebsitePage
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
            com.CommandText = "SELECT Fullname FROM [Users-Users] WHERE UserID=@UserID";
            com.Parameters.AddWithValue("UserID", Request.QueryString["UserID"]);
            SqlDataReader data = com.ExecuteReader();
            if (data.Read())
            {
                this.Title = data["Fullname"].ToString();
            }
            else redirecttonewsdefault();
        }
        catch
        {
            redirecttonewsdefault();
        }
    }
    protected void ShowAllButton_Click(object sender, EventArgs e)
    {
        try
        {
            DefaultDatalist.Visible = false;
            ShowAllPanel.Visible = true;
            ShowAllButton.Visible = false;
        }
        catch { }
    }
    protected void ShowAllGridView_SelectedIndexChanged(object sender, EventArgs e)
    {
        Response.Redirect("~/App_Page/News/ShowNewsByID.aspx?ID=" + ShowAllGridView.SelectedRow.Cells[1].Text.ToString());
    }
}
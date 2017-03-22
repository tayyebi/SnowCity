using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class App_Page_News_ShowNews :WebsitePage
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
            com.CommandText = "SELECT Title FROM [News-News] WHERE (Title=@Title)";
            com.Parameters.AddWithValue("Title", Request.QueryString["Title"]);
            SqlDataReader data = com.ExecuteReader();
            if (data.Read())
            {
                this.Title = data["Title"].ToString();
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
            DefaultDataList.Visible = false;
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
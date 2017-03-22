using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class App_Page_TV_PlayByTitle : WebsitePage
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
            com.CommandText = "SELECT Title FROM [News-TV] WHERE (VideoTitle=@Title)";
            com.Parameters.AddWithValue("Title", Request.QueryString["Title"]);
            SqlDataReader data = com.ExecuteReader();
            if (data.Read())
            {
                this.Title = pageTitle.Text = data["VideoTitle"].ToString();
            }
            else redirecttoTVdefault();
        }
        catch
        {
            redirecttoTVdefault();
        }

    }
    protected void ShowAllButton_Click(object sender, EventArgs e)
    {
        try
        {
            DefautDataList.Visible = false;
            ShowAllPanel.Visible = true;
            ShowAllButton.Visible = false;
        }
        catch { }
    }
    protected void ShowAllGridView_SelectedIndexChanged(object sender, EventArgs e)
    {
        Response.Redirect("~/App_Page/TV/Play.aspx?VideoId=" + ShowAllGridView.SelectedRow.Cells[1].Text.ToString());
    }
}
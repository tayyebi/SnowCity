using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

public partial class App_Page_Academy_Teacher : WebsitePage
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
            com.CommandText = "SELECT * FROM [Users-Users] WHERE UserID=@UserID";
            com.Parameters.AddWithValue("UserID", Request.QueryString["UserID"]);
            SqlDataReader data = com.ExecuteReader();
            if (data.Read())
            {
                this.Title = data["Fullname"].ToString();
            }
            else redirecttoacademydefault();
        }
        catch
        {
            redirecttoacademydefault();
        }
    }
    protected void ShowAllGridView_SelectedIndexChanged(object sender, EventArgs e)
    {
        Response.Redirect("~/App_Page/Academy/Article.aspx?ArticleID=" + ShowAllGridView.SelectedRow.Cells[1].Text.ToString());
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
}
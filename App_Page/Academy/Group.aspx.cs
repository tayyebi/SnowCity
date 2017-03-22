using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class App_Page_Academy_Group : WebsitePage
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
            com.CommandText = "SELECT * FROM [Academy-Group] WHERE GroupID=@GroupID";
            com.Parameters.AddWithValue("GroupID", Request.QueryString["GroupID"]);
            SqlDataReader data = com.ExecuteReader();
            if (data.Read())
            {
                this.Title = data["Name"].ToString();
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
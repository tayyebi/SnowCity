using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class App_Page_TV_TvArchiveSearch : WebsitePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void SearchButton_Click(object sender, EventArgs e)
    {
        SearchGridView.DataBind();
    }
    protected void SearchGridView_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT VideoId FROM [News-TV] WHERE (ID=@ID)";
        com.Parameters.AddWithValue("ID", SearchGridView.SelectedRow.Cells[1].Text.ToString());
        SqlDataReader data = com.ExecuteReader();
        if (data.Read())
        {
            Response.Redirect("~/App_Page/TV/Play.aspx?VideoId=" + data["VideoId"].ToString());
        }
        else
        {
            Response.Redirect("~/App_Page/TV/Archive.aspx");
        }
    }

}
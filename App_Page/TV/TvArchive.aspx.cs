using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class App_Page_TV_Tv_Archive : WebsitePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ArchiveGridView_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con.Open();
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "SELECT VideoID FROM [News-TV] WHERE (ID=@ID)";
            com.Parameters.AddWithValue("ID", Archive.SelectedRow.Cells[1].Text.ToString());
            SqlDataReader data = com.ExecuteReader();
            if (data.Read())
            {
                Response.Redirect("~/App_Page/TV/Play.aspx?VideoId="+data["VideoId"].ToString());
            }
        }
        catch { }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class USERS_LoggedIn_Admin_Adverties_Default :WebsitePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void BackToDefaultPage_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/App_USERS/LoggedIn/Default.aspx");
    }
    protected void ClassicAdverties_Click(object sender, EventArgs e)
    {
        DefaultMultiView.ActiveViewIndex = 1;
    }
    protected void BackToDefaultView_Click(object sender, EventArgs e)
    {
        DefaultMultiView.ActiveViewIndex = 0;
    }

    protected void BackToClassicView_Click(object sender, EventArgs e)
    {
        DefaultMultiView.ActiveViewIndex = 1;
        Delete.Enabled = Edit.Enabled = false;
        ClassicGridView.DataBind();
    }

    protected void Insert_Click(object sender, EventArgs e)
    {
        DefaultMultiView.ActiveViewIndex = 2;
    }
    protected void Edit_Click(object sender, EventArgs e)
    {
        DefaultMultiView.ActiveViewIndex = 3;
    }
    protected void Delete_Click(object sender, EventArgs e)
    {
        DefaultMultiView.ActiveViewIndex = 4;
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Delete.Enabled = true;
        Edit.Enabled = true;
        try
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con.Open();
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "SELECT * FROM [Adverties-Classic] WHERE [AdvertiesID]=@AdvertiesID";
            com.Parameters.AddWithValue("AdvertiesID", ClassicGridView.SelectedRow.Cells[1].Text);
            SqlDataReader data = com.ExecuteReader();
            if (data.Read())
            {
                Classic_txt_Source0.Text = data["AdvertiesFinalCode"].ToString();
                Classic_txt_Name0.Text = Classic_txt_Name1.Text = data["AdvertiesName"].ToString();
                Classic_txt_Group0.Text = data["AdvertiesGroup"].ToString();
                Classic_txt_ID.Text = data["AdvertiesID"].ToString();
            }
        }
        catch
        {
        }
    }
    protected void Classic_Insert_Click(object sender, EventArgs e)
    {
        try
        {
            ClassicSqlDataSource.Insert();
            Delete.Enabled = Edit.Enabled = false;
            ClassicGridView.DataBind();
            DefaultMultiView.ActiveViewIndex = 1;
            Classic_txt_Source.Text = Classic_txt_Name.Text = Classic_txt_Name.Text = "";
        }
        catch { }
    }
    protected void Classic_Edit_Click(object sender, EventArgs e)
    {
        try
        {
            ClassicSqlDataSource.Update();
            Delete.Enabled = Edit.Enabled = false;
            ClassicGridView.DataBind();
            DefaultMultiView.ActiveViewIndex = 1;
        }
        catch { }
    }
    protected void Classic_Delete_Click(object sender, EventArgs e)
    {
        try
        {
            ClassicGridView.DataBind();
            ClassicSqlDataSource.Delete();
            Delete.Enabled = Edit.Enabled = false;
            DefaultMultiView.ActiveViewIndex = 1;
        }
        catch { }
    }
}
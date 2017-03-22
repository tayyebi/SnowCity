using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

public partial class USERS_LoggedIn_AdminsNews :WebsitePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ShowNewsButton_Click(object sender, EventArgs e)
    {
    }

    protected void ShowTopNewsDataList_SelectedIndexChanged(object sender, EventArgs e)
    {
        //Label1.Text = ((Label)ShowTopNewsDataList.SelectedItem.FindControl("NewsTitleLabel")).Text.ToString();
        //Label1.Text = ShowTopNewsDataList.SelectedIndex.ToString();
        ShowTopNewsDataList.DataBind();
    }
    protected void ShowTopNewsDataList_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "unselect")
        {
            ShowTopNewsDataList.SelectedIndex = -1;
        }
        ShowTopNewsDataList.DataBind();
    }
    protected void ArchiveGridviw_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con.Open();
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "SELECT * FROM [Users-News] WHERE NewsID=@NewsID ";
            com.Parameters.AddWithValue("NewsID", ArchiveGridviw.SelectedRow.Cells[1].Text.ToString());
            SqlDataReader data = com.ExecuteReader();
            if (data.Read())
            {
                NewsTitleLable.Text = data["NewsTitle"].ToString();
                NewsIDLable.Text = data["NewsID"].ToString();
                Date.Text = data["Date"].ToString();
                Value.Text = data["Value"].ToString();
                DefaultMultiView.ActiveViewIndex = 2;
            }
        }
        catch { }
    }
    protected void Cancel0_Click(object sender, EventArgs e)
    {
        DefaultMultiView.ActiveViewIndex = 1;
    }
    protected void Cancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/App_USERS/LoggedIn/Default.aspx");
    }
    protected void Archive_Click(object sender, EventArgs e)
    {
        DefaultMultiView.ActiveViewIndex = 1;
    }
    protected void Cancel1_Click(object sender, EventArgs e)
    {
        DefaultMultiView.ActiveViewIndex = 0;
    }
}
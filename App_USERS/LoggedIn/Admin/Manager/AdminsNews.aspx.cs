using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class USERS_LoggedIn_Admin_Manager_AdminsNews :WebsitePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Back.NavigateUrl = "~/App_USERS/LoggedIn/Admin/Manager/Default.aspx";
    }
    protected void New_Click(object sender, EventArgs e)
    {
        DefaultMultiView.ActiveViewIndex = 1;
        lbl_Date.Text=lbl_Date0.Text= DateTime.Now.ToLongTimeString();
    }
    protected void Edit_Click(object sender, EventArgs e)
    {
        DefaultMultiView.ActiveViewIndex = 2;
    }
    protected void Delete_Click(object sender, EventArgs e)
    {
        DefaultMultiView.ActiveViewIndex = 3;
    }
    protected void btn_Back_Click(object sender, EventArgs e)
    {
        DefaultMultiView.ActiveViewIndex = 0;
        Edit.Enabled = Delete.Enabled = Edit.Visible = Delete.Visible = false;
    }
    protected void btn_Update_Click(object sender, EventArgs e)
    {
        try
        {
            lbl_Date0.Text = DateTime.Now.ToShortDateString();
            DefaultSqlDataSource.Update();
            DefaultSqlDataSource.DataBind();
            DefaultGridView.DataBind();
            Edit.Enabled = Delete.Enabled = Edit.Visible = Delete.Visible = false;
            DefaultMultiView.ActiveViewIndex = 0;
        }
        catch { }
    }
    protected void btn_Insert_Click(object sender, EventArgs e)
    {
        try
        {
            lbl_Date.Text = DateTime.Now.ToShortDateString();
            DefaultSqlDataSource.Insert();
            DefaultSqlDataSource.DataBind();
            DefaultGridView.DataBind();
            Edit.Enabled = Delete.Enabled = Edit.Visible = Delete.Visible = false;
            DefaultMultiView.ActiveViewIndex = 0;
        }
        catch { }
    }
    protected void btn_Delete_Click(object sender, EventArgs e)
    {
        try
        {
            DefaultSqlDataSource.Delete();
            DefaultSqlDataSource.DataBind();
            DefaultGridView.DataBind();
            Edit.Enabled = Delete.Enabled = Edit.Visible = Delete.Visible = false;
            DefaultMultiView.ActiveViewIndex = 0;
        }
        catch { }
    }
    protected void DefaultGridView_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT * FROM [Users-News] WHERE NewsID=@NewsID ";
        com.Parameters.AddWithValue("NewsID", DefaultGridView.SelectedRow.Cells[1].Text.ToString());
        SqlDataReader data = com.ExecuteReader();
        if (data.Read())
        {
            txt_Value0.Text = data["Value"].ToString();
            txt_Title1.Text = txt_Title2.Text = data["NewsTitle"].ToString();
            txt_Serial.Text = data["NewsID"].ToString();
            lbl_Date0.Text = data["Date"].ToString();
        }
        Edit.Enabled = Delete.Enabled = Edit.Visible = Delete.Visible = true;
    }
}
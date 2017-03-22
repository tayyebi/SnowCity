using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class USERS_LoggedIn_Admin_Manager_AppErrors : WebsitePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Back.NavigateUrl = "~/App_USERS/LoggedIn/Admin/Manager/Default.aspx";
        checknext();
    }
    private void checknext()
    {
        try
        {
            DefaultGridView.DataBind();
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con.Open();
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "SELECT * FROM [Problem] WHERE ID=@ID ";
            com.Parameters.AddWithValue("ID", DefaultGridView.SelectedRow.Cells[0].Text);
            SqlDataReader data = com.ExecuteReader();
            if (data.Read())
            {
                ValueTextBox.Text = data["ProblemValue"].ToString();
                IdTextBox.Text = data["ID"].ToString();
            }
        }
        catch { }
    }
    protected void DefaultGridView_SelectedIndexChanged(object sender, EventArgs e)
    {
        checknext();
    }
    protected void ValueTextBox_TextChanged(object sender, EventArgs e)
    {

    }
    protected void DeleteAndNext_Click(object sender, EventArgs e)
    {
        try
        {
            DefaultSqlDataSource.Delete();
            DefaultGridView.DataBind();
        }
        catch { }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class USERS_LoggedIn_Admin_Database_Default :WebsitePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void CreateTables_Click(object sender, EventArgs e)
    {
        #region tables code part 1
        try
        {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        con.Open();
        #endregion
        #region tables code here
        var com = new SqlCommand(@"
        --TABLES CODE HERE
        ", con);
        #endregion
        #region tables code part 2
        com.ExecuteNonQuery();
        con.Close();
        }
        catch { }
        #endregion
    }
    protected void BackToDefaultPage_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/App_USERS/LoggedIn/Default.aspx");
    }
    protected void RunSQL_Click(object sender, EventArgs e)
    {
        #region tables code part 1
        try
        {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        con.Open();
        #endregion
        #region tables code here
        var com = new SqlCommand(DatabaseCodeTextBox.Text.ToString(), con);
        #endregion
        #region tables code part 2
        com.ExecuteNonQuery();
        con.Close();
        }
        catch { }
        #endregion

    }
}
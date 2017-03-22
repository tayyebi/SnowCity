using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

public partial class USERS_CreateUsersManager :WebsitePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void UsersManager_Click(object sender, EventArgs e)
    {
        UsersManagerSqlDataSource.Insert();
        UsersManagerGridView.DataBind();
    }
    private void insertMainType(string MainType)
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "INSERT INTO [Users-MainType] (MainType) VALUES (@MainType)";
        com.Parameters.AddWithValue("MainType",MainType);
        com.ExecuteNonQuery();
        con.Close();
    }
    private void insertType(string Type, string MainType)
    {
        SqlConnection con1 = new SqlConnection();
        con1.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        con1.Open();
        SqlCommand com1 = new SqlCommand();
        com1.Connection = con1;
        com1.CommandText = "INSERT INTO [Users-Type] (Type, MainType) VALUES (@Type, @MainType)";
        com1.Parameters.AddWithValue("Type", Type);
        com1.Parameters.AddWithValue("MainType", MainType);
        com1.ExecuteNonQuery();
        con1.Close();
    }
    protected void MainType_Click(object sender, EventArgs e)
    {
        insertMainType("Manager");
        insertMainType("Academy");
        insertMainType("Adverties");
        insertMainType("DatabaseManager");
        insertMainType("Jornal");
        insertMainType("Police");
        UsersMainTypeGridView.DataBind();
    }
    protected void Type_Click(object sender, EventArgs e)
    {
        insertType("UsersManager", "Manager");
        insertType("ChatRoomPolice", "Police");
        insertType("AcademyManager", "Academy");
        insertType("Teacher", "Academy");
        insertType("AdvertiesManager", "Adverties");
        insertType("DatabaseManager","DatabaseManager");
        insertType("Jornal", "Jornal");
        insertType("NewsAdmin", "Jornal");
        insertType("NewsPolice", "Police");
        UsersTypeGridView.DataBind();
    }

}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class App_UserControl_News_UserControls_RelatedNews : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlCommand com = new SqlCommand();
            con.Open();
            com.Connection = con;
            com.CommandText = "SELECT Title,GroupID,UserID FROM [News-News] WHERE (ID=@ID)";
            com.Parameters.AddWithValue("ID", Request.QueryString["ID"].ToString());
            SqlDataReader data = com.ExecuteReader();
            if (data.Read())
            {
                Title.Value = data["Title"].ToString();
                GroupID.Value = data["GroupID"].ToString();
                UserID.Value = data["UserID"].ToString();
                RelatedDataList.DataBind();
            }
        }
        catch
        {
            RelatedDataList.Dispose();
        }

    }
}
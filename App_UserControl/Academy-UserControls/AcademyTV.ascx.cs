using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class App_UserControl_AcademyTV : System.Web.UI.UserControl
{
    protected void Page_PreRender(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con.Open();
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "SELECT VideoId FROM [Academy-Article] WHERE ArticleID=@ArticleID";
            com.Parameters.AddWithValue("ArticleID", Request.QueryString["ArticleID"]);
            SqlDataReader data = com.ExecuteReader();
            reap_TV.DataSource = data;
            reap_TV.DataBind();
            reap_TV.Visible = true;
        }
        catch { }
    }
}
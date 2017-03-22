using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Data.SqlTypes;
using System.Data;

public partial class App_UserControl_CountNews : System.Web.UI.UserControl
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
            com.CommandText = "SELECT ID FROM [News-News]";
            SqlDataReader data = com.ExecuteReader();
            int i = 0;
            if (data.HasRows)
            {
                while (data.Read())
                {
                    i++;
                }
                CountNews.Text = i.ToString();
            }
        }
        catch {
            CountNews.Text = "Server error! Try again later.";
        }
    }
}
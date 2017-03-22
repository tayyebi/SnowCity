using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

public partial class App_UserControl_QuestionReader : System.Web.UI.UserControl
{
    private string _Text;
    public string Text
    {
        get
        {
            return _Text;
        }
        set
        {
            _Text = lbl_Question.Text = value;
        }
    }
    private string _QuestionId;
    public string QuestionId
    {
        get
        {
            return _QuestionId;
        }
        set
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con.Open();
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "SELECT Answer FROM [Academy-Answer] WHERE (QuestionID=@QuestionID)";
            com.Parameters.AddWithValue("QuestionID", value);
            SqlDataReader data = com.ExecuteReader();
            if (data.Read())
            {
                lbl_Answer.Text = data["Answer"].ToString();
            }
            else
            {
                lbl_Answer.Text = "404";
            }
            Answer.Visible = true;
            _QuestionId = lbl_QuestionID.Text = value;
        }
    }

}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class App_Page_Academy_Article : WebsitePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con.Open();
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "SELECT * FROM [Academy-Article] WHERE ArticleID=@ArticleID";
            com.Parameters.AddWithValue("ArticleID", Request.QueryString["ArticleID"]);
            SqlDataReader data = com.ExecuteReader();
            if (data.Read())
            {
                Questions.NavigateUrl = "~/App_Page/Academy/Question.aspx?ArticleID=" + data["ArticleID"].ToString();
                this.Title = data["Title"].ToString();
                hf_UserID.Value = data["UserID"].ToString();
                hf_GroupID.Value = data["GroupID"].ToString();
            }
            else redirecttoacademydefault();
        }
        catch
        {
            redirecttoacademydefault();
        }
    }

    protected void Ask_Click(object sender, EventArgs e)
    {
        if (txt_Email.Text == "")
        {
            txt_Email.Text = "***";
        }
        else if (txt_Email.Text == "***")
        {
            txt_Email.Text = "";
        }
        else
        {
            if (txt_Question.Text == "")
            {
                txt_Question.Text = "***";
            }
            else if (txt_Question.Text == "***")
            {
                txt_Question.Text = "";
            }
            else
            {
                SDS_Question.Insert();
                Ask.Visible = false;
                try
                {
                    EMail.SendMailMessage("no-reply@" + HttpContext.Current.Request.Url.Port.ToString().ToUpper(), txt_Email.Text, "", "", this.Title, txt_Question.Text);
                }
                catch { }
            }
        }
    }
}
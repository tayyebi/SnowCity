using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class USERS_LoggedIn_Admin_Academy_Default :WebsitePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        gView_article_Default.DataBind();
        GroupGridView.DataBind();
        gView_Questions_Later.DataBind();
        gv_Questions.DataBind();
        lbl_Date.Text = lbl_Date0.Text = DateTime.Now.ToLongDateString() + "   |   " + DateTime.Now.ToLongTimeString();
        try
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlCommand com = new SqlCommand();
            con.Open();
            com.Connection = con;
            com.CommandText = "SELECT QuestionID FROM [Academy-BlockedQuestion] WHERE (UserID=@UserID) AND (IsReaded=N'false')";
            com.Parameters.AddWithValue("UserID", Session["UserID"].ToString());
            SqlDataReader data = com.ExecuteReader();
            int i = 0;
            if (data.HasRows)
            {
                while (data.Read())
                {
                    i++;
                }
                CountQuestions.Text = i.ToString();
            }
            else
            {
                CountQuestions.Text = "0";
                if (CountQuestions.Text == "0")
                    CountQuestions.ForeColor = System.Drawing.Color.Green;
            }
        }
        catch {
            CountQuestions.Text = "X";
            CountQuestions.ForeColor = System.Drawing.Color.Red;
        }
    }
    protected void BackToDefaultPage_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/App_USERS/LoggedIn/Default.aspx");
    }
    protected void btn_Article_Click(object sender, EventArgs e)
    {
        DefaultMultiView.ActiveViewIndex = 1;
        mView_Article.ActiveViewIndex = 0;
    }
    protected void Back_Click(object sender, EventArgs e)
    {
        Edit0.Enabled = Delete0.Enabled = false;
        Edit.Enabled = Delete.Enabled = false;
        DefaultMultiView.ActiveViewIndex = 0;
    }
    protected void Insert_Click(object sender, EventArgs e)
    {
        Edit.Enabled = Delete.Enabled = false;
        mView_Article.ActiveViewIndex = 1;
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Edit.Enabled = Delete.Enabled = false;
        mView_Article.ActiveViewIndex = 2;
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Edit.Enabled = Delete.Enabled = false;
        mView_Article.ActiveViewIndex = 3;
    }
    protected void gView_article_Default_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT * FROM [Academy-Article] WHERE (ArticleID=@ArticleID)";
        com.Parameters.Add("ArticleID", gView_article_Default.SelectedRow.Cells[1].Text.ToString());
        SqlDataReader data = com.ExecuteReader();
        if (data.Read())
        {
            lbl_ArticleID.Text = lbl_ArticleID0.Text = data["ArticleID"].ToString();
            txt_Title0.Text = txt_Title1.Text = data["Title"].ToString();
            txt_Abstract0.Text = txt_Abstract1.Text = data["Abstract"].ToString();
            txt_Value0.Text = data["Value"].ToString();
            lbl_Date1.Text = data["Date"].ToString();
            txt_Video0.Text=data["VideoId"].ToString();
            Edit.Enabled = Delete.Enabled = true;
        }
    }
    protected void btn_Login_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con.Open();
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "SELECT * FROM [Users-Users] WHERE UserID=@UserID AND Password=@Password AND Username=@Username ";
            com.Parameters.AddWithValue("UserID", Session["UserID"].ToString());
            com.Parameters.AddWithValue("Password", txt_Password.Text);
            com.Parameters.AddWithValue("Username", Session["Username"].ToString());
            SqlDataReader data = com.ExecuteReader();
            if (data.Read())
            {
                if ("AcademyManager" == data["Type"].ToString())
                {
                    mv_Group.ActiveViewIndex = 1;
                }
            }
        }
        catch { }

    }
    protected void Course_Click(object sender, EventArgs e)
    {
        mv_Group.ActiveViewIndex = 0;
        DefaultMultiView.ActiveViewIndex = 2;
    }
    protected void Insert0_Click(object sender, EventArgs e)
    {
        Edit0.Enabled = Delete0.Enabled = false;
        mv_Group.ActiveViewIndex = 2;
    }
    protected void Edit0_Click(object sender, EventArgs e)
    {
        Edit0.Enabled = Delete0.Enabled = false;
        mv_Group.ActiveViewIndex = 3;
    }
    protected void Delete0_Click(object sender, EventArgs e)
    {
        Edit0.Enabled = Delete0.Enabled = false;
        mv_Group.ActiveViewIndex = 4;
    }
    protected void BackToGroupDefault_Click(object sender, EventArgs e)
    {
        mv_Group.ActiveViewIndex = 1;
    }
    protected void btn_Delete0_Click(object sender, EventArgs e)
    {
        try
        {
            ArticleGroupSqlDataSource.Delete();
            mv_Group.ActiveViewIndex = 1;
        }
        catch { }
    }
    protected void btn_Edit0_Click(object sender, EventArgs e)
    {
        try
        {
            ArticleGroupSqlDataSource.Update();
            mv_Group.ActiveViewIndex = 1;
        }
        catch { }
    }
    protected void btn_Insert0_Click(object sender, EventArgs e)
    {
        try
        {
            ArticleGroupSqlDataSource.Insert();
            txt_Group_Insert.Text = string.Empty;
            mv_Group.ActiveViewIndex = 1;
        }
        catch { }
    }
    protected void btn_Insert_Click(object sender, EventArgs e)
    {
        if (txt_Title.Text != "")
        {

            try
            {
                ArticleSqlDataSource.Insert();
                txt_Title.Text = txt_Value.Text = txt_Abstract.Text = txt_Video.Text = string.Empty;
                DefaultMultiView.ActiveViewIndex = 1;
                mView_Article.ActiveViewIndex = 0;
            }
            catch { }
        }
    }
    protected void btn_Edit_Click(object sender, EventArgs e)
    {
        if (txt_Title0.Text != "")
        {
            try
            {
                ArticleSqlDataSource.Update();
                DefaultMultiView.ActiveViewIndex = 1;
                mView_Article.ActiveViewIndex = 0;
            }
            catch { }
        }
    }
    protected void btn_Delete_Click(object sender, EventArgs e)
    {
        try
        {
            ArticleSqlDataSource.Delete();
            DefaultMultiView.ActiveViewIndex = 1;
            mView_Article.ActiveViewIndex = 0;
        }
        catch { }
    }
    protected void GroupGridView_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT * FROM [Academy-Group] WHERE (GroupID=@GroupID)";
        com.Parameters.Add("GroupID", GroupGridView.SelectedRow.Cells[1].Text.ToString());
        SqlDataReader data = com.ExecuteReader();
        if (data.Read())
        {
            lbl_Group_GroupID.Text = lbl_Group_GroupID0.Text = data["GroupID"].ToString();
            txt_Group_Delete.Text = txt_Group_Edit.Text = data["Name"].ToString();
            Edit0.Enabled = Delete0.Enabled = true;
        }
    }
    protected void Question_Click(object sender, EventArgs e)
    {
        mv_Questions.ActiveViewIndex = 0;
        DefaultMultiView.ActiveViewIndex = 3;
    }
    protected void gv_Questions_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT * FROM [Academy-BlockedQuestion] WHERE (QuestionID=@QuestionID)";
        com.Parameters.AddWithValue("QuestionID", gv_Questions.SelectedRow.Cells[1].Text.ToString());
        SqlDataReader data = com.ExecuteReader();
        if (data.Read())
        {
            hp_Article.NavigateUrl = "~/App_Page/Academy/Article.aspx?ArticleID=" + data["ArticleID"].ToString();
            lbl_From.Text = data["Email"].ToString();
            lbl_QuestionBlockedId.Text = data["QuestionID"].ToString();
            lbl_GroupID.Text=data["GroupID"].ToString();
            lbl_ArticleID2.Text = data["ArticleID"].ToString();
            lbl_Comment.Text = data["Comment"].ToString();
            mv_Questions.ActiveViewIndex = 1;
            mv_Questions_Select.ActiveViewIndex = 0;
        }
    }
    protected void QuestionLater_Click(object sender, EventArgs e)
    {
        mv_Questions.ActiveViewIndex = 2;
    }
    protected void BackToQuestionsDefault_Click(object sender, EventArgs e)
    {
        mv_Questions.ActiveViewIndex = 0;
    }
    protected void Later_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con.Open();
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "UPDATE [Academy-BlockedQuestion] SET IsReaded=@IsReaded WHERE (QuestionID=@QuestionID)";
            com.Parameters.AddWithValue("QuestionID", lbl_QuestionBlockedId.Text.ToString());
            com.Parameters.AddWithValue("IsReaded", "true");
            com.ExecuteNonQuery();
            con.Close();
            gv_Questions.DataBind();
            mv_Questions.ActiveViewIndex = 0;
        }
        catch { }
    }
    protected void Delete2_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con.Open();
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "DELETE FROM [Academy-BlockedQuestion] WHERE (QuestionID=@QuestionID)";
            com.Parameters.AddWithValue("QuestionID", lbl_QuestionBlockedId.Text.ToString());
            com.ExecuteNonQuery();
            con.Close();
            gv_Questions.DataBind();
            mv_Questions.ActiveViewIndex = 0;
        }
        catch { }
    }
    protected void Answer_Click(object sender, EventArgs e)
    {
        mv_Questions_Select.ActiveViewIndex = 1;
    }
    protected void QuestionsArchive_Click(object sender, EventArgs e)
    {

    }
    protected void Cancel_Click(object sender, EventArgs e)
    {
        mv_Questions_Select.ActiveViewIndex = 0;
    }
    protected void btn_Answer_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con1 = new SqlConnection();
            con1.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con1.Open();
            SqlCommand com1 = new SqlCommand();
            com1.Connection = con1;
            com1.CommandText = "INSERT INTO [Academy-Question] (QuestionID,Email,Comment,ArticleID,UserID,GroupID) VALUES (@QuestionID,@Email,@Comment,@ArticleID,@UserID,@GroupID)";
            com1.Parameters.AddWithValue("Email", lbl_From.Text);
            com1.Parameters.AddWithValue("Comment", lbl_Comment.Text);
            com1.Parameters.AddWithValue("QuestionID", lbl_QuestionBlockedId.Text.ToString());
            com1.Parameters.AddWithValue("ArticleID", Convert.ToInt32(lbl_ArticleID2.Text));
            com1.Parameters.AddWithValue("UserID", Convert.ToInt32(Session["UserID"].ToString()));
            com1.Parameters.AddWithValue("GroupID", Convert.ToInt32(lbl_GroupID.Text.ToString()));
            com1.ExecuteNonQuery();
            con1.Close();

            SqlConnection con2 = new SqlConnection();
            con2.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con2.Open();
            SqlCommand com2 = new SqlCommand();
            com2.Connection = con2;
            com2.CommandText = "INSERT INTO [Academy-Answer] (Answer,ArticleID,UserID,GroupID,QuestionID) VALUES (@Answer,@ArticleID,@UserID,@GroupID,@QuestionID)";
            com2.Parameters.AddWithValue("Answer", txt_Answer.Text.ToString());
            com2.Parameters.AddWithValue("QuestionID", lbl_QuestionBlockedId.Text.ToString());
            com2.Parameters.AddWithValue("Comment", lbl_Comment.Text);
            com2.Parameters.AddWithValue("ArticleID", Convert.ToInt32(lbl_ArticleID2.Text));
            com2.Parameters.AddWithValue("UserID", Convert.ToInt32(Session["UserID"].ToString()));
            com2.Parameters.AddWithValue("GroupID", Convert.ToInt32(lbl_GroupID.Text.ToString()));
            com2.ExecuteNonQuery();
            con2.Close();

            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con.Open();
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "DELETE FROM [Academy-BlockedQuestion] WHERE (QuestionID=@QuestionID)";
            com.Parameters.AddWithValue("QuestionID", lbl_QuestionBlockedId.Text.ToString());
            com.ExecuteNonQuery();
            con.Close();

            gv_Questions.DataBind();
            mv_Questions.ActiveViewIndex = 0;
        }
        catch { }
        try
        {
            EMail.SendMailMessage("no-reply@" + HttpContext.Current.Request.Url.Host.ToString().ToUpper(), lbl_From.Text.ToString(), "", "", HttpContext.Current.Request.Url.Host.ToString().ToLower(), txt_Answer.Text.ToString());
        }
        catch { }
    }
    protected void gView_Questions_Later_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT * FROM [Academy-BlockedQuestion] WHERE (QuestionID=@QuestionID)";
        com.Parameters.AddWithValue("QuestionID", gView_Questions_Later.SelectedRow.Cells[1].Text.ToString());
        SqlDataReader data = com.ExecuteReader();
        if (data.Read())
        {
            hp_Article.NavigateUrl = "~/App_Page/Academy/Article.aspx?ArticleID=" + data["ArticleID"].ToString();
            lbl_From.Text = data["Email"].ToString();
            lbl_QuestionBlockedId.Text = data["QuestionID"].ToString();
            lbl_GroupID.Text = data["GroupID"].ToString();
            lbl_ArticleID2.Text = data["ArticleID"].ToString();
            lbl_Comment.Text = data["Comment"].ToString();
            mv_Questions.ActiveViewIndex = 1;
            mv_Questions_Select.ActiveViewIndex = 0;
        }
    }
}
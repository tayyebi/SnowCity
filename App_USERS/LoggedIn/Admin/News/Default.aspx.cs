using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class USERS_LoggedIn_Admin_News_Default : WebsitePage
{
    private void clearnewsfileds()
    {
        CheckNewsGridView.Visible = CheckNewsGridView0.Visible = false;
        txt_Source.Text = txt_Source0.Text = txt_Title.Text = txt_Title0.Text = txt_Title1.Text = txt_Abstract.Text = txt_Abstract0.Text = txt_Value.Text = txt_Value0.Text = string.Empty;
        txt_Source.Text = HttpContext.Current.Request.Url.Scheme.ToString().ToLower() + "://" + HttpContext.Current.Request.Url.Host.ToString().ToUpper() + ":" + HttpContext.Current.Request.Url.Port.ToString().ToLower();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        TV.NavigateUrl = "~/App_USERS/LoggedIn/Admin/News/TV.aspx";
        GroupEmptyTextValidator.Visible = GroupEmptyTextValidator0.Visible = false;
        try
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlCommand com = new SqlCommand();
            con.Open();
            com.Connection = con;
            com.CommandText = "SELECT * FROM [News-News] WHERE (UserID=@UserID)";
            com.Parameters.AddWithValue("UserID", Session["UserID"].ToString());
            SqlDataReader data = com.ExecuteReader();
            int i = 0;
            if (data.HasRows)
            {
                while (data.Read())
                {
                    i++;
                }
                hp_News.Text = i.ToString();
                hp_News.NavigateUrl = "~/App_Page/News/ShowNewsByUser.aspx?UserID=" + Session["UserID"].ToString();
            }
            SqlConnection con2 = new SqlConnection();
            con2.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlCommand com2 = new SqlCommand();
            con2.Open();
            com2.Connection = con2;
            com2.CommandText = "SELECT * FROM [News-News] WHERE (UserID=@UserID) ORDER BY [Hates] DESC";
            com2.Parameters.AddWithValue("UserID", Session["UserID"].ToString());
            SqlDataReader data2 = com2.ExecuteReader();
            if (data2.Read())
            {
                hp_Hates.Text = data2["Title"].ToString();
                hp_Hates.NavigateUrl = "~/App_Page/News/ShowNewsByID.aspx?ID=" + data2["ID"].ToString();
            }
            SqlConnection con3 = new SqlConnection();
            con3.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlCommand com3 = new SqlCommand();
            con3.Open();
            com3.Connection = con3;
            com3.CommandText = "SELECT * FROM [News-News] WHERE (UserID=@UserID) ORDER BY [Likes] DESC";
            com3.Parameters.AddWithValue("UserID", Session["UserID"].ToString());
            SqlDataReader data3 = com3.ExecuteReader();
            if (data3.Read())
            {
                hp_Likes.Text = data3["Title"].ToString();
                hp_Likes.NavigateUrl = "~/App_Page/News/ShowNewsByID.aspx?ID=" + data3["ID"].ToString();
            }
        }
        catch { }
    }
    protected void btn_BackToAdminsDefaultPage_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/App_USERS/LoggedIn/Default.aspx");
    }
    protected void NewsGridView_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT * FROM [News-News] WHERE ID=@ID";
        com.Parameters.AddWithValue("ID", NewsGridView.SelectedRow.Cells[1].Text);
        SqlDataReader data = com.ExecuteReader();
        if (data.Read())
        {
            txt_Title0.Text = txt_Title1.Text = data["Title"].ToString();
            txt_Value0.Text = data["Value"].ToString();
            txt_Abstract0.Text = data["Abstract"].ToString();
            txt_ID.Text = data["ID"].ToString();
            txt_Source0.Text = data["Source"].ToString();
            Edit.Enabled = Delete.Enabled = true;
            ID = Convert.ToInt32(data["ID"].ToString());
        }
        con.Close();
    }
    protected void btn_Cancel_Click(object sender, EventArgs e)
    {
        clearnewsfileds();
        Edit.Enabled = Delete.Enabled = false;
        dd_Group0.DataBind();
        dd_Group.DataBind();
        DefaultMultiView.ActiveViewIndex = 0;
    }
    public int ID;
    protected void btn_Edit_Click(object sender, EventArgs e)
    {
        try
        {
            Edit.Enabled = Delete.Enabled = false;
            lbl_Date0.Text = DateTime.Now.ToString();
            //NewsSqlDataSource.Update();
            int ID = Convert.ToInt32(NewsGridView.SelectedRow.Cells[1].Text);
            SqlConnection con1 = new SqlConnection();
            con1.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con1.Open();
            SqlCommand com1 = new SqlCommand();
            com1.Connection = con1;
            com1.CommandText = "UPDATE [News-News] SET Title=@Title WHERE (ID=@ID)";
            com1.Parameters.AddWithValue("Title", txt_Title0.Text);
            com1.Parameters.AddWithValue("ID", ID.ToString());
            com1.ExecuteNonQuery();
            con1.Close();
            SqlConnection con2 = new SqlConnection();
            con2.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con2.Open();
            SqlCommand com2 = new SqlCommand();
            com2.Connection = con2;
            com2.CommandText = "UPDATE  [News-News] SET Abstract=@Abstract WHERE (ID=@ID)";
            com2.Parameters.AddWithValue("Abstract", txt_Abstract0.Text);
            com2.Parameters.AddWithValue("ID",ID.ToString());
            com2.ExecuteNonQuery();
            con2.Close();
            SqlConnection con3 = new SqlConnection();
            con3.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con3.Open();
            SqlCommand com3 = new SqlCommand();
            com3.Connection = con3;
            com3.CommandText = "UPDATE  [News-News] SET Value=@Value WHERE (ID=@ID)";
            com3.Parameters.AddWithValue("Value",txt_Value0.Text);
            com3.Parameters.AddWithValue("ID", ID.ToString());
            com3.ExecuteNonQuery();
            con3.Close();
            SqlConnection con4 = new SqlConnection();
            con4.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con4.Open();
            SqlCommand com4 = new SqlCommand();
            com4.Connection = con4;
            com4.CommandText = "UPDATE  [News-News] SET GroupID=@GroupID WHERE (ID=@ID)";
            com4.Parameters.AddWithValue("GroupID", dd_Group0.SelectedValue.ToString());
            com4.Parameters.AddWithValue("ID", ID.ToString());
            com4.ExecuteNonQuery();
            con4.Close();
            SqlConnection con5 = new SqlConnection();
            con5.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con5.Open();
            SqlCommand com5 = new SqlCommand();
            com5.Connection = con5;
            com5.CommandText = "UPDATE  [News-News] SET Date=@Date WHERE (ID=@ID)";
            com5.Parameters.AddWithValue("Date", lbl_Date0.Text);
            com5.Parameters.AddWithValue("ID", ID.ToString());
            com5.ExecuteNonQuery();
            con5.Close();
            SqlConnection con6 = new SqlConnection();
            con6.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con6.Open();
            SqlCommand com6 = new SqlCommand();
            com6.Connection = con6;
            com6.CommandText = "UPDATE  [News-News] SET Source=@Source WHERE (ID=@ID)";
            com6.Parameters.AddWithValue("Source", txt_Source0.Text);
            com6.Parameters.AddWithValue("ID", ID.ToString());
            com6.ExecuteNonQuery();
            con6.Close();
            clearnewsfileds();
            DefaultMultiView.ActiveViewIndex = 0;
        }
        catch { }
    }
    protected void btn_Delete_Click(object sender, EventArgs e)
    {
        try
        {
            int ID = Convert.ToInt32(NewsGridView.SelectedRow.Cells[1].Text);
            Edit.Enabled = Delete.Enabled = false;
            Edit.Enabled = Delete.Enabled = false;
            //NewsSqlDataSource.Delete();
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con.Open();
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "DELETE FROM [News-News] WHERE (ID=@ID)";
            com.Parameters.AddWithValue("ID", txt_ID.Text);
            com.ExecuteNonQuery();
            con.Close();
            DefaultMultiView.ActiveViewIndex = 0;
            clearnewsfileds();
        }
        catch { }
    }
    protected void btn_Insert_Click(object sender, EventArgs e)
    {
        if (txt_Title.Text == "")
            RequiredFieldValidator2.Visible = true;
        else
        {
            try
            {
                Edit.Enabled = Delete.Enabled = false;
                lbl_Date.Text = DateTime.Now.ToString();
                NewsSqlDataSource.Insert();
                DefaultMultiView.ActiveViewIndex = 0;
                clearnewsfileds();
            }
            catch { }
        }
    }
    protected void BackToDefaultPage_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/App_USERS/LoggedIn/Default.aspx");
        Edit.Enabled = Delete.Enabled = false;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        DefaultMultiView.ActiveViewIndex = 1;
        RequiredFieldValidator2.Visible = Edit.Enabled = Delete.Enabled = false;
    }
    protected void Edit_Click(object sender, EventArgs e)
    {
        DefaultMultiView.ActiveViewIndex = 2;
        Edit.Enabled = Delete.Enabled = false;
    }
    protected void Delete_Click(object sender, EventArgs e)
    {
        DefaultMultiView.ActiveViewIndex = 3;
        Edit.Enabled = Delete.Enabled = false;
    }
    protected void Group_Click(object sender, EventArgs e)
    {
        DefaultMultiView.ActiveViewIndex = 4;
    }
    protected void GroupGridView_SelectedIndexChanged(object sender, EventArgs e)
    {
        InsertPanel0.Enabled = InsertPanel1.Enabled = true;
        InsertPanel0.Visible = InsertPanel1.Visible = true;
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT * FROM [News-Group] WHERE GroupID=@GroupID";
        com.Parameters.AddWithValue("GroupID", GroupGridView.SelectedRow.Cells[1].Text);
        SqlDataReader data = com.ExecuteReader();
        if (data.Read())
        {
            txtGroupName0.Text = txtGroupName1.Text = data["Name"].ToString();
            txtGroupDescription0.Text = txtGroupDescription1.Text = data["Description"].ToString();
        }
    }
    protected void btnEditGroup_Click(object sender, EventArgs e)
    {
        if (txtGroupName0.Text != "")
        {
            try
            {
                GroupEditViewDeleteSqlDataSource.Update();
                InsertPanel0.Enabled = InsertPanel1.Enabled = false;
                InsertPanel0.Visible = InsertPanel1.Visible = false;
                cleargroupfields();
            }
            catch
            {
            }
        }
        else if (txtGroupName0.Text == "")
        {
            GroupEmptyTextValidator0.Visible = true;
        }
    }
    public void cleargroupfields(){
        txtGroupName.Text = txtGroupName0.Text = txtGroupName1.Text = txtGroupDescription.Text = txtGroupDescription0.Text = txtGroupDescription1.Text = string.Empty;
    }
    protected void btnDeleteGroup_Click(object sender, EventArgs e)
    {
        try
        {
            GroupEditViewDeleteSqlDataSource.Delete();
            InsertPanel0.Enabled = InsertPanel1.Enabled = false;
            InsertPanel0.Visible = InsertPanel1.Visible = false;
            cleargroupfields();
        }
        catch
        {
        }
    }
    protected void btnInsertGroup_Click(object sender, EventArgs e)
    {
        if (txtGroupName.Text != "")
        {
            try
            {
                GroupEditViewDeleteSqlDataSource.Insert();
                InsertPanel0.Enabled = InsertPanel1.Enabled = false;
                InsertPanel0.Visible = InsertPanel1.Visible = false;
                cleargroupfields();
            }
            catch
            {
            }
        }
        else if (txtGroupName.Text == "")
        {
            GroupEmptyTextValidator.Visible = true;
        }

    }
    protected void AdminPermissionForGroupLoginButton_Click(object sender, EventArgs e)
    {
        AdminPermissionForGroupProblemErrorLable.Visible = false;
        try
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con.Open();
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "SELECT * FROM [Users-Users] WHERE UserID=@UserID AND Password=@Password";
            com.Parameters.AddWithValue("UserID", Session["UserID"].ToString());
            com.Parameters.AddWithValue("Password", AdminPermissionForGroupPasswordTextBox.Text);
            SqlDataReader data = com.ExecuteReader();
            if (data.Read())
            {
                DefaultMultiView.ActiveViewIndex = 5;
            }
        }
        catch
        {
            AdminPermissionForGroupProblemErrorLable.Visible = true;
        }
    }
    protected void AdminPermissionForGroupLoginCancelButton_Click(object sender, EventArgs e)
    {
        AdminPermissionForGroupProblemErrorLable.Visible = false;
        DefaultMultiView.ActiveViewIndex = 0;
    }

    protected void AdminPermissionForGroupLoginButton0_Click(object sender, EventArgs e)
    {
        AdminPermissionForGroupProblemErrorLable0.Visible = false;
       try
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con.Open();
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "SELECT * FROM [Users-Users] WHERE UserID=@UserID AND Password=@Password";
            com.Parameters.AddWithValue("UserID", Convert.ToInt32(Session["UserID"].ToString()));
            com.Parameters.AddWithValue("Password", AdminPermissionForGroupPasswordTextBox0.Text);
            SqlDataReader data = com.ExecuteReader();
            if (data.Read())
            {
                DefaultMultiView.ActiveViewIndex = 7;
                ImageLinkInsert.Visible = ImageLinkEdit.Visible = ImageLinkDelete.Visible = false;
            }
        }
        catch
        {
            AdminPermissionForGroupProblemErrorLable0.Visible = true;
        }
    }
    protected void ImageLink_Click(object sender, EventArgs e)
    {
        DefaultMultiView.ActiveViewIndex = 6;
    }
    protected void ImageLinkButtonInsert_Click(object sender, EventArgs e)
    {
        try
        {
            valuevalidator.Visible = valuevalidator0.Visible = valuevalidator1.Visible = false;
            if (ImageLink1.Text == "")
                valuevalidator.Visible = true;
            else if (imageLink2.Text == "")
                valuevalidator0.Visible = true;
            else if (ImageLink3.Text == "")
                valuevalidator1.Visible = true;
            else
            {
                ImageLinkSqlDataSource.Insert();
                ImageLinkInsert.Visible = ImageLinkEdit.Visible = ImageLinkDelete.Visible = false;
            }
            ImageLink4.Text = ImageLink3.Text = imageLink2.Text = ImageLink1.Text = "";
        }
        catch { }
    }
    protected void ImageLinkButtonEdit_Click(object sender, EventArgs e)
    {
        try 
        {
            valuevalidator2.Visible = valuevalidator3.Visible = valuevalidator4.Visible = false;
            if (ImageLink5.Text == "")
                valuevalidator2.Visible = true;
            if (ImageLink6.Text == "")
                valuevalidator3.Visible = true;
            if (ImageLink7.Text == "")
                valuevalidator4.Visible = true;
            ImageLinkSqlDataSource.Update();
            ImageLinkInsert.Visible = ImageLinkEdit.Visible = ImageLinkDelete.Visible = false;
            ImageLink7.Text = ImageLink8.Text = ImageLink5.Text = ImageLink6.Text = "";
        }
        catch { }
    }
    protected void Button1_Click1(object sender, EventArgs e)
    {
        ImageLinkInsert.Visible = true;
        valuevalidator.Visible = valuevalidator0.Visible = valuevalidator1.Visible = false;
    }
    protected void ImgaeLinkCancel_Click(object sender, EventArgs e)
    {
        ImageLinkInsert.Visible = ImageLinkEdit.Visible = ImageLinkDelete.Visible = false;
    }
    protected void ImageLinkGridView_SelectedIndexChanged(object sender, EventArgs e)
    {
       try
        {
            valuevalidator2.Visible = valuevalidator3.Visible = valuevalidator4.Visible = false;
            ImageLinkInsert.Visible = ImageLinkEdit.Visible = ImageLinkDelete.Visible = false;
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con.Open();
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "SELECT * FROM [News-ImageLink] WHERE (ID=@ID) ";
            com.Parameters.AddWithValue("ID", ImageLinkGridView.SelectedRow.Cells[1].Text.ToString());
            SqlDataReader data = com.ExecuteReader();
            if (data.Read())
            {
                //title
                ImageLink5.Text = data["Title"].ToString();
                //adress
                ImageLink6.Text = data["LinkURL"].ToString();
                //image
                ImageLink7.Text = data["ImageURL"].ToString();
                //description
                ImageLink8.Text = data["Description"].ToString();
                //imageid
                ImageLinkID.Value = data["ID"].ToString();
                ImageLinkEdit.Visible=ImageLinkDelete.Visible = true;
            }
        }
     catch { }
    }
    protected void ImageLinkDeleteButton_Click(object sender, EventArgs e)
    {
        try
        {
            ImageLinkSqlDataSource.Delete();
            ImageLinkInsert.Visible = ImageLinkEdit.Visible = ImageLinkDelete.Visible = false;
        }
        catch { }
    }
    protected void InsertTitleCheck_Click(object sender, EventArgs e)
    {
        if (txt_Title.Text == "")
            RequiredFieldValidator2.Visible = true;
        CheckNewsGridView.Visible = true;
        CheckNewsGridView.DataBind();
    }
    protected void EditTitleCheck_Click(object sender, EventArgs e)
    {
        CheckNewsGridView0.Visible = true;
        CheckNewsGridView0.DataBind();
    }
    protected void AdminPermissionForGroupLoginButton1_Click(object sender, EventArgs e)
    {
        AdminPermissionForGroupProblemErrorLable0.Visible = false;
        try
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con.Open();
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "SELECT * FROM [Users-Users] WHERE UserID=@UserID AND Password=@Password";
            com.Parameters.AddWithValue("UserID", Session["UserID"].ToString());
            com.Parameters.AddWithValue("Password", AdminPermissionForGroupPasswordTextBox1.Text);
            SqlDataReader data = com.ExecuteReader();
            if (data.Read())
            {
                DefaultMultiView.ActiveViewIndex = 9;
            }
        }
        catch
        {
            AdminPermissionForGroupProblemErrorLable0.Visible = true;
        }
    }
    protected void UsersNewsButton_Click(object sender, EventArgs e)
    {
        DefaultMultiView.ActiveViewIndex = 8;
    }
    protected void btn_UsersNewsSend_Click(object sender, EventArgs e)
    {
        UsersNewsToHiddenField.Value = UsersNewsDropDownList.SelectedItem.Text;
        UsersNewsTitleHiddenField.Value = TitleDropDownList.SelectedItem.Text;
        ConverstationSqlDataSource.Insert();
        UsersNewsCautionValueTextBox.Text = string.Empty;
    }
}
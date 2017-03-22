using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Drawing;
using System.Drawing.Imaging;



public partial class USERS_LoggedIn_Admin_Manager_Default : WebsitePage
{
    private void reset()
    {
        DeleteMultiPlace.Enabled = false;
        LoginDatesSqlDataSource.DataBind();
        FullnameSqlDataSource.DataBind();
        LoginDatesGridView.DataBind();
        LoginDatesListBox.DataBind();
        MainTypeViewEditMainTypeDescriptionTextBox.Text = MainTypeViewEditMainTypeMainTypeTextBox.Text = string.Empty;
        MainTypeViewDeleteMainTypeDescriptionTextBox.Text = MainTypeViewDeleteMainTypeMainTypeTextBox.Text = string.Empty;
        TypeViewEditTypeDescriptionTextBox.Text = TypeViewEditTypeTypeTextBox.Text = string.Empty;
        TypeViewDeleteTypeTypeTextBox.Text = TypeViewDeleteTypeMainTypeTextBox.Text = TypViewDeleteTypeDescriptionTextBox.Text = string.Empty;
        EditMainTypeDropDownList.DataBind();
        EditTypeDropDownList.DataBind();
        InsertMainTypeDropDownList.DataBind();
        InsertTypeDropDownList.DataBind();
        TypeViewEditTypeMaintTypeDropDownList.DataBind();
        DefaultGridView.DataBind();
        MainTypeViewGridView.DataBind();
        TypeViewGridView.DataBind();
        TypeViewSqlDataSource.DataBind();
        TypeViewInsertTypeMainTypeSqlDataSource.DataBind();
        TypeViewEditTypeMainTypeSqlDataSource.DataBind();
        MainTypeViewSQLDataSource.DataBind();
        MainTypeSqlDataSource.DataBind();
        InsertTypeSqlDataSource.DataBind();
        DefaultSqlDataSource.DataBind();
        EditTypeSqlDataSource.DataBind();
        MainTypeViewDeleteMainTypeDescriptionTextBox.Text = MainTypeViewDeleteMainTypeMainTypeTextBox.Text = string.Empty;
        MainTypeViewDeleteMainTypePanel.Enabled = false;
        MainTypeViewChooseItemErrorLable.Visible = false;
        MainTypeViewDeleteError.Visible = false;
        MainTypeViewDeleteMainTypePanel.Enabled = false;
        MainTypeViewEditMainTypePanel.Enabled = false;
        MainTypeViewEditError.Visible = false;
        MainTypeViewInsertMainTypePanel.Enabled = true;
        MainTypeViewInsertMainTypeDescriptionTextBox.Text = MainTypeViewInsertMainTypeMainTypeTextBox.Text = string.Empty;
        Delete.Enabled = Edit.Enabled = MultiPlace.Enabled = false;
        DeleteError.Visible = InsertError.Visible = EditError.Visible = false;
        TypeViewDeleteTypeError.Visible = false; TypeViewEditError.Visible = false; TypeViewInsertError.Visible = false;
        MainTypeViewInsertError.Visible = false; MainTypeViewInsertMainTypePanel.Enabled = false; MainTypeViewDeleteMainTypePanel.Enabled = false; MainTypeViewInsertMainTypePanel.Enabled = false;
        ChooseItemErrorLable.Visible = false;
        TypeViewEditError.Visible = TypeViewInsertError.Visible = false;
        DeleteUsernameTextbox.Text = EditUsernameTextbox.Text = DeleteFirstnameTextBox.Text = EditFirstnameTextBox.Text = DeleteLastnameTextBox.Text = EditLastnameTextBox.Text = DeleteMainTypeTextbox.Text = EditMainTypeTextBox.Text = DeleteTypeTextbox.Text = EditPasswordTextBox.Text = EditTypeTextBox.Text = DeleteDescriptionTextBox.Text = EditDescriptionTextBox.Text = DeleteUserIDHiddenField.Value = EditUserIDHiddenField.Value = string.Empty;
        TypeViewInsertPanel.Enabled = TypeViewEditPanel.Enabled = TypeViewDeletePanel.Enabled = false;
        DeleteTypeButton.Enabled = EditTypeButton.Enabled = false;
        DefaultGridView.DataBind(); TypeViewGridView.DataBind();
    }
    private void checkdatabase()
    {
        try
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con.Open();
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "SELECT * FROM [Users-Users] WHERE [UserID]=@UserID";
            com.Parameters.AddWithValue("UserID", DefaultGridView.SelectedRow.Cells[6].Text);
            SqlDataReader data = com.ExecuteReader();
            if (data.Read())
            {
                DeleteUsernameTextbox.Text = data["Username"].ToString();
                EditUsernameTextbox.Text = data["Username"].ToString();
                DeleteFirstnameTextBox.Text = data["Firstname"].ToString();
                EditFirstnameTextBox.Text = data["Firstname"].ToString();
                DeleteLastnameTextBox.Text = data["Lastname"].ToString();
                EditLastnameTextBox.Text = data["Lastname"].ToString();
                DeleteMainTypeTextbox.Text = data["MainType"].ToString();
                EditMainTypeTextBox.Text = data["MainType"].ToString();
                DeleteTypeTextbox.Text = data["Type"].ToString();
                EditPasswordTextBox.Text = data["Password"].ToString();
                EditTypeTextBox.Text = data["Type"].ToString();
                DeleteDescriptionTextBox.Text = data["Description"].ToString();
                EditDescriptionTextBox.Text = data["Description"].ToString();
                DeleteUserIDHiddenField.Value = data["UserID"].ToString();
                EditUserIDHiddenField.Value = data["UserID"].ToString();
            }
        }
        catch
        {
            ChooseItemErrorLable.ForeColor = Color.Red;
            ChooseItemErrorLable.Visible = true;
        }
    }
    private void checkTypeDatabase()
    {
        try
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con.Open();
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "SELECT * FROM [Users-Type] WHERE [Type]=@Type";
            com.Parameters.AddWithValue("Type", TypeViewGridView.SelectedRow.Cells[1].Text);
            SqlDataReader data = com.ExecuteReader();
            if (data.Read())
            {
                TypeViewDeleteTypeMainTypeTextBox.Text = data["MainType"].ToString();
                TypViewDeleteTypeDescriptionTextBox.Text = data["Description"].ToString();
                TypeViewDeleteTypeTypeTextBox.Text = data["Type"].ToString();
                TypeViewEditTypeTypeTextBox.Text = data["Type"].ToString();
                TypeViewEditTypeDescriptionTextBox.Text = data["Description"].ToString();
                TypeViewSelectedTypeHiddenField.Value = data["Type"].ToString();
            }
        }
        catch
        {
            TypeViewChooseItemErrorLable.ForeColor = Color.Red;
            TypeViewChooseItemErrorLable.Visible = true;
        }
    }
    private void checkmaintypedatabase()
    {
        try
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con.Open();
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "SELECT * FROM [Users-MainType] WHERE [MainType]=@MainType";
            com.Parameters.AddWithValue("MainType", MainTypeViewGridView.SelectedRow.Cells[1].Text);
            SqlDataReader data = com.ExecuteReader();
            if (data.Read())
            {
                MainTypeViewSelectedMainTypeHiddenField.Value = data["MainType"].ToString();
                MainTypeViewEditMainTypeDescriptionTextBox.Text = data["Description"].ToString();
                MainTypeViewEditMainTypeMainTypeTextBox.Text = data["MainType"].ToString();
                MainTypeViewDeleteMainTypeMainTypeTextBox.Text = data["MainType"].ToString();
                MainTypeViewDeleteMainTypeDescriptionTextBox.Text = data["Description"].ToString();
            }
        }
        catch
        {
            MainTypeViewChooseItemErrorLable.ForeColor = Color.Red;
            MainTypeViewChooseItemErrorLable.Visible = true;
        }
    }
    protected void Page_Prerender(object sender, EventArgs e)
    {
        /*
        UploadUsersImageGridView.DataBind();
        DirectoryInfo d = new DirectoryInfo(Server.MapPath("~/App_Data/Users/"));
        FileInfo[] files = d.GetFiles();
        foreach (var file in files)
        {
            TableCell tc = new TableCell();
            tc.Text = String.Format("<img src=\"/App_Handler/UsersImageThumb.ashx?fn={0}\">", file.Name);
            TableRow tr = new TableRow();
            tr.Cells.Add(tc);
            UsersImagesUploadTable.Rows.Add(tr);
        }
        */
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        DefaultMultiView.ActiveViewIndex = 1;
    }
    protected void InsertMainTypeDropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        InsertTypeDropDownList.DataBind();
    }
    protected void Cancel_Click(object sender, EventArgs e)
    {
        InsertDescriptionTextBox.Text = InsertFirstnameTextBox.Text = InsertIsOnlineHiddenFiled.Value = InsertFullnameHiddenField.Value = InsertLastloginDateHiddenField.Value = InsertLastnameTextBox.Text = InsertPasswordTextBox.Text = InsertRandomNumberHiddenField.Value = InsertUsernameTextbox.Text = string.Empty; DefaultMultiView.ActiveViewIndex = 0;
    }
    protected void InsertButton_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con.Open();
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "SELECT * FROM [Users-Users] WHERE Username=@Username ";
            com.Parameters.AddWithValue("Username", InsertUsernameTextbox.Text);
            SqlDataReader data = com.ExecuteReader();
            if (data.Read())
            {
                InsertUsernameTextbox.Text = "";
            }
            else
            {
                Random r = new Random();
                InsertIsOnlineHiddenFiled.Value = "False";
                InsertLastloginDateHiddenField.Value = "FirstLogin " + DateTime.Now.ToLongTimeString();
                int randomnumber = r.Next();
                InsertRandomNumberHiddenField.Value = Convert.ToString(randomnumber);
                InsertFullnameHiddenField.Value = InsertFirstnameTextBox.Text.ToString() + " " + InsertLastnameTextBox.Text.ToString();
                DefaultSqlDataSource.Insert();
                DefaultMultiView.ActiveViewIndex = 0;
            }
        }

        catch
        {
            InsertError.ForeColor = System.Drawing.Color.Red;
            InsertError.Visible = true;
        }
    }
    protected void DefaultGridView_SelectedIndexChanged(object sender, EventArgs e)
    {
        checkdatabase();
        Edit.Enabled = Delete.Enabled = MultiPlace.Enabled = true;
    }
    protected void Delete_Click(object sender, EventArgs e)
    {
        reset();
        checkdatabase();
        DefaultMultiView.ActiveViewIndex = 3;
    }
    protected void Edit_Click(object sender, EventArgs e)
    {
        reset();
        checkdatabase();
        DefaultMultiView.ActiveViewIndex = 2;
    }
    protected void DeleteButton_Click(object sender, EventArgs e)
    {
        try
        {
            DefaultSqlDataSource.Delete();
            DefaultMultiView.ActiveViewIndex = 0;
            Delete.Enabled = Edit.Enabled = false;
        }
        catch
        {
            DeleteError.ForeColor = System.Drawing.Color.Red;
            DeleteError.Visible = true;
        }

    }
    protected void EditButton_Click(object sender, EventArgs e)
    {
        try
        {
            EditFullnameHiddenField.Value = EditFirstnameTextBox.Text.ToString() + " " + EditLastnameTextBox.Text.ToString();
            DefaultSqlDataSource.Update();
            DefaultMultiView.ActiveViewIndex = 0;
        }
        catch
        {
            EditError.ForeColor = System.Drawing.Color.Red;
            EditError.Visible = true;
        }
    }
    protected void EditMainTypeDropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        EditTypeDropDownList.DataBind();
    }
    protected void Type_Click(object sender, EventArgs e)
    {
        TypeViewInserTypeMainTypeDrpDownList.DataBind(); TypeViewEditTypeMaintTypeDropDownList.DataBind();
        TypeViewGridView.DataBind();
        TypeViewSqlDataSource.DataBind();
        reset();
        DefaultMultiView.ActiveViewIndex = 4;
    }
    protected void MainType_Click(object sender, EventArgs e)
    {
        reset();
        DefaultMultiView.ActiveViewIndex = 5;
    }
    protected void TypeViewGridView_SelectedIndexChanged(object sender, EventArgs e)
    {
        checkTypeDatabase();

        EditTypeButton.Enabled = DeleteTypeButton.Enabled = true;
    }
    protected void BackToDefaultPage_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/App_USERS/LoggedIn/Default.aspx");
    }
    protected void Back_Click(object sender, EventArgs e)
    {
        DefaultMultiView.ActiveViewIndex = 0;
        reset();
    }
    protected void InsertTypeButton_Click(object sender, EventArgs e)
    {
        reset();
        TypeViewInsertPanel.Enabled = true;
    }
    protected void EditTypeButton_Click(object sender, EventArgs e)
    {
        reset();
        checkTypeDatabase();
        TypeViewEditPanel.Enabled = true;
    }
    protected void DeleteTypeButton_Click(object sender, EventArgs e)
    {
        reset();
        checkTypeDatabase();
        TypeViewDeletePanel.Enabled = true;
    }
    protected void TypeViewInsertButton_Click(object sender, EventArgs e)
    {
        try
        {
            TypeViewSqlDataSource.Insert();
            reset();
        }
        catch
        {
            TypeViewInsertError.ForeColor = Color.Red;
            TypeViewInsertError.Visible = true;
        }
    }
    protected void TypeViewEditButton_Click(object sender, EventArgs e)
    {
        try
        {
            TypeViewSqlDataSource.Update();
            reset();
        }
        catch
        {
            TypeViewEditError.ForeColor = Color.Red;
            TypeViewEditError.Visible = true;
        }
    }
    protected void TypeViewDeleteButton_Click(object sender, EventArgs e)
    {
        try
        {
            TypeViewSqlDataSource.Delete();
            reset();
        }
        catch
        {
            TypeViewDeleteTypeError.ForeColor = Color.Red;
            TypeViewDeleteTypeError.Visible = true;
        }
    }
    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {
        reset();
        checkmaintypedatabase();
        EditMainTypeButton.Enabled = DeleteMainTypeButton.Enabled = true;
    }
    protected void InsertMainTypeButton_Click(object sender, EventArgs e)
    {
        MainTypeViewInsertMainTypePanel.Enabled = true;
    }
    protected void EditMainTypeButton_Click(object sender, EventArgs e)
    {
        reset();
        checkmaintypedatabase();
        MainTypeViewEditMainTypePanel.Enabled = true;
    }
    protected void DeleteMainButton_Click(object sender, EventArgs e)
    {
        reset();
        checkmaintypedatabase();
        MainTypeViewDeleteMainTypePanel.Enabled = true;
    }
    protected void MainTypeViewEditButton_Click(object sender, EventArgs e)
    {
        try
        {
            MainTypeViewSQLDataSource.Update();
            reset();
        }
        catch
        {
            MainTypeViewEditError.ForeColor = Color.Red;
            MainTypeViewEditError.Visible = true;
        }
    }
    protected void MainTypeViewEditButton0_Click(object sender, EventArgs e)
    {
        try
        {
            MainTypeViewSQLDataSource.Delete();
            reset();
        }
        catch
        {


            MainTypeViewDeleteError.ForeColor = Color.Red;
            MainTypeViewDeleteError.Visible = true;
        }
    }
    protected void MainTypeViewInsertButton_Click(object sender, EventArgs e)
    {
        try
        {
            MainTypeViewSQLDataSource.Insert();
            reset();
        }
        catch
        {


            MainTypeViewInsertError.ForeColor = Color.Red;
            MainTypeViewInsertError.Visible = true;
        }
    }
    protected void LoginDates_Click(object sender, EventArgs e)
    {
        DefaultMultiView.ActiveViewIndex = 6;
    }
    protected void LoginDatesListBox_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoginDatesGridView.DataBind();
    }
    protected void LoginDatesViewDeleteLoginDates_Click(object sender, EventArgs e)
    {
        LoginDatesSqlDataSource.Delete();
    }
    protected void MultiPlace_Click(object sender, EventArgs e)
    {
        DefaultMultiView.ActiveViewIndex = 7;
    }
    protected void MultiPlaceListBox_SelectedIndexChanged(object sender, EventArgs e)
    {
    }
    protected void InsertTypeDropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Page_Load(object sender, EventArgs e)
    {
        AdminsNews.NavigateUrl = "~/App_USERS/LoggedIn/Admin/Manager/AdminsNews.aspx";
        AppErrors.NavigateUrl = "~/App_USERS/LoggedIn/Admin/Manager/AppErrors.aspx";
    }
}
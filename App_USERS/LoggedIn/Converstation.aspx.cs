using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

public partial class USERS_LoggedIn_Converstation : WebsitePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        FromFullnameLable.Text = Session["Fullname"].ToString();
        FromIdLable.Text = Session["UserID"].ToString();
    }
    protected void Cancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/App_USERS/LoggedIn/Default.aspx");
    }
    protected void DefaultGridView_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT * FROM [Users-Converstation] WHERE ID=@ID";
        com.Parameters.AddWithValue("ID", DefaultGridView.SelectedRow.Cells[1].Text.ToString());
        SqlDataReader data = com.ExecuteReader();
        if (data.Read())
        {
            IDHiddenField.Value = data["ID"].ToString();
            lbl_Title.Text = data["Title"].ToString();
            hf_From.Value = data["FromFullname"].ToString();
            hf_To.Value = data["ToFullname"].ToString();
            hf_FromId.Value = data["FromId"].ToString();
            hf_ToId.Value = data["ToId"].ToString();
            ConverstationSqlDataSource.DataBind();
            DefaultMultiView.ActiveViewIndex = 1;
        }
    }
    protected void Cancel0_Click(object sender, EventArgs e)
    {
        DefaultMultiView.ActiveViewIndex = 0;
    }
    protected void Databind_Click(object sender, EventArgs e)
    {
        ConverstationGridView.DataBind();
    }
    public void reset()
    {
        emptyvalidator.Visible =emptyvalidator0.Visible=emptyvalidator1.Visible= false;
        DefaultGridView.DataBind();
        ConverstationGridView.DataBind();
        TitleTextBox.Text = SendTextBox.Text = ValueTextBox.Text = string.Empty;
    }
    protected void SendButton_Click(object sender, EventArgs e)
    {
        try
        {
            if (TitleTextBox.Text != "")
            {
                lbl_Title.Text = TitleTextBox.Text;
            }
            else emptyvalidator0.Visible = true;
            if (ValueTextBox.Text != "")
            { //nothing 
            }
            else emptyvalidator1.Visible = true;
            ConverstationSqlDataSource.Insert();
            reset();
            DefaultMultiView.ActiveViewIndex = 1;
        }
        catch { }
    }
    protected void Start_Click(object sender, EventArgs e)
    {
        DefaultMultiView.ActiveViewIndex = 2;
    }
    protected void Delete_Click(object sender, EventArgs e)
    {
        ConverstationSqlDataSource.Delete();
        reset();
        DefaultMultiView.ActiveViewIndex = 0;
    }
    protected void SendMessage_Click(object sender, EventArgs e)
    {
        try
        {
            if (SendTextBox.Text != "")
            {
                SendMessageSqlDataSource.Insert();
                reset();
            }
            else
            {
                emptyvalidator.Visible = true;
            }
        }
        catch { }
    }
}
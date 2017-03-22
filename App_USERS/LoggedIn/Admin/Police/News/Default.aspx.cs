using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;


public partial class USERS_LoggedIn_Admin_Police_News_Default :WebsitePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Comments_Click(object sender, EventArgs e)
    {
        DefaultMultiView.ActiveViewIndex = 1;
    }
    protected void btn_Back_Click(object sender, EventArgs e)
    {
        DefaultMultiView.ActiveViewIndex = 0;
    }
    protected void btn_BackToPoliceDefault_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/App_USERS/LoggedIn/Admin/Police/Default.aspx");
    }
    protected void btn_Confirm_Click(object sender, EventArgs e)
    {
        foreach (ListItem i in CommentSelectedDataList.Items)
        {    
            //find news comment
            SqlConnection con1 = new SqlConnection();
            con1.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con1.Open();
            SqlCommand com1 = new SqlCommand();
            com1.Connection = con1;
            com1.CommandText = "SELECT * FROM [Police-Comment] WHERE (ID=@ID)";
            com1.Parameters.AddWithValue("ID", i.Text);
            SqlDataReader data1 = com1.ExecuteReader();
            if (data1.Read())
            {
                hf_InsertCommentID.Value = data1["ID"].ToString();
                hf_InsertCommentNewsID.Value = data1["NewsID"].ToString();
                hf_InsertCommentValue.Value = data1["Value"].ToString();
                hf_InsertCommentEmail.Value = data1["Email"].ToString();
            }
            //Confirm
            PoliceNewsCommentSqlDataSource.Delete();
            NewsCommentSqlDataSource.Insert();
            CommentGridView.DataBind();
        }
        CommentSelectedDataList.Items.Clear();
    }
    protected void btn_Reject_Click(object sender, EventArgs e)
    {
        foreach (ListItem i in CommentSelectedDataList.Items)
        {

            SqlConnection con1 = new SqlConnection();
            con1.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con1.Open();
            SqlCommand com1 = new SqlCommand();
            com1.Connection = con1;
            com1.CommandText = "SELECT * FROM [Police-Comment] WHERE ID=@ID";
            com1.Parameters.AddWithValue("ID", i.Text);
            SqlDataReader data1 = com1.ExecuteReader();
            if (data1.Read())
            {
                hf_InsertCommentID.Value = data1["ID"].ToString();
                hf_InsertCommentNewsID.Value = data1["NewsID"].ToString();
                hf_InsertCommentValue.Value = data1["Value"].ToString();
                hf_InsertCommentEmail.Value = data1["Email"].ToString();
            }
            //Confirm
            PoliceNewsCommentSqlDataSource.Delete();
            CommentGridView.DataBind();
        }
        CommentSelectedDataList.Items.Clear();
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {

    }
    protected void btn_AcceptCommentSelection_Click(object sender, EventArgs e)
    {
        CommentGridView.AllowPaging = true;
        CommentSelectedDataList.Items.Clear();
        foreach (GridViewRow row in CommentGridView.Rows)
        {
            CheckBox ck = ((CheckBox)row.FindControl("SelectCheckBox"));
            if (ck.Checked)
            {
                CommentSelectedDataList.Items.Add(ck.Text);
            }
        }
    }
}
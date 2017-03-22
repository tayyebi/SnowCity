using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

public partial class SocialNetworking_CMS_View_Post : SocialNetworkingPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    private void next()
    {
        mv_Default.ActiveViewIndex++;
        gv_Default.DataBind();
    }
    private void prev()
    {
        mv_Default.ActiveViewIndex--;
        gv_Default.DataBind();
    }
    protected void gv_Default_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        con.Open();
        SqlCommand com = new SqlCommand();
        com.CommandText = "SELECT * FROM [Social-Post] WHERE (PostID=@PostID)";
        com.Parameters.AddWithValue("PostID", gv_Default.SelectedRow.Cells[1].Text.ToString());
        lbl_PostID.Text = gv_Default.SelectedRow.Cells[1].Text.ToString();
        com.Connection = con;
        SqlDataReader data = com.ExecuteReader();
        if (data.Read())
        {
            lbl_title.Text = data["Title"].ToString();
            lbl_value.Text = data["Value"].ToString();
            lbl_time.Text = data["Time"].ToString();
            lbl_date.Text = data["Date"].ToString();
            try
            {
                lbl_likes.Text = SocialNetworkingPost.GetPostLikes(data["PostID"].ToString());
                lbl_hates.Text = SocialNetworkingPost.GetPostHates(data["PostID"].ToString());
            }
            catch
            {
                lbl_hates.Text = lbl_likes.Text = "_";
            }
        }
        next();
    }
    protected void btn_back_Click(object sender, EventArgs e)
    {
        lbl_title.Text = lbl_value.Text = lbl_time.Text = lbl_date.Text = lbl_likes.Text = lbl_hates.Text = "";
        prev();
    }
    protected void btn_next_Click(object sender, EventArgs e)
    {
        txt_value.Text = lbl_value.Text;
        txt_title.Text = lbl_title.Text;
        txt_PostID.Text = lbl_PostID.Text;
        next();
    }
    protected void btn_delete_Click(object sender, EventArgs e)
    {
        SocialNetworkingPost.deletePost(txt_PostID.Text);
        mv_Default.ActiveViewIndex = 0;
    }
    protected void btn_cancel_Click(object sender, EventArgs e)
    {
        prev();
        txt_title.Text = txt_value.Text = string.Empty;
    }
    protected void btn_edit_Click(object sender, EventArgs e)
    {
        SocialNetworkingPost.editPost(txt_PostID.Text, txt_title.Text, ddl_permission.SelectedValue.ToString(), txt_value.Text);
        mv_Default.ActiveViewIndex = 0;
    }
}
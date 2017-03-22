using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Drawing;
using System.Web.UI.WebControls;

public partial class SocialNetworking_CMS_CMS_Post : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btn_Next_Click(object sender, EventArgs e)
    {
        btn_Next.Text = "مرحله بعد";
        btn_Next.ForeColor = Color.Black;
        if (txt_Title.Text != "")
        {
            if (txt_Value.Text != "")
            {
                lbl_Value.Text = txt_Value.Text;
                lbl_Title.Text = txt_Title.Text;
                mv_Post.ActiveViewIndex++;
            }
            else
            {
                btn_Next.Text = "لطفا متنی در پست خود بنویسید و سپس اینجا کلیک کنید!";
                btn_Next.ForeColor = Color.Red;
            }
        }
        else
        {
            btn_Next.Text = "لطفا عنوانی برای پست خود انتخاب کنید و سپس اینجا کلیک کنید!";
            btn_Next.ForeColor = Color.Red;
        }
    }
    protected void btn_Back_Click(object sender, EventArgs e)
    {
        mv_Post.ActiveViewIndex--;
    }
    protected void btn_send_Click(object sender, EventArgs e)
    {
        try
        {
            SocialNetworkingPost.SendNewPost(Session["username"].ToString(), lbl_Title.Text.ToString(), lbl_Value.Text.ToString());
            SocialNetworkingPost.GetLastPost(lbl_Title.Text, Session["username"].ToString());
            if (SocialNetworkingPost.PostID != "Empty")
            {
                SocialNetworkingPost.AddPostPermission(SocialNetworkingPost.PostID.ToString(), ddl_Permission.SelectedItem.Value.ToString());
                Response.Redirect("~/SocialNetworking/CMS/CMS-Default.aspx");
            }
        }
        catch
        {

        }
    }
}
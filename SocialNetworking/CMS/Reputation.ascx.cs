using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class SocialNetworking_CMS_Likes : System.Web.UI.UserControl
{
    private string _PostID;
    public string PostID
    {
        get { return _PostID; }
        set
        {
            _PostID = value;
            try
            {
                lbl_Likes.Text = SocialNetworkingPost.GetPostLikes(PostID);
                lbl_Hates.Text = SocialNetworkingPost.GetPostHates(PostID);
            }
            catch {
                lbl_Hates.Text = lbl_Likes.Text = "_";
            }
        }
    }
}
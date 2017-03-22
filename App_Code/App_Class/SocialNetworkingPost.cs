using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.HtmlControls;
using System.Web.Configuration;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text.RegularExpressions;

public class SocialNetworkingPost : System.Web.UI.Page
{
	public SocialNetworkingPost()
	{
	}
    #region SendNewPost
    static public void SendNewPost(string username, string Title, string Value)
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString=ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "INSERT INTO [Social-Post] (username,Title,Value,[time],[date]) VALUES (@username,@Title,@Value,@Time,@Date)";
        com.Parameters.AddWithValue("username", username);
        com.Parameters.AddWithValue("Title", Title);
        com.Parameters.AddWithValue("Value", Value);
        com.Parameters.AddWithValue("Date", DateTime.Now.ToLongDateString());
        com.Parameters.AddWithValue("Time", DateTime.Now.ToLongTimeString());
        com.ExecuteNonQuery();
        con.Close();
    }
    #endregion
    #region AddPostPermission
    static public void AddPostPermission(string PostID,string Permission)
    {
        SqlConnection con1 = new SqlConnection();
        con1.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        con1.Open();
        SqlCommand com1 = new SqlCommand();
        com1.CommandText = "DELETE FROM [Social-PostPermission] WHERE (PostID=@PostID)";
        com1.Parameters.AddWithValue("PostID", PostID);
        com1.Connection = con1;
        com1.ExecuteNonQuery();
        con1.Close();
        SqlConnection con2 = new SqlConnection();
        con2.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        con2.Open();
        SqlCommand com2 = new SqlCommand();
        com2.Connection = con2;
        com2.CommandText = "INSERT INTO [Social-PostPermission] (PostID,Permission) Values (@PostID,@Permission)";
        com2.Parameters.Add("PostID", PostID);
        com2.Parameters.Add("Permission", Permission);
        com2.ExecuteNonQuery();
        con2.Close();
    }
    #endregion
    #region GetLastPost
    static public string PostID="Empty";
    static public void GetLastPost(string Title,string username)
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText="SELECT * FROM [Social-Post] WHERE (Title=@Title) AND (username=@username) ORDER BY [PostID] DESC";
        com.Parameters.AddWithValue("username",username);
        com.Parameters.AddWithValue("Title", Title);
        SqlDataReader data = com.ExecuteReader();
        if (data.Read())
            PostID = data["PostID"].ToString();
        else if (!data.Read())
            PostID = "Empty";
    }
    #endregion
    #region GetUsernamePermissionToOtherUsername
    static public string UsernamePermission = "NoData";
    static public void GetUserPermission(string TheUsername, string ForUsername)
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT * FROM [Social-Permission] WHERE (TheUsername=@TheUsername) AND (ForUsername=@ForUsername)";
        com.Parameters.AddWithValue("TheUsername", TheUsername);
        com.Parameters.AddWithValue("ForUsername", ForUsername);
        SqlDataReader data = com.ExecuteReader();
        if (data.Read())
        {
            UsernamePermission = data["Permission"].ToString();
        }
        else if (!data.Read())
            UsernamePermission = "NoData";
    }
    #endregion
    #region GetPostPermission
    static public string PostPermission = "NoData";
    static public void GetPostPermission(string PostID)
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT * FROM [Social-PostPermission] WHERE (PostID=@PostID)";
        com.Parameters.AddWithValue("PostID", PostID);
        SqlDataReader data = com.ExecuteReader();
        if (data.Read())
            PostPermission = data["Permission"].ToString();
        else if (!data.Read())
            PostPermission = "NoData";
    }
    #endregion
    #region ReadPost
    static public string GetPostLikes(string _PostId)
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT ForPostID FROM [Social-Post-Like] WHERE (ForPostID=@ForPostID)";
        com.Parameters.AddWithValue("ForPostID", _PostId);
        SqlDataReader data = com.ExecuteReader();
        int i = 0;
        if (data.HasRows)
        {
            while (data.Read())
            {
                i++;
            }
            return i.ToString();
        }
        return i.ToString();
    }
    static public string GetPostHates(string _PostId)
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT ForPostID FROM [Social-Post-Hate] WHERE (ForPostID=@ForPostID)";
        com.Parameters.AddWithValue("ForPostID", _PostId);
        SqlDataReader data = com.ExecuteReader();
        int i = 0;
        if (data.HasRows)
        {
            while (data.Read())
            {
                i++;
            }
            return i.ToString();
        }
        return i.ToString();
    }
    static public string GetPostTitle(string _PostId)
    {
        string output = _PostId.ToString();
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT Title FROM [Social-Post] WHERE (PostID=@PostID)";
        com.Parameters.AddWithValue("PostID", _PostId);
        SqlDataReader data = com.ExecuteReader();
        if (data.Read())
        {
            output = data["Title"].ToString();
        }
        else
        {
            output = "404";
        }
        return output;
    }
    static public string GetPostUsername(string _PostId)
    {
        string output = _PostId.ToString();
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT Username FROM [Social-Post] WHERE (PostID=@PostID)";
        com.Parameters.AddWithValue("PostID", _PostId);
        SqlDataReader data = com.ExecuteReader();
        if (data.Read())
        {
            output = data["Username"].ToString();
        }
        else
        {
            output = "404";
        }
        return output;
    }
    static public string GetPostDate(string _PostId)
    {
        string output = _PostId.ToString();
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT Date FROM [Social-Post] WHERE (PostID=@PostID)";
        com.Parameters.AddWithValue("PostID", _PostId);
        SqlDataReader data = com.ExecuteReader();
        if (data.Read())
        {
            output = data["Date"].ToString();
        }
        else
        {
            output = "404";
        }
        return output;
    }
    static public string GetPostTime(string _PostId)
    {
        string output = _PostId.ToString();
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT Time FROM [Social-Post] WHERE (PostID=@PostID)";
        com.Parameters.AddWithValue("PostID", _PostId);
        SqlDataReader data = com.ExecuteReader();
        if (data.Read())
        {
            output = data["Time"].ToString();
        }
        else
        {
            output = "404";
        }
        return output;
    }

    static public string GetPostValue(string _PostId)
    {
        string output = _PostId.ToString();
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT Value FROM [Social-Post] WHERE (PostID=@PostID)";
        com.Parameters.AddWithValue("PostID", _PostId);
        SqlDataReader data = com.ExecuteReader();
        if (data.Read())
        {
            output = data["Value"].ToString();
        }
        else
        {
            output = "404";
        }
        return output;
    }
    #endregion
    #region Set reputation
    static public void UnVote(string username,string PostID)
    {
        //delete like
        SqlConnection con_like = new SqlConnection();
        con_like.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        con_like.Open();
        SqlCommand com_like = new SqlCommand();
        com_like.Connection = con_like;
        com_like.CommandText = "DELETE FROM [Social-Post-Like] WHERE (LikeFromUsername=@Username) AND (ForPostID=@PostID)";
        com_like.Parameters.AddWithValue("Username", username);
        com_like.Parameters.AddWithValue("PostID", PostID);
        com_like.ExecuteNonQuery();
        con_like.Close();
        //delete hate
        SqlConnection con_Hate = new SqlConnection();
        con_Hate.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        con_Hate.Open();
        SqlCommand com_Hate = new SqlCommand();
        com_Hate.Connection = con_Hate;
        com_Hate.CommandText = "DELETE FROM [Social-Post-Hate] WHERE (HateFromUsername=@Username) AND (ForPostID=@PostID)";
        com_Hate.Parameters.AddWithValue("Username", username);
        com_Hate.Parameters.AddWithValue("PostID", PostID);
        com_Hate.ExecuteNonQuery();
        con_Hate.Close();
    }
    static public bool IsUserVoted(string username, string PostID)
    {
        bool output = false;
        SqlConnection con_like = new SqlConnection();
        con_like.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        con_like.Open();
        SqlCommand com_like = new SqlCommand();
        com_like.Connection = con_like;
        com_like.CommandText = "SELECT ForPostID FROM [Social-Post-Like] WHERE (LikeFromUsername=@Username) AND (ForPostID=@PostID)";
        com_like.Parameters.AddWithValue("Username", username);
        com_like.Parameters.AddWithValue("PostID", PostID);
        SqlDataReader data_like = com_like.ExecuteReader();
        if (data_like.Read())
        {
            output = true;
        }
        con_like.Close();
        data_like.Close();
        SqlConnection con_hate = new SqlConnection();
        con_hate.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        con_hate.Open();
        SqlCommand com_hate = new SqlCommand();
        com_hate.Connection = con_hate;
        com_hate.CommandText = "SELECT ForPostID FROM [Social-Post-Hate] WHERE (HateFromUsername=@Username) AND (ForPostID=@PostID)";
        com_hate.Parameters.AddWithValue("Username", username);
        com_hate.Parameters.AddWithValue("PostID", PostID);
        SqlDataReader data_hate = com_hate.ExecuteReader();
        if (data_hate.Read())
        {
            output = true;
        }
        con_hate.Close();
        data_hate.Close();
        return output;
    }
    static public void SetLike(string FromUsername, string ToUsername, string ForPostId)
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "INSERT INTO [Social-Post-Like] (LikeFromUsername,LikeToUsername,ForPostID) VALUES (@FromUsername,@ToUsername,@ForPostID)";
        com.Parameters.AddWithValue("FromUsername", FromUsername);
        com.Parameters.AddWithValue("ToUsername", ToUsername);
        com.Parameters.AddWithValue("ForPostID", ForPostId);
        com.ExecuteNonQuery();
        con.Close();
    }
    static public void SetHate(string FromUsername, string ToUsername, string ForPostId)
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "INSERT INTO [Social-Post-Hate] (HateFromUsername,HateToUsername,ForPostID) VALUES (@FromUsername,@ToUsername,@ForPostID)";
        com.Parameters.AddWithValue("FromUsername", FromUsername);
        com.Parameters.AddWithValue("ToUsername", ToUsername);
        com.Parameters.AddWithValue("ForPostID", ForPostId);
        com.ExecuteNonQuery();
        con.Close();
    }
    #endregion
    #region editPost
    static public void editPost(string PostID, string NewTitle, string NewPermission, string NewValue)
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "UPDATE [Social-Post] SET Title=@Title, Value=@Value, [date]=@Date, [time]=@Time WHERE (PostID=@PostID)";
        com.Parameters.AddWithValue("PostID", PostID);
        com.Parameters.AddWithValue("Date", DateTime.Now.ToLongDateString());
        com.Parameters.AddWithValue("Time", DateTime.Now.ToLongTimeString());
        com.Parameters.AddWithValue("Title", NewTitle);
        com.Parameters.AddWithValue("Value", NewValue);
        AddPostPermission(PostID, NewPermission);
        com.ExecuteNonQuery();
        con.Close();
    }
    #endregion
    #region deletePost
    static public void deletePost(string PostID)
    {
        SqlConnection con1 = new SqlConnection();
        con1.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        con1.Open();
        SqlCommand com1 = new SqlCommand();
        com1.CommandText = "DELETE FROM [Social-PostPermission] WHERE (PostID=@PostID)";
        com1.Parameters.AddWithValue("PostID", PostID);
        com1.Connection = con1;
        com1.ExecuteNonQuery();
        con1.Close();
        SqlConnection con2 = new SqlConnection();
        con2.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        con2.Open();
        SqlCommand com2 = new SqlCommand();
        com2.Connection = con2;
        com2.CommandText = "DELETE FROM [Social-Post] WHERE PostID=@PostID";
        com2.Parameters.AddWithValue("PostID", PostID);
        com2.ExecuteNonQuery();
        con2.Close();
    }
    #endregion
    #region setComment
    static public void setComment(string FromUsername, string PostID, string Value)
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "INSERT INTO [Social-Comment] (PostID,FromUsername,ToUsername,Value) VALUES (@PostID,@FromUsername,@ToUsername,@Value)";
        com.Parameters.AddWithValue("PostID", PostID);
        com.Parameters.AddWithValue("FromUsername", FromUsername);
        com.Parameters.AddWithValue("ToUsername", GetPostUsername(PostID));
        com.Parameters.AddWithValue("Value", Regex.Replace(Value, @"<[^>]*>", " "));
        com.ExecuteNonQuery();
        con.Close();
    }
    #endregion
    #region deleteComment
    static public void deleteComment(string CommentID)
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "DELETE FROM [Social-Comment] WHERE (CommentID=@CommentID)";
        com.Parameters.AddWithValue("CommentID", CommentID);
        com.ExecuteNonQuery();
    }
    #endregion
    #region editComment
    static public void editComment(string CommentID,string Value)
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "UPDATE [Social-Comment] SET Value=@Value WHERE (CommentID=@CommentID)";
        com.Parameters.AddWithValue("CommentID", CommentID);
        com.Parameters.AddWithValue("Value", Regex.Replace(Value, @"<[^>]*>", " "));
        com.ExecuteNonQuery();
    }
    #endregion
    #region getCommentData
    static public string getCommentValue(string CommentID)
    {
        string output = "404";
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT Value FROM [Social-Comment] WHERE (CommentID=@CommentID)";
        com.Parameters.AddWithValue("CommentID", CommentID);
        SqlDataReader data = com.ExecuteReader();
        if (data.Read())
            output = data["Value"].ToString();
        return output;
    }
    static public string getCommentUsername(string CommentID)
    {
        string output = "404";
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT FromUsername FROM [Social-Comment] WHERE (CommentID=@CommentID)";
        com.Parameters.AddWithValue("CommentID", CommentID);
        SqlDataReader data = com.ExecuteReader();
        if (data.Read())
            output = data["FromUsername"].ToString();
        return output;

    }
    static public string getCommentReciver(string CommentID)
    {
        string output = "404";
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT ToUsername FROM [Social-Comment] WHERE (CommentID=@CommentID)";
        com.Parameters.AddWithValue("CommentID", CommentID);
        SqlDataReader data = com.ExecuteReader();
        if (data.Read())
            output = data["ToUsername"].ToString();
        return output;

    }
    #endregion
    #region Comment Answer Operations
    static public void AnswerComment(string CommentID, string PostID, string Value, string FromUsername)
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "INSERT INTO [Social-Comment-Answer] (CommentID,PostID,Value,FromUsername,ToUsername) VALUES (@CommentID,@PostID,@Value,@FromUsername,@ToUsername)";
        com.Parameters.AddWithValue("CommentID", CommentID);
        com.Parameters.AddWithValue("PostID", PostID);
        com.Parameters.AddWithValue("Value", Value);
        com.Parameters.AddWithValue("FromUsername", FromUsername);
        com.Parameters.AddWithValue("ToUsername", getCommentReciver(CommentID));
        com.ExecuteNonQuery();
        con.Close();
    }
    static public void EditCommentAnswer(string AnswerID, string newValue)
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        con.Open();
        SqlCommand com = new SqlCommand();
        com.CommandText = "UPDATE [Social-Comment-Answer] SET Value=@Value WHERE AnswerID=@AnswerID";
        com.Connection = con;
        com.Parameters.AddWithValue("AnswerID", AnswerID);
        com.Parameters.AddWithValue("Value", newValue);
        com.ExecuteNonQuery();
        con.Close();
    }
    static public void deleteCommentAnswer(string AnswerID)
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "DELETE FROM [Social-Comment-Answer] WHERE (AnswerID=@AnswerID)";
        com.Parameters.AddWithValue("AnswerID", AnswerID);
        com.ExecuteNonQuery();
        con.Close();
    }
    static public string getCommentAnswerValue(string AnswerID)
    {
        string output = "";
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        con.Open();
        SqlCommand com = new SqlCommand();
        com.CommandText = "SELECT Value FROM [Social-Comment-Answer] WHERE AnswerID=@AnswerID";
        com.Parameters.AddWithValue("AnswerID", AnswerID);
        SqlDataReader data = com.ExecuteReader();
        if (data.Read())
        {
            output = data["Value"].ToString();
        }
        else output = "404";
        con.Close();
        return output;
    }
    static public string countCommentAnswers(string CommentID)
    {
        int _output = 0;
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT AnswerID FROM [Social-Comment-Answer] WHERE (CommentID=@CommentID)";
        com.Parameters.AddWithValue("CommentID", CommentID);
        SqlDataReader data = com.ExecuteReader();
        while (data.Read())
        {
            _output++;
        }
        return _output.ToString();
    }
    #endregion
}
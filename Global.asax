<%@ Application Language="C#" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>
<%@ Import Namespace="System.Web.Routing" %>
<%@ Import Namespace="System.Web.UI.WebControls" %>
<%@ Import Namespace="System.Web.UI" %>
<%@ Import Namespace="System.Web" %>
<%@ Import Namespace="System" %>
<script runat="server">
    //void Application_Error(object sender, EventArgs e)
    //{
    //    var serverError = Server.GetLastError() as HttpException;
    //    if (null != serverError)
    //    {
    //        int errorCode = serverError.GetHttpCode();
    //        try
    //        {
    //            Response.Redirect("~/Error/" + errorCode);
    //        }
    //        catch
    //        {
    //            Response.Redirect("~/App_Errors/Default.aspx");
    //        }
    //        Server.ClearError();
    //    }
    //}
    void RegisterRoutes(RouteCollection routes)
    {
        /*     -------------------------------             Users                 -------------------------------     */
        RouteTable.Routes.MapPageRoute("Admin", "Admin/Login", "~/App_USERS/Login.aspx");
        /*     -------------------------------            Academy                -------------------------------     */
        RouteTable.Routes.MapPageRoute("AcademyDefaultPage", "Academy", "~/Default-Academy.aspx");
        /*     -------------------------------         SOCIAL NETWORKING         -------------------------------     */
        string socialnetworking = "~/SocialNetworking/";
        RouteTable.Routes.MapPageRoute("Login", "Login", socialnetworking + "Login.aspx");
        RouteTable.Routes.MapPageRoute("PostDefault", "User/{*queryvalues}", socialnetworking + "Post/Post-Default.aspx");
        /*     -------------------------------                TV                 -------------------------------     */
        RouteTable.Routes.MapPageRoute("TV", "TV", "~/Default-TV.aspx");
        /*     -------------------------------             Error                 -------------------------------     */
        RouteTable.Routes.MapPageRoute("Error", "Error/{code}", "~/App_Errors/Default.aspx", false, new RouteValueDictionary { { "code", string.Empty } });
        /*     -------------------------------              News                 -------------------------------     */
        RouteTable.Routes.MapPageRoute("NewsDefaultPage", "News", "~/Default-News.aspx");
        RouteTable.Routes.MapPageRoute("ShowNewsByTitle", "News/Title/{*queryvalues}", "~/App_Page/News/ShowNewsByTitle.aspx");
        RouteTable.Routes.MapPageRoute("ShowNewsByGroup", "News/Group/{*queryvalues}", "~/App_Page/News/ShowNewsByGroup.aspx");
        RouteTable.Routes.MapPageRoute("ShowNewsByUser", "News/User/{*queryvalues}", "~/App_Page/News/ShowNewsByUser.aspx");
        RouteTable.Routes.MapPageRoute("ShowNewsByID", "News/ID/{*queryvalues}", "~/App_Page/News/ShowNewsByID.aspx");
        RouteTable.Routes.MapPageRoute("ShowNewsInArchive", "News/Archive", "~/App_Page/News/NewsArchive.aspx");
        RouteTable.Routes.MapPageRoute("SearchNewsInArchive", "News/Search", "~/App_Page/News/NewsArchiveSearch.aspx");
        RouteTable.Routes.MapPageRoute("NewsDefaultRss", "News/Rss", "~/App_Page/News/Rss-NewsDefault.aspx");
        /*     -------------------------------          ChatRoom                 -------------------------------     */
        RouteTable.Routes.MapPageRoute("ChatRoomLogin", "ChatRoom", "~/Default-ChatRoom.aspx");
        RouteTable.Routes.MapPageRoute("ChatRoomChat", "Chat", "~/App_Page/ChatRoom/Chat/.aspx");
        /*     -------------------------------          Statistics               -------------------------------     */
        RouteTable.Routes.MapPageRoute("Statistics", "Statistics", "~/Statistics.aspx");
        /*     -------------------------------       SearchEngine                -------------------------------     */
        RouteTable.Routes.MapPageRoute("SearchEngine", "Search", "~/Default-SearchEngine.aspx");
        /*     -------------------------------       Redirect                    -------------------------------     */
        routes.MapPageRoute("Redirect", "Forward/{porotocol}/{host}/{port}/{page}/{format}", "~/Redirect.aspx", false, new RouteValueDictionary { { "format", string.Empty }, { "page", string.Empty } });
                    
    }
    void Application_Start(object sender, EventArgs e)
    {
        Application["OnlineUsers"] = 0;

        RegisterRoutes(RouteTable.Routes);
    }

    public void clearandeditdatabase()
    {
        if (Session["ChatRoomNickname"] != null && Session["ChatRoomNickname"] != "")
        {
            //__________________________________________________Clear Chat History
            SqlConnection con2 = new SqlConnection();
            con2.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con2.Open();
            SqlCommand com2 = new SqlCommand();
            com2.Connection = con2;
            com2.CommandText = "DELETE FROM [Chat-Value] WHERE (Nickname = @Nickname)";
            com2.Parameters.AddWithValue("@Nickname", Session["ChatRoomNickname"].ToString());
            com2.ExecuteNonQuery();
            //__________________________________________________Clear Chat Histoy
            SqlConnection con1 = new SqlConnection();
            con1.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con1.Open();
            SqlCommand com1 = new SqlCommand();
            com1.Connection = con1;
            com1.CommandText = "DELETE FROM [Chat-Value] WHERE (ReciverNickname = @ReciverNickname)";
            com1.Parameters.AddWithValue("@ReciverNickname", Session["ChatRoomNickname"].ToString());
            com1.ExecuteNonQuery();
            //__________________________________________________Clear Nickname Database
            SqlConnection con3 = new SqlConnection();
            con3.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con3.Open();
            SqlCommand com3 = new SqlCommand();
            com3.Connection = con3;
            com3.CommandText = "DELETE FROM [Chat-Nickname] WHERE (Nickname = @Nickname)";
            com3.Parameters.AddWithValue("@Nickname", Session["ChatRoomNickname"].ToString());
            com3.ExecuteNonQuery();
        }
        if (Session["UserID"] != null)
        {
            //  _________________________________________________Edit Is Online
            SqlConnection con4 = new SqlConnection();
            con4.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con4.Open();
            SqlCommand com4 = new SqlCommand();
            com4.Connection = con4;
            com4.CommandText = "UPDATE [Users-Users] SET IsOnline = @IsOnline WHERE (UserID = @UserID)";
            com4.Parameters.AddWithValue("UserID", Session["UserID"].ToString());
            com4.Parameters.AddWithValue("IsOnline", "FALSE");//FALSE means that user didnt log out normally but False shows that user logged out normaly
            com4.ExecuteNonQuery();
            Session.Abandon();
        }
    }
    void Application_End(object sender, EventArgs e) 
    {
    }
        
    void Session_Start(object sender, EventArgs e) 
    {
        Application.Lock();
        Application["OnlineUsers"] = (int)Application["OnlineUsers"] + 1;
        Application.UnLock();
        Session.Timeout = 120;
    }

    void Session_End(object sender, EventArgs e)
    {
        Application.Lock();
        Application["OnlineUsers"] = (int)Application["OnlineUsers"] - 1;
        Application.UnLock();
        clearandeditdatabase();
    }
    void Session_OnEnd(object sender, EventArgs e)
    {
        clearandeditdatabase();
    }
       
</script>

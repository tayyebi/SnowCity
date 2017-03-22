using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class App_UserControl_ChatRoomTextBox : System.Web.UI.UserControl
{
    public void replace(string symbol,string image)
    {
        string tag = "<img src=\"" + SocialNetworkingPage.PDP + "App_Image/ChatRoom/"+image+"\"/>";
        _Text = _Text.Replace(symbol,tag);
    }
    private string _Text;
    public string Text
    {
        get
        {
            return _Text;
        }
        set
        {
            _Text =  value;
            replace("`smile`", "smile.gif");
            replace("`cry`", "cry.gif");
            replace("`depressed`", "depressed.gif");
            replace("`laugh`", "laugh.gif");
            replace("`fear`", "fear.gif");
            replace("`shame`", "shame.gif");
            replace("`think`", "think.gif");
            replace("`uncomfortable`", "uncomfortable.gif");
            replace("`vomit`", "vomit.gif");
            ChatValue.Text = _Text;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
    }
}
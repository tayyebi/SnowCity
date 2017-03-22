using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class App_Errors_Default : WebsitePage
{
    public class App_Error
    {
        public int ErrorCode { get; set; }
        public string ErrorTitle { get; set; }
        public string ErrorValue { get; set; }
    }

    List<App_Error> error = new List<App_Error>();


    public void Add(int code, string title, string value)
    {
        error.Add(new App_Error { ErrorCode = code, ErrorTitle = title, ErrorValue = value });
    }
    string Read(int code, bool title)
    {
        string _ = "Unknown Error";
        foreach (var item in error)
        {
            if (item.ErrorCode == code)
            {
                _ = item.ErrorValue;
                if (title) { _ = item.ErrorTitle; }
            }
        }
        return _;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (RouteData.Values["code"] == null || RouteData.Values["code"] == "") { Response.Redirect(WebsitePage.WebsiteRoot(true, false) + "/Error/404"); }
        if (RouteData.Values["code"].ToString() == "Database") Response.Redirect(WebsitePage.WebsiteRoot(true, false) + "/App_Errors/Database.aspx");

        //------------ADD
        //   Add(,"","");

        Add(200,"OK","");
        Add(201,"Created","");
        Add(203,"Non-Authoritative Information","");
        Add(204,"No Content","");
        Add(205,"Reset Content","");
        Add(206,"Partial Content","");
        Add(207,"Multi-Status","");
        Add(208,"Already Reported","");
        Add(226,"IM Used","");

        Add(300,"Multiple Choices","");
        Add(301,"Moved Permanently","");
        Add(302,"Found","");
        Add(303,"See Other","");
        Add(304,"Not Modified","");
        Add(305,"Use Proxy","");
        Add(306,"Switch Proxy","");
        Add(307,"Temporary Redirect","");
        Add(308,"Permanent Redirect","");

        Add(400,"Bad Request","");
        Add(401,"Unauthorized","");
        Add(402,"Payment Required","");
        Add(403,"Forbidden","");
        Add(404,"Not Found","");
        Add(405,"Method Not Allowed","");
        Add(406,"Not Acceptable","");
        Add(407,"Proxy Authentication Required","");
        Add(408,"Request Timeout","");
        Add(409,"Conflict","");
        Add(410,"Gone","");
        Add(411,"Length Required","");
        Add(412,"Precondition Failed","");
        Add(413,"Request Entity Too Large","");
        Add(414,"Request-URI Too Long","");
        Add(415,"Unsupported Media Type","");
        Add(416,"Requested Range Not Satisfiable","");
        Add(417,"Expectation Failed","");
        Add(418,"I'm a teapot","");
        Add(419,"Authentication Timeout","");
        Add(420,"Method Failure","");
        Add(422,"Unprocessable Entity","");
        Add(423,"Locked","");
        Add(424,"Failed","");
        Add(425,"Unordered Collection","");
        Add(426, "Upgrade Required", "");
        Add(428, "Precondition Required", "");
        Add(429,"Too Many Requests","");
        Add(431,"Request Header Fields Too Large","");
        Add(440,"Login Timeout","");
        Add(444,"No Response","");
        Add(449,"Retry With","");
        Add(450,"Blocked by Windows Parental Controls","");
        Add(451,"Redirect","Microsoft");
        Add(494,"Request Header Too Large","");
        Add(495,"Cert Error","");
        Add(496,"No Cert","");
        Add(497, "HTTP to HTTPS", "");
        Add(499,"Client Closed Request","");

        Add(500,"Internal Server Error","");
        Add(501,"Not Implemented","");
        Add(502,"Bad Gateway","");
        Add(503,"Service Unavailable","");
        Add(504,"Gateway Timeout","");
        Add(505,"HTTP Version Not Supported","");
        Add(506,"Variant Also Negotiates","");
        Add(507,"Insufficient Storage","");
        Add(508,"Loop Detected","");
        Add(509,"Bandwidth Limit Exceeded","");
        Add(510,"Not Extended","");
        Add(511,"Network Authentication Required","");
        Add(520,"Origin Error","");
        Add(522,"Connection timed out","");
        Add(523,"Proxy Declined Request","");
        Add(524,"A timeout occurred","");
        Add(598,"Network read timeout error","");
        Add(599,"Network connect timeout error","");

        //-----------READ
        string _title = Read(Convert.ToInt32(RouteData.Values["code"].ToString()), true);
        string _code = RouteData.Values["code"].ToString();
        string _value = Read(Convert.ToInt32(RouteData.Values["code"].ToString()), false);
        lbl_Title.Text = _title;
        lbl_Code.Text = Page.Title = _code;
        lbl_Value.Text = _value;
    }
}
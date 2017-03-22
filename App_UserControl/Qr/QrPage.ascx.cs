using sc.QrCodeGenerator.Encoding;
using sc.QrCodeGenerator.Rendering;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class App_UserControl_Qr_QrPage : System.Web.UI.UserControl
{
    protected void Page_Init(object sender, EventArgs e)
    {
        if (!Directory.Exists(Server.MapPath("~/App_Qr"))) { Directory.CreateDirectory(Server.MapPath("~/App_Qr")); }

        string Url = Request.Url.AbsolutePath + Request.Url.Query;
        string FileName = "~/App_Qr/" + Url.Replace("/", "-").Replace("?", "-").Replace("&", "-") + ".png";
        string Page = HttpContext.Current.Request.Url.Scheme.ToString() + "://" + HttpContext.Current.Request.Url.Host.ToString() + ":" + HttpContext.Current.Request.Url.Port.ToString() + Request.Url.AbsolutePath;

        if (!File.Exists(Server.MapPath(FileName)))
        {

            QrEncoder qrEncoder = new QrEncoder(ErrorCorrectionLevel.M);
            QrCode qrCode = qrEncoder.Encode(Page);

            Renderer renderer = new Renderer(5, Brushes.Black, Brushes.White);
            renderer.CreateImageFile(qrCode.Matrix, Server.MapPath(FileName), ImageFormat.Png);
        }

        output.ImageUrl = FileName;
        output.Visible = true;
    }
}
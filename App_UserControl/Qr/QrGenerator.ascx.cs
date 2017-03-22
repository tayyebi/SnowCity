using sc.QrCodeGenerator.Encoding;
using sc.QrCodeGenerator.Rendering;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class App_UserControl_Users_UserControls_QrGenerator : System.Web.UI.UserControl
{
    public string InputText { get; set; }
    public string OutputPath { get; set; }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (InputText != null) { QrText.Visible = lbl_Text.Visible = false; }
        if (OutputPath != null) { QrPath.Visible = lbl_Path.Visible = false; }
    }
    protected void QrCreate_Click(object sender, EventArgs e)
    {
        if (QrText.Text != null) { InputText = QrText.Text; }
        if (QrPath.Text != null) { OutputPath = QrPath.Text; }

        QrEncoder qrEncoder = new QrEncoder(ErrorCorrectionLevel.M);
        QrCode qrCode = qrEncoder.Encode(InputText);

        Renderer renderer = new Renderer(5, Brushes.Black, Brushes.White);
        renderer.CreateImageFile(qrCode.Matrix, Server.MapPath("~/" + OutputPath + ".png"), ImageFormat.Png);

        lbl_output.Visible = true;
        img_output.ImageUrl = "~/" + OutputPath + ".png";
        img_output.Visible = true;

        InputText = OutputPath = null;
    }
}
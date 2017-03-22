<%@ WebHandler Language="C#" Class="FullSize" %>

using System;
using System.Web;
using System.Drawing;
using System.Drawing.Imaging;

public class FullSize : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        Image t = Image.FromFile(context.Server.MapPath("~/Album/") + context.Request["fn"]);
        Image t1 = Image.FromFile(context.Server.MapPath("~/mark.png"));
        Bitmap b = new Bitmap(t.Width,t.Height);
        using (Graphics gr = Graphics.FromImage(b))
        {
            //gr.CompositingQuality = CompositingQuality.HighSpeed;
            //gr.InterpolationMode = InterpolationMode.HighQualityBicubic;
            //gr.CompositingMode = CompositingMode.SourceCopy;

            gr.DrawImage(t, 0, 0, t.Width, t.Height);
            gr.DrawImage(t1, 10, 10, t1.Width, t1.Height);
            gr.DrawString("WWW.MYSITE.COM", new Font("Tahoma", 10, FontStyle.Bold), Brushes.White, 10, 42);
            //int x1, y1, x2, y2;
            Random rg = new Random();
            //for (int i = 0; i < 100; i++)
            //{
            //    x1 = rg.Next(0, 250);
            //    x2 = rg.Next(0, 250);
            //    y1 = rg.Next(0, 250 * t.Height / t.Width);
            //    y2 = rg.Next(0, 250 * t.Height / t.Width);
            //    gr.DrawLine(Pens.White, x1, y1, x2, y2);
            //}
            using (System.IO.MemoryStream memoryStream = new System.IO.MemoryStream())
            {
                b.Save(memoryStream, ImageFormat.Jpeg);
                memoryStream.WriteTo(context.Response.OutputStream);
            }
        }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace SnowLabel
{
    [DefaultProperty("Text")]
    [ToolboxData("<{0}:SnowAbstractLabel runat=server></{0}:SnowAbstractLabel>")]
    [ToolboxBitmap(typeof(ResourceFinder), "SnowCity.bmp")]
    public class SnowAbstractLabel : WebControl
    {
        [Bindable(true)]
        [Category("Appearance")]
        [DefaultValue("")]
        [Localizable(true)]
        public string Text
        {
            get
            {
                String s = (String)ViewState["Text"];
                return ((s == null)? "[" + this.ID + "]" : s);
            }
 
            set
            {
                ViewState["Text"] = value;
            }
        }
 
        protected override void RenderContents(HtmlTextWriter output)
        {
            output.Write("<span>" + Regex.Replace(Text, @"<[^>]*>", " " + "</span>"));
        }
    }
}

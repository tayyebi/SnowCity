using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Email : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            for (int i = 1; i < 21; i++)
            {
                ddl_Number.Items.Add(i.ToString());
            }
            for (int i = 0; i < 201; i++)
            {
                ddl_Money.Items.Add(i.ToString());
            }
        }
    }
    protected void ChangeProduct(object sender, EventArgs e)
    {
        int price = Convert.ToInt32(ddl_Product.SelectedValue);
        int number = Convert.ToInt32(ddl_Number.SelectedValue);
        int more=Convert.ToInt32(ddl_Money.SelectedValue);
        int PostPrice = Convert.ToInt32(lbl_PostPrice.Text.ToString());
        more = more * 1000;
        int final = (price * number) + more + PostPrice;
        lbl_FinalMoney.Text = final.ToString();
    }
    protected void btn_Buy_Click(object sender, EventArgs e)
    {
        if (txt_Fullname0.Text != "" && txt_Adress.Text != "" && txt_postalCode.Text != "" && txt_BankSupportCode.Text != "" && txt_fishNumber.Text != "" && txt_Email0.Text != "" && txt_PhoneNumber0.Text != "")
        {
            string subject = "خرید محصولات";
            string from = "Product@SnowCity.ir";
            string to = "tayyebi_mohammadreza@hotmail.com";
            string body = "تعداد";
            body += " ";
            body += ddl_Number.SelectedValue;
            body += "<hr/>";
            body += "از محصول";
            body += " ";
            body += ddl_Product.SelectedItem.Text;
            body += "<hr/>";
            body += "که نام";
            body += " ";
            body += txt_Fullname0.Text;
            body += " ";
            body += "در کنار لوگوی شهر برفی چاپ";
            body += " ";
            body += ddl_Print.SelectedValue;
            body += " ";
            body += "است.";
            body += "<hr/>";
            body += "محل ارسال:";
            body += txt_Adress.Text;
            body += "<hr/>";
            body += "و کد پستی محل ارسال:";
            body += txt_postalCode.Text;
            body += "<hr/>";
            body += "مبلغ:";
            body += lbl_FinalMoney.Text;
            body += "<hr/>";
            body += "شماره پیگیری:";
            body += txt_BankSupportCode.Text;
            body += "<hr/>";
            body += "و شماره فیش:";
            body += " ";
            body += txt_fishNumber.Text;
            body += "<hr/>";
            body += "ایمیل درخواست کننده:";
            body += " ";
            body += txt_Email0.Text;
            body += "<hr/>";
            body += "شماره تلفن درخواست کننده:";
            body += " ";
            body += txt_PhoneNumber0.Text;
            EMail.SendMailMessage(from, to, "", "", subject, body);
            btn_Buy.Visible = false;
            lbl_Thanks.Visible = true;
        }
        else
        {
            btn_Buy.Text = "لطفا تمامی اطلاعات را وارد نمائید و سپس اینجا کلیک کنید.";
        }
    }
    protected void btn_SendRequest_Click(object sender, EventArgs e)
    {
        if (txt_Fullname.Text != "" && txt_Email.Text != "" && txt_PhoneNumber.Text != "")
        {
            string subject = "درخواست تبلیغ، سفارش کار ویا محصول سفارشی";
            string from = "Product@SnowCity.ir";
            string to = "tayyebi_mohammadreza@hotmail.com";
            string body = "نام:";
            body += txt_Fullname.Text;
            body += "<hr/>";
            body += "ایمیل:";
            body += txt_Email.Text;
            body += "<hr/>";
            body += "شماره تلفن:";
            body += txt_PhoneNumber.Text;
            body += "<hr/>";
            body += "متن کامل درخواست:";
            body += "<hr/>";
            body += txt_Comment.Text;
            body += "<hr/>";
            EMail.SendMailMessage(from, to, "", "", subject, body);
            btn_SendRequest.Visible = false;
        }
        else
        {
            btn_SendRequest.Text = "لطفا تمامی اطلاعات را وارد نمائید و سپس اینجا کلیک کنید.";
        }
    }

}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BotDetect;
using System.Configuration;
using BotDetect.Web;
using BotDetect.Web.UI;
using System.Security.Cryptography;
using System.Text;
using System.Drawing;

public partial class SocialNetworking_register : System.Web.UI.Page
{
    /*
    protected void Page_Init(object sender, EventArgs e)
    {
        C_Generator.InitializedCaptchaControl +=
          new EventHandler<InitializedCaptchaControlEventArgs>(SampleCaptcha_InitializedCaptchaControl);   
    }
    */
    protected void Page_PreRender(object sender, EventArgs e)
    {

    }

    void SampleCaptcha_InitializedCaptchaControl(object sender, InitializedCaptchaControlEventArgs e)
    {
        if (e.CaptchaId != C_Generator.CaptchaId)
        {
            return;
        }

        CaptchaControl captcha = sender as CaptchaControl;

        captcha.CodeStyle = CaptchaRandomization.GetRandomCodeStyle();
        captcha.CodeLength = CaptchaRandomization.GetRandomCodeLength(4, 5);
        ImageStyle[] imageStyles = { 
            ImageStyle.Lego, 
            ImageStyle.MeltingHeat, 
            ImageStyle.Ghostly,
            ImageStyle.Fingerprints, 
            ImageStyle.Graffiti2, 
            ImageStyle.Bullets2,
            ImageStyle.CaughtInTheNet2, 
            ImageStyle.Collage, 
            ImageStyle.Chalkboard
        };
        captcha.ImageStyle = CaptchaRandomization.GetRandomImageStyle(imageStyles);
        SoundStyle[] soundStyles = { 
            SoundStyle.Dispatch, 
            SoundStyle.Radio, 
            SoundStyle.Synth
        };
        captcha.SoundStyle = CaptchaRandomization.GetRandomSoundStyle(soundStyles);

    }
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void btn_Validate_Click(object sender, EventArgs e)
    {
        bool isHuman = C_Generator.Validate(txt_Captcha.Text);

        txt_Captcha.Text = null;

        if (!isHuman)
        {
        }
        else if (isHuman)
        {
            lbl_Name.Text = hf_Name.Value;
            lbl_LastName.Text = hf_Lastname.Value;
            if (hf_Gender.Value == "male") lbl_Gender.Text = "آقا";
            else if (hf_Gender.Value == "female") lbl_Gender.Text = "خانم";
            lbl_SMS.Text = hf_SMS.Value;
            lbl_Email.Text = hf_Email.Value;
            lbl_Username.Text = hf_Username.Value;
            next();
        }
    }


    public void next() {
        hiddenErrors();
        mv_Default.ActiveViewIndex += 1; 
    }
    public void prev() {
        hiddenErrors();
        mv_Default.ActiveViewIndex -= 1; 
    }

    protected void btn_Next_Click(object sender, EventArgs e)
    {
        if (txt_Name.Text != "" && txt_Lastname.Text != "")
        {
            hf_Name.Value = txt_Name.Text;
            hf_Lastname.Value = txt_Lastname.Text;
            hf_Gender.Value = ddl_Gender.SelectedItem.Value;
            next();
            if (hf_Gender.Value == "male")
                lbl_GenderToKnow.Text = "آقای";
            else lbl_GenderToKnow.Text = "خانم";
            lbl_LastNameToKnow.Text = hf_Lastname.Value;
        }
        else { lbl_Error.Visible = true; }
    }
    public void hiddenErrors()
    {
        DontReadAndAccept.Text = "قوانین را مطالعه نکردم اما قبول دارم!";  DontReadAndAccept.ForeColor = Color.Black;
        lbl_Error0.Visible = false;
        lbl_Error.Visible = false;
        lbl_Error1.Visible = false;
        lbl_Error2.Visible = false;
        lbl_Error3.Visible = false;
    }
    protected void btn_Back_Click(object sender, EventArgs e)
    {
        prev();
    }
    protected void btn_Next0_Click(object sender, EventArgs e)
    {
        if (txt_Password.Text == txt_ConfirmPassword.Text)
        {
            if (SocialNetworkingPage.IsUsernameExist(txt_Username.Text) == false)
            {
                if (txt_Password.Text != "" && txt_Username.Text != "")
                {
                    hf_Password.Value = SocialNetworkingHashCode.converttohash(txt_ConfirmPassword.Text);
                    hf_Username.Value = txt_Username.Text;
                    next();
                }
                else
                    lbl_Error1.Visible = true;
            }
            else if (SocialNetworkingPage.IsUsernameExist(txt_Username.Text) == true)
                lbl_Error3.Visible = true;
         }

        else if (txt_Password.Text != txt_ConfirmPassword.Text)
        {
            lbl_Error0.Visible = true;
        }
    }
    protected void btn_Next1_Click(object sender, EventArgs e)
    {
        SocialNetworkingPage.checkEmail(txt_Email.Text);
        SocialNetworkingPage.checkSMS(txt_SMS.Text);
        if (!SocialNetworkingPage.isSMSExist)
        {
            if (!SocialNetworkingPage.isEmailExist)
            {
                if (txt_Email.Text != "" && txt_SMS.Text != "")
                {
                    hf_Email.Value = txt_Email.Text;
                    hf_SMS.Value = txt_SMS.Text;
                    next();
                }
                else lbl_Error2.Visible = true;
            }
            else lbl_Error4.Visible = true;
        }
        else lbl_Error4.Visible = true;
    }
    protected void btn_Next2_Click(object sender, EventArgs e)
    {
        SocialNetworkingPage.register(hf_Name.Value, hf_Lastname.Value, hf_Gender.Value, hf_Email.Value, hf_Password.Value,hf_Username.Value,txt_SMS.Text);
        next();
    }
    protected void login_Click(object sender, EventArgs e)
    {
        Response.Redirect(SocialNetworkingPage.socialnetworkingroot + "Login.aspx");
    }
    protected void DontAcceptRules_Click(object sender, EventArgs e)
    {
        Response.Redirect(SocialNetworkingPage.socialnetworkingroot + "Login.aspx");
    }
    protected void DontReadAndAccept_Click(object sender, EventArgs e)
    {
        hiddenErrors();
        if ((sender as Button).Text == "قوانین را مطالعه نکردم اما قبول دارم!")
        {
            (sender as Button).Text = "قوانین را مطالعه نکردید! ولی قبول دارید!";
            (sender as Button).ForeColor = Color.Red;
        }
        else
        {
            next();
            hiddenErrors();
        }
    }
}

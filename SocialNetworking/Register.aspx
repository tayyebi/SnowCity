<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="SocialNetworking_register" %>

<%@ Register Assembly="BotDetect" Namespace="BotDetect.Web.UI"  TagPrefix="BotDetect" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ثبت نام</title>
    <script type="text/javascript" src="./../../../App_Scripts/-jquery.js"></script>
    <script type="text/javascript">
        $(function () {
            $('.Rules').load('Rules.html');
        });
    </script>
    <link href="Register.css" rel="stylesheet" type="text/css" />
    <link href="All.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:MultiView ID="mv_Default" runat="server" ActiveViewIndex="0">
            <asp:View ID="v_Rules" runat="server">
                <div class="text">
                    سلام! برای ادامه دادن باید قوانین ما را قبول کنید.
                    <div class="Rules"></div>
                </div>
                <asp:Button runat="server" Text="قوانین را مطالعه کردم و قبول دارم." ToolTip="مرحله بعد" ID="ReadAndAccept"/>
                <asp:Button runat="server" Text="قوانین را مطالعه نکردم اما قبول دارم!" ID="DontReadAndAccept" ToolTip="مرحله بعد" OnClick="DontReadAndAccept_Click"/>
                <asp:Button runat="server" Text="قوانین را قبول ندارم" ID="DontAcceptRules" ToolTip="صفحه اصلی" OnClick="DontAcceptRules_Click"/>
            </asp:View>
            <asp:View ID="v_Step1" runat="server">
            <div class="text">   لطفا اجازه دهید کمی شما را بشناسیم. برای این کار نیاز است تا نام , نام خانوادگی خودتان را برای ما ارسال نمائید.<br /> اجازه دهید تا بدانیم شما را آقا یا خانم هستید. این به ما کمک می کند تا بتوانیم محیط مناسب تری را برای شما فراهم کنیم.</div>

                <table class="step1" cellpadding="4" cellspacing="0">
                    <tr>
                        <td>نام:</td>
                        <td>
                            <asp:TextBox ID="txt_Name" runat="server" ToolTip="لطفا نام خود را در این قسمت وارد نمائید."></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>نام خانوادگی:</td>
                        <td>
                            <asp:TextBox ID="txt_Lastname" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>جنسیت:</td>
                        <td>
                            <asp:DropDownList ID="ddl_Gender" runat="server">
                                <asp:ListItem Value="male">آقا</asp:ListItem>
                                <asp:ListItem Value="female">خانم</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
                <asp:Button ID="btn_Next" runat="server" OnClick="btn_Next_Click" Text="مرحله بعد" />
                <asp:Label ID="lbl_Error" runat="server" ForeColor="Red" Text="لطفا تمامی اطلاعات خواسته شده را وارد نمائید." Visible="False" EnableViewState="False"></asp:Label>
            </asp:View>
            <asp:View ID="v_Step2" runat="server">
                <div class="text">
                                <asp:Label ID="lbl_GenderToKnow" runat="server"></asp:Label>
                &nbsp;<asp:Label ID="lbl_LastNameToKnow" runat="server"></asp:Label>
                این مرحله به شما کمک میکند تا وارد حساب کاربری خود شوید.<br /> برای ورود، شما به این اطلاعات نیاز دارید. در وارد کردن این اطلاعات دقت کنید.کلمه عبور شما نزد ما محفوظ است و جز سیستم هوشمند کسی از آن اطلاع ندارد.<br />
                    </div>
                <table cellpadding="4" cellspacing="0" class="step2">
                    <tr>
                        <td>نام کاربری:</td>
                        <td>
                            <asp:TextBox ID="txt_Username" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>کلمه عبور:</td>
                        <td>
                            <asp:TextBox ID="txt_Password" runat="server" TextMode="Password"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>تکرار کلمه عبور:</td>
                        <td>
                            <asp:TextBox ID="txt_ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                        </td>
                    </tr>
                </table>
                <asp:Button ID="btn_Next0" runat="server" OnClick="btn_Next0_Click" Text="مرحله بعد" />
                <asp:Button ID="btn_Back" runat="server" OnClick="btn_Back_Click" Text="مرحله قبل" />
                <br /><asp:Label ID="lbl_Error0" runat="server" ForeColor="Red" Text="کلمه های عبور با هم برابرای نمی کنند." Visible="False" EnableViewState="False"></asp:Label>
                <br /><asp:Label ID="lbl_Error1" runat="server" ForeColor="Red" Text="لطفا تمامی اطلاعات خواسته شده را وارد نمائید." Visible="False" EnableViewState="False"></asp:Label>
                <br /><asp:Label ID="lbl_Error3" runat="server" ForeColor="Red" Text="این نام کاربری قبلا به ثبت رسیده است. لطفا نام کاربری دیگری انتخاب کنید." Visible="False" EnableViewState="False"></asp:Label>
            </asp:View>
            <asp:View ID="v_Step3" runat="server"><div class="text">
                لطفا آدرس ایمیل یا شماره sms خودتان را وارد نمائید تا در صورت نیاز به آن مراجعه کنیم.<br /> اگر کلمه عبور خود را فراموش کنید ما میتوانیم از این روش کلمه عبورتان را برای شما ارسال کنیم.
              </div>  <table class="step3" cellpadding="4" cellspacing="0">
                    <tr>
                        <td>ایمیل:</td>
                        <td>
                            <asp:TextBox ID="txt_Email" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>تلفن با قابلیت دریافت sms:</td>
                        <td>
                            <asp:TextBox ID="txt_SMS" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                </table>
                <asp:Button ID="btn_Next1" runat="server" OnClick="btn_Next1_Click" Text="مرحله بعد" />
                <asp:Button ID="btn_Back0" runat="server" OnClick="btn_Back_Click" Text="مرحله قبل" />
                <br /><asp:Label ID="lbl_Error2" runat="server" ForeColor="Red" Text="لطفا تمامی اطلاعات خواسته شده را وارد نمائید." Visible="False" EnableViewState="False"></asp:Label>
                <br />
                <asp:Label ID="lbl_Error4" runat="server" ForeColor="Red" Text="ایمیل یا شماره تلفن قبلا به ثبت رسیده لطفا از گزینه های دیگری استفاده نمائید." Visible="False" EnableViewState="False"></asp:Label>
            </asp:View>
            <asp:View ID="v_Step4" runat="server">
               <div class="text"> به آخرین مرحله از ثبت نام رسیدیم. اجازه دهید مطمئن شویم که شما روبات نیستید!
         </div>       <table cellpadding="4" cellspacing="0" class="step4">
                    <tr>
                        <td>
                            <BotDetect:Captcha ID="C_Generator" runat="server" CssClass="captcha" />
                            <asp:TextBox ID="txt_Captcha" runat="server" />
                        </td>
                    </tr>
                </table>
                <asp:Button ID="btn_Validate" runat="server" OnClick="btn_Validate_Click" Text="اعتبار یابی" ToolTip="این دکمه چک میکند که کد را صحیح وارد کردید" />
                <asp:Button ID="btn_Back1" runat="server" OnClick="btn_Back_Click" Text="مرحله قبل" />
            </asp:View>
            <asp:View ID="v_Step5" runat="server">
                <div class="text">لطفا اطلاعاتتان را دوباره مرور کنید.<br /> در صورت اشکال به مرحله های قبل بازگشته و آنرا اصلاح کنید.</div>
                <table class="step5" cellpadding="4" cellspacing="0">
                    <tr>
                        <td>نام:</td>
                        <td>
                            <asp:Label ID="lbl_Name" runat="server" EnableViewState="False"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>نام خانوادگی:</td>
                        <td>
                            <asp:Label ID="lbl_LastName" runat="server" EnableViewState="False"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>جنیست:</td>
                        <td>
                            <asp:Label ID="lbl_Gender" runat="server" EnableViewState="False"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>نام کاربری:</td>
                        <td>
                            <asp:Label ID="lbl_Username" runat="server" EnableViewState="False"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>ایمیل:</td>
                        <td>
                            <asp:Label ID="lbl_Email" runat="server" EnableViewState="False"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>sms:</td>
                        <td>
                            <asp:Label ID="lbl_SMS" runat="server" EnableViewState="False"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Button ID="btn_Next2" runat="server" OnClick="btn_Next2_Click" Text="تکمیل ثبت نام" />
                            <asp:Button ID="btn_Back2" runat="server" OnClick="btn_Back_Click" Text="مرحله قبل" />
                        </td>
                    </tr>
                </table>
            </asp:View>
            <asp:View ID="v_Step6" runat="server"><div class="text">
                مراحل ثبت نام تمام شد.<br /> از اینکه این شبکه اجتماعی را انتخاب کردید ممنونیم. شما میتوانید وارد حساب کاربری خود شوید.</div>
            <div class="step6"><asp:Button ID="login" runat="server" Text="وارد حساب کاربری خود شوید" OnClick="login_Click" /></div>
            </asp:View>
        </asp:MultiView>
        <asp:HiddenField ID="hf_Name" runat="server" Visible="False" />
        <asp:HiddenField ID="hf_Lastname" runat="server" Visible="False" />
        <asp:HiddenField ID="hf_Gender" runat="server" Visible="False" />
        <asp:HiddenField ID="hf_Username" runat="server" Visible="False" />
        <asp:HiddenField ID="hf_Password" runat="server" Visible="False" />
        <asp:HiddenField ID="hf_SMS" runat="server" Visible="False" />
        <asp:HiddenField ID="hf_Email" runat="server" Visible="False" />
    </form>
</body>
</html>

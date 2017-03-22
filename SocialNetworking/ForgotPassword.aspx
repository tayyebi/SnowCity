<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ForgotPassword.aspx.cs" Inherits="SocialNetworking_ForgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="All.css" rel="stylesheet" type="text/css" />
    <link href="ForgotPassword.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="f_Default" runat="server">
        <asp:ScriptManager ID="sm_default" runat="server"></asp:ScriptManager>
        <div class="maindiv">
        <div class="text">
            کلمه عبور خود را فراموش کردید؟ اصلا مشکلی نیست!<br />
            برای اینکه مطمئن شویم شما صاحب پسورد هستید، آنرا به ایمیل شما ارسال خواهیم کرد؛<br />
            در نتیجه باردیگر نام کاربری و ایمیل خود را برای ما بنویسید.</div>
        <div class="email">
            ایمیل:
            <asp:TextBox runat="server" ID="txt_email" ToolTip="ایمیل خود را در این قسمت وارد نمائید" CssClass="txt_email"></asp:TextBox>
        </div>
        <div class="sms">
            نام کاربری:<asp:TextBox ID="txt_username" runat="server" CssClass="txt_username" ToolTip="نام کاربری خود را در این قسمت وارد نمائید."></asp:TextBox>
        </div>
        </div>
        <asp:Panel ID="final" Visible="true" runat="server" CssClass="final"></asp:Panel>
        <asp:UpdatePanel ID="up_send" runat="server">
            <ContentTemplate>
                <div class="send">
                    <asp:Button CssClass="btn_send" runat="server" ID="btn_send" Text="ارسال اطلاعات" ToolTip="اگر روی این دکمه کلیک کنید پسورد جدید به ایمیل شما ارسال میگردد" OnClick="btn_send_Click" />
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>

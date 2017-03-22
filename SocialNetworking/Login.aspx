<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="SocialNetworking_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ورود
    </title>
    <link href="Login.css" rel="stylesheet" type="text/css" />
    <link href="All.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="f_Default" runat="server">
        <table cellpadding="4" cellspacing="0" class="logintable">
            <tr>
                <td>نام کاربری:</td>
                <td>
                    <asp:TextBox ID="txt_Username" runat="server" CssClass="txt_username" ToolTip="نام کاربری خود را وارد نمائید"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>کلمه عبور:</td>
                <td>
                    <asp:TextBox ID="txt_Password" runat="server" CssClass="txt_password" TextMode="Password" ToolTip="کلمه عبور خود را وارد نمائید"></asp:TextBox>
                </td>
            </tr>
            <tr><td colspan="2">
                <asp:Label ID="lbl_loginerror" runat="server" EnableViewState="False" style="color: #FF0066" Text="نام کاربری یا کلمه عبور اشتباه است." ToolTip="در وارد کردن نام کاربری یا کلمه عبور دقت کنید." Visible="False"></asp:Label>
                </td></tr>
            <tr>
                <td>
                    <asp:Button ID="btn_Login" runat="server" CssClass="btn_login" Text="ورود" ToolTip="برای وارد شدن به حساب کاربری خود کلیک کنید" OnClick="btn_Login_Click" />
                </td>
                <td>
                    <asp:HyperLink ID="hl_ForgotPassword" runat="server" CssClass="hl_forgotpassword" ToolTip="فراموشی کلمه عبور" EnableViewState="False" NavigateUrl="~/SocialNetworking/ForgotPassword.aspx">کلمه عبور خود را فراموش کردید؟</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:HyperLink ID="hl_register" runat="server" CssClass="hl_register" NavigateUrl="~/SocialNetworking/Register.aspx" ToolTip="ایجاد حساب کاربری" EnableViewState="False">حساب کاربری ندارید؟ آنرا ایجاد کنید.</asp:HyperLink>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

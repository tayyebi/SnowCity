<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Email.aspx.cs" Inherits="Email" %>

<%@ Register src="../App_UserControl/Loading-UserControls/Loading2.ascx" tagname="Loading2" tagprefix="uc1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>اینجا میتوانید کمک کنید</title>
    <style type="text/css">
body {
direction:rtl;
font-size:15px;
text-shadow:0px 0px 1px black;
}
.maintable {
width:1000px;
margin: 0px auto 0px auto;
}
.adverties, .product {
vertical-align:top;
width: 500px;
min-width: 450px;
max-width: 450px;
}
.adverties {
background-color:rgba(255, 255, 255, 0.10);
}
.product {
box-shadow:0px 0px 200px black;
background-color:rgba(255, 255, 255, 0.5);
border-radius:30px;
}
.updateprogress {
text-align:center;
margin:0px auto 0px auto;
}
input[type=submit] , input[type=text] , .tayyebi , textarea{
border-width:0px;
border-color:black;
border-style:solid;
background-color:white;
color:black;
box-shadow:0px 0px 2px black;
text-shadow:0px 0px 2px black;
border-radius:20px;
height:30px;
max-width:450px;
min-width:100px;
font-size:15px;
transition-duration:1s;
transition-timing-function:linear;
}
input[type=text]:hover {
box-shadow:0px 0px 6px black;
text-shadow:0px 0px 0px black;
}
input[type=submit]:hover {
box-shadow:0px 0px 10px black;
text-shadow:0px 0px 6px black;
}
.tayyebi {
color:red;
background-color:rgba(128, 128, 128, 0.80);
}
.tayyebi:hover {
color:black;
background-color:white;
}
</style>
</head>
<body>
     <form id="form1" runat="server">
         <asp:ScriptManager ID="ScriptManager1" runat="server">
         </asp:ScriptManager>
         <asp:UpdatePanel ID="UpdatePanel1" runat="server">
             <ContentTemplate>
                 <table cellpadding="4" cellspacing="0" class="maintable">
                     <tr>
                         <td class="adverties">درخواست تبلیغات کاملا دلخواه خود، با ارزان ترین قیمت را دارید؟<br /> و یا دوست دارید برای شما محصولاتی سفارشی تهیه کنیم؟<br /> شاید هم میخواهید به ما سفارش کار دهید؟<br /> با ما تماس بگیرید تا ما به شما پاسخ دهیم.<br /> نام شما:<br />
                             <asp:TextBox ID="txt_Fullname" runat="server" Width="100%" ToolTip="نام و نام خانوادگی خود را وارد نمائید."></asp:TextBox>
                 <br />
                             شماره تلفن شما:<asp:TextBox ID="txt_PhoneNumber" runat="server" ToolTip="شماره تلفن خود را وارد کنید تا از این روش با شما تماس بگیریم!" Width="100%"></asp:TextBox>
                 <br />
                             ایمیل شما:<asp:TextBox ID="txt_Email" runat="server" Width="100%" ToolTip="ایمیل خود را وارد نمائید. این به ما کمک میکند اگر نتوانسیم با شماره تلفن با شما تماس بگیریم، از این راه شما را پیدا کنیم."></asp:TextBox>
                 <br />
                             به ما بگویید! چگونه؟<br />
                             <asp:TextBox ID="txt_Comment" runat="server" Height="100%" TextMode="MultiLine" Width="100%" ToolTip="هرچه می خواهد دل تنگت بگو! البته در رابطه با تبلیغات و کمک و یا سفارش کار..."></asp:TextBox>
                 <br />
                             <asp:Button ID="btn_SendRequest" runat="server" Text="درخواستم را ارسال میکنم و انتظار پاسخ در سریع ترین زمان را از شما دارم" ToolTip="برای ارسال  درخواست کلیک کنید." OnClick="btn_SendRequest_Click" />
                 <br />
                         </td>
                         <td class="product">دوست دارید از محصولات ما داشته باشید؟<br /> نام شما؟<br /><asp:TextBox ID="txt_Fullname0" runat="server" Width="100%" ToolTip="نام و نام خانوادگی خود را وارد نمائید."></asp:TextBox>
                 <br />
                             ایمیل شما؟<br /><asp:TextBox ID="txt_Email0" runat="server" Width="100%" ToolTip="ایمیل خود را وارد نمائید. این به ما کمک میکند اگر نتوانسیم با شماره تلفن با شما تماس بگیریم، از این راه شما را پیدا کنیم."></asp:TextBox>
                 <br />
                             شماره تلفن شما؟<br /><asp:TextBox ID="txt_PhoneNumber0" runat="server" ToolTip="شماره تلفن خود را وارد کنید تا از این روش با شما تماس بگیریم!" Width="100%"></asp:TextBox>
                 <br />
                             میخواهم که تعداد
                             <asp:DropDownList ID="ddl_Number" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ChangeProduct">
                             </asp:DropDownList>
                             &nbsp;عدد از محصول&nbsp;<asp:DropDownList ID="ddl_Product" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ChangeProduct">
                                 <asp:ListItem Value="12000">کلاه</asp:ListItem>
                                 <asp:ListItem Value="10000">لیوان</asp:ListItem>
                             </asp:DropDownList>
                             &nbsp;که نام من در کنار لوگوی شهر برفی چاپ
                             <asp:DropDownList ID="ddl_Print" runat="server">
                                 <asp:ListItem Value="شده">شده</asp:ListItem>
                                 <asp:ListItem Value="نشده">نشده</asp:ListItem>
                             </asp:DropDownList>
                             &nbsp; است ، به محل مورد نظر من واقع در&nbsp;
                             <asp:TextBox ID="txt_Adress" runat="server" Width="100%" ToolTip="آدرسی که میخواهید محصولات را دریافت کنید بنویسید. نام شهر و استان را فراموش نکنید"></asp:TextBox>
                 <br />
                             ارسال شود. کد پستی این محل&nbsp;
                             <asp:TextBox ID="txt_postalCode" runat="server" ToolTip="کد پستی محل دریافت محصولات را بنویسید." Width="100%" ></asp:TextBox>
                             &nbsp;است.<br /> میدانم تا اینجا لطف بسیار بزرگی در حق شهر برفی انجام داده ام اما دلم می خواست که مبلغ
                             <asp:DropDownList ID="ddl_Money" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ChangeProduct">
                             </asp:DropDownList>
                             &nbsp;هزار تومان بیشتر کمک کنم. اگر قیمت پست را که&nbsp;<asp:Label ID="lbl_PostPrice" runat="server" Text="2000"></asp:Label>
                             &nbsp;تومان است محاسبه کنم، یعنی
                             <asp:Label ID="lbl_FinalMoney" runat="server">14000</asp:Label>
                             &nbsp;تومان واریز کردم.
                 <br />
                             من این مبلغ را به شماره حساب 9311555291 از بانک تجارت که به اسم آقای
                             <asp:Label ID="lbl_Tayyebi" runat="server" CssClass="tayyebi" Text="طیبی" ToolTip="محمدرضا طیبی - بنیان گذار و مدیر شهر برفی"></asp:Label>
                             &nbsp; است ، واریز کردم و شماره رهگیری
                             <asp:TextBox ID="txt_BankSupportCode" runat="server" ToolTip="کد پیگیری خود را وارد نمائید"></asp:TextBox>
                             &nbsp;را دریافت نمودم.پس شماره فیش من
                             <asp:TextBox ID="txt_fishNumber" runat="server" ToolTip="شماره فیش خود را وارد نمائید."></asp:TextBox>
                             &nbsp;است.<br /> امید وارم هرچه سریع تر محصولاتم آماده شوند وآنها را جلوی در تحویل بگیرم.<br />
                             <asp:Button ID="btn_Buy" runat="server" Text="قسد خرید دارم و میدانم پاسخ به  من بعد از بررسی خرید هایم به من اطلاع داده خواهد شد." ToolTip="برای خرید کلیک کنید!" OnClick="btn_Buy_Click" />
                 <br />
                             <asp:Label ID="lbl_Thanks" runat="server" Text="شهر برفی به خاطر این لطفتان شما را از یاد نخواهد برد و امیدوار است بتواند در هر جا که میتواند شما را کمک کند.باز هم ممنونیم!" Visible="False"></asp:Label>
                         </td>
                     </tr>
                 </table>
             </ContentTemplate>
         </asp:UpdatePanel>
         <asp:UpdateProgress ID="UpdateProgress1" runat="server">
             <ProgressTemplate>
                 <uc1:Loading2 ID="Loading21" runat="server" />
             </ProgressTemplate>
         </asp:UpdateProgress>
     </form>
</body>
</html>

<%@ Page Title="ارسال پست" Language="C#" MasterPageFile="~/SocialNetworking/CMS/CMS.master" AutoEventWireup="true" CodeFile="CMS-Post.aspx.cs" Inherits="SocialNetworking_CMS_CMS_Post" %>

<%@ Register assembly="SnowCity.HtmlEditor" namespace="SnowCity.HtmlEditor" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="CMS-Post.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_Default" Runat="Server">
    <asp:MultiView ID="mv_Post" runat="server" ActiveViewIndex="0">
        <asp:View ID="v_Write" runat="server">
            <div class="write">
                <asp:TextBox ID="txt_Title" runat="server" CssClass="txt_title" ToolTip="عنوان را در اینجا بنویسید"></asp:TextBox>
                <cc1:HtmlEditor ID="txt_Value" runat="server" AllowedAttributes="href,target,src,align,valign,color,size,style,face,dir,alt,title" CssClass="txt_value" HtmlModeEditable="False" ToggleMode="None" Toolbars=":Select#Size:Bold,Italic,Underline:Left,Center,Right,Justify;OrderedList,BulletedList:Rule:Link:Image" TextDirection="RightToLeft" />
                <br />
                چه کسی به این پست دسترسی داشته باشد؟
                <asp:DropDownList ID="ddl_Permission" runat="server">
                    <asp:ListItem Selected="True" Value="all">همه</asp:ListItem>
                    <asp:ListItem Value="friends">دوستان</asp:ListItem>
                    <asp:ListItem Value="family">خانواده</asp:ListItem>
                </asp:DropDownList>
                <br />
                <asp:Button ID="btn_Next" runat="server" Text="مرحله بعد" OnClick="btn_Next_Click" ToolTip="نمایش متن پایانی" />
            </div>
        </asp:View>
        <asp:View ID="v_Preview" runat="server">
            <div class="preview">
                <asp:Label ID="lbl_Title" runat="server" CssClass="lbl_title"></asp:Label><hr />
                <asp:Label ID="lbl_Value" runat="server" CssClass="lbl_Value"></asp:Label>

            </div>
            <asp:Button ID="btn_Back" runat="server" OnClick="btn_Back_Click" Text="مرحله قبل" ToolTip="ویرایش پست" />
            <asp:Button ID="btn_send" runat="server" Text="ارسال پست" OnClick="btn_send_Click" />
            <br />
        </asp:View>
    </asp:MultiView>
</asp:Content>


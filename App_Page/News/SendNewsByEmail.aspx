<%@ Page   Language="C#" MasterPageFile="~/App_MasterPage/NewsMasterPage.master" AutoEventWireup="true" CodeFile="SendNewsByEmail.aspx.cs" Inherits="App_Page_News_SendNewsByEmail" %>

<%@ Register assembly="FreeTextBox" namespace="FreeTextBoxControls" tagprefix="FTB" %>
<%@ Register assembly="SnowCity.HtmlEditor" namespace="SnowCity.HtmlEditor" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="DefaultContentPlaceHolder" Runat="Server">
    <div class="newsItem">
        <asp:Label ID="From" runat="server" Text="<%$ Resources:Resource, From %>"></asp:Label>
        <asp:TextBox ID="txt_From" CssClass="Email" runat="server"></asp:TextBox>
        <asp:Label ID="To" runat="server" Text="<%$ Resources:Resource, To %>"></asp:Label>
        <asp:TextBox ID="txt_To" CssClass="Email" runat="server"></asp:TextBox>
        <asp:Label ID="Comment" runat="server" Text="<%$ Resources:Resource, Comment %>"></asp:Label>
        <cc1:HtmlEditor ID="txt_Comment" runat="server" AllowedAttributes="href,target,src,align,valign,color,size,style,face,dir,alt,title" BorderStyle="None" ButtonMouseOverBorderColor="White" ButtonMouseOverColor="White" CssClass="editor" DialogBackColor="White" DialogBorderColor="Black" DialogTableColor="White" EditorBorderColor="White" EditorInnerBorderColor="White" SelectedTabBackColor="Black" TabBackColor="White" TabbarBackColor="WhiteSmoke" TabMouseOverColor="WhiteSmoke" ToggleMode="None" ToolbarColor="WhiteSmoke" Toolbars="ForeColor,BackColor:Left,Center,Right,Justify:Link:Image" />
        <asp:Button ID="btn_Send" runat="server" OnClick="btn_Send_Click" Text="<%$ Resources:Resource, Send %>" CssClass="btn_Send"/>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="NoAjax" Runat="Server">
</asp:Content>

<asp:Content ID="Content4" runat="server" contentplaceholderid="ContentPlaceHolderSiteMap">
    <asp:HyperLink ID="hp_NewsRoot" runat="server" NavigateUrl="~/News" Text="<%$ Resources:Resource, News %>"></asp:HyperLink>
    *<asp:HyperLink ID="hp_Back" runat="server" Text="<%$ Resources:Resource, Back %>"></asp:HyperLink>
    *<asp:HyperLink ID="hp_ID" runat="server">[hp_ID]</asp:HyperLink>
    *<asp:HyperLink ID="hp_Title" runat="server">[hp_Title]</asp:HyperLink>
    *<asp:HyperLink ID="hp_Group" runat="server">[hp_Group]</asp:HyperLink>
    *<asp:HyperLink ID="hp_User" runat="server">[hp_User]</asp:HyperLink>
</asp:Content>



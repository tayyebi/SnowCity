<%@ Page Language="C#" MasterPageFile="~/SocialNetworking/CMS/CMS.master" AutoEventWireup="true" CodeFile="CMS-Default.aspx.cs" Inherits="SocialNetworking_CMS_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="CMS-Default.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_Default" Runat="Server">
<div class="like"></div>
<div class="like-rate">
    <asp:Label ID="lbl_like_rate" runat="server"></asp:Label>
    </div>
<div class="hate-rate">
    <asp:Label ID="lbl_hate_rate" runat="server"></asp:Label>
    </div>
<div class="hate"></div>
</asp:Content>


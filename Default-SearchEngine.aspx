<%@ Page Title="<%$ Resources:Resource, SearchEngine%>" Language="C#" MasterPageFile="~/App_MasterPage/SearchEngineMasterPage.master" AutoEventWireup="true" CodeFile="Default-SearchEngine.aspx.cs" Inherits="Default_SearchEngine" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="DefaultContentPlaceHolder" Runat="Server">
    <div class="Logo">
        <img src="Logo.png" alt="Logo" />
    </div>
    <div class="searchBox">
        <asp:TextBox ID="txt_SearchValue" runat="server" CssClass="txt_SearchValue"></asp:TextBox>
        <asp:Button ID="btn_Search" runat="server" CssClass="btn_Search" Text="<%$ Resources:Resource, search %>" OnClick="btn_Search_Click" />
    </div>
</asp:Content>


<%@ Page Title="Error" Language="C#" MasterPageFile="~/App_MasterPage/ErrorMasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="App_Errors_Default" %>

<asp:Content ID="Content" ContentPlaceHolderID="DefaultContentPlaceHolder" Runat="Server">
    <asp:Label ID="lbl_Code" CssClass="lbl_Code" runat="server"></asp:Label>
    <asp:Label ID="lbl_Title" CssClass="lbl_Title" runat="server"></asp:Label>
    <asp:Label ID="lbl_Value" CssClass="lbl_Value" runat="server"></asp:Label>
</asp:Content>
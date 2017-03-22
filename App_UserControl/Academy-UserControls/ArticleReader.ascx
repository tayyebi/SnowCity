<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ArticleReader.ascx.cs" Inherits="App_UserControl_NewsReader" %>
<%@ Register assembly="OnBarcode.Barcode.ASPNET" namespace="OnBarcode.Barcode.ASPNET" tagprefix="cc1" %>
<%@ Register src="../SocialNetworkings/Button.ascx" tagname="SocialNetworkingShareButtons" tagprefix="uc2" %>
<%@ Register src="AcademyTV.ascx" tagname="AcademyTV" tagprefix="uc1" %>
<script type="text/javascript">
    function PrintDiv() {
        var divToPrint = document.getElementById('ArticleArea');
        var popupWin = window.open('', '_blank', 'width=300,height=400,location=no,left=200px');
        popupWin.document.open();
        popupWin.document.write('<html><head><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><title>Print . . . </title></head><body onload="window.print()">' + divToPrint.innerHTML + '<img src="../../Logo.png" alt="SnowCity" /></html>');
        popupWin.document.close();
    }
</script>
<div class="ReaderTable">
    <uc2:SocialNetworkingShareButtons ID="SocialNetworkingShareButton" runat="server" />
    <asp:Button ID="Print" CssClass="Print" runat="server" Text="<%$ Resources:Resource, Print %>" OnClientClick="PrintDiv()" />
    -<asp:Label ID="Views" runat="server" CssClass="Number" ToolTip="<%$ Resources:Resource, Views %>"></asp:Label>
    -<asp:Button ID="Like" runat="server" OnClick="Like_Click" Text="<%$ Resources:Resource, Like %>" CssClass="Like" />
    <asp:Button ID="Hate" runat="server" OnClick="Hate_Click" Text="<%$ Resources:Resource, Hate %>" CssClass="Hate" />
    <div id="ArticleArea">
        <asp:Label ID="lbl_ArticleText" runat="server"></asp:Label>
    </div>
    <uc1:AcademyTV ID="TV" runat="server" />
</div>


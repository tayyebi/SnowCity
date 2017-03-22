<%@ Control Language="C#" AutoEventWireup="true" CodeFile="QrGenerator.ascx.cs" Inherits="App_UserControl_Users_UserControls_QrGenerator" %>

<div id="<%:this.ID %>" class="<%:this.ID%>">
    <asp:Label ID="lbl_Text" runat="server" Text="<%$ Resources:Resource, Text%>"></asp:Label><asp:TextBox ID="QrText" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="lbl_Path" runat="server" Text="<%$ Resources:Resource, File%>"></asp:Label><asp:TextBox ID="QrPath" runat="server"></asp:TextBox>
    <br />
    <asp:Button ID="QrCreate" runat="server" Text="<%$ Resources:Resource, Create %>" OnClick="QrCreate_Click" />
    <br />
    <div class="output">
        <asp:Label CssClass="lbl_output" ID="lbl_output" runat="server" Text="<%$ Resources:Resource, Done %>" Visible="False"></asp:Label>
        <br />
        <asp:Image CssClass="img_output" ID="img_output" runat="server" Visible="false" />
    </div>
</div>
<%@ Control Language="C#" AutoEventWireup="true" CodeFile="QuestionReader.ascx.cs" Inherits="App_UserControl_QuestionReader" %>
<div class="QuestionBlock">
    #<asp:Label ID="lbl_QuestionID" runat="server"></asp:Label>
    <div class="QuestionDiv">
        <asp:Literal ID="lbl_Question" runat="server"></asp:Literal>
    </div>
        <asp:Panel ID="Answer" runat="server" Visible="False" CssClass="AnswerDiv">
            <asp:Literal ID="lbl_Answer" runat="server"></asp:Literal>
        </asp:Panel>
</div>


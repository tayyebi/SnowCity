<%@ Page Title="نظرات پست ها" Language="C#" MasterPageFile="~/SocialNetworking/CMS/CMS.master" AutoEventWireup="true" CodeFile="CMS-Comment.aspx.cs" Inherits="SocialNetworking_CMS_CMS_Comment" %>

<%@ Register src="Reputation.ascx" tagname="Reputation" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="CMS-Comment.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_Default" runat="Server">
    <asp:UpdatePanel ID="up_Default" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:GridView ID="gv_Default" runat="server" AutoGenerateColumns="False" CssClass="gv_Default" DataKeyNames="CommentID" DataSourceID="sds_Default" EmptyDataText="هیچ نظری برای شما ثبت نشده است." OnSelectedIndexChanged="gv_Default_SelectedIndexChanged" ShowHeader="False" AllowPaging="True">
                <Columns>
                    <asp:CommandField ButtonType="Button" HeaderText="پاسخ" SelectText="پاسخ" ShowSelectButton="True" />
                    <asp:BoundField DataField="CommentID" HeaderText="سریال کامنت" InsertVisible="False" ReadOnly="True" SortExpression="CommentID" />
                    <asp:TemplateField HeaderText="امتیازات پست" SortExpression="PostID">
                        <ItemTemplate>
                            <uc1:Reputation ID="Reputation1" runat="server" PostID='<%# Bind("PostID") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Value" HeaderText="متن نظر" SortExpression="Value">
                        <ItemStyle CssClass="gv_Default_Value" />
                    </asp:BoundField>
                </Columns>
                <RowStyle CssClass="gv_Default_Row" />
                <SelectedRowStyle CssClass="gv_Default_Row_Selected" />
            </asp:GridView>
            <div class="mv">
                <asp:MultiView ID="mv_Answer" runat="server" ActiveViewIndex="0" Visible="False">
                    <asp:View ID="v_Default" runat="server">
                        تعداد پاسخ هایی که شما برای این نظر ارسال کردید:<asp:Label ID="lbl_AnswersCount" runat="server" CssClass="lbl_AnswersCount"></asp:Label>
                        <br />
                        <asp:Label ID="lbl_CommentValue" runat="server" CssClass="lbl_CommentValue"></asp:Label>
                        <br />
                        پاسخ شما:<br />
                        <asp:TextBox ID="txt_Answer" runat="server" CssClass="txt_Answer" TextMode="MultiLine" ToolTip="پاسخ خود را در این قسمت وارد نمائید."></asp:TextBox>
                        <asp:Button ID="btn_Answer" runat="server" CssClass="btn_Answer" OnClick="btn_Answer_Click" Text="ارسال پاسخ" />
                        <br />
                    </asp:View>
                </asp:MultiView>
            </div>
            <asp:SqlDataSource ID="sds_Default" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Social-Comment] WHERE ([ToUsername] = @ToUsername)">
                <SelectParameters>
                    <asp:SessionParameter Name="ToUsername" SessionField="username" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:UpdateProgress ID="uprog_Defualt" runat="server" DisplayAfter="0">
                <ProgressTemplate>
                    <div class="loading1"></div>
                </ProgressTemplate>
            </asp:UpdateProgress>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>


<%@ Page Title="پیوند به خارج" Language="C#" MasterPageFile="~/SocialNetworking/CMS/CMS.master" AutoEventWireup="true" CodeFile="CMS-ExternalLink.aspx.cs" Inherits="SocialNetworking_CMS_CMS_ExternalLink" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="CMS-ExternalLink.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_Default" Runat="Server">
    <div class="insertExternalLink">
        <asp:TextBox ID="txt_insert" CssClass="txt_insert" runat="server"></asp:TextBox>
        <asp:Button ID="btn_insert" CssClass="btn_insert"  runat="server" OnClick="btn_Insert_Click" Text="اضافه کردن لینک" />
    </div>
    <div class="operations">
        <asp:MultiView ID="mv_Default" runat="server" ActiveViewIndex="0">
            <asp:View ID="v_Default" runat="server">
                <asp:GridView ID="gv_Default" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CssClass="gv_Default" DataKeyNames="LinkID" DataSourceID="sds_Default" PageSize="20">
                    <Columns>
                        <asp:CommandField ButtonType="Button" CancelText="انصراف" DeleteText="حذف" EditText="ویرایش" InsertText="ایجاد" NewText="جدید" SelectText="انتخاب" ShowEditButton="True" UpdateText="ویرایش" ShowDeleteButton="True" />
                        <asp:BoundField DataField="URL" HeaderText="آدرس" SortExpression="URL" />
                        <asp:TemplateField ConvertEmptyStringToNull="False">
                            <ItemTemplate>
                                <asp:HyperLink ID="Browse" runat="server" Text="برو" NavigateUrl='<%# Eval("URL") %>' Mode="ReadOnly" Target="_blank" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <RowStyle CssClass="gv_Default_Row" />
                </asp:GridView>
                <asp:SqlDataSource ID="sds_Default" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Social-ExternalLink] WHERE ([username] = @username)" DeleteCommand="DELETE FROM [Social-ExternalLink] WHERE (LinkID = @LinkID)" UpdateCommand="UPDATE [Social-ExternalLink] SET URL = @URL WHERE (LinkID = @LinkID)">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="gv_Default" Name="LinkID" PropertyName="SelectedValue" />
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="username" SessionField="username" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="gv_Default" Name="URL" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="gv_Default" Name="LinkID" PropertyName="SelectedValue" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </asp:View>
        </asp:MultiView>
    </div>
</asp:Content>


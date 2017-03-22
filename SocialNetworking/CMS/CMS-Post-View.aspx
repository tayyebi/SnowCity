<%@ Page Title="مدیریت پست ها" Language="C#" MasterPageFile="~/SocialNetworking/CMS/CMS.master" AutoEventWireup="true" CodeFile="CMS-Post-View.aspx.cs" Inherits="SocialNetworking_CMS_View_Post" %>

<%@ Register assembly="SnowCity.HtmlEditor" namespace="SnowCity.HtmlEditor" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="CMS-Post-View.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_Default" Runat="Server">
    <asp:UpdatePanel ID="up_Default" runat="server">
    <ContentTemplate>
        <asp:MultiView ID="mv_Default" runat="server" ActiveViewIndex="0">
            <asp:View ID="v_Default" runat="server">
                <asp:GridView ID="gv_Default" runat="server" AllowPaging="True" AutoGenerateColumns="False" CssClass="gv_Default" DataKeyNames="PostID" DataSourceID="sds_Default" OnSelectedIndexChanged="gv_Default_SelectedIndexChanged">
                    <Columns>
                        <asp:CommandField ButtonType="Button" SelectText="انتخاب" ShowSelectButton="True" />
                        <asp:BoundField DataField="PostID" HeaderText="کد پست" InsertVisible="False" ReadOnly="True" ShowHeader="False" SortExpression="PostID" />
                        <asp:BoundField DataField="Title" HeaderText="عنوان پست" ShowHeader="False" SortExpression="Title" />
                    </Columns>
                    <RowStyle CssClass="gv_Default_Row" />
                </asp:GridView>
                <asp:SqlDataSource ID="sds_Default" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Social-Post] WHERE ([username] = @username) ORDER BY [PostID] DESC">
                    <SelectParameters>
                        <asp:SessionParameter Name="username" SessionField="username" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </asp:View>
            <asp:View ID="v_QuickPreview" runat="server">
                <asp:Button ID="btn_back" runat="server" CssClass="btn_back" OnClick="btn_back_Click" text="مرحله قبل" />
                <asp:Button ID="btn_next" runat="server" CssClass="btn_next" OnClick="btn_next_Click" text="مرحله بعد" />
                <div class="quickView">
                    <asp:Label ID="lbl_title" runat="server" CssClass="lbl_title"></asp:Label>
                    #<asp:Label ID="lbl_PostID" runat="server" CssClass="lbl_PostID"></asp:Label>
                    <asp:Label ID="lbl_value" runat="server" CssClass="lbl_value"></asp:Label>
                    <asp:Label ID="lbl_date" runat="server" CssClass="lbl_date"></asp:Label>
                    <asp:Label ID="lbl_time" runat="server" CssClass="lbl_time"></asp:Label>
                    <asp:Label ID="lbl_likes" runat="server" CssClass="lbl_likes"></asp:Label>
                    <asp:Label ID="lbl_hates" runat="server" CssClass="lbl_hates"></asp:Label>
                </div>
            </asp:View>
            <asp:View ID="v_chooseOperation" runat="server">
                <asp:Button ID="btn_cancel" runat="server" OnClick="btn_cancel_Click" Text="انصراف" />
                <asp:Button ID="btn_edit" runat="server" OnClick="btn_edit_Click" Text="ویرایش" />
                <asp:Button ID="btn_delete" runat="server" OnClick="btn_delete_Click" Text="حذف" />
                <div class="editPost">
                    <asp:TextBox ID="txt_title" runat="server" CssClass="txt_title" ToolTip="عنوان جدید را در این قسمت وارد نمائید"></asp:TextBox>
                    #<asp:TextBox ID="txt_PostID" runat="server" CssClass="txt_PostID" ReadOnly="true"></asp:TextBox>
                    <cc1:HtmlEditor ID="txt_value" runat="server" AllowedAttributes="href,target,src,align,valign,color,size,style,face,dir,alt,title" CssClass="txt_value" HtmlModeEditable="False" TextDirection="RightToLeft" ToggleMode="None" Toolbars=":Select#Size:Bold,Italic,Underline:Left,Center,Right,Justify;OrderedList,BulletedList:Rule:Link:Image" Width="500px" />
                    <asp:DropDownList ID="ddl_permission" runat="server" CssClass="ddl_permission" ToolTip="چه کسانی به این پست دسترسی داشته باشند؟">
                        <asp:ListItem Selected="True" Value="all">همه</asp:ListItem>
                        <asp:ListItem Value="friends">دوستان</asp:ListItem>
                        <asp:ListItem Value="family">خانواده</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </asp:View>
        </asp:MultiView>
    </ContentTemplate>
</asp:UpdatePanel>
</asp:Content>


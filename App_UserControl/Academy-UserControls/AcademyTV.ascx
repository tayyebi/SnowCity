<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AcademyTV.ascx.cs" Inherits="App_UserControl_AcademyTV" %>
<asp:Repeater ID="reap_TV" runat="server" Visible="False">
    <HeaderTemplate>
    </HeaderTemplate>
    <ItemTemplate>
        <div class="TV">
            <embed src="<%# "../../../App_Page/TV/SnowTV.swf?VideoId=" + DataBinder.Eval(Container.DataItem, "VideoId")%>" type="application/x-shockwave-flash" height="320" wmode="transparent" width="700" />
        </div>
    </ItemTemplate>
    <FooterTemplate>
    </FooterTemplate>
</asp:Repeater>  

  

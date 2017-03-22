<%@ Page Language="C#" ContentType="text/xml" AutoEventWireup="true" CodeFile="Rss-NewsDefault.aspx.cs" Inherits="App_Page_News_NewsRss" %>
<asp:repeater id="RepeaterRSS" runat="server">     
        <HeaderTemplate>
                <?xml-stylesheet type="text/css" href="../../App_StyleSheet/rss.css"?>
                <rss version="2.0">
                <channel>
                <title><%:"..::  "+HttpContext.Current.Request.Url.Host.ToString().ToUpper()+" Feed  ::.."%></title>
                <link><%:HttpContext.Current.Request.Url.Scheme+"://" + HttpContext.Current.Request.Url.Host.ToString() +":"+ HttpContext.Current.Request.Url.Port.ToString() + "/" %></link>
        </HeaderTemplate>
        <ItemTemplate>  
                <item>  
                <Title><%# RemoveIllegalCharacters(DataBinder.Eval(Container.DataItem, "Title")) %></Title>

                <Abstract><%# RemoveIllegalCharacters(DataBinder.Eval(Container.DataItem, "Abstract")) %></Abstract>
                <Body><%# RemoveIllegalCharacters(DataBinder.Eval(Container.DataItem, "Value")) %></Body>

                <Source><%# RemoveIllegalCharacters(DataBinder.Eval(Container.DataItem, "Source")) %></Source>
                <Date><%# RemoveIllegalCharacters(DataBinder.Eval(Container.DataItem, "Date")) %></Date>

                <Likes><%# RemoveIllegalCharacters(DataBinder.Eval(Container.DataItem, "Likes")) %></Likes>
                <Views><%# RemoveIllegalCharacters(DataBinder.Eval(Container.DataItem, "Views")) %></Views>
                <Hates><%# RemoveIllegalCharacters(DataBinder.Eval(Container.DataItem, "Hates")) %></Hates>

                <Group><%# RemoveIllegalCharacters(GetGroupName(DataBinder.Eval(Container.DataItem, "GroupID"))) %></Group>
                <Jornal><%# RemoveIllegalCharacters(GetUserFullName(DataBinder.Eval(Container.DataItem, "UserID"))) %></Jornal>

                <ShowNews><%#HttpContext.Current.Request.Url.Scheme+"://" + HttpContext.Current.Request.Url.Host.ToString().ToUpper() +":"+ HttpContext.Current.Request.Url.Port.ToString() + "/"+"App_Page/News/ShowNewsByID.aspx?ID="+ DataBinder.Eval(Container.DataItem, "ID") %></ShowNews>
                <ShowByTitle><%#HttpContext.Current.Request.Url.Scheme+"://" + HttpContext.Current.Request.Url.Host.ToString().ToUpper() +":"+ HttpContext.Current.Request.Url.Port.ToString() + "/"+"App_Page/News/ShowNewsByTitle.aspx?Title="+RemoveIllegalCharacters(DataBinder.Eval(Container.DataItem, "Title")) %></ShowByTitle>
                <ShowByJornal><%#HttpContext.Current.Request.Url.Scheme+"://" + HttpContext.Current.Request.Url.Host.ToString().ToUpper() +":"+ HttpContext.Current.Request.Url.Port.ToString() + "/"+"App_Page/News/ShowNewsByUser.aspx?UserID="+RemoveIllegalCharacters(DataBinder.Eval(Container.DataItem, "UserID")) %></ShowByJornal>
                <ShowByGroup><%#HttpContext.Current.Request.Url.Scheme+"://" + HttpContext.Current.Request.Url.Host.ToString().ToUpper() +":"+ HttpContext.Current.Request.Url.Port.ToString() + "/"+"App_Page/News/ShowNewsByGroup.aspx?GroupID="+RemoveIllegalCharacters(DataBinder.Eval(Container.DataItem, "GroupID")) %></ShowByGroup>
                </item>
        </ItemTemplate>
        <FooterTemplate>  
                </channel>
                </rss>
        </FooterTemplate>  
</asp:repeater>


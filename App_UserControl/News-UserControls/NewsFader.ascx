<%@ Control Language="C#" AutoEventWireup="true" CodeFile="NewsFader.ascx.cs" Inherits="App_UserControl_News_UserControls_NewsFader" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <script src="<%:WebsitePage.WebsiteRoot(true, false)%>/App_Scripts/-jquery.js" type="text/javascript"></script>
     <link href="<%:WebsitePage.WebsiteRoot(true, false)%>/App_StyleSheet/NewsFader.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        (function (e) { function t(e) { var t = ["Webkit", "Moz", "O", "ms"]; for (var n = 0; n < t.length; n++) { if (t[n] + "Transition" in e.style) { return "-" + t[n].toLowerCase() + "-" } } return "transition" in e.style ? "" : false } var n = { init: function (n) { return this.each(function () { function p(e, n) { function i() { l.eq(e).removeAttr("style"); a = n; o = false; v() } if (o || e == n) { return false } o = true; g.removeClass("active").eq(f).addClass("active"); l.eq(e).css("z-index", 3); l.eq(n).css({ "z-index": 2, opacity: 1 }); if (!t) { l.eq(e).animate({ opacity: 0 }, r.fadeDur, function () { i() }) } else { var s = {}; s[t + "transition"] = "opacity " + r.fadeDur + "ms"; s["opacity"] = 0; l.eq(e).css(s); var u = setTimeout(function () { i() }, r.fadeDur) } } function d(e) { if (e == "next") { f = a + 1; if (f > c - 1) { f = 0 } } else if (e == "prev") { f = a - 1; if (f < 0) { f = c - 1 } } else { f = e } p(a, f) } function v() { u = setTimeout(function () { d("next") }, r.slideDur) } var r = { slideDur: 7e3, fadeDur: 800 }; if (n) { e.extend(r, n) } this.config = r; var i = e(this), s = ".slide", o = false, u, a, f, l = e("img.slide"), c = l.length, h = i.find(".pager_list"); t = t(i[0]); for (var m = 0; m < c; m++) { h.append('<li class="page" data-target="' + m + '">' + "</li>") } i.find(".page").bind("click", function () { var t = e(this).attr("data-target"); clearTimeout(u); d(t) }); var g = h.find(".page"); l.eq(0).css("opacity", 1); g.eq(0).addClass("active"); a = 0; v() }) } }; e.fn.easyFader = function (e) { return n.init.apply(this, arguments) } })(jQuery); $(function () { $("#Fader").easyFader({ slideDur: 6e3, fadeDur: 800 }) })
    </script>
</head>
<body>
<div id="Fader" class="fader">
    <div class="fader_controls">
      <div class="page prev" data-target="prev">&lsaquo;</div>
      <div class="page next" data-target="next">&rsaquo;</div>
      <ul class="pager_list"></ul>
    </div>
</div>
</body>
</html>

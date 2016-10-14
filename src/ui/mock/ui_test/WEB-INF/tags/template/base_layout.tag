<%--
  標準HTMLテンプレート
  @author Iwauo Tajima
--%>

<%@tag pageEncoding="UTF-8" %>
<%@taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="event" tagdir="/WEB-INF/tags/widget/event" %>
<%@taglib prefix="device" tagdir="/WEB-INF/tags/device" %>

 <%---------------------- 属性定義 ----------------------%>
<%@ attribute name="title"           description="画面名" required="true" rtexprvalue="true" %>
<%@ attribute name="topNavHtml"      description="トップナビゲーション領域の内容" fragment="true" required="true" %>
<%@ attribute name="headerHtml"      description="ヘッダー領域の内容" fragment="true" required="true" %>
<%@ attribute name="bodyLayoutHtml"  description="ボディ領域の内容" fragment="true" required="true" %>
<%@ attribute name="footerHtml"      description="フッター領域の内容" fragment="true" required="true" %>
<%@ attribute name="localCss"        description="ページ毎CSS" fragment="true" %>
<%@ attribute name="localJs"         description="ページ毎JS" fragment="true" %>
<%@ attribute name="localInclude"    description="ページ毎外部スクリプト" fragment="true" %>
<%@ attribute name="remainSubWindow" description="画面遷移後も閉じずに残すサブウィンドウ名のリスト(カンマ区切り)。デフォルトは空文字(全てのサブウィンドウを閉じる)" rtexprvalue="true" %>
<%@ attribute name="tabindexOrder"   description="タブの遷移順を領域単位で変更するための順序(カンマ区切り)。" rtexprvalue="true" %>
<%@ attribute name="whenToClose"     description="画面を閉じるイベント式を指定する。" rtexprvalue="true" %>
<%------------------------------------------------------------%>

<n:set var="pageTitle" value="${title}"/>

<html>

<head>
  <%-- HTTPヘッダ --%>
  <n:noCache />
  <device:set></device:set>
  <%-- htmlヘッダ --%>
  <jsp:include page="/include/html_head.jsp">
    <jsp:param name="title" value="${pageTitle}" />
  </jsp:include>

  <%-- ページ毎CSS --%>
  <style>
    <jsp:invoke fragment="localCss" />
  </style>
</head>

<body class="<n:write name='nablarch_deviceType' withHtmlFormat='false' />
             <n:write name='nablarch_deviceVersion' withHtmlFormat='false' />
             <n:write name='nablarch_browserType'  withHtmlFormat='false'/>
             <n:write name='nablarch_browserVersion'  withHtmlFormat='false'/>">
<%-- tabindexの定義 --%>
<c:if test="${not empty tabindexOrder}">
<div class="nablarch_TabindexOrder -order <n:write name='tabindexOrder' withHtmlFormat='false'/>" style="display:none;"></div>
</c:if>

<%-- 閉じる機能イベントの定義 --%>
<c:if test="${not empty whenToClose}" >
  <event:listen event="${whenToClose}">
    <event:window_close></event:window_close>
  </event:listen>
</c:if>
<event:listen event=".nablarch_WindowClose click">
 <event:window_close></event:window_close>
</event:listen>

<%-- トップナビゲーション領域 --%>
<div class="grid-row">
  <div id="top_nav">
    <jsp:invoke fragment="topNavHtml" />
  </div>
</div>

<%-- ヘッダー領域 --%>
<div class="grid-row">
  <div id="header">
    <jsp:invoke fragment="headerHtml" />
  </div>
</div>

<%-- メイン領域 --%>
<div class="grid-row enclose main">
  <jsp:invoke fragment="bodyLayoutHtml" />
</div>

<%-- フッター領域 --%>
<div class="grid-row">
  <div id="footer">
    <jsp:invoke fragment="footerHtml" />
  </div>
</div>
<device:script></device:script>
<jsp:include page="/include/js_include.jsp" />
<jsp:invoke fragment="localInclude" />

<%-- 画面遷移時にこのサブウィンドウから開かれた全てのサブウィンドウを閉じる --%>
<n:script type="text/javascript">
require(["jquery", "sugar"], function($) {
  var remainSubWindow = "<n:write name='remainSubWindow' withHtmlFormat='false'/>".split(/\s*,\s*/);
  $(function() {
    function closeAllSubWindows() {
      Object.each(nablarch_opened_windows, function(name, w) {
        if (!remainSubWindow.any(name)) {
          w.close();
        }
      });
    }
    $(window).on('unload', closeAllSubWindows)
             .on('beforeunload', closeAllSubWindows);

  });
});
</n:script>

<n:script type="text/javascript">
require(["jquery", "sugar"], function($) {
  <jsp:invoke fragment="localJs" />
});
</n:script>

</body>
</html>


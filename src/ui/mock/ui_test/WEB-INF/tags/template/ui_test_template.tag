<%-----------------------------------------------------------------
  UI部品テスト画面テンプレート
  @author Iwauo Tajima
------------------------------------------------------------------%>

<%@tag pageEncoding="UTF-8" %>
<%@taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/template" %>

<%---------------------- 属性定義 ----------------------%>
<%@ attribute name="title"                 description="画面名" required="true" rtexprvalue="true" %>
<%@ attribute name="noMenu"                description="サイドメニューを非表示にするかどうか(デフォルト:false)" rtexprvalue="true" %>
<%@ attribute name="confirmationPageTitle" description="確認画面名" %>
<%@ attribute name="topNavHtml"            description="トップナビゲーション領域の内容" fragment="true" %>
<%@ attribute name="headerHtml"            description="ヘッダー領域の内容" fragment="true" %>
<%@ attribute name="contentHtml"           description="メインコンテンツ領域の内容" fragment="true" %>
<%@ attribute name="asideHtml"             description="サイドコンテンツ領域の内容" fragment="true" %>
<%@ attribute name="footerHtml"            description="フッター領域の内容" fragment="true"  %>
<%@ attribute name="localCss"              description="ページ毎CSS" fragment="true" %>
<%@ attribute name="localJs"               description="ページ毎JS" fragment="true" %>
<%@ attribute name="testcase"              description="UI部品テストスクリプトパス" rtexprvalue="true" %>
<%@ attribute name="testpage"              description="テストページの内容パス" rtexprvalue="true"  %>
<%@ attribute name="testdata"              description="テストデータの内容パス" rtexprvalue="true"  %>
<%@ attribute name="suite"                 description="テストスイート名(=このJSPの親フォルダ名)" rtexprvalue="true"  %>
<%@ attribute name="whenToClose"           description="画面を閉じるイベント式を指定する。" rtexprvalue="true" %>
<%------------------------------------------------------------%>

<n:set
  var="title"
  value="${(empty nablarch_confirmationPage) ? title : confirmationPageTitle}"
  scope="page"
/>

<c:if test="${not empty testdata}">
  <jsp:include page="${testdata}" />
</c:if>

<t:base_layout title="${title}"
               whenToClose="${whenToClose}">
  <jsp:attribute name="localCss">
    <jsp:invoke fragment="localCss" />
  </jsp:attribute>

  <jsp:attribute name="topNavHtml">
    <jsp:invoke fragment="topNavHtml" />
    <c:if test="${empty topNavHtml}">
      <jsp:include page="/include/app_top_nav.jsp">
        <jsp:param name="title" value="${title}" />
      </jsp:include>
    </c:if>
  </jsp:attribute>

  <jsp:attribute name="headerHtml">
    <jsp:invoke fragment="headerHtml" />
    <c:if test="${empty headerHtml}">
      <jsp:include page="/include/app_header.jsp">
        <jsp:param name="title" value="${title}" />
      </jsp:include>
    </c:if>
  </jsp:attribute>


  <jsp:attribute name="bodyLayoutHtml">
    <n:set var="noMenuCss" value="${(empty noMenu) ? '' : 'noMenu'}" />

    <div id="qunit"></div>
    <%-- サイドコンテンツ領域 (5grid) --%>
    <div id="aside" class="<n:write name='noMenuCss' withHtmlFormat='false'/>">
      <jsp:include page="/include/aside.jsp" />
    </div>

    <%-- メインコンテンツ領域 (18grid)--%>
    <div id="content" class="<n:write name='noMenuCss' withHtmlFormat='false'/>">
      <jsp:include page="/include/app_error.jsp" />
      <jsp:invoke fragment="contentHtml" />
      <c:if test="${not empty testpage}">
        <jsp:include page="${testpage}" />
      </c:if>
    </div>
  </jsp:attribute>

  <jsp:attribute name="footerHtml">
    <jsp:invoke fragment="footerHtml" />
    <c:if test="${empty footerHtml}">
      <jsp:include page="/include/app_footer.jsp">
        <jsp:param name="title" value="${title}" />
      </jsp:include>
    </c:if>
  </jsp:attribute>

  <jsp:attribute name="localInclude">
    <c:if test="${not empty testcase}">
      <n:link rel="stylesheet" type="text/css" href="/css/qunit.css" charset="UTF-8" />
      <n:script type="text/javascript" src="/js/qunit.js" />
      <n:script type="text/javascript" src="/js/runner.js" />
      <n:script type="text/javascript" src="/js/testsupport.js" />
      <n:script type="text/javascript" src="${testcase}" />
    </c:if>
    <n:link rel="stylesheet" type="text/css" href="/css/demo.css" charset="UTF-8" />
  </jsp:attribute>

  <jsp:attribute name="localJs">
    window.isConfirmationPage = function() {
      var result = <n:forConfirmationPage>true;</n:forConfirmationPage><n:forInputPage>false;</n:forInputPage>
      return result;
    }
    <jsp:invoke fragment="localJs" />
  </jsp:attribute>
</t:base_layout>

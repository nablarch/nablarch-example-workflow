<%-----------------------------------------------------------------
  標準業務画面テンプレート (2ペイン/24グリッド)
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
<%@ attribute name="asideHtml"             description="サイドコンテンツ領域の内容" fragment="true" %>
<%@ attribute name="contentHtml"           description="メインコンテンツ領域の内容" fragment="true" required="true" %>
<%@ attribute name="footerHtml"            description="フッター領域の内容" fragment="true"  %>
<%@ attribute name="localCss"              description="ページ毎CSS" fragment="true" %>
<%@ attribute name="localJs"               description="ページ毎JS" fragment="true" %>
<%@ attribute name="remainSubWindow"       description="画面遷移後も閉じずに残すサブウィンドウ名のリスト(カンマ区切り)。デフォルトは空文字(全てのサブウィンドウを閉じる)" %>
<%@ attribute name="tabindexOrder"         description="タブの遷移順を領域単位で変更するための順序(カンマ区切り)。" %>
<%@ attribute name="whenToClose"           description="画面を閉じるイベント式を指定する。" rtexprvalue="true" %>
<%------------------------------------------------------------%>

<n:set
  var="title"
  value="${(empty nablarch_confirmationPage) ? title : confirmationPageTitle}"
  scope="page"
/>

<n:set var="noMenuClass" value="${(empty noMenu) ? '' : 'noMenu'}" scope="page" />

<t:base_layout title="${title}" remainSubWindow="${remainSubWindow}" tabindexOrder="${tabindexOrder}" whenToClose="${whenToClose}">
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
    <%-- サイドコンテンツ領域 --%>
    <div id="aside" class="<n:write name='noMenuClass' withHtmlFormat='false' />">
      <c:if test="${not noMenu}">
        <jsp:invoke fragment="asideHtml" />
        <c:if test="${empty asideHtml}">
          <jsp:include page="/include/app_aside.jsp">
            <jsp:param name="title" value="${title}" />
          </jsp:include>
        </c:if>
      </c:if>
    </div>

    <%-- メインコンテンツ領域 --%>
    <div id="content" class="<n:write name='noMenuClass' withHtmlFormat='false' />">
      <jsp:include page="/include/app_error.jsp" />
      <jsp:invoke fragment="contentHtml" />
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

  <jsp:attribute name="localJs">
    <jsp:invoke fragment="localJs" />
  </jsp:attribute>

</t:base_layout>

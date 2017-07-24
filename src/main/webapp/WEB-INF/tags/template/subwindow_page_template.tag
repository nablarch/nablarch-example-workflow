<%-----------------------------------------------------------------
  標準子画面テンプレート (1ペイン/18グリッド)
  @author Hisaaki Sioiri
------------------------------------------------------------------%>

<%@tag pageEncoding="UTF-8" %>
<%@taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/template" %>

<%---------------------- 属性定義 ----------------------%>
<%@ attribute name="title"                 description="画面名" required="true" rtexprvalue="true" %>
<%@ attribute name="topNavHtml"            description="トップナビゲーション領域の内容" fragment="true" %>
<%@ attribute name="headerHtml"            description="ヘッダー領域の内容" fragment="true" %>
<%@ attribute name="contentHtml"           description="メインコンテンツ領域の内容" fragment="true" required="true" %>
<%@ attribute name="footerHtml"            description="フッター領域の内容" fragment="true"  %>
<%@ attribute name="localCss"              description="ページ毎CSS" fragment="true" %>
<%@ attribute name="localJs"               description="ページ毎JS" fragment="true" %>
<%@ attribute name="tabindexOrder"         description="タブの遷移順を領域単位で変更するための順序(カンマ区切り)。" %>
<%@ attribute name="whenToClose"           description="画面を閉じるイベント式を指定する。" rtexprvalue="true" %>
<%------------------------------------------------------------%>

<t:base_layout
    title="${title}"
    tabindexOrder="${tabindexOrder}"
    whenToClose="${whenToClose}"
    >
  <jsp:attribute name="localCss">
    <jsp:invoke fragment="localCss" />
  </jsp:attribute>

  <jsp:attribute name="topNavHtml">
    <jsp:invoke fragment="topNavHtml" />
    <c:if test="${empty topNavHtml}">
      <jsp:include page="/include/subwindow_app_top_nav.jsp">
        <jsp:param name="title" value="${title}" />
      </jsp:include>
    </c:if>
  </jsp:attribute>

  <jsp:attribute name="headerHtml">
    <jsp:invoke fragment="headerHtml" />
    <c:if test="${empty headerHtml}">
      <jsp:include page="/include/subwindow_app_header.jsp">
        <jsp:param name="title" value="${title}" />
      </jsp:include>
    </c:if>
  </jsp:attribute>

  <jsp:attribute name="bodyLayoutHtml">
    <%--サイドバーは非表示--%>
    <div id="aside" class="noMenu"></div>
    <%-- メインコンテンツ領域 (18grid)--%>
    <div id="content" class="subwindow">
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

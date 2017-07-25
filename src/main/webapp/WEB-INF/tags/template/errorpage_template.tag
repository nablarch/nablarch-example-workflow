<%--
  共通エラー画面用テンプレート
  @author Iwauo Tajima
--%>

<%@tag pageEncoding="UTF-8" %>
<%@taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/template" %>

<%-- ページタイトル --%>
<%@attribute name="title" required="true" rtexprvalue="true" %>

<%-- エラーメッセージ --%>
<%@attribute name="errorMessageHtml" fragment="true" required="true" %>

<t:page_template title="${title}" noMenu="true">
  <jsp:attribute name="contentHtml">
    <div class="error-content">
      <jsp:invoke fragment="errorMessageHtml" />
      <c:if test="${not empty trackingNumber}">
        <div class="inquiry-number">
          <span class="inquiry-title">問い合わせ番号:</span> <n:write name="trackingNumber" />
        </div>
      </c:if>
    </div>
  </jsp:attribute>
</t:page_template>


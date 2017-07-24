<%--
  タブ型リンク
  @author Iwauo Tajima
--%>

<%@ tag pageEncoding="UTF-8" description="タブ型リンク" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ attribute name="title" description="タブに表示する見出し" rtexprvalue="true" required="true" %>
<%@ attribute name="uri" description="遷移先URI" required="true" rtexprvalue="true" %>
<%@ attribute name="id" description="HTMLのid属性" rtexprvalue="true" %>
<%@ attribute name="cssClass" description="HTMLのclass属性" rtexprvalue="true" %>
<%@ attribute name="dummyUri" rtexprvalue="true" description="画面設計時に使用する遷移先（紙芝居のように画面遷移する）（本番環境では使用しない）" %>
<%@ attribute name="allowDoubleSubmission" description="2重サブミットを許可するか否か。falseを指定した場合は許可しない。デフォルトはtrue" rtexprvalue="true" %>

<%-- タブ --%>
<c:if test="${renderingTabContent == 'false'}">
<div class="nablarch_TabLink">
<n:submitLink
    id="${id}"
    uri="${uri}"
    displayMethod="NORMAL"
    cssClass="TabLink -name ${tabGroupName} ${cssClass}"
    allowDoubleSubmission="${(empty allowDoubleSubmission) ? true : allowDoubleSubmission}">
  <n:prettyPrint name="title" />
  <jsp:doBody />
</n:submitLink>
</div>
</c:if>

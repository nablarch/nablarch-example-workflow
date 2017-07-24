<%--
  タブによる表示内容切り替え
  @author Iwauo Tajima
--%>

<%@ tag pageEncoding="UTF-8" description="タブによる表示内容切り替え" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>

<%@ attribute name="name" description="タブグループ名(必須)" required="true" rtexprvalue="true" %>

<%-- タブ --%>
<div class="tabgroup">
  <n:set var="tabGroupName" value="${name}" />
  <n:set var="renderingTabContent" value="false" />
  <jsp:doBody/>
</div>

<%-- タブの選択状態保持用 --%>
<n:plainHidden name="${tabGroupName}" />

<%-- コンテンツ --%>
<n:set var="renderingTabContent" value="true" />
<jsp:doBody/>

<%--
  タブによる表示内容切り替え
  @author Iwauo Tajima
--%>

<%@ tag pageEncoding="UTF-8" description="タブによる表示内容切り替え" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ attribute name="title"    description="タブに表示する見出し" required="true" rtexprvalue="true" %>
<%@ attribute name="value"   description="タブの識別名" required="true" rtexprvalue="true" %>
<%@ attribute name="selected" description="タブの初期選択状態" rtexprvalue="true" %>
<%@ attribute name="cssClass" description="HTMLのclass属性値" rtexprvalue="true" %>

<%-- 読み取り専用を表すcssクラスの定義 --%>
<n:set var="tabContentId" value="tab_content_${value}_content" />
<n:set var="isSelected"   value="${(selected) ? 'selected' : ''}" />

<%-- タブ --%>
<c:if test="${renderingTabContent == 'false'}">
<div class="<n:write name='cssClass' withHtmlFormat='false' />
            nablarch_Tab
              -content  #<n:write name='tabContentId' withHtmlFormat='false' />
              -name     <n:write name='tabGroupName' withHtmlFormat='false' />
              -value    <n:write name='value' withHtmlFormat='false' />
              <n:write name='isSelected' withHtmlFormat='false' />">
  <n:prettyPrint name="title" />
</div>
</c:if>

<%-- コンテンツ --%>
<c:if test="${renderingTabContent == 'true'}">
<div id="<n:write name='tabContentId' withHtmlFormat='false' />" style="display:none;">
  <jsp:doBody/>
</div>
</c:if>

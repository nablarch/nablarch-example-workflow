<%--
  要素配置ブロック
  @author Iwauo Tajima
--%>

<%@ tag pageEncoding="UTF-8" description="見出し付ブロックを出力するウィジェット" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ attribute name="title"       description="ブロックの見出し" rtexprvalue="true" %>
<%@ attribute name="id"          description="htmlのid属性" rtexprvalue="true" %>
<%@ attribute name="collapsible" description="ブロックを開閉可能とするか(デフォルトはfalse)" rtexprvalue="true" %>
<%@ attribute name="name"        description="ブロックの開閉状態を保持するフォームの入力要素名" rtexprvalue="true" %>
<%@ attribute name="value"       description="ブロックが開かれていた場合にサーバ側に送信する値" rtexprvalue="true" %>
<%@ attribute name="collapsed"   description="初期表示時にブロックを閉じるかどうか。(デフォルトはfalse)" rtexprvalue="true" %>
<%@ attribute name="showTitle"   description="ブロックの見出しを表示するかどうか。(デフォルトはtrue)" rtexprvalue="true" %>

<n:set var="isCollapsible" value="${collapsible == 'true' ? 'true' : 'false'}" />
<n:set var="isShowTitle" value="${showTitle == 'false' ? 'false' : 'true'}" />

<%-- 入力項目配置用ブロック --%>
<div class="title" id="<n:write name='id' withHtmlFormat='false' />">
  <n:set
    var = "collapsible_marker_css"
    value = "nablarch_Collapsible
      -content div.block_content.${value}
      -name    ${name}
      -value   ${value}
      ${collapsed == 'true' ? '-closed' : ''}"
  />

  <c:if test="${isShowTitle == 'true'}">
    <c:if test="${isCollapsible == 'true'}">
      <h2 class="<n:write name='collapsible_marker_css' withHtmlFormat='false' />">
        <n:prettyPrint name="title" />
      </h2>
    </c:if>
    <c:if test="${isCollapsible == 'false'}">
      <h2>
        <n:prettyPrint name="title" />
      </h2>
    </c:if>
  </c:if>

  <div class="block_content <n:write name='value' withHtmlFormat='false' />">
    <jsp:doBody/>
  </div>
</div>

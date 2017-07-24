<%--
  検索結果のテーブル表示
  @author Iwauo Tajima
--%>
<%@ tag pageEncoding="UTF-8" description="テーブル（検索結果など）を出力するウィジェット" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="listSearchResult" tagdir="/WEB-INF/tags/listSearchResult" %>

<%-- ============================ 属性定義 =============================== --%>

<%@ attribute name="title"              description="見出し文字列[ローカル表示必須]" required="true" rtexprvalue="true" %>
<%@ attribute name="id"                 description="テーブルのID属性" rtexprvalue="true" %>
<%@ attribute name="showTitle"          description="タイトルを見出しとして表示するか(デフォルト:true)" rtexprvalue="true" %>
<%@ attribute name="searchUri"          description="検索処理を行うリクエストのURI" rtexprvalue="true" %>
<%@ attribute name="listSearchInfoName" description="検索条件を格納する変数名" required="true" rtexprvalue="true" %>
<%@ attribute name="resultSetName"      description="検索結果を格納する変数名" rtexprvalue="true" %>
<%@ attribute name="resultNumName"      description="検索結果件数を格納する変数名(resultSetNameといずれか必須)" rtexprvalue="true" %>
<%@ attribute name="resultSetCss"       description="検索結果表示領域に適用するCSSクラス" rtexprvalue="true" %>
<%@ attribute name="usePaging"          description="ページングを使用するか否か（デフォルトは使用する:true）" rtexprvalue="true" %>
<%@ attribute name="sampleResults"      description="サンプルで表示する件数(本番動作時では使用されない。)[ローカル表示必須]" rtexprvalue="true" %>

<%-- ================================================================================ --%>


<%-- ============================ 属性定義（設計書向け） =============================== --%>

<%@ attribute name="sortCondition"             description="テーブルの初期ソート条件（画面概要の一覧表示のリストで、ソート条件に表示される）" %>
<%@ attribute name="comment"                   description="テーブルについての備考（画面概要の一覧表示のリストで、備考に表示される）" %>
<%@ attribute name="estimatedMaxSearchResults" description="検索結果として想定される最大件数（画面概要の一覧表示のリストで、想定検索最大件数に表示される）" %>

<%-- ================================================================================ --%>


<%-- 複数行表示対応 --%>
<%@ attribute name="multipleRowLayout" description="複数の行レイアウトが含まれる場合かどうか。デフォルトは'false'" rtexprvalue="true" %>

<c:if test="${not empty searchUri}">
  <n:set var="searchUri" value="${searchUri}" />
</c:if>

<c:if test="${not empty listSearchInfoName}">
  <n:set var="listSearchInfoName" value="${listSearchInfoName}" />
</c:if>

<c:if test="${empty showTitle}">
  <n:set var="showTitle" value="true" />
</c:if>

<c:if test="${not empty resultSetName}">
  <n:set var="resultSet" name="${resultSetName}" scope="page" bySingleValue="false" />
</c:if>
<c:if test="${not empty resultNumName}">
  <n:set var="resultNum" name="${resultNumName}" scope="page" bySingleValue="false" />
  <n:hidden name="${resultNumName}" />
</c:if>

<c:if test="${(not empty resultSet) || (not empty resultNum)}">
  <c:if test="${showTitle == 'true'}">
  <div class="title">
    <h2>
      <n:prettyPrint name="title" />
      (<n:write name="${listSearchInfoName}.resultCount" />件)
    </h2>
  </div>
  </c:if>
</c:if>

<listSearchResult:listSearchResult
  listSearchInfoName = "${listSearchInfoName}"
  searchUri          = "${searchUri}"
  resultSetName      = "${resultSetName}"
  resultNumName      = "${resultNumName}"
  useResultCount     = "false"
  usePaging          = "${(not empty usePaging) ? usePaging : true}"
  pagingPosition     = "both"
  resultSetCss       = "${resultSetCss} nablarch_resultSet"
  id                 = "${id}">

  <jsp:attribute name="headerRowFragment">
    <%-- ヘッダー部 --%>
    <c:if test="${multipleRowLayout != 'true'}">
    <tr class="<n:write name='oddEvenCss' withHtmlFormat='false' />">
      <n:set var="renderingHeader" value="true"  />
      <n:set var="renderingRows"   value="false" />
      <jsp:doBody/>
    </tr>
    </c:if>
    <c:if test="${multipleRowLayout == 'true'}">
      <n:set var="renderingHeader" value="true" />
      <n:set var="renderingRows"   value="false" />      
      <jsp:doBody/>
    </c:if>
  </jsp:attribute>
  
  <jsp:attribute name="bodyRowFragment">
    <%-- ボディ部 --%>
    <c:if test="${multipleRowLayout != 'true'}">
    <tr class="<n:write name='oddEvenCss' withHtmlFormat='false' />">
      <n:set var="renderingHeader" value="false" />
      <n:set var="renderingRows"   value="true" />
      <jsp:doBody/>
    </tr>
    </c:if>

    <c:if test="${multipleRowLayout == 'true'}">
      <n:set var="renderingHeader" value="false" />
      <n:set var="renderingRows"   value="true" />
      <jsp:doBody/>
    </c:if>
  </jsp:attribute>

</listSearchResult:listSearchResult>

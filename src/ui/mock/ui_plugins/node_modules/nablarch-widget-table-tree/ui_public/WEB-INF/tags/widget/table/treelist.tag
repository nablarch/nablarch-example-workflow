<%--
  階層化リスト表示
  @author Iwauo Tajima
--%>
<%@ tag pageEncoding="UTF-8" description="部署一覧、部品表など、階層化されたデータの一覧を表示するウィジェット" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="listSearchResult" tagdir="/WEB-INF/tags/listSearchResult" %>

<%-- ============================ 属性定義 =============================== --%>
<%@ attribute name="title"              description="見出し文字列" required="true" rtexprvalue="true" %>
<%@ attribute name="id"                 description="テーブルのID属性" rtexprvalue="true" %>
<%@ attribute name="resultSetName"      description="検索結果を格納する変数名" required="true" rtexprvalue="true" %>
<%@ attribute name="resultSetCss"       description="検索結果表示領域に適用するCSSクラス" rtexprvalue="true" %>
<%@ attribute name="key"                description="階層化対象キー" required="true" rtexprvalue="true" %>
<%@ attribute name="name"               description="ツリーの開閉状態の保持に使用するフォーム要素のname属性値" required="true" rtexprvalue="true" %>
<%@ attribute name="hierarchy"          description="階層構造の定義式。以下の3つの書式のいずれかを指定する。 1. chars:(数値)|(数値)|...|(数値) 各要素のid属性値を先頭からの文字数で分割し階層を決定する方法。 2. separator:(区切り文字列) 各要素のid属性値を区切り文字列で分割し階層を決定する方法。 3. function: (グローバル関数名) 指定されたグローバル関数を使用して階層を決定する方法。" required="true" rtexprvalue="true" %>

<%@ attribute name="sampleResults"      description="サンプルで表示する件数(本番動作時では使用されない。)" rtexprvalue="true" %>

<%-- ================================================================================ --%>


<%-- ============================ 属性定義（設計書向け） =============================== --%>

<%@ attribute name="sortCondition"             description="このテーブルの初期ソート条件（画面概要の一覧表示のリストで、ソート条件に表示される）" %>
<%@ attribute name="comment"                   description="このテーブルについての備考（画面概要の一覧表示のリストで、備考に表示される）" %>
<%@ attribute name="estimatedMaxSearchResults" description="検索結果として想定される最大件数（画面概要の一覧表示のリストで、想定検索最大件数に表示される）" %>

<%-- ================================================================================ --%>


<n:set var="resultSet" name="${resultSetName}" scope="page" bySingleValue="false" />

<c:if test="${resultSet != null}">
  <div class="title">
    <h2><n:prettyPrint name="title" /></h2>
  </div>
</c:if>

<%-- 各ブロック、ツリーの開閉状態 --%>
<n:plainHidden name="${name}"></n:plainHidden>

<listSearchResult:listSearchResult
  resultSetName       = "${resultSetName}"
  useResultCount      = "false"
  usePaging           = "false"
  resultSetCss        = "${resultSetCss}
                         nablarch_resultSet
                         nablarch_TreeList
                           -name ${name}
                           -hierarchy ${hierarchy}
                           -depth     3
                           -items      tr:has(td)
                           -navigation td.tree_toggler">
  <jsp:attribute name="headerRowFragment">
    <%-- ヘッダー部 --%>
    <tr class="<n:write name='oddEvenCss' withHtmlFormat='false' />">
      <n:set var="renderingHeader" value="true"  />
      <n:set var="renderingRows"   value="false" />
      <n:set var="columnNum"       value="0" />
      <jsp:doBody/>
    </tr>
  </jsp:attribute>
    
        
  <jsp:attribute name="bodyRowFragment">
    <%-- ボディ部 --%>
    <n:set var="row_key" name="row.${key}" />  
    <tr id="<n:write name='row_key' withHtmlFormat='false' />"
        class="<n:write name='oddEvenCss' withHtmlFormat='false' />">
      <n:set var="renderingHeader" value="false" />
      <n:set var="renderingRows"   value="true" />
      <jsp:doBody/>
    </tr>
  </jsp:attribute>

</listSearchResult:listSearchResult>

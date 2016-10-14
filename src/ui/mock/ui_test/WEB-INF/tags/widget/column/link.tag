<%--
  テーブルカラム定義 (リンク表示)
  @author Iwauo Tajima
--%>
<%@ tag pageEncoding="UTF-8" description="テーブルカラム定義 (リンク表示)" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="listSearchResult" tagdir="/WEB-INF/tags/listSearchResult" %>

<%-- ============================ 属性定義 =============================== --%>

<%@ attribute name="key"      description="カラムキー" rtexprvalue="true" %>
<%@ attribute name="title"    description="カラムヘッダーに表示する文字列" required="true" rtexprvalue="true" %>
<%@ attribute name="value"    description="リンクテキスト文字列" rtexprvalue="true" %>
<%@ attribute name="domain"   description="データのドメイン型" rtexprvalue="true" %>
<%@ attribute name="cssClass" description="各カラムに指定するCSSクラス" rtexprvalue="true" %>
<%@ attribute name="sortable" description="【table:search_resultタグでのみ利用可能】カラムのソートリンクを表示するかどうか(デフォルト:false)" rtexprvalue="true" %>
<%@ attribute name="uri"      description="リンク対象URI" required="true" rtexprvalue="true" %>
<%@ attribute name="inactive" description="リンクを非活性とするかどうか。trueの場合にはリンクを非活性とし、ラベル表示される。" rtexprvalue="true" %>
<%@ attribute name="sample"   description="テスト用のダミー入力値(本番動作では使用されない)" rtexprvalue="true" %>
<%@ attribute name="dummyUri" description="テスト用のダミー遷移先(本番動作では使用されない)" rtexprvalue="true" %>
<%@ attribute name="width"    description="カラムの横幅。" rtexprvalue="true"%>

<%-- 複数行表示対応 --%>
<%@ attribute name="colspan"  description="横方向に結合するカラム数。" rtexprvalue="true" %>
<%@ attribute name="rowspan"  description="縦方向に結合するカラム数。" rtexprvalue="true" %>

<%-- ============================ 属性定義（設計書表示用） =============================== --%>
<%@ attribute name="dataFrom" description="表示するデータの取得元（画面項目定義に記載する、「表示情報取得元」.「表示項目名」の形式で設定する）" %>
<%@ attribute name="comment"    description="このリンクについての備考（画面項目定義の項目定義一覧で、備考欄に表示される）" %>
<%@ attribute name="initialValueDesc"    description="初期表示内容に関する説明。" %>

<n:set var="styleWidth" value="${(empty width) ? '' : 'width : '}" scope="page"/>
<c:set var="sortable" value="${(empty sortable) ? 'false' : sortable}" />

<%-- ヘッダー行 --%>
<c:if test="${renderingHeader == 'true'}">
  <th
    colspan="<n:write name='colspan' withHtmlFormat='false'/>"
    rowspan="<n:write name='rowspan' withHtmlFormat='false'/>"
    class="<n:write name='cssClass' withHtmlFormat='false' />"
    style="<n:write name='styleWidth' withHtmlFormat='false' /> <n:write name='width' withHtmlFormat='false' />">
    <c:if test="${sortable == 'false'}">
      <n:prettyPrint name="title" />
    </c:if>
    <c:if test="${sortable == 'true'}">
      <listSearchResult:listSearchSortSubmit
        tag                = "submitLink"
        ascSortId          = "${key}_asc"
        descSortId         = "${key}_desc"
        name               = "${key}"
        label              = "${title}"
        uri                = "${searchUri}"
        listSearchInfoName = "${listSearchInfoName}"
      />
    </c:if>
  </th>
</c:if>

<%-- ボディ行 --%>
<c:if test="${renderingRows == 'true'}">
  <c:if test="${not empty value}"><n:set var="linkText" name="value" /></c:if>
  <c:if test="${empty value}"><n:set var="linkText" name="row.${key}" /></c:if>

  <td
    colspan="<n:write name='colspan' withHtmlFormat='false'/>"
    rowspan="<n:write name='rowspan' withHtmlFormat='false'/>"
    class=  "<n:write name='cssClass' withHtmlFormat='false' />
            <n:write name='domain' withHtmlFormat='false' />"
    style="<n:write name='styleWidth' withHtmlFormat='false' /> <n:write name='width' withHtmlFormat='false' />">
    <c:if test="${inactive != 'true'}">
      <n:submitLink
        uri="${uri}">
        <n:write name="linkText" />
        <jsp:doBody />
      </n:submitLink>
    </c:if>
    <c:if test="${inactive == 'true'}">
      <n:write name="linkText" />
    </c:if>
  </td>

</c:if>

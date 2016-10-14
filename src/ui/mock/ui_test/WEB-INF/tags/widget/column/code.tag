<%--
  テーブルカラム定義(コード値表示)
  @author Iwauo Tajima
--%>
<%@ tag pageEncoding="UTF-8" description="テーブルカラム定義(コード表示)" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="listSearchResult" tagdir="/WEB-INF/tags/listSearchResult" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>

<%-- ============================ 属性定義 =============================== --%>

<%@ attribute name="key"      description="カラムキー" required="true" rtexprvalue="true" %>
<%@ attribute name="title"    description="カラムヘッダーに表示する文字列" required="true" rtexprvalue="true" %>
<%@ attribute name="cssClass" description="各カラムに指定するCSSクラス" rtexprvalue="true" %>
<%@ attribute name="sortable" description="【table:search_resultタグでのみ利用可能】カラムのソートリンクを表示するかどうか(デフォルト:false)" rtexprvalue="true" %>
<%@ attribute name="sample"   description="テスト用のダミー入力値(本番動作では使用されない)" rtexprvalue="true" %>

<%@ attribute name="samplePattern"    description="1レコードに出力する件数の出現パターン。カンマ区切りで指定する。(本番動作では使用されない)" %>
<%@ attribute name="codeId"           description="コード定義ID" required="true" rtexprvalue="true" %>
<%@ attribute name="pattern"          description="使用するコードパターンのカラム名(デフォルトは'PATTERN01')" rtexprvalue="true" %>
<%@ attribute name="optionColumnName" description="取得するオプション名称のカラム名(デフォルトは'OPTION01')" rtexprvalue="true" %>
<%@ attribute name="labelPattern"     description="ラベル表示書式(デフォルト:$NAME$)" rtexprvalue="true" %>
<%@ attribute name="listFormat"       description="リスト表示時に使用するフォーマット。（デフォルト値は'sp'）" rtexprvalue="true" %>
<%@ attribute name="width"            description="カラムの横幅。" rtexprvalue="true"%>

<%-- 複数行表示対応 --%>
<%@ attribute name="colspan"    description="横方向に結合するカラム数。" rtexprvalue="true" %>
<%@ attribute name="rowspan"    description="縦方向に結合するカラム数。" rtexprvalue="true" %>
<%@ attribute name="additional" description="付加情報かどうか(trueの場合narrow表示モードで別形式での表示となる。デフォルトはfalse)" rtexprvalue="true"%>

<%-- 属性定義（設計書） --%>
<%@ attribute name="dataFrom" description="表示するデータの取得元（画面項目定義に記載する、「表示情報取得元」.「表示項目名」の形式で設定する）" %>
<%@ attribute name="comment"    description="このコード値表示についての備考（画面項目定義の項目定義一覧で、備考欄に表示される）" %>
<%@ attribute name="initialValueDesc"    description="初期表示内容に関する説明。" %>


<%-- 明示的に指定しなかった場合に使用するパターンコードのカラム名 --%>
<n:set var="defaultPattern" value="PATTERN01" />
<%-- 明示的に指定しなかった場合に使用するオプション名称のカラム名 --%>
<n:set var="defaultOption" value="OPTION01" />
<%-- 明示的に指定しなかった場合に使用するラベルコード --%>
<n:set var="defaultLabel" value="$NAME$" />

<c:set var="sortable" value="${(empty sortable) ? 'false' : sortable}" />

<n:set var="headerSpan" value="${(empty headerSpan) ? 1 : headerSpan}" scope="page"/>
<n:set var="styleWidth" value="${(empty width) ? '' : 'width : '}" scope="page"/>
<n:set var="additionalColumnCss" value="${(additional == 'true') ? 'additional' : ''}" scope="page" />

<%-- ヘッダー行 --%>
<c:if test="${renderingHeader == 'true'}">
  <th
    colspan="<n:write name='colspan' withHtmlFormat='false'/>"
    rowspan="<n:write name='rowspan' withHtmlFormat='false'/>"
    class="<n:write name='cssClass' withHtmlFormat='false' />
           <n:write name='additionalColumnCss' withHtmlFormat='false' />"
    style="<n:write name='styleWidth' withHtmlFormat='false' /> <n:write name='width' withHtmlFormat='false' />">
    <c:if test="${sortable == 'false'}">
      <n:prettyPrint name="title" />
    </c:if>
    <c:if test="${sortable == 'true'}">
      <listSearchResult:listSearchSortSubmit
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
  <td
    colspan="<n:write name='colspan' withHtmlFormat='false'/>"
    rowspan="<n:write name='rowspan' withHtmlFormat='false'/>"
    class="<n:write name='cssClass' withHtmlFormat='false' />
           <n:write name='additionalColumnCss' withHtmlFormat='false' />"
    style="<n:write name='styleWidth' withHtmlFormat='false' /> <n:write name='width' withHtmlFormat='false' />">
    <n:code
      name             = "row.${key}"
      codeId           = "${codeId}"
      pattern          = "${(empty pattern) ? defaultPattern : pattern}"
      optionColumnName = "${(empty optionColumnName) ? defaultOption : optionColumnName}"
      labelPattern     = "${(empty labelPattern) ? defaultLabel : labelPattern}"
      listFormat       = "${(empty listFormat) ? 'sp' : listFormat}"
    />
  </td>
</c:if>

<%-- 付加情報表示領域 --%>
<c:if test="${(renderingInlay == 'true') && (additional == 'true')}">
  <div class="inlayDataRecord">
    <div class="inlayTitle"><n:prettyPrint name="title" />：</div>
    <div class="inlayData">
      <n:code
        name             = "row.${key}"
        codeId           = "${codeId}"
        pattern          = "${(empty pattern) ? defaultPattern : pattern}"
        optionColumnName = "${(empty optionColumnName) ? defaultOption : optionColumnName}"
        labelPattern     = "${(empty labelPattern) ? defaultLabel : labelPattern}"
        listFormat       = "${(empty listFormat) ? 'sp' : listFormat}"
      />
    </div>
  </div>
</c:if>

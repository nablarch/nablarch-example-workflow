<%--
  テーブルカラム定義(テキスト表示)
  @author Iwauo Tajima
--%>
<%@ tag pageEncoding="UTF-8" description="テーブルカラム定義(テキスト表示)" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="listSearchResult" tagdir="/WEB-INF/tags/listSearchResult" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>

<%-- ============================ 属性定義 =============================== --%>

<%@ attribute name="key"         description="カラムキー" required="true" rtexprvalue="true" %>
<%@ attribute name="title"       description="カラムヘッダーに表示する文字列" required="true" rtexprvalue="true" %>
<%@ attribute name="value"       description="カラムの表示内容" rtexprvalue="true" %>
<%@ attribute name="domain"      description="データのドメイン型" rtexprvalue="true" %>
<%@ attribute name="cssClass"    description="各カラムに指定するCSSクラス" rtexprvalue="true" %>
<%@ attribute name="sortable"    description="【table:search_resultタグでのみ利用可能】カラムのソートリンクを表示するかどうか(デフォルト:false)" rtexprvalue="true" %>
<%@ attribute name="valueFormat" description="出力する値のフォーマット指定" rtexprvalue="true" %>
<%@ attribute name="sample"      description="テスト用のダミー入力値(本番動作では使用されない)" rtexprvalue="true" %>
<%@ attribute name="width"       description="カラムの横幅。" rtexprvalue="true"%>
<%@ attribute name="additional"  description="付加情報かどうか(trueの場合narrow表示モードで別形式での表示となる。デフォルトはfalse)" rtexprvalue="true"%>


<%-- ============================ 階層リスト用属性 =============================== --%>
<%@ attribute name="tree_indent"  description="階層の深さに応じたインデントを表示するかどうか。(デフォルトはfalse)" rtexprvalue="true" %>
<%@ attribute name="tree_toggler" description="各階層の開閉を行うボタンをこのカラム内に表示するかどうか。(デフォルトはfalse)" rtexprvalue="true" %>


<%-- ============================ 設計書用属性 =============================== --%>
<%@ attribute name="dataFrom"   description="表示するデータの取得元（画面項目定義に記載する、「表示情報取得元」.「表示項目名」の形式で設定する）" %>
<%@ attribute name="comment"    description="このラベル表示についての備考（画面項目定義の項目定義一覧で、備考欄に表示される）" %>
<%@ attribute name="formatSpec" description="編集仕様に関する説明" %>
<%@ attribute name="initialValueDesc"    description="初期表示内容に関する説明。" %>


<%-- 複数行表示対応 --%>
<%@ attribute name="colspan"  description="横方向に結合するカラム数。" rtexprvalue="true" %>
<%@ attribute name="rowspan"  description="縦方向に結合するカラム数。" rtexprvalue="true" %>
<%@ attribute name="autospan" description="項目値による自動カラム連結。" rtexprvalue="true"%>

<c:set var="sortable" value="${(empty sortable) ? 'false' : sortable}" />
<n:set var="tree_indent" value="${(tree_indent == 'true') ? 'tree_indent' : ''}" scope="page" />
<n:set var="tree_toggler" value="${(tree_toggler == 'true') ? 'tree_toggler' : ''}" scope="page" />
<n:set var="styleWidth" value="${(empty width) ? '' : 'width : '}" scope="page"/>
<n:set var="colClass" value="col_${key}" scope="page"/>
<n:set var="additionalColumnCss" value="${(additional == 'true') ? 'additional' : ''}" scope="page" />

<%-- ヘッダー行 --%>
<c:if test="${renderingHeader == 'true'}">
  <th
    colspan="<n:write name='colspan' withHtmlFormat='false'/>"
    rowspan="<n:write name='rowspan' withHtmlFormat='false'/>"
    class="<n:write name='colClass' withHtmlFormat='false' />
           <n:write name='cssClass' withHtmlFormat='false' />
           <n:write name='additionalColumnCss' withHtmlFormat='false' />"
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
</c:if><%-- ボディ行 --%><%-- 改行が重なるとIE9、IE10でレンダリングがこける問題の対応で改行を削る(#8653) --%>
<c:if test="${renderingRows == 'true'}"><%-- 一度だけバインドするためindexで判定する。(index == 0 で判定するとローカルレンダリングができないのでcount==1を利用する。)--%>
<c:if test="${(status.count == 1) && (not empty autospan)}"><n:set var="autospanMarkerCss" value="nablarch_AutoSpan -selector 'td.col_${key}'" scope="page"/>
</c:if><td
    colspan="<n:write name='colspan' withHtmlFormat='false'/>"
    rowspan="<n:write name='rowspan' withHtmlFormat='false'/>"
    class=  "<n:write name='colClass' withHtmlFormat='false' />
             <n:write name='cssClass' withHtmlFormat='false' />
             <n:write name='domain' withHtmlFormat='false' />
             <n:write name='tree_indent' withHtmlFormat='false' />
             <n:write name='tree_toggler' withHtmlFormat='false' />
             <n:write name='additionalColumnCss' withHtmlFormat='false' />
             <n:write name='autospanMarkerCss' withHtmlFormat='false' />"
    data-autospan="<n:write name='autospan' withHtmlFormat='false' />"
    style="<n:write name='styleWidth' withHtmlFormat='false' /><n:write name='width' withHtmlFormat='false' />"><c:if test="${empty valueFormat}">
<c:if test="${empty value}"><n:write name="row.${key}" /></c:if><c:if test="${not empty value}"><n:write name="value" /></c:if>
</c:if><c:if test="${not empty valueFormat}">
  <c:if test="${empty value}"><n:write name="row.${key}" valueFormat="${valueFormat}"/></c:if>
  <c:if test="${not empty value}"><n:write name="value" valueFormat="${valueFormat}"/></c:if>
</c:if></td>
</c:if>

<%-- 付加情報表示領域 --%>
<c:if test="${(renderingInlay == 'true') && (additional == 'true')}">
  <div class="inlayDataRecord">
    <div class="inlayTitle"><n:prettyPrint name="title" />：</div>
    <div class="inlayData">
    <c:if test="${empty valueFormat}">
      <c:if test="${empty value}"><n:write name="row.${key}" /></c:if>
      <c:if test="${not empty value}"><n:write name="value" /></c:if>
    </c:if>
    <c:if test="${not empty valueFormat}">
      <c:if test="${empty value}"><n:write name="row.${key}" valueFormat="${valueFormat}"/></c:if>
      <c:if test="${not empty value}"><n:write name="value" valueFormat="${valueFormat}"/></c:if>
    </c:if>
    </div>
  </div>
</c:if>
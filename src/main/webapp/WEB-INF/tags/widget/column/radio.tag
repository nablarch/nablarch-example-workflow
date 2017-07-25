<%--
  テーブルカラム定義 (行選択用ラジオボタン)
  @author Iwauo Tajima
--%>
<%@ tag pageEncoding="UTF-8" description="テーブルカラム定義 (行選択用ラジオボタン)" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- ============================ 属性定義 =============================== --%>

<%@ attribute name="key"      description="カラムキー" required="true" rtexprvalue="true" %>
<%@ attribute name="title"    description="カラムヘッダーに表示する文字列" required="true" rtexprvalue="true" %>
<%@ attribute name="cssClass" description="各カラムに指定するCSSクラス" rtexprvalue="true" %>

<%@ attribute name="name"     description="ラジオボタンのname属性" required="true" rtexprvalue="true" %>
<%@ attribute name="value"    description="ラジオボタン選択時に送信する値" rtexprvalue="true" %>

<%@ attribute name="disabled" description="サーバに対する入力値の送信を抑制するかどうか" rtexprvalue="true" %>
<%@ attribute name="readonly" description="編集可能かどうか" rtexprvalue="true" %>

<%@ attribute name="width"    description="カラムの横幅。" rtexprvalue="true"%>

<%-- 複数行表示対応 --%>
<%@ attribute name="colspan"  description="横方向に結合するカラム数。" rtexprvalue="true" %>
<%@ attribute name="rowspan"  description="縦方向に結合するカラム数。" rtexprvalue="true" %>

<%-- 属性定義（設計書） --%>
<%@ attribute name="dataFrom" description="表示するデータの取得元（画面項目定義に記載する、「表示情報取得元」.「表示項目名」の形式で設定する）" %>
<%@ attribute name="comment"    description="このラジオボタンについての備考（画面項目定義の項目定義一覧で、備考欄に表示される）" %>
<%@ attribute name="initialValueDesc"    description="初期表示内容に関する説明。" %>

<n:set var="styleWidth" value="" />
<c:if test="${not empty width}">
  <n:set var="styleWidth" value="width: ${width};" scope="page"/>
</c:if>

<%-- ヘッダー行 --%>
<c:if test="${renderingHeader == 'true'}">
  <th
    colspan="<n:write name='colspan' withHtmlFormat='false'/>"
    rowspan="<n:write name='rowspan' withHtmlFormat='false'/>"
    class="<n:write name='cssClass' withHtmlFormat='false' />"
    style="<n:write name='styleWidth' withHtmlFormat='false' />">
    <n:prettyPrint name="title" />
  </th>
</c:if>

<%-- ボディ行 --%>
<c:if test="${renderingRows == 'true'}">

  <n:set var="keyValue" name="row.${key}" />
  <n:set var="onValue"  value="${(not empty value) ? value : keyValue}" />
  <n:set var="displayLabel" value="${(empty nablarch_confirmationPage) ? '' : '●'}" />

  <td
    colspan="<n:write name='colspan' withHtmlFormat='false'/>"
    rowspan="<n:write name='rowspan' withHtmlFormat='false'/>"
    class="<n:write name='cssClass' withHtmlFormat='false' />"
    style="text-align:center; <n:write name='styleWidth' withHtmlFormat='false' />">

    <n:radioButton
      name     = "${name}"
      value    = "${onValue}"
      disabled = "${disabled}"
      label    = "${displayLabel}"
      style    = "width:20px;"
      cssClass = "${(readonly) ? 'nablarch_readonly' : ''}"
    />
  </td>

</c:if>

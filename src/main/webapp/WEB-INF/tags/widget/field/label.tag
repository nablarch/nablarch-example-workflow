<%--
  ラベル表示
  @author Hisaaki Sioiri
--%>

<%@tag pageEncoding="UTF-8" description="項目のラベル表示を行うウィジェット" %>
<%@taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>

<%---------------------- 属性定義 ----------------------%>
<%@ attribute name="title"       description="項目名" required="true" rtexprvalue="true" %>
<%@ attribute name="name"        description="出力対象の値を変数スコープから取得するための名前" rtexprvalue="true" required="true" %>
<%@ attribute name="id"          description="HTMLのid属性値 (省略時はname属性と同じ値を使用する)" rtexprvalue="true" %>
<%@ attribute name="cssClass"    description="HTMLのclass属性値" rtexprvalue="true" %>
<%@ attribute name="domain"      description="データのドメイン型" rtexprvalue="true" %>
<%@ attribute name="sample"      description="テスト用のダミー入力値(本番動作では使用されない)" rtexprvalue="true" %>
<%@ attribute name="valueFormat" description="出力時のフォーマット（詳細は、write(n:write)タグを参照" rtexprvalue="true" %>
<%@ attribute name="unit"        description="ラベルの右側に表示する単位" rtexprvalue="true" %>
<%---------------------- 属性定義（設計書） ----------------------%>
<%@ attribute name="comment"    description="このラベル表示項目についての備考（画面項目定義の項目定義一覧で、備考欄に表示される）" %>
<%@ attribute name="initialValueDesc"    description="初期表示内容に関する説明。" %>
<%@ attribute name="formatSpec" description="編集仕様に関する説明" %>
<%@ attribute name="dataFrom"   description="表示するデータの取得元（画面項目定義に記載する、「表示情報取得元」.「表示項目名」の形式で設定する）" %>

<%---------------------- マルチレイアウト用属性 ----------------------%>
<%@ attribute name="titleSize" description="タイトル部の幅（グリッド数）※マルチレイアウトモードの場合に使用する。" rtexprvalue="true" %>
<%@ attribute name="inputSize" description="入力部の幅（グリッド数）※マルチレイアウトモードの場合に使用する。" rtexprvalue="true" %>
<%------------------------------------------------------------%>

<n:set var="labelId" value="${(empty id) ? name : id}" />

<field:base title="${title}"
    fieldClass="${domain}"
    contentId="${labelId}"
    inputField="false"
    contentClass="${cssClass}"
    titleSize="${titleSize}"
    inputSize="${inputSize}">

  <jsp:attribute name="fieldContent">
    <c:if test="${not empty valueFormat}">
      <n:write name="${name}" valueFormat="${valueFormat}" />
    </c:if>
    <c:if test="${empty valueFormat}">
      <n:write name="${name}" />
    </c:if>

    <c:if test="${not empty unit}">
      <n:set var="value" name="${name}" scope="page" />
      <c:if test="${not empty value}">
        <span class="unit">
          <n:write name="unit" withHtmlFormat="false" />
        </span>
      </c:if>
    </c:if>
  </jsp:attribute>
</field:base>



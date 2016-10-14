<%--
  ラベル表示

  ID値と名称（VALUE）を「:」で連結して出力する。

  @author Hisaaki Sioiri
--%>

<%@tag pageEncoding="UTF-8" description="ID値と名称（VALUE）を「:」で連結して出力する。" %>
<%@taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>

<%---------------------- 属性定義 ----------------------%>
<%@ attribute name="title" description="項目名" required="true" rtexprvalue="true" %>
<%@ attribute name="sample" description="テスト用のダミー入力値 (IDのサンプル値):(名称のサンプル値) の書式で入力する。" rtexprvalue="true" %>
<%@ attribute name="domain"    description="項目のドメイン型" rtexprvalue="true" %>

<%---------------------- 個別属性 ----------------------%>
<%@ attribute name="idName" description="ID値のname属性" required="true" rtexprvalue="true" %>
<%@ attribute name="valueName" description="名称のname属性" required="true" rtexprvalue="true" %>

<%---------------------- 属性定義（設計書） ----------------------%>
<%@ attribute name="dataFrom" description="表示するデータの取得元（画面項目定義に記載する、「表示情報取得元」.「表示項目名」の形式で設定する）" %>
<%@ attribute name="comment"    description="この表示項目についての備考（画面項目定義の項目定義一覧で、備考欄に表示される）" %>
<%@ attribute name="initialValueDesc"    description="初期表示内容に関する説明。" %>

<%---------------------- マルチレイアウト用属性 ----------------------%>
<%@ attribute name="titleSize" description="タイトル部の幅（グリッド数）※マルチレイアウトモードの場合に使用する。" rtexprvalue="true" %>
<%@ attribute name="inputSize" description="入力部の幅（グリッド数）※マルチレイアウトモードの場合に使用する。" rtexprvalue="true" %>

<n:set var="labelValue" value="" />
<n:set var="labelId" name="${idName}" />
<n:set var="labelName" name="${valueName}" />

<field:base
    title="${title}"
    inputField="false"
    titleSize="${titleSize}"
    inputSize="${inputSize}">
  <jsp:attribute name="fieldContent">
    <c:if test="${not empty labelId}">
      <n:set var="labelValue"
          value="${labelId}:${labelName}" />
    </c:if>
    <n:write name="labelValue" />
  </jsp:attribute>
</field:base>

<%--
  ラベル表示
  @author Hisaaki Sioiri
--%>

<%@tag pageEncoding="UTF-8" description="タグボディ内容のラベル表示を行うウィジェット" %>
<%@taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>

<%---------------------- 属性定義 ----------------------%>
<%@ attribute name="title" description="項目名" required="true" rtexprvalue="true" %>

<%----------------- 属性定義（設計書用） ----------------%>
<%@ attribute name="dataFrom" description="表示するデータの取得元（画面項目定義に記載する、「表示情報取得元」.「表示項目名」の形式で設定する）" %>
<%@ attribute name="comment"    description="このラベル表示についての備考（画面項目定義の項目定義一覧で、備考欄に表示される）" %>
<%@ attribute name="initialValueDesc"    description="初期表示内容に関する説明。" %>

<%---------------------- マルチレイアウト用属性 ----------------------%>
<%@ attribute name="titleSize" description="タイトル部の幅（グリッド数）※マルチレイアウトモードの場合に使用する。" rtexprvalue="true" %>
<%@ attribute name="inputSize" description="入力部の幅（グリッド数）※マルチレイアウトモードの場合に使用する。" rtexprvalue="true" %>

<field:base
    title="${title}"
    inputField="false"
    titleSize="${titleSize}"
    inputSize="${inputSize}">
  <jsp:attribute name="fieldContent">
    <jsp:doBody />
  </jsp:attribute>
</field:base>


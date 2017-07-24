<%--
  単一の入力項目を持つフィールドの共通テンプレート
  @author Iwauo Tajima
--%>

<%@ tag pageEncoding="UTF-8" description="入力項目の共通テンプレート" %>
<%@ taglib prefix="n"      uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="field"  tagdir="/WEB-INF/tags/widget/field" %>

<%---------------------- 属性定義 ----------------------%>
<%@ attribute name="fieldContent" fragment="true" required="true" description="フィールド入力部タグ" %>
<%@ attribute name="title"      description="項目名" required="true" rtexprvalue="true" %>
<%@ attribute name="name"       description="HTMLのname属性値" required="true" rtexprvalue="true" %>
<%@ attribute name="required"   description="必須項目かどうか" rtexprvalue="true" %>
<%@ attribute name="hint"       description="入力内容や留意点などの補助テキスト" rtexprvalue="true" %>
<%@ attribute name="fieldClass" description="入力フィールドのDIVに付与するcssClass" rtexprvalue="true" %>

<%---------------------- マルチレイアウト用属性 ----------------------%>
<%@ attribute name="titleSize" description="タイトル部の幅（グリッド数）※マルチレイアウトモードの場合に使用する。" rtexprvalue="true" %>
<%@ attribute name="inputSize" description="入力部の幅（グリッド数）※マルチレイアウトモードの場合に使用する。" rtexprvalue="true" %>

<%------------------------------------------------------%>


<field:base
    title="${title}"
    fieldClass="${fieldClass}"
    inputField="true"
    required="${required}"
    titleSize="${titleSize}"
    inputSize="${inputSize}"
    >

  <jsp:attribute name="fieldContent">
    <jsp:invoke fragment="fieldContent" />

    <n:forInputPage>
      <%-- エラーメッセージ表示域 --%>
      <div class="fielderror">
        <n:error name="${name}" />
      </div>
      <%-- 補助テキスト表示域 --%>
      <c:if test="${ not empty hint }">
        <field:internal_hint><n:write name='hint' /></field:internal_hint>
      </c:if>
    </n:forInputPage>
  </jsp:attribute>

</field:base>

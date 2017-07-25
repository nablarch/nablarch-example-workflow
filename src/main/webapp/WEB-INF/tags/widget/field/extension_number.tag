<%--
  内線番号用のカスタムウィジェット

  以下型式の内線番号入力フィールドを出力する。
  ビル番号 - 個人番号
  @author Hisaaki Sioiri
--%>

<%@ tag pageEncoding="UTF-8" description="内線番号用のカスタムウィジェット" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="field"  tagdir="/WEB-INF/tags/widget/field" %>

<%---------------------- 属性定義 ----------------------%>
<%@ attribute name="title"     description="項目名" required="true" rtexprvalue="true" %>
<%@ attribute name="domain"    description="項目のドメイン型" rtexprvalue="true" %>
<%@ attribute name="required"  description="必須項目かどうか" rtexprvalue="true" %>
<%@ attribute name="readonly"  description="編集可能かどうか" rtexprvalue="true" %>
<%@ attribute name="disabled"  description="サーバに対する入力値の送信を抑制するかどうか" rtexprvalue="true" %>
<%@ attribute name="id"        description="HTMLのid属性値 (省略時は各入力項目のname属性と同じ値を使用する)" rtexprvalue="true" %>
<%@ attribute name="cssClass"  description="HTMLのclass属性値" rtexprvalue="true" %>
<%@ attribute name="nameAlias" description="一つのエラーメッセージに対して複数の入力項目をハイライト表示する場合に指定する（項目間精査など）。詳細については、Application Framework解説書の「エラー表示」を参照。" rtexprvalue="true" %>
<%@ attribute name="hint"      description="入力内容や留意点などの補助テキスト" rtexprvalue="true" %>
<%@ attribute name="sample"    description="テスト用のダミー入力値(本番動作では使用されない)" rtexprvalue="true" %>

<%---------------------- 個別属性 ----------------------%>
<%@ attribute name="builName"     description="ビル番号のname属性" required="true" rtexprvalue="true" %>
<%@ attribute name="personalName" description="個人番号のname属性" required="true" rtexprvalue="true" %>

<%---------------------- 設計書用属性 ----------------------%>
<%@ attribute name="dataFrom"   description="表示するデータの取得元（画面項目定義に記載する、「表示情報取得元」.「表示項目名」の形式で設定する）" %>

<n:set var="fieldClass" value="${disabled ? 'disabled' : ''}" />

<n:set var="builNoId" value="${id}-bldg" />
<n:set var="personalNoId" value="${id}-personal" />
<c:if test="${empty id}">
  <n:set var="builNoId" value="${builName}" />
  <n:set var="personalNoId" value="${personalName}" />
</c:if>

<field:base
    title="${title}"
    inputField="true"
    required="${required}"
    fieldClass="${fieldClass}">

  <jsp:attribute name="fieldContent">
    <n:forInputPage>
      <%-- 入力画面用の出力 --%>
      <n:text name="${builName}"
          maxlength="2"
          disabled="${disabled}"
          id="${builNoId}"
          cssClass="${cssClass} inline ${readonly ? 'nablarch_readonly' : ''}"
          style="width:30px;"
          placeholder="03"
          nameAlias="${nameAlias}"/>
      <div class="separator">-</div>
      <n:text name="${personalName}"
          maxlength="4"
          disabled="${disabled}"
          id="${personalNoId}"
          cssClass="${cssClass} inline ${readonly ? 'nablarch_readonly' : ''}"
          placeholder="2222"
          style="width:50px;"
          nameAlias="${nameAlias}"/>
      <%-- エラー表示領域 --%>
      <div class="fielderror">
        <n:error name="${builName}" />
        <n:error name="${personalName}" />
        <n:error name="${nameAlias}" />
      </div>
      <c:if test="${ not empty hint }">
        <field:internal_hint><n:write name='hint' /></field:internal_hint>
      </c:if>
    </n:forInputPage>

    <n:forConfirmationPage>
      <%-- 確認画面用の表示。市外局番が入力されている場合のみ、「-」で連結して表示する。 --%>
      <n:set var="builNo" name="${builName}" />
      <c:if test="${not empty builNo}">
        <n:text name="${builName}" /> - <n:text name="${personalName}" />
      </c:if>
    </n:forConfirmationPage>
  </jsp:attribute>
</field:base>


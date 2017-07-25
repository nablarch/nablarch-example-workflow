<%--
  電話番号用カスタムウィジェット

  以下型式の電話番号入力フィールドを出力する。
  市外局番 - 市内局番 - 加入者番号
  @author Hisaaki Sioiri
--%>

<%@tag pageEncoding="UTF-8" description="電話番号用カスタムウィジェット" %>
<%@taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>

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
<%@ attribute name="areaName"       description="市外局番のname属性"   required="true" rtexprvalue="true" %>
<%@ attribute name="localName"      description="市内局番のname属性"   required="true" rtexprvalue="true" %>
<%@ attribute name="subscriberName" description="加入者局番のname属性" required="true" rtexprvalue="true" %>

<%---------------------- 設計書用属性 ----------------------%>
<%@ attribute name="dataFrom"   description="表示するデータの取得元（画面項目定義に記載する、「表示情報取得元」.「表示項目名」の形式で設定する）" %>

<%-- 読み取り専用を表すcssクラスの定義 --%>
<n:set var="readonly_class" value="${(readonly) ? 'nablarch_readonly' : ''}" />

<n:set var="areaNoId" value="${id}-area" />
<n:set var="localNoId" value="${id}-local" />
<n:set var="subscriberNoId" value="${id}-subscriber" />
<c:if test="${empty id}">
  <n:set var="areaNoId" value="${areaName}" />
  <n:set var="localNoId" value="${localName}" />
  <n:set var="subscriberNoId" value="${subscriberName}" />
</c:if>

<n:set var="fieldClass" value="${disabled ? 'disabled' : ''}" />
<field:base
    title="${title}"
    inputField="true"
    required="${required}"
    fieldClass="${fieldClass}">

  <jsp:attribute name="fieldContent">
    <n:forInputPage>
      <%-- 入力画面用の出力 --%>
      <n:text name="${areaName}" nameAlias="${nameAlias}"
          maxlength="4"
          disabled="${disabled}"
          cssClass="${cssClass} inline ${readonly_class}"
          style="width:40px;"
          id="${areaNoId}"
          placeholder="03"/>
      <div class="separator">-</div>
      <n:text name="${localName}" nameAlias="${nameAlias}"
          maxlength="4"
          id="${localNoId}"
          disabled="${disabled}"
          cssClass="${cssClass} inline ${readonly_class}" placeholder="1111"
          style="width:50px;"/>
      <div class="separator">-</div>
      <n:text name="${subscriberName}" nameAlias="${nameAlias}"
          maxlength="4"
          id="${subscriberNoId}"
          disabled="${disabled}"
          style="width:50px;"
          cssClass="${cssClass} inline ${readonly_class}" placeholder="2222"/>
      <%-- エラー表示領域 --%>
      <div class="fielderror">
        <n:error name="${areaName}" />
        <n:error name="${localName}" />
        <n:error name="${subscriberName}" />
        <n:error name="${nameAlias}" />
      </div>
      <c:if test="${ not empty hint }">
        <field:internal_hint><n:write name='hint' /></field:internal_hint>
      </c:if>
    </n:forInputPage>

    <n:forConfirmationPage>
      <%-- 確認画面用の表示。いずれかの項目が入力されている場合に、「-」で連結して表示する。 --%>
      <n:set var="areaNo" name="${areaName}" />
      <n:set var="localNo" name="${localName}" />
      <n:set var="subscriberNo" name="${subscriberName}" />
      <c:if test="${(not empty areaNo) and (not empty localNo) and (not empty subscriberNo)}">
        <n:text name="${areaName}" /> - <n:text name="${localName}" /> - <n:text name="${subscriberName}" />
      </c:if>
    </n:forConfirmationPage>

  </jsp:attribute>
</field:base>

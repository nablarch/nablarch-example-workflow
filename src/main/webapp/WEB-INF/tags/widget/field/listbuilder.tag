<%--
  リストビルダー
  @author Iwauo Tajima
--%>

<%@ tag pageEncoding="UTF-8" description="リストビルダーUI部品を表示するウィジェット" %>
<%@ taglib prefix="n"     uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>

<%---------------------- 属性定義（共通） ----------------------%>
<%@ attribute name="title"     description="項目名" required="true" rtexprvalue="true" %>
<%@ attribute name="domain"    description="項目のドメイン型" rtexprvalue="true" %>
<%@ attribute name="required"  description="必須項目かどうか" rtexprvalue="true" %>
<%@ attribute name="readonly"  description="編集可能かどうか" rtexprvalue="true" %>
<%@ attribute name="disabled"  description="サーバに対する入力値の送信を抑制するかどうか" rtexprvalue="true" %>
<%@ attribute name="name"      description="HTMLのname属性値" required="true" rtexprvalue="true" %>
<%@ attribute name="id"        description="HTMLのid属性値"   required="true" rtexprvalue="true" %>
<%@ attribute name="cssClass"  description="HTMLのclass属性値" rtexprvalue="true" %>
<%@ attribute name="nameAlias" description="一つのエラーメッセージに対して複数の入力項目をハイライト表示する場合に指定する（項目間精査など）。詳細については、Application Framework解説書の「エラー表示」を参照。" rtexprvalue="true" %>
<%@ attribute name="hint"      description="入力内容や留意点などの補助テキスト" rtexprvalue="true" %>
<%@ attribute name="sample"    description="テスト用のダミー入力値(本番動作では使用されない)" rtexprvalue="true" %>
<%---------------------- 属性定義（個別） ----------------------%>
<%@ attribute name="listName"              description="選択項目のリストの属性名" required="true" rtexprvalue="true" %>
<%@ attribute name="size"                  description="リスト上に一度に表示する件数 (デフォルトは6件)" rtexprvalue="true" %>
<%@ attribute name="elementLabelProperty"  description="リスト要素から値を取得するためのプロパティ名" required="true" rtexprvalue="true" %>
<%@ attribute name="elementValueProperty"  description="リスト要素からラベルを取得するためのプロパティ名" required="true" rtexprvalue="true" %>
<%@ attribute name="elementLabelPattern"   description="ラベルを整形するためのパターン。" rtexprvalue="true" %>
<%---------------------- 属性定義（設計書） ----------------------%>
<%@ attribute name="dataFrom" description="表示するデータの取得元（画面項目定義に記載する、「表示情報取得元」.「表示項目名」の形式で設定する）" %>
<%@ attribute name="comment"    description="このリストビルダーについての備考（画面項目定義の項目定義一覧で、備考欄に表示される）" %>
<%@ attribute name="initialValueDesc"    description="初期表示内容に関する説明。" %>

<%---------------------- マルチレイアウト用属性 ----------------------%>
<%@ attribute name="titleSize" description="タイトル部の幅（グリッド数）※マルチレイアウトモードの場合に使用する。(入力部の幅は21グリッド固定となる)" rtexprvalue="true" %>
<%------------------------------------------------------------%>

<n:set var="size" value="${(empty size) ? '6' : size}" scope="page" />
<n:set var="readonly_class" value="${(readonly) ? 'nablarch_readonly' : ''}" />
<n:set var="labelPattern" value="${(empty elementLabelPattern) ? '$LABEL$' : elementLabelPattern}" />

<field:inputbase
  title      = "${title}"
  name       = "${name}"
  required   = "${required}"
  hint       = "${hint}"
  fieldClass = "listbuilder ${disabled ? 'disabled' : ''}"
  titleSize  = "${titleSize}">
  <jsp:attribute name="fieldContent">
    <%-- listFormatが指定されていない場合にエラーとなるため、指定されない場合は'br'を明示的に設定する。 --%>
      <n:forInputPage>
        <n:select
          id       = "${id}_from"
          name     = "${name}"
          multiple = "true"
          size     = "${size}"
          cssClass = "listbuilder_from ${readonly_class} ${cssClass}"
          disabled = "${disabled}"
          style    = "float:left"
          listName = "${listName}"
          nameAlias= "${nameAlias}"
          elementLabelProperty = "${elementLabelProperty}"
          elementValueProperty = "${elementValueProperty}"
          elementLabelPattern="${labelPattern}"
        />
        
        <div class="nablarch_ListBuilder
                      -from <n:write name='id' withHtmlFormat='false' />_from
                      -to   <n:write name='id' withHtmlFormat='false' />_to">
        </div>


        <c:if test="${disabled}">
          <select
              id       = "<n:write name='id' withHtmlFormat='false' />_to"
              multiple = "true"
              size     = "<n:write name='size' withHtmlFormat='false' />"
              style    = "float:left"
              disabled = "disabled"
              class = "listbuilder_to <n:write name='readonly_class' withHtmlFormat='false' /> <n:write name='cssClass' withHtmlFormat='false' />">
          </select>
        </c:if>
        <c:if test="${not disabled}">
          <select
              id       = "<n:write name='id' withHtmlFormat='false' />_to"
              multiple = "true"
              size     = "<n:write name='size' withHtmlFormat='false' />"
              style    = "float:left"
              class = "listbuilder_to <n:write name='readonly_class' withHtmlFormat='false' /> <n:write name='cssClass' withHtmlFormat='false' />">
          </select>
        </c:if>
      </n:forInputPage>
      
      <n:forConfirmationPage>
        <n:set var="_listbuilder_content"
               name="${name}"
               bySingleValue="false" />

        <c:if test="${empty _listbuilder_content}">-</c:if>
        <n:select
          name     = "${name}"
          multiple = "true"
          size     = "${size}"
          listName = "${listName}"
          elementLabelProperty = "${elementLabelProperty}"
          elementValueProperty = "${elementValueProperty}"
          elementLabelPattern  = "${labelPattern}"
        />
      </n:forConfirmationPage>
  </jsp:attribute>
</field:inputbase>

<%--
  パスワード入力UI部品
  @author Iwauo Tajima
--%>

<%@ tag pageEncoding="UTF-8" description="パスワード入力項目を出力するウィジェット" %>
<%@ taglib prefix="n"      uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="field"  tagdir="/WEB-INF/tags/widget/field" %>

<%---------------------- 属性定義 ----------------------%>
<%@ attribute name="title"     description="項目名" required="true" rtexprvalue="true" %>
<%@ attribute name="domain"    description="項目のドメイン型" rtexprvalue="true" %>
<%@ attribute name="required"  description="必須項目かどうか" rtexprvalue="true" %>
<%@ attribute name="readonly"  description="編集可能かどうか" rtexprvalue="true" %>
<%@ attribute name="disabled"  description="サーバに対する入力値の送信を抑制するかどうか" rtexprvalue="true" %>
<%@ attribute name="name"      description="HTMLのname属性値" required="true" rtexprvalue="true" %>
<%@ attribute name="id"        description="HTMLのid属性値 (省略時はname属性と同じ値を使用する)" rtexprvalue="true" %>
<%@ attribute name="cssClass"  description="HTMLのclass属性値" rtexprvalue="true" %>
<%@ attribute name="maxlength" description="入力文字数の上限" rtexprvalue="true" %>
<%@ attribute name="example"   description="具体的な入力例を表すテキスト(placeholderなどの形式で表示する)" rtexprvalue="true" %>
<%@ attribute name="nameAlias" description="一つのエラーメッセージに対して複数の入力項目をハイライト表示する場合に指定する（項目間精査など）。詳細については、Application Framework解説書の「エラー表示」を参照。" rtexprvalue="true" %>
<%@ attribute name="hint"      description="入力内容や留意点などの補助テキスト" rtexprvalue="true" %>

<%---------------------- 属性定義（ローカルレンダリング用） ----------------------%>
<%@ attribute name="sample"    description="テスト用のダミー入力値(本番動作では使用されない)" rtexprvalue="true" %>
<%------------------------------------------------------%>

<%---------------------- 属性定義（設計書） ----------------------%>
<%@ attribute name="dataFrom" description="表示するデータの取得元（画面項目定義に記載する、「表示情報取得元」.「表示項目名」の形式で設定する）" %>
<%@ attribute name="comment"    description="このパスワード入力項目についての備考（画面項目定義の項目定義一覧で、備考欄に表示される）" %>
<%@ attribute name="initialValueDesc"    description="初期表示内容に関する説明。" %>

<%---------------------- マルチレイアウト用属性 ----------------------%>
<%@ attribute name="titleSize" description="タイトル部の幅（グリッド数）※マルチレイアウトモードの場合に使用する。" rtexprvalue="true" %>
<%@ attribute name="inputSize" description="入力部の幅（グリッド数）※マルチレイアウトモードの場合に使用する。" rtexprvalue="true" %>
<%------------------------------------------------------%>

<field:inputbase
  title      = "${title}"
  name       = "${name}"
  required   = "${required}"
  hint       = "${hint}"
  fieldClass = "password ${disabled ? 'disabled' : ''}"
  titleSize  = "${titleSize}"
  inputSize  = "${inputSize}">
  <jsp:attribute name="fieldContent">
    <%-- maxlength未設定の場合 --%>
    <c:if test="${empty maxlength}">
      <n:password
        name        = "${name}"
        id          = "${empty id ? name : id}"
        disabled    = "${disabled}"
        cssClass    = "${cssClass} ${readonly ? 'nablarch_readonly' : ''}"
        placeholder = "${example}"
        nameAlias   = "${nameAlias}"
      />
    </c:if>
    <%-- maxlength設定ありの場合 --%>
    <c:if test="${not empty maxlength}">
      <n:password
        name        = "${name}"
        id          = "${empty id ? name : id}"
        disabled    = "${disabled}"
        cssClass    = "${cssClass} ${readonly ? 'nablarch_readonly' : ''}"
        placeholder = "${example}"
        nameAlias   = "${nameAlias}"
        maxlength   = "${maxlength}"
      />
    </c:if>
  </jsp:attribute>
</field:inputbase>

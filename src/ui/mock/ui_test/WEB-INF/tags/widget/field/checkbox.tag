<%--
  チェックボックスUI部品（リストを受け取り、チェックボックスの選択項目として表示する。）
  @author Ryo Tanaka
--%>

<%@ tag pageEncoding="UTF-8" description="チェックボックス項目を出力するウィジェット" %>
<%@ taglib prefix="n"     uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>

<%---------------------- 属性定義（共通） ----------------------%>
<%@ attribute name="title"     description="項目名" required="true" rtexprvalue="true" %>
<%@ attribute name="domain"    description="項目のドメイン型" rtexprvalue="true" %>
<%@ attribute name="required"  description="必須項目かどうか" rtexprvalue="true" %>
<%@ attribute name="readonly"  description="編集可能かどうか" rtexprvalue="true" %>
<%@ attribute name="disabled"  description="サーバに対する入力値の送信を抑制するかどうか" rtexprvalue="true" %>
<%@ attribute name="name"      description="HTMLのname属性値" required="true" rtexprvalue="true" %>
<%@ attribute name="cssClass"  description="HTMLのclass属性値" rtexprvalue="true" %>
<%@ attribute name="nameAlias" description="一つのエラーメッセージに対して複数の入力項目をハイライト表示する場合に指定する（項目間精査など）。詳細については、Application Framework解説書の「エラー表示」を参照。" rtexprvalue="true" %>
<%@ attribute name="hint"      description="入力内容や留意点などの補助テキスト" rtexprvalue="true" %>
<%---------------------- 属性定義（個別） ----------------------%>
<%@ attribute name="listName"              description="選択項目のリストの属性名" required="true" rtexprvalue="true" %>
<%@ attribute name="elementLabelProperty"  description="リスト要素から値を取得するためのプロパティ名" required="true" rtexprvalue="true" %>
<%@ attribute name="elementValueProperty"  description="リスト要素からラベルを取得するためのプロパティ名" required="true" rtexprvalue="true" %>
<%@ attribute name="elementLabelPattern"   description="ラベルを整形するためのパターン。" rtexprvalue="true" %>
<%@ attribute name="listFormat"            description="リスト表示時に使用するフォーマット。（デフォルト値は'span'）" rtexprvalue="true" %>
<%---------------------- 属性定義（ローカルレンダリング） ----------------------%>
<%@ attribute name="sample"    description="テスト用のダミー入力値(本番動作では使用されない)" rtexprvalue="true" %>
<%---------------------- 属性定義（設計書） ----------------------%>
<%@ attribute name="dataFrom" description="表示するデータの取得元（画面項目定義に記載する、「表示情報取得元」.「表示項目名」の形式で設定する）" %>
<%@ attribute name="comment"    description="このチェックボックスについての備考（画面項目定義の項目定義一覧で、備考欄に表示される）" %>
<%@ attribute name="initialValueDesc"    description="初期表示内容に関する説明。" %>

<%---------------------- マルチレイアウト用属性 ----------------------%>
<%@ attribute name="titleSize" description="タイトル部の幅（グリッド数）※マルチレイアウトモードの場合に使用する。" rtexprvalue="true" %>
<%@ attribute name="inputSize" description="入力部の幅（グリッド数）※マルチレイアウトモードの場合に使用する。" rtexprvalue="true" %>
<%------------------------------------------------------------%>

<field:inputbase
  title      = "${title}"
  name       = "${name}"
  required   = "${required}"
  hint       = "${hint}"
  fieldClass = "checkboxes ${disabled ? 'disabled' : ''}"
  titleSize  = "${titleSize}"
  inputSize  = "${inputSize}">
  <jsp:attribute name="fieldContent">
    <%-- listFormatが指定されていない場合にエラーとなるため、指定されない場合は'span'を明示的に設定する。 --%>
    <n:checkboxes
        name="${name}"
        disabled="${disabled}"
        cssClass="${cssClass} ${readonly ? 'nablarch_readonly' : ''}"
        nameAlias="${nameAlias}"
        listName="${listName}"
        elementLabelProperty="${elementLabelProperty}"
        elementValueProperty="${elementValueProperty}"
        elementLabelPattern="${empty elementLabelPattern ? '$LABEL$' : elementLabelPattern}"
        listFormat="${empty listFormat ? 'span' : listFormat}"
        />
  </jsp:attribute>
</field:inputbase>

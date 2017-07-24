<%@tag pageEncoding="UTF-8" description="プルダウン項目を出力するウィジェット" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%--
  プルダウン用ウィジェット
  @author Hisaaki Sioiri
--%>

<%---------------------- 属性定義 ----------------------%>
<%@ attribute name="title"     description="項目名" required="true" rtexprvalue="true" %>
<%@ attribute name="domain"    description="項目のドメイン型" rtexprvalue="true" %>
<%@ attribute name="required"  description="必須項目かどうか" rtexprvalue="true" %>
<%@ attribute name="readonly"  description="編集可能かどうか" rtexprvalue="true" %>
<%@ attribute name="disabled"  description="サーバに対する入力値の送信を抑制するかどうか" rtexprvalue="true" %>
<%@ attribute name="name"      description="HTMLのname属性値" required="true" rtexprvalue="true" %>
<%@ attribute name="id"        description="HTMLのid属性値 (省略時はname属性と同じ値を使用する)" rtexprvalue="true" %>
<%@ attribute name="cssClass"  description="HTMLのclass属性値" rtexprvalue="true" %>
<%@ attribute name="nameAlias" description="一つのエラーメッセージに対して複数の入力項目をハイライト表示する場合に指定する（項目間精査など）。詳細については、Application Framework解説書の「エラー表示」を参照。" rtexprvalue="true" %>
<%@ attribute name="hint"      description="入力内容や留意点などの補助テキスト" rtexprvalue="true" %>
<%@ attribute name="sample"    description="テスト用のダミー入力値(本番動作では使用されない)" rtexprvalue="true" %>
<%---------------------- 属性定義（設計書） ----------------------%>
<%@ attribute name="dataFrom" description="表示するデータの取得元（画面項目定義に記載する、「表示情報取得元」.「表示項目名」の形式で設定する）" %>
<%@ attribute name="comment"    description="このプルダウンについての備考（画面項目定義の項目定義一覧で、備考欄に表示される）" %>
<%@ attribute name="initialValueDesc"    description="初期表示内容に関する説明。" %>

<%---------------------- マルチレイアウト用属性 ----------------------%>
<%@ attribute name="titleSize" description="タイトル部の幅（グリッド数）※マルチレイアウトモードの場合に使用する。" rtexprvalue="true" %>
<%@ attribute name="inputSize" description="入力部の幅（グリッド数）※マルチレイアウトモードの場合に使用する。" rtexprvalue="true" %>
<%------------------------------------------------------%>

<%-- 選択項目のリストの属性名 --%>
<%@ attribute name="listName" required="true" description="選択項目のリストの属性名" rtexprvalue="true" %>

<%-- ラベルの表示形式 --%>
<%@ attribute name="elementLabelPattern" description="ラベルの表示形式" rtexprvalue="true" %>

<%-- ラベルの属性名 --%>
<%@ attribute name="elementLabelProperty" required="true" description="リスト項目(listName)からラベルを取得するための属性名" rtexprvalue="true" %>

<%-- 値の属性名 --%>
<%@ attribute name="elementValueProperty" required="true" description="リスト項目(listName)から値を取得するための属性名" rtexprvalue="true" %>

<%-- xhtmlのmultiple属性 --%>
<%@ attribute name="multiple" description="xhtmlのmultiple属性" rtexprvalue="true" %>

<%-- xhtmlのsize属性 --%>
<%@ attribute name="size" description="xhtmlのsize属性" rtexprvalue="true" %>

<%--リスト先頭に選択なしのオプションを追加するか否か。 --%>
<%@ attribute name="withNoneOption" description="リスト先頭に選択なしのオプションを追加するか否か。(デフォルト:false)" rtexprvalue="true" %>

<%-- ============================ フィールド部 =============================== --%>

<field:inputbase
  title      = "${title}"
  name       = "${name}"
  required   = "${required}"
  hint       = "${hint}"
  fieldClass = "pulldown ${disabled ? 'disabled' : ''}"
  titleSize  = "${titleSize}"
  inputSize  = "${inputSize}">

  <jsp:attribute name="fieldContent">
    <n:select
        name="${name}"
        id="${(empty id) ? name : id}"
        listName="${listName}"
        elementLabelPattern="${(empty elementLabelPattern) ? '$LABEL$' : elementLabelPattern}"
        elementValueProperty="${elementValueProperty}"
        elementLabelProperty="${elementLabelProperty}"
        cssClass="${cssClass} ${(readonly) ? 'nablarch_readonly' : ''}"
        multiple="${multiple}"
        nameAlias="${nameAlias}"
        withNoneOption="${withNoneOption}"
        disabled="${disabled}"
        size="${size}"
        noneOptionLabel="${(required == 'true') ? '(選択してください)' : '(選択しない)'}"
    />
  </jsp:attribute>
</field:inputbase>


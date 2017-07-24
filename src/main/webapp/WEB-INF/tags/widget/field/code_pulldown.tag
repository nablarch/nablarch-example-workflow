<%--
  コード定義に従ってプルダウンメニュー(selectタグ)を出力するUI部品
  @author Iwauo Tajima
--%>

<%@ tag pageEncoding="UTF-8" description="コード定義に従ってプルダウン項目を出力するウィジェット" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>

<%---------------------- 属性定義（共通） ----------------------%>
<%@ attribute name="title"     description="項目名" required="true" rtexprvalue="true" %>
<%@ attribute name="domain"    description="項目のドメイン型" rtexprvalue="true" %>
<%@ attribute name="required"  description="必須項目かどうか" rtexprvalue="true" %>
<%@ attribute name="readonly"  description="編集可能かどうか" rtexprvalue="true" %>
<%@ attribute name="disabled"  description="サーバに対する入力値の送信を抑制するかどうか" rtexprvalue="true" %>
<%@ attribute name="name"      description="HTMLのname属性値" required="true" rtexprvalue="true" %>
<%@ attribute name="id"        description="HTMLのid属性値 (省略時はname属性とvalue値から導出した値を使用する)" rtexprvalue="true" %>
<%@ attribute name="cssClass"  description="HTMLのclass属性値" rtexprvalue="true" %>
<%@ attribute name="nameAlias" description="一つのエラーメッセージに対して複数の入力項目をハイライト表示する場合に指定する（項目間精査など）。詳細については、Application Framework解説書の「エラー表示」を参照。" rtexprvalue="true" %>
<%@ attribute name="hint"      description="入力内容や留意点などの補助テキスト" rtexprvalue="true" %>
<%@ attribute name="sample"    description="テスト用のダミー入力値(本番動作では使用されない)" rtexprvalue="true" %>
<%---------------------- 属性定義（個別） ----------------------%>
<%@ attribute name="codeId"           description="コード定義ID" required="true" rtexprvalue="true" %>
<%@ attribute name="pattern"          description="使用するコードパターンのカラム名(デフォルトは'PATTERN01')" rtexprvalue="true" %>
<%@ attribute name="optionColumnName" description="取得するオプション名称のカラム名(デフォルトは'OPTION01')" rtexprvalue="true" %>
<%@ attribute name="labelPattern"     description="ラベル表示書式(デフォルト:$NAME$)" rtexprvalue="true" %>
<%@ attribute name="withNoneOption"   description="リスト先頭に選択なしのオプションを追加するか否か。(デフォルト:false)" rtexprvalue="true" %>
<%@ attribute name="multiple"         description="xhtmlのmultiple属性" rtexprvalue="true" %>
<%@ attribute name="size"             description="xhtmlのsize属性" rtexprvalue="true" %>
<%---------------------- 属性定義（設計書） ----------------------%>
<%@ attribute name="comment"    description="このプルダウンについての備考（画面項目定義の項目定義一覧で、備考欄に表示される）" %>
<%@ attribute name="initialValueDesc"    description="初期表示内容に関する説明。" %>
<%@ attribute name="dataFrom"   description="表示するデータの取得元（画面項目定義に記載する、「表示情報取得元」.「表示項目名」の形式で設定する）" %>

<%---------------------- マルチレイアウト用属性 ----------------------%>
<%@ attribute name="titleSize" description="タイトル部の幅（グリッド数）※マルチレイアウトモードの場合に使用する。" rtexprvalue="true" %>
<%@ attribute name="inputSize" description="入力部の幅（グリッド数）※マルチレイアウトモードの場合に使用する。" rtexprvalue="true" %>
<%------------------------------------------------------------%>

<%-- 明示的に指定しなかった場合に使用するパターンコードのカラム名 --%>
<n:set var="defaultPattern" value="PATTERN01" />
<%-- 明示的に指定しなかった場合に使用するオプション名称のカラム名 --%>
<n:set var="defaultOption" value="OPTION01" />
<%-- 明示的に指定しなかった場合に使用するラベルコード --%>
<n:set var="defaultLabel" value="$NAME$" />

<field:inputbase
  title      = "${title}"
  name       = "${name}"
  required   = "${required}"
  hint       = "${hint}"
  fieldClass = "pulldown ${disabled ? 'disabled' : ''}"
  titleSize  = "${titleSize}"
  inputSize  = "${inputSize}">

  <jsp:attribute name="fieldContent">
  
    <n:codeSelect
      name             = "${name}"
      id               = "${(empty id) ? name : id}"
      disabled         = "${disabled}"
      cssClass         = "${cssClass} ${(readonly) ? 'nablarch_readonly' : ''}"
      nameAlias        = "${nameAlias}"
      codeId           = "${codeId}"
      pattern          = "${(empty pattern) ? defaultPattern : pattern}"
      optionColumnName = "${(empty optionColumnName) ? defaultOption : optionColumnName}"
      labelPattern     = "${(empty labelPattern) ? defaultLabel : labelPattern}"
      withNoneOption   = "${withNoneOption}"
      size             = "${size}"
      multiple         = "${multiple}"
      noneOptionLabel  = "${(required == 'true') ? '(選択してください)' : '(選択しない)'}"
    />
  
  </jsp:attribute>
</field:inputbase>

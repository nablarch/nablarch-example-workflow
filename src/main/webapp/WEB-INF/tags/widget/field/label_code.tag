<%--
  コード定義に従ってテキストラベルを出力するウィジェット
  @author Iwauo Tajima
--%>

<%@ tag pageEncoding="UTF-8" description="コード定義に従ってテキストラベルを出力するウィジェット" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>

<%-- ============================ 属性定義 =============================== --%>

<%@ attribute name="title" description="項目名" required="true" rtexprvalue="true" %>
<%@ attribute name="name" description="出力対象の値を変数スコープから取得するための名前" rtexprvalue="true" required="true" %>
<%@ attribute name="sample" description="テスト用のダミー入力値(本番動作では使用されない)" rtexprvalue="true" %>

<%@ attribute name="codeId"           description="コード定義ID" required="true" rtexprvalue="true" %>
<%@ attribute name="pattern"          description="使用するコードパターンのカラム名(デフォルトは'PATTERN01')" rtexprvalue="true" %>
<%@ attribute name="optionColumnName" description="取得するオプション名称のカラム名(デフォルトは'OPTION01')" rtexprvalue="true" %>
<%@ attribute name="labelPattern"     description="ラベル表示書式(デフォルト:$NAME$)" rtexprvalue="true" %>
<%@ attribute name="listFormat"       description="リスト表示時に使用するフォーマット。（デフォルト値は'sp'）" rtexprvalue="true" %>
<%---------------------- 属性定義（設計書） ----------------------%>
<%@ attribute name="dataFrom" description="表示するデータの取得元（画面項目定義に記載する、「表示情報取得元」.「表示項目名」の形式で設定する）" %>
<%@ attribute name="comment"    description="このコード表示項目についての備考（画面項目定義の項目定義一覧で、備考欄に表示される）" %>
<%@ attribute name="initialValueDesc"    description="初期表示内容に関する説明。" %>

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

<field:base
    title="${title}"
    inputField="false"
    titleSize="${titleSize}"
    inputSize="${inputSize}">
  <jsp:attribute name="fieldContent">
    <n:code
        name             = "${name}"
        codeId           = "${codeId}"
        pattern          = "${(empty pattern) ? defaultPattern : pattern}"
        optionColumnName = "${(empty optionColumnName) ? defaultOption : optionColumnName}"
        labelPattern     = "${(empty labelPattern) ? defaultLabel : labelPattern}"
        listFormat       = "${(empty listFormat) ? 'sp' : listFormat}"
        />
  </jsp:attribute>
</field:base>


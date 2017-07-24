<%--
  ファイル選択UI部品
  @author Ryo Tanaka
--%>

<%@ tag pageEncoding="UTF-8" description="ファイル選択項目を出力するウィジェット" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%---------------------- 属性定義（共通） ----------------------%>
<%@ attribute name="title"     description="項目名" required="true" rtexprvalue="true" %>
<%@ attribute name="domain"    description="項目のドメイン型" rtexprvalue="true" %>
<%@ attribute name="required"  description="必須項目かどうか" rtexprvalue="true" %>
<%@ attribute name="disabled"  description="サーバに対する入力値の送信を抑制するかどうか" rtexprvalue="true" %>
<%@ attribute name="name"      description="HTMLのname属性値" required="true" rtexprvalue="true" %>
<%@ attribute name="id"        description="HTMLのid属性値 (省略時はname属性と同じ値を使用する)" rtexprvalue="true" %>
<%@ attribute name="cssClass"  description="HTMLのclass属性値" rtexprvalue="true" %>
<%@ attribute name="nameAlias" description="一つのエラーメッセージに対して複数の入力項目をハイライト表示する場合に指定する（項目間精査など）。詳細については、Application Framework解説書の「エラー表示」を参照。" rtexprvalue="true" %>
<%@ attribute name="hint"      description="入力内容や留意点などの補助テキスト" rtexprvalue="true" %>
<%---------------------- 属性定義（設計書） ----------------------%>
<%@ attribute name="comment"    description="このファイル選択ダイアログについての備考（画面項目定義の項目定義一覧で、備考欄に表示される）" %>

<%---------------------- マルチレイアウト用属性 ----------------------%>
<%@ attribute name="titleSize" description="タイトル部の幅（グリッド数）※マルチレイアウトモードの場合に使用する。" rtexprvalue="true" %>
<%@ attribute name="inputSize" description="入力部の幅（グリッド数）※マルチレイアウトモードの場合に使用する。" rtexprvalue="true" %>
<%------------------------------------------------------------%>

<field:inputbase
    title="${title}"
    name="${name}"
    required="${required}"
    hint="${hint}"
    fieldClass="file ${disabled ? 'disabled' : ''}"
    titleSize="${titleSize}"
    inputSize="${inputSize}">
  <jsp:attribute name="fieldContent">
    <n:file
        id="${(empty id) ? name : id}"
        name="${name}"
        disabled="${disabled}"
        cssClass="${cssClass}"
        nameAlias="${nameAlias}"
        />
  </jsp:attribute>
</field:inputbase>

<%--
  確認ボタン表示
  @author Hisaaki Sioiri
--%>
<%@tag pageEncoding="UTF-8" description="確認ボタンを出力するウィジェット" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>

<%-- ============================ 属性定義 =============================== --%>
<%@ attribute name="label"      description="ボタンに表示するラベルを設定する。省略した場合は、「確認」" rtexprvalue="true" %>
<%@ attribute name="uri"        description="遷移先URI" required="true" rtexprvalue="true" %>
<%@ attribute name="id"         description="HTMLのid属性" rtexprvalue="true" %>
<%@ attribute name="cssClass"   description="HTMLのclass属性" rtexprvalue="true" %>
<%@ attribute name="size" description="ボタンの表示サイズ(Grid数)。デフォルトは3" rtexprvalue="true" %>
<%@ attribute name="disabled" rtexprvalue="true" description="ボタンを無効化するか否か" %>
<%@ attribute name="allowDoubleSubmission" description="2重サブミットを許可するか否か。falseを指定した場合は許可しない。デフォルトはtrue" rtexprvalue="true" %>
<%@ attribute name="dummyUri" description="画面設計時に使用する遷移先（紙芝居のように画面遷移する）（本番環境では使用しない）" rtexprvalue="true" %>

<%-- ============================ 属性定義（設計書表示用） =============================== --%>
<%@ attribute name="comment"    description="このボタンを押下した際のイベント概要（画面項目定義のイベント一覧で、画面イベント概要に表示される）" %>
<%@ attribute name="lockTarget" description="排他制御対象となるテーブル名を指定する。" %>

<button:base
    label="${(empty label) ? '確認' : label}"
    id="${id}"
    uri="${uri}"
    disabled="${disabled}"
    cssClass="${cssClass}"
    size="${size}"
    icon="fa fa-check"
    allowDoubleSubmission="${(empty allowDoubleSubmission) ? true : allowDoubleSubmission}">

  <jsp:attribute name="bodyContent">
    <jsp:doBody />
  </jsp:attribute>

</button:base>

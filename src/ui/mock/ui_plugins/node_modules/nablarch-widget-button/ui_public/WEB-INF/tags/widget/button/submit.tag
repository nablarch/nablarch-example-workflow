<%--
  ボタン表示
  @author Iwauo Tajima
--%>
<%@tag pageEncoding="UTF-8" description="ボタンを出力するウィジェット。" %>
<%@taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>

<%-- ============================ 属性定義 =============================== --%>

<%@ attribute name="label"           rtexprvalue="true" description="ボタンに表示するラベル" required="true" %>
<%@ attribute name="uri"             rtexprvalue="true" description="遷移先URI" required="true" %>
<%@ attribute name="disabled"        rtexprvalue="true" description="ボタンを無効化するか否か" %>
<%@ attribute name="id"              rtexprvalue="true" description="HTMLのid属性" %>
<%@ attribute name="cssClass"        rtexprvalue="true" description="HTMLのclass属性" %>
<%@ attribute name="size"            rtexprvalue="true" description="ボタンの表示サイズ(Grid数)。デフォルトは3"%>
<%@ attribute name="icon"            rtexprvalue="true" description="ボタンに表示するアイコンの画像名" %>
<%@ attribute name="dummyUri"        rtexprvalue="true" description="画面設計時に使用する遷移先（紙芝居のように画面遷移する）（本番環境では使用しない）" %>
<%@ attribute name="allowDoubleSubmission" description="2重サブミットを許可するか否か。falseを指定した場合は許可しない。デフォルトはtrue" rtexprvalue="true" %>

<%-- ============================ 属性定義（設計書表示用） =============================== --%>
<%@ attribute name="comment"    description="このボタンを押下した際のイベント概要（画面項目定義のイベント一覧で、画面イベント概要に表示される）" %>
<%@ attribute name="lockTarget" description="排他制御対象となるテーブル名を指定する。"%>

<button:base
    label="${label}"
    id="${id}"
    uri="${uri}"
    icon="${icon}"
    disabled="${disabled}"
    cssClass="${cssClass}"
    size="${size}"
    allowDoubleSubmission="${(empty allowDoubleSubmission) ? true : allowDoubleSubmission}">

  <jsp:attribute name="bodyContent">
    <jsp:doBody />
  </jsp:attribute>

</button:base>


<%--
  閉じるボタン
  @author tani takanori
--%>
<%@tag pageEncoding="UTF-8" description="閉じるボタンを生成するウィジェット" %>
<%@taglib prefix="event" tagdir="/WEB-INF/tags/widget/event" %>
<%@taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>

<%-- ============================ 属性定義 =============================== --%>
<%@ attribute name="label"        description="ボタンに表示するラベルを設定する。省略した場合は、「閉じる」" rtexprvalue="true" %>
<%@ attribute name="id"           description="HTMLのid属性" rtexprvalue="true" %>
<%@ attribute name="cssClass"     description="HTMLのclass属性" rtexprvalue="true" %>
<%@ attribute name="size"         description="ボタンの表示サイズ(Grid数)。デフォルトは3" rtexprvalue="true" %>
<%@ attribute name="disabled"     description="ボタンを非活性にする。デフォルトはfalse" rtexprvalue="true" %>

<%-- ============================ 属性定義（設計書表示用） =============================== --%>
<%@ attribute name="comment"    description="このボタンを押下した際のイベント概要（画面項目定義のイベント一覧で、画面イベント概要に表示される）" %>

<button:base
    id="${id}"
    uri="#"
    cssClass="${cssClass} nablarch_WindowClose"
    size="${size}"
    icon="fa fa-times"
    label="${(empty label) ? '閉じる' : label}"
    disabled="${disabled}"
    displayMethod="NORMAL"
    allowDoubleSubmission="true">
  <jsp:attribute name="bodyContent">
    <jsp:doBody />
  </jsp:attribute>
</button:base>

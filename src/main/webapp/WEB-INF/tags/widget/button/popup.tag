<%--
  ポップアップ画面用ボタン表示
  @author Ryo Tanaka
--%>
<%@tag pageEncoding="UTF-8" description="遷移先画面を新規ウィンドウで表示するためのボタンを出力するウィジェット。" %>
<%@taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- ============================ 属性定義 =============================== --%>

<%@ attribute name="label"           rtexprvalue="true" description="ボタンに表示するラベル" required="true" %>
<%@ attribute name="uri"             rtexprvalue="true" description="遷移先URI" required="true" %>
<%@ attribute name="disabled"        rtexprvalue="true" description="ボタンを無効化するか否か" %>
<%@ attribute name="id"              rtexprvalue="true" description="HTMLのid属性" %>
<%@ attribute name="popupWindowName" rtexprvalue="true" description="ポップアップのウィンドウ名" %>
<%@ attribute name="popupOption"     rtexprvalue="true" description="ポップアップのオプション情報" %>
<%@ attribute name="cssClass"        rtexprvalue="true" description="HTMLのclass属性" %>
<%@ attribute name="icon"            rtexprvalue="true" description="ボタンに表示するアイコンの画像名" %>
<%@ attribute name="size"            rtexprvalue="true" description="ボタンの表示サイズ(Grid数)。デフォルトは3" %>
<%@ attribute name="dummyUri"        rtexprvalue="true" description="画面設計時に使用する遷移先（紙芝居のように画面遷移する）（本番環境では使用しない）" %>

<%-- ============================ 属性定義（設計書表示用） =============================== --%>
<%@ attribute name="comment"    description="このボタンを押下した際のイベント概要（画面項目定義のイベント一覧で、画面イベント概要に表示される）" %>
<%@ attribute name="lockTarget" description="排他制御対象となるテーブル名を指定する。"%>

<n:set var="gridSize" value="" />
<c:if test="${not empty size}">
  <n:set var="gridSize" value="grid-col-${size}" />
</c:if>

<div class="buttonWrapper">
<n:popupButton
    id="${id}"
    uri="${uri}"
    disabled="${disabled}"
    displayMethod="NORMAL"
    popupWindowName="${(empty popupWindowName) ? 'subwindow' : popupWindowName}"
    popupOption="${popupOption}"
    cssClass="${gridSize} ${cssClass}">
  <i class="<n:write name='icon' withHtmlFormat='false' />"></i>
  <n:write name="label" />
  <jsp:doBody/>
</n:popupButton>
</div>
<div class="pillar"></div>

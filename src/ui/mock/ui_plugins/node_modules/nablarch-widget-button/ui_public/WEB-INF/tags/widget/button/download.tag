<%--
  ダウンロードボタン
  @author Iwauo Tajima
--%>
<%@tag pageEncoding="UTF-8" description="ダウンロードボタンを出力するウィジェット" %>
<%@taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- ============================ 属性定義 =============================== --%>
<%@ attribute name="label"    rtexprvalue="true" description="ボタンに表示するラベル" required="true" %>
<%@ attribute name="uri"      rtexprvalue="true" description="ダウンロード用リクエストのURI" required="true" %>
<%@ attribute name="id"       rtexprvalue="true" description="HTMLのid属性値" %>
<%@ attribute name="cssClass" rtexprvalue="true" description="HTMLのclass属性値" %>
<%@ attribute name="size" description="ボタンの表示サイズ(Grid数)。デフォルトは3" rtexprvalue="true" %>
<%@ attribute name="disabled" rtexprvalue="true" description="ボタンを無効化するか否か" %>
<%@ attribute name="allowDoubleSubmission" description="2重サブミットを許可するか否か。falseを指定した場合は許可しない。デフォルトはtrue" rtexprvalue="true" %>
<%@ attribute name="dummyUri" description="画面設計時に使用する遷移先（ダウンロード時に専用画面を表示する場合などに指定する）（本番環境では使用しない）" rtexprvalue="true" %>

<%-- ============================ 属性定義（設計書表示用） =============================== --%>
<%@ attribute name="comment"    description="このボタンを押下した際のイベント概要（画面項目定義のイベント一覧で、画面イベント概要に表示される）" %>
<%@ attribute name="lockTarget" description="排他制御対象となるテーブル名を指定する。" %>

<n:set var="gridSize" value="" />
<c:if test="${not empty size}">
  <n:set var="gridSize" value="grid-col-${size}" />
</c:if>

<div class="buttonWrapper">
<n:downloadButton
  id            = "${id}"
  uri           = "${uri}"
  cssClass      = "${gridSize} ${cssClass} download"
  displayMethod = "NORMAL"
  disabled      = "${disabled}"
  allowDoubleSubmission="${(empty allowDoubleSubmission) ? true : allowDoubleSubmission}">
  <i class="fa fa-arrow-circle-o-down"></i>
  <n:write name="label" />
  <jsp:doBody/>
</n:downloadButton>
</div>
<div class="pillar"></div>

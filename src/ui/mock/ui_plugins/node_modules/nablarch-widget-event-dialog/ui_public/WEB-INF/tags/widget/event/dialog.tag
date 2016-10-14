<%@ tag pageEncoding="UTF-8" description="ダイアログ表示ウィジェット" %>
<%@ taglib prefix="n"      uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="event" tagdir="/WEB-INF/tags/widget/event" %>

<%---------------------- 属性定義 ----------------------%>
<%@ attribute name="title"     description="処理名称" rtexprvalue="true" %>
<%@ attribute name="type"      description="プロパティの切替種別" required="true" rtexprvalue="true" %>
<%@ attribute name="target"    description="操作対象の項目のセレクタ" rtexprvalue="true" %>
<%@ attribute name="condition" description="イベントを処理する条件" rtexprvalue="true" %>
<%@ attribute name="message"   description="表示するメッセージ" rtexprvalue="true" required="true"%>
<%@ attribute name="stop"      description="イベントを停止するかどうか(デフォルトはtrue)" rtexprvalue="true" %>
<%@ attribute name="revert"    description="入力値を復元するかどうか(デフォルトはtrue)" rtexprvalue="true" %>

<n:set var="isRevert" value="${(empty revert) ? 'true' : revert}" ></n:set>
<n:set var="isStop" value="${(empty stop) ? 'true' : stop}" ></n:set>
<div
  style="display:none"
  class="nablarch_event_Action
         -type    ShowDialog
         -dialog    '<n:write name='type'      withHtmlFormat='false'/>'
         -target    '<n:write name='target'    withHtmlFormat='false'/>'
         -condition '<n:write name='condition' withHtmlFormat='false'/>'
         -message   '<n:write name='message'   withHtmlFormat='false'/>'
         -stop      '<n:write name='isStop'    withHtmlFormat='false'/>'
         -revert    '<n:write name='isRevert'  withHtmlFormat='false'/>'">
</div>

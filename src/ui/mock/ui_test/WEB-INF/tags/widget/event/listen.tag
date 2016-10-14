<%--
  親要素内で発生するイベントを監視するイベントハンドラを定義する。
  @author Iwauo Tajima
  @from 1.4
--%>
<%@ tag pageEncoding="UTF-8" description="親要素内で発生するイベントを監視するイベントハンドラを定義する。" %>
<%@ taglib prefix="n"      uri="http://tis.co.jp/nablarch" %>
<%---------------------- 属性定義 ----------------------%>
<%@ attribute name="context"     description="監視対象要素を指定するセレクタ(省略時は親要素)" rtexprvalue="true" %>
<%@ attribute name="event"       description="監視対象要素上のイベント定義式" required="true" rtexprvalue="true" %>

<%---------------------- 属性定義（設計書） ----------------------%>
<%@ attribute name="title"       description="イベントの名称"%>
<%@ attribute name="operation"   description="画面機能設計書の画面イベントの画面操作" %>
<%@ attribute name="comment"     description="画面機能設計書の画面イベントの概要" %>

<div
  style="display:none"
  class="nablarch_event_Listener
         -context '<n:write name='context' withHtmlFormat='false' />'
         -event   '<n:write name='event' withHtmlFormat='false' />'">
  <jsp:doBody />
</div>

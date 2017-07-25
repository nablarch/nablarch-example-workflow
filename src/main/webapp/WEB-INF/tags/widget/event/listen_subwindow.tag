<%--
  他のウィンドウ上で発生するイベントを監視するハンドラを定義する。
  @author Iwauo Tajima
  @from 1.4
--%>
<%@ tag pageEncoding="UTF-8" description="他のウィンドウ上で発生するイベントを監視するハンドラを定義する。" %>
<%@ taglib prefix="n"      uri="http://tis.co.jp/nablarch" %>
<%---------------------- 属性定義 ----------------------%>
<%@ attribute name="windowName"  description="監視対象ウィンドウ名" rtexprvalue="true" %>
<%@ attribute name="openTrigger" description="監視対象となるウィンドウを開いた要素を指定するセレクタ" rtexprvalue="true" %>
<%@ attribute name="watchTarget" description="監視対象要素を指定するセレクタ(必須)" required="true" rtexprvalue="true" %>
<%@ attribute name="event"       description="監視対象要素上のイベント定義" required="true" rtexprvalue="true" %>

<%---------------------- 属性定義（設計書） ----------------------%>
<%@ attribute name="title"       description="イベントの名称"%>
<%@ attribute name="operation"   description="画面機能設計書の画面イベントの画面操作" %>
<%@ attribute name="comment"     description="画面機能設計書の画面イベントの概要" %>

<div
  style="display:none"
  class="nablarch_event_Listener
         -type        SubWindow
         -windowName  '<n:write name='windowName' withHtmlFormat='false' />'
         -openTrigger '<n:write name='openTrigger' withHtmlFormat='false' />'
         -watchTarget '<n:write name='watchTarget' withHtmlFormat='false' />'
         -event       '<n:write name='event' withHtmlFormat='false' />'">
  <jsp:doBody />
</div>

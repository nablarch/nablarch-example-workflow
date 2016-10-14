<%@ tag pageEncoding="UTF-8" description="イベント時プロパティ切替" %>
<%@ taglib prefix="n"      uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>

<%---------------------- 属性定義 ----------------------%>
<%@ attribute name="title"   description="処理名称" rtexprvalue="true" %>
<%@ attribute name="type"    description="プロパティの切替種別" required="true" rtexprvalue="true" %>
<%@ attribute name="target"  description="操作対象の項目のセレクタ" required="true" rtexprvalue="true" %>
<%@ attribute name="reverse" description="操作対象のプロパティの切替を逆転させる。" rtexprvalue="true" %>
<%@ attribute name="condition"   description="イベントを処理する条件" rtexprvalue="true" required="true" %>

<n:set name="conditionMarker" var="${not empty condition ? condition : '*' }" ></n:set>

<div
  style="display:none"
  class="nablarch_event_Action
         -type         ToggleProperty
         -toggleType   '<n:write name='type' withHtmlFormat='false' />'
         -toggleTarget '<n:write name='target' withHtmlFormat='false' />'
         -reverse      '<n:write name='reverse' withHtmlFormat='false' />'
         -condition    '<n:write name='condition'  withHtmlFormat='false'/>' ">
</div>

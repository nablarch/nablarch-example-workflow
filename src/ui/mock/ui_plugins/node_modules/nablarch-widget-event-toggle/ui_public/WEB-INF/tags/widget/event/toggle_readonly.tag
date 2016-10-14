<%@ tag pageEncoding="UTF-8" description="イベント時readonly切替" %>
<%@ taglib prefix="n"      uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="event" tagdir="/WEB-INF/tags/widget/event" %>

<%---------------------- 属性定義 ----------------------%>
<%@ attribute name="title"   description="処理名称" rtexprvalue="true" %>
<%@ attribute name="target"  description="操作対象の項目のセレクタ" rtexprvalue="true" required="true"%>
<%@ attribute name="condition"   description="イベントを処理する条件" rtexprvalue="true" required="true" %>
<%@ attribute name="reverse" description="操作対象のプロパティの切替を逆転させる。" rtexprvalue="true" %>

<event:toggle_property type="readonly"
                       target="${target}"
                       reverse="${reverse}"
                       condition="${condition}">
</event:toggle_property>

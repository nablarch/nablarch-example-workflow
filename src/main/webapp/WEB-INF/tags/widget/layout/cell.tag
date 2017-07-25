<%--
  セル指定レイアウト
  @author tani takanori
--%>

<%@tag pageEncoding="UTF-8" description="セルのレイアウトを定義するウィジェット" %>
<%@taglib prefix="n" uri="http://tis.co.jp/nablarch" %>

<%-- ============================ 属性定義 =============================== --%>
<%@ attribute name="gridSize"     description="グリッド幅" rtexprvalue="true"%>

<%-- ============================ 属性定義（設計書表示用） =============================== --%>

<div class="layout content-cell
            cell-width-<n:write name='gridSize' withHtmlFormat='false'/>">
  <jsp:doBody/>
</div>
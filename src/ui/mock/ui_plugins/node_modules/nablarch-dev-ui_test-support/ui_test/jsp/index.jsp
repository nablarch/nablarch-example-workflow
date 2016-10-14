<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <%/* --> <script src="js/devtool.js"></script><meta charset="utf-8"><body> <!-- */%> -->
<%@taglib prefix="n"  uri="http://tis.co.jp/nablarch" %>
<%@taglib prefix="t"  tagdir="/WEB-INF/tags/template" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<t:page_template title="UI部品デモページ">
  <jsp:attribute name="asideHtml">
    <jsp:include page="/include/aside.jsp" />
  </jsp:attribute>

  <jsp:attribute name="contentHtml">
    <p>(左のメニューを選択して下さい。)</p>
  </jsp:attribute>
</t:page_template>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <%/* --> <script src="js/devtool.js"></script><meta charset="utf-8"><body> <!-- */%> -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="tab" tagdir="/WEB-INF/tags/widget/tab" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<%
  // サーバーモードを表す
  request.setAttribute("serverMode", true);
%>

<t:ui_test_template
    suite="タブ"
    title="タブ型リンクサンプル（遷移先）">
  <jsp:attribute name="contentHtml">
    <n:form>
      <button:block>
        <button:back
            uri="./タブ型リンク.jsp"
            dummyUri="タブ型リンク.jsp">
        </button:back>
      </button:block>
    </n:form>
  </jsp:attribute>
</t:ui_test_template>

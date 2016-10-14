<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <%/* --> <script src="js/devtool.js"></script><meta charset="utf-8"><body> <!-- */%> -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="tab" tagdir="/WEB-INF/tags/widget/tab" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ taglib prefix="link" tagdir="/WEB-INF/tags/widget/link" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
  ui_test.AppServer.currentRequest().setParam(
      "formdata.label_code", new String[] {"value1-1"});
%>

<t:page_template title="その他のウィジェット">
  <jsp:attribute name="contentHtml">
  <n:form windowScopePrefixes="formdata">
    <field:block title="コード値のラベル表示">
      <field:label_code
          title="コード値のラベル表示"
          codeId="code1"
          name="formdata.label_code"
          listFormat="br">
      </field:label_code>
    </field:block>
  </n:form>
  </jsp:attribute>
</t:page_template>

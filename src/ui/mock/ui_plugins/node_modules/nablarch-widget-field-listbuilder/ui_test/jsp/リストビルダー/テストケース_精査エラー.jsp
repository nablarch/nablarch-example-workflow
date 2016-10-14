<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <%/* --> <script src="js/devtool.js"></script><meta charset="utf-8"><body> <!-- */%> -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
  ui_test.AppServer.currentRequest().setParam(
    "formdata.permissionUnits"
  ,  new String[] {"0000000001","0000000002","0123456789012"}
  );
%>

<t:ui_test_template
  title    = "初期表示のテストケース"
  testdata = "./テストデータ_リストの内容.jsp"
  testpage = "./テストページ_登録画面.jsp"
  testcase = "./テストケース_精査エラー.js">
</t:ui_test_template>
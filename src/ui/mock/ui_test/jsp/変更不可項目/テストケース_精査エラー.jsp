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
    "formdata.flightDate", new String[] {"2012/10/10"}
  );
  
  ui_test.AppServer.currentRequest().setParam(
    "formdata.sheetGrade", new String[] {"business"}
  );
%>

<t:ui_test_template
  suite="変更不可項目"
  title="変更不可項目サンプル(登録画面)"
  confirmationPageTitle="変更不可項目サンプル(確認画面)"
  testdata ="./テストデータ.jsp"
  testpage = "./テストページ_登録画面.jsp"
  testcase = "./テストケース_精査エラー.js">
  
  <jsp:attribute name="localJs">
  $(function() {
    $("#changeClass").on("click", function() {
      $(":input").readonly(false);
      return false;
    });
  });
  </jsp:attribute>
</t:ui_test_template>
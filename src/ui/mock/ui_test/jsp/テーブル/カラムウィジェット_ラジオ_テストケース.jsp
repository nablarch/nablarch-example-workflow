<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <%/* --> <script src="js/devtool.js"></script><meta charset="utf-8"><body> <!-- */%> -->
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<t:ui_test_template
    suite    = "テーブル"
    title    = "カラムウィジェット_ラジオボタンのテストケース"
    confirmationPageTitle="カラムウィジェット_ラジオボタンのテストケース(確認)"
    testpage = "カラムウィジェット_ラジオ_テストページ.jsp"
    testdata = "カラムウィジェット_ラジオ_テストデータ.jsp"
    testcase = "カラムウィジェット_ラジオ_テストケース.js">
  
  <jsp:attribute name="localCss">
    th.red-line, td.red-line {
      border: 2px red solid;
    }
  </jsp:attribute>
</t:ui_test_template>

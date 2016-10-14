<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <%/* --> <script src="js/devtool.js"></script><meta charset="utf-8"><body> <!-- */%> -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
  request.setAttribute("serverMode", true);
%>


<t:ui_test_template
  suite    = "ボタン"
  title    = "戻るボタン(button:back)のテストケース"
  testpage = "./戻るボタン_テストページ.jsp"
  testcase = "./戻るボタン_テストケース.js">
  <jsp:attribute name="localCss">
    #back-id {
      background: #000066;
      background-color: #000066;
      border: none;
      text-shadow: none;
      font-weight: normal;
      color: #ffffff;
    }

    .button-white {
      background: #ffffff;
      background-color: #ffffff;
      color: #000000;
      font-weight: normal;
      border: #000000 solid 1px;
      text-shadow: none;
    }
  </jsp:attribute>
</t:ui_test_template>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <%/* --> <script src="js/devtool.js"></script><meta charset="utf-8"><body> <!-- */%> -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%
  request.setAttribute("formdata", new HashMap() {{
      put("text1", "");
      put("text2", "１２３４５６７８９０１２３４５６７８９０１");
      put("text3", "");
      put("textarea1", "");
      put("textarea2", "１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１");
      put("textarea3", "");
  }});
%>

<t:ui_test_template
  suite    = "プレースホルダー"
  title    = "初期表示のテストケース"
  testpage = "./テストページ_登録画面.jsp"
  testcase = "./テストケース_精査エラー.js">
</t:ui_test_template>
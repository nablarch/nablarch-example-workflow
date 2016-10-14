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
  suite    = "リンク"
  title    = "ポップアップリンク(link:popup)のテストケース"
  testpage = "./ポップアップリンク_テストページ.jsp"
  testcase = "./ポップアップリンク_テストケース.js">
  <jsp:attribute name="localCss">
    #link-id {
      font-size: 2em;
      color: #000066;
    }

    #link-id:hover {
      color: red;
    }

    a.style {
      font-size: 1.25em;
      color: #ffffff;
      text-decoration: none;
      background-color: blue;
      text-align: center;
      padding: 0 1em 0 1em;
    }

  </jsp:attribute>
</t:ui_test_template>

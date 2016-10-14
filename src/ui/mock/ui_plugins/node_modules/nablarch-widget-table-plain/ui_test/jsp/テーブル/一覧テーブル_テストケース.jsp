<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <%/* --> <script src="js/devtool.js"></script><meta charset="utf-8"><body> <!-- */%> -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<t:ui_test_template
  suite    = "テーブル"
  title    = "一覧テーブルのテストケース"
  testpage = "一覧テーブル_テストページ.jsp"
  testdata = "一覧テーブル_テストデータ.jsp"
  testcase = "一覧テーブル_テストケース.js">
  <jsp:attribute name="localCss">
    div.border-blue {
      border: 1px solid blue;
    }
  </jsp:attribute>

</t:ui_test_template>

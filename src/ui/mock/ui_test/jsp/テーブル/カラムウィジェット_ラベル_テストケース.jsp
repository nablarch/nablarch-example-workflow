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
  title    = "カラムウィジェット_ラベルのテストケース"
  testpage = "カラムウィジェット_ラベル_テストページ.jsp"
  testdata = "カラムウィジェット_ラベル_テストデータ.jsp"
  testcase = "カラムウィジェット_ラベル_テストケース.js">
  <jsp:attribute name="localCss">
    th.font-red, td.font-red {
      color: red;
    }

    th.font-blue, td.font-blue {
      color: blue;
    }

    th.mail, td.mail {
      border: 2px green solid;
    }

    th.date, td.date {
      border: 2px #800080 solid;
    }
  </jsp:attribute>

</t:ui_test_template>

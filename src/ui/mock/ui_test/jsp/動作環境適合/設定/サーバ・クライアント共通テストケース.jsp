<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <%/* --> <script src="js/devtool.js"></script><meta charset="utf-8"><body> <!-- */%> -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<t:ui_test_template
    suite    = "動作環境適合/変数出力"
    title    = "サーバー・クライアント共通ケース.jsp"
    testpage = "サーバ・クライアント共通テストページ.jsp"
    testdata = "サーバ・クライアント共通テストデータ.jsp">
    <jsp:attribute name="localCss">
    span.classOfBody {
      border:#000000 solid 1px;
    }
    span.header {
      margin-right:4px;
    }
    </jsp:attribute>
    <jsp:attribute name="localJs">
      $(function(){'use strict';
         $('span.classOfBody').text($('body').attr("class"));
         $('span.userAgent').text(navigator.userAgent);
      });
    </jsp:attribute>

</t:ui_test_template>

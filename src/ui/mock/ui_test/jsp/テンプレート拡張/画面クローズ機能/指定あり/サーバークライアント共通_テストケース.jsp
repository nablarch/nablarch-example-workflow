<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <%/* --> <script src="js/devtool.js"></script><meta charset="utf-8"><body> <!-- */%> -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<t:ui_test_template
  suite    = "テンプレート拡張/画面クローズ機能/指定あり"
  title    = "画面クローズイベントのテスト(テンプレートの拡張あり)"
  testpage = "サーバークライアント共通_テストページ.jsp"
  testdata = "サーバークライアント共通_テストデータ.jsp"
  testcase = "サーバークライアント共通_テストケース.js"
  whenToClose=".eventDef_test click">
</t:ui_test_template>

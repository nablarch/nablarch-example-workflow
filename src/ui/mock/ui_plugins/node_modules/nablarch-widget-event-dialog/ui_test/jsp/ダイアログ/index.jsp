<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <%/* --> <script src="js/devtool.js"></script><meta charset="utf-8"><body> <!-- */%> -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ taglib prefix="link" tagdir="/WEB-INF/tags/widget/link" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<t:ui_test_template title="ダイアログ表示">
  <jsp:attribute name="contentHtml">
  <n:form>
  <ul>
    <li><link:submit uri="./ダイアログ_デモ.jsp" dummyUri="./ダイアログ_デモ.jsp" label="ダイアログ(デモ)" /></li>
    <li><link:submit uri="./警告ダイアログ_テストケース.jsp" dummyUri="./警告ダイアログ_テストケース.jsp" label="ダイアログ_テスト(alert)" /></li>
    <li><link:submit uri="./確認ダイアログ_テストケース.jsp" dummyUri="./確認ダイアログ_テストケース.jsp" label="ダイアログ_テスト(confirm)" /></li>
    <li><link:submit uri="./リバート_テストケース.jsp" dummyUri="./リバート_テストケース.jsp" label="リバート機能の確認" /></li>
  </ul>

  </n:form>
  </jsp:attribute>
  <jsp:attribute name="localJs">
  </jsp:attribute>
</t:ui_test_template>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <%/* --> <script src="js/devtool.js"></script><meta charset="utf-8"><body> <!-- */%> -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ taglib prefix="link" tagdir="/WEB-INF/tags/widget/link" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<t:ui_test_template title="リンク">
  <jsp:attribute name="contentHtml">
  <n:form>
    <ul>
      <li><link:submit uri="./リンク.jsp" dummyUri="./リンク.jsp" label="リンク"/></li>
      <li><link:submit uri="./ポップアップリンク.jsp" dummyUri="./ポップアップリンク.jsp" label="ポップアップリンク"/></li>
    </ul>
    <ul>
      <li><link:submit uri="./リンク_テストケース.jsp" dummyUri="./リンク.jsp" label="リンク"/></li>
      <li><link:submit uri="./ポップアップリンク_テストケース.jsp" dummyUri="./ポップアップリンク.jsp" label="ポップアップリンク(自動テスト)"/></li>
    </ul>
  </n:form>
  </jsp:attribute>
</t:ui_test_template>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <%/* --> <script src="js/devtool.js"></script><meta charset="utf-8"><body> <!-- */%> -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ taglib prefix="link" tagdir="/WEB-INF/tags/widget/link" %>
<%@ taglib prefix="box" tagdir="/WEB-INF/tags/widget/box" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<t:ui_test_template title="その他のウィジェット">
  <jsp:attribute name="contentHtml">
  <n:form>

    <ul>
     <li><link:submit uri="./設定/サーバ・クライアント共通テストケース.jsp" dummyUri="./設定/サーバ・クライアント共通テストケース.jsp" label="ユーザーエージェント設定"></link:submit></li>
     <li><link:submit uri="./変数出力/サーバ・クライアント共通テストケース.jsp" dummyUri="./変数出力/サーバ・クライアント共通テストケース.jsp" label="JavaScirpt変数化"></link:submit></li>
    </ul>

  </n:form>
  </jsp:attribute>
</t:ui_test_template>

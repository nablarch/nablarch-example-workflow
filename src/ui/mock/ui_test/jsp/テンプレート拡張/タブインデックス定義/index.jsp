<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <%/* --> <script src="js/devtool.js"></script><meta charset="utf-8"><body> <!-- */%> -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ taglib prefix="link" tagdir="/WEB-INF/tags/widget/link" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<t:ui_test_template title="タブインデックス">
  <jsp:attribute name="contentHtml">
  <n:form>
  <ul>
    <li>タブインデックス定義(クライアントサーバー共通)<br >※tabindexはコンテキストがページとなるためケースごとにページを用意する。
      <ul>
        <li><link:submit label="指定なし"
                         uri="./指定なし/サーバークライアント共通_テストケース.jsp" dummyUri="./指定なし/サーバークライアント共通_テストケース.jsp" /></li>
        <li><link:submit label="1領域指定"
                         uri="./1領域指定/サーバークライアント共通_テストケース.jsp" dummyUri="./1領域指定/サーバークライアント共通_テストケース.jsp" /></li>
        <li><link:submit label="複数領域指定"
                         uri="./複数領域指定/サーバークライアント共通_テストケース.jsp" dummyUri="./複数領域指定/サーバークライアント共通_テストケース.jsp" /></li>
        <li><link:submit label="一部未指定"
                         uri="./一部未指定/サーバークライアント共通_テストケース.jsp" dummyUri="./一部未指定/サーバークライアント共通_テストケース.jsp" /></li>
      </ul>
    </li>
  </ul>
  </n:form>
  </jsp:attribute>
</t:ui_test_template>

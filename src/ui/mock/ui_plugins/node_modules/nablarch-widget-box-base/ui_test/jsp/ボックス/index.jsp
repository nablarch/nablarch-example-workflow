<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <%/* --> <script src="js/devtool.js"></script><meta charset="utf-8"><body> <!-- */%> -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ taglib prefix="link" tagdir="/WEB-INF/tags/widget/link" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<t:ui_test_template title="ボックス">
  <jsp:attribute name="contentHtml">
  <n:form>
  <ul>
    <li>コンテンツ
      <ul>
        <li><link:submit label="サーバークライアント共通" uri="./コンテンツ/サーバークライアント共通_テストケース.jsp"
                         dummyUri="./コンテンツ/サーバークライアント共通_テストケース.jsp" /></li>
      </ul>
    </li>
    <li>タイトル
      <ul>
        <li><link:submit label="サーバークライアント共通" uri="./タイトル/サーバークライアント共通_テストケース.jsp"
                         dummyUri="./タイトル/サーバークライアント共通_テストケース.jsp" /></li>
      </ul>
    </li>
    <li>画像
      <ul>
        <li><link:submit label="サーバークライアント共通" uri="./画像/サーバークライアント共通_テストケース.jsp"
                         dummyUri="./画像/サーバークライアント共通_テストケース.jsp" /></li>
        <li><link:submit label="性能" uri="./画像/性能テスト.jsp"
                         dummyUri="javascript:alert('クライアントではJSの性能は見れません。')" /></li>
      </ul>
    </li>
  </ul>
  </n:form>
  </jsp:attribute>
</t:ui_test_template>

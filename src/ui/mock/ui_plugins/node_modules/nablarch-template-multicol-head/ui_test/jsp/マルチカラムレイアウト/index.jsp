<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <%/* --> <script src="js/devtool.js"></script><meta charset="utf-8"><body> <!-- */%> -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ taglib prefix="link" tagdir="/WEB-INF/tags/widget/link" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<t:ui_test_template title="マルチカラムレイアウト">
  <jsp:attribute name="contentHtml">
  <n:form>
    <ul>
      <li>デモ画面
        <ul>
          <li>
            <link:submit label="検索画面"
                uri="./デモページ/検索画面.jsp"
                dummyUri="./デモページ/検索画面.jsp" />
          </li>
          <li>
            <link:submit label="登録画面"
                uri="./デモページ/登録画面.jsp"
                dummyUri="./デモページ/登録画面.jsp" />
          </li>
        </ul>
      </li>
      <li>
        <link:submit label="テスト画面"
          uri="./テストページ/テスト画面.jsp"
          dummyUri="./テストページ/テスト画面.jsp" />
      </li>
    </ul>
  </n:form>
  </jsp:attribute>
</t:ui_test_template>

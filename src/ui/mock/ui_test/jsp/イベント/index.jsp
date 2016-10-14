<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <%/* --> <script src="js/devtool.js"></script><meta charset="utf-8"><body> <!-- */%> -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ taglib prefix="link" tagdir="/WEB-INF/tags/widget/link" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<t:ui_test_template title="イベントリスナ">
  <jsp:attribute name="contentHtml">
  <n:form>
  <ul>
    <li><link:submit uri="./動的書き込み/テストケース.jsp" dummyUri="./動的書き込み/テストケース.jsp" label="動的書き込み(write_to)" /></li>
  </ul>
  <ul>
    <li><link:submit uri="./活性切替/活性切替_登録画面.jsp"
                     dummyUri="javascript:alert('サーバーのエミュレートが不十分なので動作確認できません')"
                     label="活性切替"/></li>
    <li><link:submit uri="./活性切替/活性切替_登録_テストケース.jsp"
                     dummyUri="javascript:alert('サーバーのエミュレートが不十分なので動作確認できません')"
                     label="活性切替(単体テスト)"/></li>
  </ul>
  <ul>
    <li><link:submit uri="./他機能と併用/テストケース.jsp"
                     dummyUri="./他機能と併用/テストケース.jsp"
                     label="beforeSubmitなどの機能の併用" /></li>
  </ul>

  </n:form>
  </jsp:attribute>
</t:ui_test_template>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <%/* --> <script src="js/devtool.js"></script><meta charset="utf-8"><body> <!-- */%> -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ taglib prefix="link" tagdir="/WEB-INF/tags/widget/link" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<t:ui_test_template title="ボタン">
  <jsp:attribute name="contentHtml">
  <n:form>
    <ul>
      <li><link:submit uri="./戻るボタン.jsp" dummyUri="./戻るボタン.jsp" label="戻るボタン"/></li>
      <li><link:submit uri="./キャンセルボタン.jsp" dummyUri="./キャンセルボタン.jsp" label="キャンセルボタン"/></li>
      <li><link:submit uri="./確認ボタン.jsp" dummyUri="./確認ボタン.jsp" label="確認ボタン"/></li>
      <li><link:submit uri="./確定ボタン.jsp" dummyUri="./確定ボタン.jsp" label="確定ボタン"/></li>
      <li><link:submit uri="./削除ボタン.jsp" dummyUri="./削除ボタン.jsp" label="削除ボタン"/></li>
      <li><link:submit uri="./更新ボタン.jsp" dummyUri="./更新ボタン.jsp" label="更新ボタン"/></li>
      <li><link:submit uri="./検索ボタン.jsp" dummyUri="./検索ボタン.jsp" label="検索ボタン"/></li>
      <li><link:submit uri="./ダウンロードボタン.jsp" dummyUri="./ダウンロードボタン.jsp" label="ダウンロードボタン"/></li>
      <li><link:submit uri="./ポップアップボタン.jsp" dummyUri="./ポップアップボタン.jsp" label="ポップアップボタン"/></li>
      <li><link:submit uri="./汎用ボタン.jsp" dummyUri="./汎用ボタン.jsp" label="汎用ボタン"/></li>
      <li><link:popup  uri="./閉じるボタン.jsp" dummyUri="./閉じるボタン.jsp" label="閉じる"></link:popup></li><%-- 閉じるボタンなので新規画面 --%>
    </ul>
    <ul>
      <li><link:submit uri="./戻るボタン_テストケース.jsp" dummyUri="./戻るボタン.jsp" label="戻るボタン(自動テスト)"/></li>
      <li><link:submit uri="./キャンセルボタン_テストケース.jsp" dummyUri="./キャンセルボタン.jsp" label="キャンセルボタン(自動テスト)"/></li>
      <li><link:submit uri="./確認ボタン_テストケース.jsp" dummyUri="./確認ボタン.jsp" label="確認ボタン(自動テスト)"/></li>
      <li><link:submit uri="./確定ボタン_テストケース.jsp" dummyUri="./確定ボタン.jsp" label="確定ボタン(自動テスト)"/></li>
      <li><link:submit uri="./削除ボタン_テストケース.jsp" dummyUri="./削除ボタン.jsp" label="削除ボタン(自動テスト)"/></li>
      <li><link:submit uri="./更新ボタン_テストケース.jsp" dummyUri="./更新ボタン.jsp" label="更新ボタン(自動テスト)"/></li>
      <li><link:submit uri="./検索ボタン_テストケース.jsp" dummyUri="./検索ボタン.jsp" label="検索ボタン(自動テスト)"/></li>
      <li><link:submit uri="./ダウンロードボタン_テストケース.jsp" dummyUri="./ダウンロードボタン.jsp" label="ダウンロードボタン(自動テスト)"/></li>
      <li><link:submit uri="./ポップアップボタン_テストケース.jsp" dummyUri="./ポップアップボタン.jsp" label="ポップアップボタン(自動テスト)"/></li>
      <li><link:submit uri="./汎用ボタン_テストケース.jsp" dummyUri="./汎用ボタン.jsp" label="汎用ボタン(自動テスト)"/></li>
      <li><link:popup uri="./閉じるボタン_テストケース.jsp" dummyUri="./閉じるボタン_テストケース.jsp" label="閉じる"></link:popup></li><%-- 閉じるボタンなので新規画面 --%>
    </ul>
    <ul>
      <li><link:submit uri="./ボタン並列表示.jsp" dummyUri="./ボタン並列表示.jsp" label="複数ボタンの並列表示"/></li>
    </ul>

  </n:form>
  </jsp:attribute>
</t:ui_test_template>

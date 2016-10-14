<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <%/* --> <script src="js/devtool.js"></script><meta charset="utf-8"><body> <!-- */%> -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ taglib prefix="link" tagdir="/WEB-INF/tags/widget/link" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<t:ui_test_template title="テーブル">
  <jsp:attribute name="contentHtml">
  <n:form>
    <ul>
      <li><link:submit uri="./検索結果表示用テーブル.jsp" dummyUri="./検索結果表示用テーブル.jsp" label="検索結果表示用テーブル"/></li>
      <li><link:submit uri="./一覧テーブル.jsp" dummyUri="./一覧テーブル.jsp" label="一覧テーブル"/></li>
      <li><link:submit uri="./カラムウィジェット_コード.jsp" dummyUri="./カラムウィジェット_コード.jsp" label="コードカラム"/></li>
      <li><link:submit uri="./カラムウィジェット_チェックボックス.jsp" dummyUri="./カラムウィジェット_チェックボックス.jsp" label="チェックボックスカラム"/></li>
      <li><link:submit uri="./カラムウィジェット_ラベル.jsp" dummyUri="./カラムウィジェット_ラベル.jsp" label="ラベルカラム"/></li>
      <li><link:submit uri="./カラムウィジェット_リンク.jsp" dummyUri="./カラムウィジェット_リンク.jsp" label="リンクカラム"/></li>
    </ul>
    <ul>
      <li><link:submit uri="./検索結果表示用テーブル_テストケース.jsp" dummyUri="./検索結果表示用テーブル.jsp" label="検索結果表示用テーブル(自動テスト)"/></li>
      <li><link:submit uri="./一覧テーブル_テストケース.jsp" dummyUri="./一覧テーブル.jsp" label="一覧テーブル(自動テスト)"/></li>
      <li><link:submit uri="./カラムウィジェット_コード_テストケース.jsp" dummyUri="./カラムウィジェット_コード.jsp" label="コードカラム(自動テスト)"/></li>
      <li><link:submit uri="./カラムウィジェット_チェックボックス_テストケース.jsp" dummyUri="./カラムウィジェット_チェックボックス.jsp" label="チェックボックスカラム(自動テスト)"/></li>
      <li><link:submit uri="./カラムウィジェット_ラベル_テストケース.jsp" dummyUri="./カラムウィジェット_ラベル.jsp" label="ラベルカラム(自動テスト)"/></li>
      <li><link:submit uri="./カラムウィジェット_リンク_テストケース.jsp" dummyUri="./カラムウィジェット_リンク.jsp" label="リンクカラム(自動テスト)"/></li>
      <li><link:submit uri="./カラムウィジェット_ラジオ_テストケース.jsp" dummyUri="./カラムウィジェット_ラジオ_テストケース.jsp" label="ラジオカラム（自動テスト）" /></li>
    </ul>
    <ul><li>サーバー・クライアント共通</li>
        <li><link:submit uri="./複数行レイアウト/サーバークライアント共通_テストケース.jsp"
                         dummyUri="./複数行レイアウト/サーバークライアント共通_テストケース.jsp"
                         label="複数行レイアウト(自動テスト)" /></li>
    </ul>
  </n:form>
  </jsp:attribute>
</t:ui_test_template>

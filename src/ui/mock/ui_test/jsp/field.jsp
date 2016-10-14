<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <%/* --> <script src="js/devtool.js"></script><meta charset="utf-8"><body> <!-- */%> -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ taglib prefix="link" tagdir="/WEB-INF/tags/widget/link" %>
<%@ taglib prefix="box" tagdir="/WEB-INF/tags/widget/box" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<t:ui_test_template title="tutorial 入力系プラグイン">
  <jsp:attribute name="contentHtml">

  <n:form>
    <table style="width: 90%;">
      <tr>
        <th>ウィジェット</th>
        <th>サーバサイド</th>
        <th>サーバ・クライアント共通</th>
        <th>クライアント</th>
      </tr>
      <tr>
        <td>電話番号</td>
        <td>
          <link:submit uri="/jsp/その他のウィジェット/電話番号テキスト入力/サーバサイドテストケース.jsp" dummyUri="javascript:alert('サーバサイドでテストを行ってください')" label="テストページへ" />
        </td>
        <td>
          <link:submit uri="/jsp/その他のウィジェット/電話番号テキスト入力/サーバ・クライアント共通テストケース.jsp" dummyUri="/jsp/その他のウィジェット/電話番号テキスト入力/サーバ・クライアント共通テストケース.jsp" label="テストページへ" />
        </td>
        <td>
          <link:submit uri="javascript:alert('クライアントサイドでテストを行ってください')" dummyUri="/jsp/その他のウィジェット/電話番号テキスト入力/クライアントサイドテストケース.jsp" label="テストページへ" />
        </td>
      </tr>
      <tr>
        <td>内線番号</td>
        <td>
          <link:submit uri="/jsp/その他のウィジェット/内線番号テキスト入力/サーバサイドテストケース.jsp" dummyUri="javascript:alert('サーバサイドでテストを行ってください')" label="テストページへ" />
        </td>
        <td>
          <link:submit uri="/jsp/その他のウィジェット/内線番号テキスト入力/サーバ・クライアント共通テストケース.jsp" dummyUri="/jsp/その他のウィジェット/内線番号テキスト入力/サーバ・クライアント共通テストケース.jsp" label="テストページへ" />
        </td>
        <td>
          <link:submit uri="javascript:alert('クライアントサイドでテストを行ってください')" dummyUri="/jsp/その他のウィジェット/内線番号テキスト入力/クライアントサイドテストケース.jsp" label="テストページへ" />
        </td>
      </tr>
    </table>
  </n:form>
  </jsp:attribute>
</t:ui_test_template>

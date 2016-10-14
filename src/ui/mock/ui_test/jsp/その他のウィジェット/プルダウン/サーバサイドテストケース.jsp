<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<t:ui_test_template
    suite="その他ウィジェット/プルダウン"
    title="サーバサイドのテストケース（登録画面）"
    confirmationPageTitle="サーバサイドのテストケース（確認画面）"
    testpage="./サーバサイドテストページ(登録).jsp"
    testdata="./サーバサイドテストデータ.jsp"
    testcase="./サーバサイドテストケース.js">

  <jsp:attribute name="localCss">
  </jsp:attribute>
</t:ui_test_template>

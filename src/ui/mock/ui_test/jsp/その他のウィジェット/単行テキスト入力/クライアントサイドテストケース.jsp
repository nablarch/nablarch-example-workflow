<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <%/* --> <script src="js/devtool.js"></script><meta charset="utf-8"><body> <!-- */%> -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<t:ui_test_template
    suite    = "その他ウィジェット/単行テキスト入力"
    title    = "クライアントのテストケース（登録画面）"
    confirmationPageTitle="クライアントのテストケース（確認画面）"
    testpage = "クライアントサイドテストページ(登録).jsp"
    testdata = "クライアントサイドテストデータ.jsp">
  <jsp:attribute name="localCss">
    /*********************
    id属性のテストで使用するスタイル定義
    *********************/
    input#server\.id-none {
      background-color: #7ec78f;
    }

    input#server\.id-blank {
      background-color: #a7c788
    }

    input#test-id {
      border-color: red;
    }

    /*********************
    cssClass属性のテストで使用するスタイル定義
    *********************/
    input.cssClass-test {
      border-color: blue;
    }
  </jsp:attribute>

</t:ui_test_template>

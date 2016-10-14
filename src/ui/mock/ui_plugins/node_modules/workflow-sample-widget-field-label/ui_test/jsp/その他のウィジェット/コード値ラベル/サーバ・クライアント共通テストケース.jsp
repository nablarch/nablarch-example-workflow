<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <%/* --> <script src="js/devtool.js"></script><meta charset="utf-8"><body> <!-- */%> -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<t:ui_test_template
    suite    = "その他ウィジェット/コード値ラベル"
    title    = "サーバ・クライアント共通のテストケース"
    testpage = "サーバ・クライアント共通テストページ.jsp"
    testdata = "サーバ・クライアント共通テストデータ.jsp"
    testcase = "サーバ・クライアント共通ケース.js">

  <jsp:attribute name="localCss">
    /*********************
    id属性のテストで使用するスタイル定義
    *********************/
    div#server\.id-none {
      background-color: #7ec78f;
    }

    div#server\.id-blank {
      background-color: #a7c788;
    }

    div#test-id {
      border: 1px red solid;
    }

    /*********************
    cssClass属性のテストで使用するスタイル定義
    *********************/
    div.cssClass-test {
      border: 1px blue solid;
    }

    /*********************
    domain属性のテストで使用するスタイル定義
    *********************/
    div.domain-test {
      border: 1px green solid;
    }
  </jsp:attribute>

</t:ui_test_template>

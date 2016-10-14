<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <%/* --> <script src="js/devtool.js"></script><meta charset="utf-8"><body> <!-- */%> -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<t:ui_test_template
    suite    = "その他ウィジェット/電話番号テキスト入力"
    title    = "サーバ・クライアント共通のテストケース（登録画面）"
    confirmationPageTitle="サーバ・クライアント共通のテストケース（確認画面）"
    testpage = "サーバ・クライアント共通テストページ(登録).jsp"
    testdata = "サーバ・クライアント共通テストデータ.jsp"
    testcase = "サーバ・クライアント共通ケース.js">

  <jsp:attribute name="localCss">
    /*********************
    id属性のテストで使用するスタイル定義
    *********************/
    input#server\.tel-area-id {
      border: 1px red solid;
    }
    input#server\.tel-local-id {
      border: 1px red dashed;
    }
    input#server\.tel-subscriber-id {
      border: 1px red dotted;
    }

    input#server\.id-blank {
      background-color: #a7c788
    }

    input#tel-area {
      border-color: red;
    }
    input#tel-local {
      border-color: red;
    }
    input#tel-subscriber {
      border-color: red;
    }

    /*********************
    cssClass属性のテストで使用するスタイル定義
    *********************/
    input.border-blue {
      border-color: blue;
    }
  </jsp:attribute>

</t:ui_test_template>

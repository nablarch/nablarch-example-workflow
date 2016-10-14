<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <%/* --> <script src="js/devtool.js"></script><meta charset="utf-8"><body> <!-- */%> -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ taglib prefix="event" tagdir="/WEB-INF/tags/widget/event" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<t:ui_test_template
  suite    = "ダイアログ"
  title    = "復元機能"
  confirmationPageTitle="復元機能(確認)"
  testdata = "ダイアログ_テストデータ.jsp"
  testpage = "リバート_テストページ.jsp">

  <jsp:attribute name="localJs">
    var placeHolderCase = $('span.test-case.revertOnPlaceHolder');
    placeHolderCase.prepend($('<span>').text(nativeSupport()));
    function nativeSupport() {
      return ("placeholder" in document.createElement("input")) ? " can't test " : " can test ";
    }
  </jsp:attribute>
</t:ui_test_template>

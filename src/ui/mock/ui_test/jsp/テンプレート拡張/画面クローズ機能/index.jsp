<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <%/* --> <script src="js/devtool.js"></script><meta charset="utf-8"><body> <!-- */%> -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ taglib prefix="link" tagdir="/WEB-INF/tags/widget/link" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<t:ui_test_template title="画面クローズ機能">
  <jsp:attribute name="contentHtml">
  <n:form>
  <ul>
    <li>画面クローズ機能
      <ul>
        <li><n:popupLink uri="./指定なし/サーバークライアント共通_テストケース.jsp" popupWindowName="default" >デフォルトのテンプレート</n:popupLink></li>
      </ul>
      <ul>
        <li><n:popupLink uri="./指定あり/サーバークライアント共通_テストケース.jsp" popupWindowName="custom" >画面クローズイベントの指定</n:popupLink></li>
      </ul>
    </li>
  </ul>
  </n:form>
  </jsp:attribute>
</t:ui_test_template>

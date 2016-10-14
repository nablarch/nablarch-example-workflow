<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <%/* --> <script src="js/devtool.js"></script><meta charset="utf-8"><body> <!-- */%> -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>

 
<%
  request.setAttribute("W11AC02", new HashMap() {{
    put("systemAccount", new HashMap());
    put("ugroupSystemAccount", new HashMap() {{
      put("ugroupId", "");
    }});
    put("users", new HashMap());
  }});
%>

<t:ui_test_template
  suite="開閉可能領域"
  title="開閉可能領域サンプル(登録画面)"
  confirmationPageTitle="開閉可能領域サンプル(確認画面)"
  testpage = "テストページ_登録画面.jsp"
  testdata = "テストデータ_リストの内容.jsp">
  
</t:ui_test_template>
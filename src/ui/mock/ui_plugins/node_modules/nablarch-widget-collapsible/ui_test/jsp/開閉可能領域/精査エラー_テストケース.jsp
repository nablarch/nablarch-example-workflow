<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <%/* --> <script src="js/devtool.js"></script><meta charset="utf-8"><body> <!-- */%> -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>


<t:ui_test_template
  suite="開閉可能領域"
  title="開閉可能領域(精査エラー仕様)"
  testpage = "精査エラー_テストページ.jsp"
  testdata = "精査エラー_テストデータ.jsp">
<jsp:attribute name="localJs" >
  $('#resetError').click(function(){
     $('#inputError').remove();
     $('#grobalError').remove();
  });
  $('#showInputError').click(function(){
     $('#grobalError').remove();
  });
  $('#showGrobalError').click(function(){
     $('#inputError').remove();
  });
</jsp:attribute>
</t:ui_test_template>
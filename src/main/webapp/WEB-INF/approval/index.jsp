<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page session="false" %>
<%@taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>ワークフローサンプルアプリケーション</title>

  <n:include path="/WEB-INF/common/include.jsp" />
</head>
<body>
<n:include path="/WEB-INF/common/menu.jsp" />
<div class="ui main text container">
  <h1 class="ui header">申請一覧</h1>
  <c:if test="${not empty message}">
    <div class="ui positive message">
      <i class="close icon"></i>
      <n:write name="message" />
    </div>
  </c:if>
</div>
</body>
</html>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page session="false" %>
<%@taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<html>
<head>
  <title>ワークフローサンプルアプリケーション</title>

  <n:include path="/WEB-INF/common/include.jsp" />
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.13/semantic.min.css" />
</head>
<body>
<div class="ui fixed inverted menu">
  <div class="ui container">
    <a href="#" class="item">ホーム</a>
    <div class="ui simple dropdown item">
      申請<i class="dropdown icon"></i>
      <div class="menu">
        <a class="item" href="#">申請一覧</a>
      </div>
    </div>
  </div>
</div>
<div class="ui main text container">
  <h1 class="ui header">申請一覧</h1>
</div>
</body>
</html>


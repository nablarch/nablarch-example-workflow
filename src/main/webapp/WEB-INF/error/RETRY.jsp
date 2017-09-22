<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html>
<title>ワークフローサンプルアプリケーション</title>
<n:include path="/WEB-INF/common/include.jsp" />
<body>
<n:include path="/WEB-INF/common/menu.jsp" />
<div class="ui main text container">
  <div class="masthead error segment">
    <div class="container">
      <h1 class="ui dividing header">
        データが変更されている可能性があります。
      </h1>
      <p>最初から処理をやり直してください。</p>
    </div>
  </div>
</div>
</body>
</html>
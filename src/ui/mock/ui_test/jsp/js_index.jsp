<!DOCTYPE html>
<%@page pageEncoding="UTF-8" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>Test Suite</title>
  <link rel="stylesheet" href="../css/qunit.css">
</head>
<body>
  <div id="qunit"></div>
  <div id="qunit-fixture">test markup</div>

  <script src="../js/require.js"></script>
  <script src="../js/nablarch-test.js"></script>
  <script src="../js/qunit.js"></script>

  <!-- テスト用のJavaScriptコードを列挙して下さい。-->
  <script src="../js/nablarch/util/BigDecimalTest.js"></script>
  <script src="../js/nablarch/util/SimpleDateFormatTest.js"></script>
  <script src="../js/nablarch/ui/selectorTest.js"></script>


  <a href="./index.jsp" class="button">テストページへ</a>
</body>
</html>

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@page session="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<!DOCTYPE html>
<html lang="ja">
  <head>
    <meta charset="utf-8">
    <title>カード申し込み</title>
    <n:include path="/WEB-INF/common/include.jsp" />
  </head>
  <body>
    <n:include path="/WEB-INF/common/menu.jsp" />
    <div class="ui main text container">
      <n:form cssClass="ui form">
        <h:hiddenStore name="nablarch_hiddenStore" />
        <h4 class="ui diving header">カード申し込み</h4>
        <div class="field required">
          <label>名前</label>
          <n:text name="card.name" placeholder="名前"/>
          <n:error name="card.name" messageFormat="div" errorCss="ui pointing red basic label" />
        </div>
        <div class="field required">
          <label>年収(単位:万円)</label>
          <div class="ui right input">
            <n:text name="card.annualIncome" placeholder="年収"/>
          </div>
          <n:error name="card.annualIncome" messageFormat="div" errorCss="ui pointing red basic label" />
        </div>
        <n:button id="saveNewCard" cssClass="ui primary button" uri="/action/card/new">申し込み</n:button>
      </n:form>
    </div>
    <script>
     $(function () {
       $('#saveNewCard').on('click', function(e) {
         return confirm('カード申し込みを行いますか？')
       });
     })
    </script>
  </body>
</html>


<!DOCTYPE html>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<html>
<head>
  <title>ワークフローサンプルアプリケーション</title>
  <n:include path="/WEB-INF/common/include.jsp" />
  <style type="text/css">
    body {
      background-color: #DADADA;
    }
    
    body > .grid {
      height: 100%;
    }

    .column {
      max-width: 550px;
    }

    .ui.large.form {
      max-width: 300px;
      margin: auto;
    }
  </style>
</head>
<body>
<div class="ui middle aligned center aligned grid">
  <div class="column">
    <h2 class="ui teal header">
      <span class="content">
        ワークフローサンプルアプリケーション
      </span>
    </h2>
    <n:form method="post" action="/action/auth" cssClass="ui large form">
      <div class="ui stacked secondary segment">
        <div class="field">
          <n:select
              name="userId"
              listName="userList"
              elementValueProperty="userId"
              elementLabelProperty="kanjiName"
              cssClass="ui dropdown"
              elementLabelPattern="$LABEL$"
              noneOptionLabel="ログインユーザ"
              withNoneOption="true"/>
          <n:error name="userId" messageFormat="div" errorCss="ui pointing red basic label" />
        </div>
        <button class="ui fluid large teal submit button">ログイン</button>
      </div>
    </n:form>
  </div>
</div>
</body>
</html>

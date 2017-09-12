<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ page session="false" %>

<div class="ui fixed inverted menu">
  <div class="ui container">
    <a href="#" class="item">ホーム</a>
    <div class="ui simple dropdown item">
      ワークフロー関連<i class="dropdown icon"></i>
      <div class="menu">
        <n:a href="/action/approval" cssClass="item">処理可能申請一覧</n:a>
        <n:a href="/action/loan/new" cssClass="item">ローン申請</n:a>
      </div>
    </div>
    <div class="ui right floated item">
      <%--@elvariable id="user" type="please.change.me.domain.User"--%>
      <span class="item"><n:write name="user.kanjiName" /></span>
      <n:a href="/action/auth/signout" cssClass="item">sign out</n:a>
    </div>
  </div>
</div>

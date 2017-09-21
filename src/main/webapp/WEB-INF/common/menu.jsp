<%@ page contentType="text/html;charset=UTF-8" language="java" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ page session="false" %>

<div class="ui fixed inverted menu">
  <div class="ui container">
    <a href="#" class="item">ホーム</a>
    <div class="ui simple dropdown item">
      ワークフロー関連<i class="dropdown icon"></i>
      <div class="menu">
        <n:a href="/action/approval" cssClass="item">申請一覧</n:a>
        <n:a href="/action/loan/new" cssClass="item">ローン申請</n:a>
        <n:a href="/action/card/new" cssClass="item">カード申し込み</n:a>
      </div>
    </div>
    <div class="ui simple dropdown item">
      ステートマシン<i class="dropdown icon"></i>
      <div class="menu">
        <n:a href="/action/card/new" cssClass="item">カード申し込み</n:a>
      </div>
    </div>
  </div>
</div>

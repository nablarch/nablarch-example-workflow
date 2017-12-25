<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page session="false" %>
<%@taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<html>
<head>
  <title>ワークフローサンプルアプリケーション</title>
  <n:include path="/WEB-INF/common/include.jsp" />
</head>
<body>
<n:include path="/WEB-INF/common/menu.jsp" />
<div class="ui main text container">
  <h1 class="ui header">ローン申請</h1>

  <n:form cssClass="ui form">
    <n:hiddenStore name="nablarch_hiddenStore" />
    <h4 class="ui dividing header">お客様情報</h4>
    <div class="field required">
      <label>勤務先</label>
      <n:text name="form.company" placeholder="勤務先" />
      <n:error name="form.company" messageFormat="div" errorCss="ui pointing red basic label" />
    </div>
    <div class="field required">
      <label>年収</label>
      <div class="ui right labeled input">
        <n:text name="form.annualSalary" placeholder="年収" valueFormat="decimal{#,###}" />
        <n:forInputPage>
          <div class="ui label">
            <div class="text">万円</div>
          </div>
        </n:forInputPage>
        <n:forConfirmationPage>
          <div class="text">万円</div>
        </n:forConfirmationPage>
      </div>
      <n:error name="form.annualSalary" messageFormat="div" errorCss="ui pointing red basic label" />
    </div>
    <h4 class="ui dividing header">申し込み情報</h4>
    <div class="field required">
      <label>ローン申請額</label>
      <div class="ui right labeled input">
        <n:text name="form.loanAmount" placeholder="ローン申請額" valueFormat="decimal{#,###}" />
        <n:forInputPage>
          <div class="ui label">
            <div class="text">万円</div>
          </div>
        </n:forInputPage>
        <n:forConfirmationPage>
          <div class="text">万円</div>
        </n:forConfirmationPage>
      </div>
      <n:error name="form.loanAmount" messageFormat="div" errorCss="ui pointing red basic label" />
    </div>
    <div class="field ui calendar required">
      <label>振込日</label>
      <div class="ui input left icon">
        <n:forInputPage>
          <i class="calendar icon"></i>
        </n:forInputPage>
        <n:text name="form.transferDate" placeholder="振込日" valueFormat="yyyymmdd{yyyy/MM/dd}"/>
      </div>
      <n:error name="form.transferDate" messageFormat="div" errorCss="ui pointing red basic label" />
    </div>

    <!-- 申請画面用ボタン -->
    <n:forInputPage>
      <n:button cssClass="ui primary button" uri="/action/loan/new/confirm">
        確認
      </n:button>
    </n:forInputPage>
    <n:forConfirmationPage>
      <n:button cssClass="ui primary button" uri="/action/loan/new">
        申請
      </n:button>
      <n:button cssClass="ui button" uri="/action/loan/new/re">
        修正
      </n:button>
    </n:forConfirmationPage>
  </n:form>
</div>
</body>
</html>


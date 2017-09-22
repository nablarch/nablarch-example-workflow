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
  <n:set var="title" value="" scope="page" />
  <%--@elvariable id="loanApproval" type="please.change.me.domain.LoanApproval"--%>
  <c:if test="${loanApproval.surveyTask}">
    <n:set var="title" value="調査" scope="page" />
  </c:if>
  <c:if test="${loanApproval.judgingTask}">
    <n:set var="title" value="判定" scope="page" />
  </c:if>
  <c:if test="${loanApproval.upperLevelJudgingTask}">
    <n:set var="title" value="上位者判定" scope="page" />
  </c:if>
  <c:if test="${loanApproval.executeTask}">
    <n:set var="title" value="実行" scope="page" />
  </c:if>

  <h1 class="ui header">ローン申請(<n:write name="title" />)</h1>
  <div class="ui segment">
    <n:form cssClass="ui form">
      <n:hiddenStore name="nablarch_hiddenStore" />
      <div class="ui dividing  header">お客様情報</div>
      <div class="field">
        <label>勤務先</label>
        <n:write name="loanApproval.loanApplication.company" />
      </div>
      <div class="field">
        <label>年収</label>
        <n:write name="loanApproval.loanApplication.annualSalary" valueFormat="decimal{###,###}" />万円
      </div>
      <div class="ui dividing  header">申し込み情報</div>
      <div class="field">
        <label>ローン申請額</label>
        <n:write name="loanApproval.loanApplication.loanAmount" valueFormat="decimal{###,###}" />万円
      </div>
      <div class="field">
        <label>振込日</label>
        <n:write name="loanApproval.loanApplication.transferDate" valueFormat="dateTime{yyyy/MM/dd}" />
      </div>

      <div class="ui dividing  header">調査結果</div>
      <div class="field">
        <label>調査結果</label>
        <c:if test="${loanApproval.surveyTask}">
          <n:textarea rows="3" cols="100" name="form.surveyComment" />
          <n:error name="form.surveyComment" messageFormat="div" errorCss="ui pointing red basic label" />
        </c:if>
        <c:if test="${not loanApproval.surveyTask}">
          <n:write name="loanApproval.loanApplication.surveyContent" />
        </c:if>
      </div>
      <div class="field">
        <label>コメント</label>
        <n:textarea rows="3" cols="100" name="form.comment" />
        <n:error name="form.comment" messageFormat="div" errorCss="ui pointing red basic label" />
      </div>

      <n:set var="uri" value="/action/approval/${loanApproval.loanApplication.loanAppliId}" />
      <c:if test="${loanApproval.surveyTask}">
        <n:button cssClass="ui primary button" uri="${uri}/survey">調査</n:button>
        <n:button cssClass="ui button" uri="${uri}/reject">却下</n:button>
      </c:if>
      <c:if test="${loanApproval.judgingTask}">
        <n:button cssClass="ui primary button" uri="${uri}/judge">判定実行</n:button>
        <n:button cssClass="ui button" uri="${uri}/rejectFromJudge">却下</n:button>
        <n:button cssClass="ui button" uri="${uri}/back">差し戻し</n:button>
      </c:if>
      <c:if test="${loanApproval.upperLevelJudgingTask}">
        <n:button cssClass="ui primary button" uri="${uri}/upperLevelJudge">上位者判定実行</n:button>
        <n:button cssClass="ui button" uri="${uri}/rejectFromUpperLevelJudge">却下</n:button>
      </c:if>
      <c:if test="${loanApproval.executeTask}">
        <n:button cssClass="ui primary button" uri="${uri}/executeLoan">ローン実行</n:button>
      </c:if>
    </n:form>
  </div>

  <div class="ui dividing  header">承認履歴</div>

    <table class="ui small striped table">
      <thead>
      <tr>
        <td>日時</td>
        <td>処理内容</td>
        <td>担当者</td>
        <td>処理結果</td>
        <td>コメント</td>
      </tr>
      </thead>
      <tbody>
      <%--@elvariable id="history" type="java.util.List<please.change.me.form.loan.LoanHistoryDto>"--%>
      <c:forEach var="h" items="${history}">
        <tr>
          <td><n:write name="h.executionDateTime" valueFormat="dateTime{yyyy/MM/dd HH:mm:ss}" /></td>
          <td><n:write name="h.loanAppliActionLabel" /></td>
          <td><n:write name="h.kanjiName" /></td>
          <td><n:write name="h.loanAppliResultLabel" /></td>
          <td><n:write name="h.historyComment" /></td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
  </div>
</body>
</html>


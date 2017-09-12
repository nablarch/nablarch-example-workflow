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
  <c:if test="${not empty message}">
    <div class="ui positive message">
      <i class="close icon"></i>
      <n:write name="message" />
    </div>
  </c:if>
  <h1 class="ui header">申請一覧</h1>

  <%--@elvariable id="approvals" type="java.util.List<please.change.me.form.approval.ApprovalResultForm>"--%>
  <c:if test="${empty approvals}">
    <div class="ui warning message">
      <i class="close icon"></i>
      承認可能なデータが存在しません。
    </div>
  </c:if>
  <c:if test="${not empty approvals}">
    <%--@elvariable id="user" type="please.change.me.domain.User"--%>
    <c:if test="${user.ugourpId == '8888888888'}">
      <n:form>
        <n:button cssClass="ui button primary" uri="/action/approval/auto">
          自動審査実行
        </n:button>
      </n:form>
    </c:if>
    <table class="ui small striped table">
      <thead>
      <tr>
        <td>申請ID</td>
        <td>業務種類</td>
        <td>申請日</td>
        <td>申請者</td>
        <td>承認状況</td>
      </tr>
      </thead>
      <tbody>
      <c:forEach var="approval" items="${approvals}">
        <tr>
          <c:if test="${user.ugourpId == '8888888888'}">
            <td><n:write name="approval.applicationId" /></td>
          </c:if>
          <c:if test="${user.ugourpId != '8888888888'}">
            <td><n:a href="/action/approval/${approval.applicationId}"><n:write name="approval.applicationId" /></n:a></td>
          </c:if>
          <td><n:write name="approval.businessTypeLabel" /></td>
          <td><n:write name="approval.applicationDate" valueFormat="dateTime{yyyy/MM/dd HH:mm:ss}"/></td>
          <td><n:write name="approval.applicationUserName" /></td>
          <td><n:write name="approval.statusLabel" /></td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
  </c:if>
</div>
</body>
</html>


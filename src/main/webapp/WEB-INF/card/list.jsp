<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@page session="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="ja">
  <head>
    <meta charset="utf-8">
    <title>カード申し込み一覧</title>
    <n:include path="/WEB-INF/common/include.jsp" />
  </head>
  <body>
    <n:include path="/WEB-INF/common/menu.jsp" />
    <div class="ui main text container">
      <h3 class="ui header">
        <div class="content">
          <c:out value="カード申し込み件数(${fn:length(list)}件)"/>
        </div>
      </h3>
      <c:if test="${not empty list}">
        <table class="ui table celled striped ">
          <thead>
            <tr>
              <th>申し込み番号</th>
              <th>申込者</th>
              <th>年収(万円)</th>
              <th>状況</th>
              <th>審査</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="row" items="${list}">
              <tr>
                <td><n:write name="row.id" /></td>
                <td><n:write name="row.name" /></td>
                <td><n:write name="row.annualIncome" /></td>
                <td><n:write name="row.statusLabel" /></td>
                <td>
                  <c:choose>
                    <c:when test="${row.status == 'NEW'}">
                      <c:url value="/action/card/sinsa/auto" var="url" scope="page">
                        <c:param name="id" value="${row.id}" />
                      </c:url>
                      <n:a href="${url}">自動審査実行</n:a>
                    </c:when>
                    <c:when test="${row.status == 'CONTINUOUS'}">
                      <c:url value="/action/card/sinsa/ok" var="ok" scope="page">
                        <c:param name="id" value="${row.id}" />
                      </c:url>
                      <c:url value="/action/card/sinsa/ng" var="ng" scope="page">
                        <c:param name="id" value="${row.id}" />
                      </c:url>
                      <n:a href="${ok}">審査OK</n:a>/<n:a href="${ng}">審査NG</n:a>
                    </c:when>
                  </c:choose>
                </td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </c:if>
    </div>
  </body>
</html>


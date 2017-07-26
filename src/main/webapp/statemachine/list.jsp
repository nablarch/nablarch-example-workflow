<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/widget/layout" %>
<%@taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@taglib prefix="tab" tagdir="/WEB-INF/tags/widget/tab" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<t:page_template
    title="カード申し込み一覧"
    confirmationPageTitle="カード申し込み確認一覧">
  
  <jsp:attribute name="contentHtml">
    <%--@elvariable id="list" type="java.util.List<please.change.me.sample.statemachine.CardAction.CardApplicationForm>"--%>
    <field:block title="カード申し込み件数(${fn:length(list)}件)" name="" />
    <c:if test="${not empty list}">
      <table>
        <tr>
          <th>申し込み番号</th>
          <th>申込者</th>
          <th>年収(万円)</th>
          <th>状況</th>
          <th>審査</th>
        </tr>
        <c:forEach var="row" items="${list}">
          <tr>
            <td><n:write name="row.id" /></td>
            <td><n:write name="row.name" /></td>
            <td><n:write name="row.annualIncome" /></td>
            <td><n:write name="row.statusLabel" /></td>
            <td>
              <c:if test="${row.status == 'NEW'}">
                <c:url value="/action/statemachine/CardAction/autoSinsa" var="url" scope="page">
                  <c:param name="id" value="${row.id}" />
                </c:url>
                <n:a href="${url}">自動審査実行</n:a>
              </c:if>
              <c:if test="${row.status == 'CONTINUOUS'}">
                <c:url value="/action/statemachine/CardAction/sinsaOk" var="ok" scope="page">
                  <c:param name="id" value="${row.id}" />
                </c:url>
                <c:url value="/action/statemachine/CardAction/sinsaNg" var="ng" scope="page">
                  <c:param name="id" value="${row.id}" />
                </c:url>
                <n:a href="${ok}">審査OK</n:a>/<n:a href="${ng}">審査NG</n:a>
              </c:if>
            </td>
          </tr>
        </c:forEach>
      </table>
    </c:if>
  </jsp:attribute>
</t:page_template>


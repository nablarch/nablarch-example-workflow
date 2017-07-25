<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="link" tagdir="/WEB-INF/tags/widget/link" %>

<n:form useToken="false">
  <c:if test="${not empty commonHeaderLoginUserName}">
    <div class="navItem loginInfo">
      名前：<n:write name="commonHeaderLoginUserName" />
    </div>
  </c:if>
</n:form>


<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="link" tagdir="/WEB-INF/tags/widget/link" %>

<n:form useToken="false">
  <c:if test="${not empty commonHeaderLoginUserName}">
    <div class="navItem">
      <link:submit cssClass="logout" uri="/action/ss11AB/W11AB01Action/RW11AB0101" label="" dummyUri="W11AB0101.jsp">
        <i class="fa fa-list"></i>
        トップメニュー
      </link:submit>
    </div>

    <div class="navItem loginInfo">
      <link:submit
          cssClass="logout"
          uri="/action/ss11AA/W11AA01Action/RW11AA0101"
          dummyUri="W11AA0101.jsp"
          label="">
        <i class="fa fa-sign-out"></i>
        ログアウト
      </link:submit>
    </div>

    <div class="navItem loginInfo">
      名前：<n:write name="commonHeaderLoginUserName" ></n:write>
    </div>
  </c:if>

  <c:if test="${empty commonHeaderLoginUserName}">
    <div class="navItem loginInfo">
      <link:submit
          uri="/action/ss11AA/W11AA01Action/RW11AA0101"
          label=""
          dummyUri="W11AA0101.jsp">
        <i class="fa fa-sign-in"></i>
        ログイン
      </link:submit>
    </div>
  </c:if>
</n:form>


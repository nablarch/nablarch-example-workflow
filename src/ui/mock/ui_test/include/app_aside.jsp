<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="link" tagdir="/WEB-INF/tags/widget/link" %>

<n:form>
<ul>

  <%--
    ViewHandlerで設定される、現在選択中の取引ID（tid）に応じて、
    メニュー項目をハイライト表示する。
  --%>

  <n:set var="W11AB01current" value="${tid=='W11AB01' ? 'current' : ''}" />
  <li class="<n:write name='W11AB01current' /> hover">
    <link:submit
      uri="/action/ss11AB/W11AB01Action/RW11AB0101"
      dummyUri="./W11AB0101.jsp"
      label="">
      <i class="fa fa-list-alt"></i>承認一覧照会
    </link:submit>
  </li>
  
  <n:set var="W11AD03current" value="${tid=='W11AD03' ? 'current' : ''}" />
  <li class="<n:write name='W11AD03current' /> hover">
    <link:submit
      uri="/action/ss11AD/W11AD03Action/RW11AD0301"
      dummyUri="./W11AD0301.jsp"
      label="">
      <i class="fa fa-list-alt"></i>交通費申請一覧照会
    </link:submit>
  </li>

  <n:set var="W11AC01current" value="${tid=='W11AC01' ? 'current' : ''}" />
  <li class="<n:write name='W11AD01current' /> hover">
    <link:submit
      uri="/action/ss11AC/W11AC01Action/RW11AC0101"
      dummyUri="./W11AC0101.jsp"
      label="">
      <i class="fa fa-user"></i>ローン申請登録
    </link:submit>
  </li>

  <n:set var="W11AD01current" value="${tid=='W11AD01' ? 'current' : ''}" />
  <li class="<n:write name='W11AD01current' /> hover">
    <link:submit
      uri="/action/ss11AD/W11AD01Action/RW11AD0101"
      dummyUri="./W11AD0101.jsp"
      label="">
      <i class="fa fa-group"></i>交通費申請登録
    </link:submit>
  </li>

</ul>
</n:form>

<%--
  ラベル(電話番号)表示

  電話番号の各要素を「-」で連結して出力する。

  @author Hisaaki Sioiri
--%>

<%@tag pageEncoding="UTF-8" description="電話番号用のラベル表示タグ" %>
<%@taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>

<%---------------------- 属性定義 ----------------------%>
<%@ attribute name="title" description="項目名" required="true" rtexprvalue="true" %>
<%@ attribute name="sample" description="テスト用のダミー入力値(本番動作では使用されない)" rtexprvalue="true" %>
<%@ attribute name="domain"    description="項目のドメイン型" rtexprvalue="true" %>

<%---------------------- 個別属性 ----------------------%>
<%@ attribute name="areaName" description="市外局番のname属性" required="true" rtexprvalue="true" %>
<%@ attribute name="localName" description="市内局番のname属性" required="true" rtexprvalue="true" %>
<%@ attribute name="subscriberName" description="加入者局番のname属性" required="true" rtexprvalue="true" %>

<%---------------------- 設計書用属性 ----------------------%>
<%@ attribute name="dataFrom"   description="表示するデータの取得元（画面項目定義に記載する、「表示情報取得元」.「表示項目名」の形式で設定する）" %>

<n:set var="telNo" value="" />
<n:set var="areaNo" name="${areaName}" />
<n:set var="localNo" name="${localName}" />
<n:set var="subscriberNo" name="${subscriberName}" />

<field:base title="${title}" inputField="false">
  <jsp:attribute name="fieldContent">
    <c:if test="${not empty areaNo and not empty localNo and not empty subscriberNo}">
      <n:set var="telNo"
          value="${areaNo} - ${localNo} - ${subscriberNo}" />
    </c:if>
    <n:write name="telNo" />
  </jsp:attribute>
</field:base>


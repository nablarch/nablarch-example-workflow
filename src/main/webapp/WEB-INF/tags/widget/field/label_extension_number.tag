<%--
  ラベル表示

  内線番号の各要素を「-」で連結して出力する。

  @author Hisaaki Sioiri
--%>

<%@tag pageEncoding="UTF-8" description="内線番号をラベル出力する。" %>
<%@taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>

<%---------------------- 属性定義 ----------------------%>
<%@ attribute name="title" description="項目名" required="true" rtexprvalue="true" %>
<%@ attribute name="sample" description="テスト用のダミー入力値(本番動作では使用されない)" rtexprvalue="true" %>
<%@ attribute name="domain"    description="項目のドメイン型" rtexprvalue="true" %>

<%---------------------- 個別属性 ----------------------%>
<%@ attribute name="builName"     description="ビル番号のname属性" required="true" rtexprvalue="true" %>
<%@ attribute name="personalName" description="個人番号のname属性" required="true" rtexprvalue="true" %>

<%---------------------- 設計書用属性 ----------------------%>
<%@ attribute name="dataFrom"   description="表示するデータの取得元（画面項目定義に記載する、「表示情報取得元」.「表示項目名」の形式で設定する）" %>

<n:set var="extension_number" value="" />
<n:set var="builNo" name="${builName}" />
<n:set var="personalNo" name="${personalName}" />

<field:base title="${title}" inputField="false">
  <jsp:attribute name="fieldContent">
    <c:if test="${not empty builNo and not empty personalNo}">
      <n:set var="extension_number"
          value="${builNo} - ${personalNo}" />
    </c:if>
    <n:write name="extension_number" />
  </jsp:attribute>
</field:base>


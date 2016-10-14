<%--
  画像表示用ウィジェット
  @author takanori tani
--%>

<%@tag pageEncoding="UTF-8" description="画像を表示するウィジェット" %>
<%@taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- ============================ 属性定義 =============================== --%>
<%@ attribute name="cssClass"   description="htmlのclass属性。このウィジェットの全体ラッパに適用される。" rtexprvalue="true" %>
<%@ attribute name="id"         description="htmlのid属性。このウィジェットの全体ラッパに適用される。" rtexprvalue="true" %>
<%@ attribute name="file"       description="表示する画像の相対パスを指定する。" rtexprvalue="true" required="true"%>

<n:set var="contextPath" value="${pageContext.request.contextPath}" />

<div id="<n:write name='id' withHtmlFormat='false'/>"
     class="box imgWrapper <n:write name='cssClass' withHtmlFormat='false'/>" >
  <div class="nablarch_ResponsibleImage
             -filepath    '<n:write name='file' withHtmlFormat='false' />'
             -id          '<n:write name='id' withHtmlFormat='false'/>'
             -contextPath '<n:write name='contextPath' withHtmlFormat='false'/>'"></div>
</div>
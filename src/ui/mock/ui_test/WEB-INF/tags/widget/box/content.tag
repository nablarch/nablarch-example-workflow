<%--
  テキストの表示
  @author takanori tani
--%>

<%@tag pageEncoding="UTF-8" description="文言を表示するウィジェット" %>
<%@taglib prefix="n" uri="http://tis.co.jp/nablarch" %>

<%-- ============================ 属性定義 =============================== --%>
<%@ attribute name="cssClass"  description="htmlのclass属性" rtexprvalue="true" %>

<div class="box contentBox <n:write name='cssClass' withHtmlFormat='false' />"><jsp:doBody /></div>
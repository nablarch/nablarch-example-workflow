<%--
  タイトルテキストの表示
  @author takanori tani
--%>

<%@tag pageEncoding="UTF-8" description="タイトル文言を表示するウィジェット" %>
<%@taglib prefix="n" uri="http://tis.co.jp/nablarch" %>

<%-- ============================ 属性定義 =============================== --%>
<%@ attribute name="cssClass"  description="htmlのclass属性" rtexprvalue="true" %>
<%@ attribute name="id"  description="htmlのid属性" rtexprvalue="true" %>

<div class="box titleBox <n:write name='cssClass' withHtmlFormat='false' />"
     id="<n:write name='id' withHtmlFormat='false' />"><jsp:doBody /></div>

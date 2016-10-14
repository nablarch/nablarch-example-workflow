<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <%/* --> <script src="js/devtool.js"></script><meta charset="utf-8"><body> <!-- */%> -->
<%@taglib prefix="n"  uri="http://tis.co.jp/nablarch" %>
<%@taglib prefix="t"  tagdir="/WEB-INF/tags/template" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
  String str = "hogehoge";
  pageContext.setAttribute("str", str);

%>

<t:page_template title="EL組み込み関数テスト">
  <jsp:attribute name="asideHtml">
    <jsp:include page="/include/aside.jsp" />
  </jsp:attribute>

  <jsp:attribute name="contentHtml">

  <h2> fn:contains </h2>
  <div>${fn:contains("hogefuga", "hoge")} must be true</div>
  <div>${fn:contains("hogefuga", "piyo")} must be false</div>

  <h2> fn:containsIgnoreCase</h2>
  <div>${fn:containsIgnoreCase("HOGEfuga", "hoge")} must be true</div>
  <div>${fn:containsIgnoreCase("hogefuga", "piyo")} must be false</div>

  <h2> fn:startsWith</h2>
  <div>${fn:startsWith("HOGEfuga", "HOGE")} must be true</div>
  <div>${fn:startsWith("hogefuga", "piyo")} must be false</div>

  <h2> fn:endsWith</h2>
  <div>${fn:endsWith("HOGEfuga", "fuga")} must be true</div>
  <div>${fn:endsWith("hogefuga", "piyo")} must be false</div>

  <h2> fn:escapeXml</h2>
  <div>${fn:escapeXml("&")} must be &amp;</div>
  <div>${fn:escapeXml("hogehoge")} must be hogehoge</div>

  <h2> fn:indexOf</h2>
  <div>${fn:indexOf("hogefuga", "hoge")} must be 0</div>
  <div>${fn:indexOf("hogefuga", "piyo")} must be -1</div>
  <div>${fn:indexOf("hogefuga", "oge")}  must be 1</div>

  <h2> fn:length</h2>
  <div>${fn:length("hogefuga")} must be 8</div>
  <div>${fn:length("")} must be 0</div>

  <h2> fn:replace</h2>
  <div>${fn:replace("hogefuga", "fuga", "hoge")} must be "hogehoge"</div>
  <div>${fn:replace("hogefuga", "piyo", "hoge")} must be "hogefuga"</div>
  <div>${fn:replace("hoge?fuga?piyo", "?", "!")} must be "hoge!fuga!piyo"</div>


  <h2> fn:split と fn:join</h2>
  <n:set var="array" value='${fn:split("hoge;fuga;piyo", ";")}'></n:set>

  <div>${fn:join(array, "=")} must be hoge=fuga=piyo</div>

  <h2> fn:substring</h2>
  <div>${fn:substring("hogefuga", 4, 8)} must be fuga</div>
  <div>${fn:substring("hogefuga", 2, -1)} must be gefuga</div>

  <h2> fn:substringAfter</h2>
  <div>"${fn:substringAfter("hoge;fuga", ";")}" must be "fuga"</div>
  <div>"${fn:substringAfter("hogefuga", ";")}" must be ""</div>

  <h2> fn:substringBefore</h2>
  <div>"${fn:substringBefore("hoge;fuga", ";")}" must be "hoge"</div>
  <div>"${fn:substringBefore("hogefuga", ";")}" must be ""</div>

  <h2> fn:toLowerCase</h2>
  <div>${fn:toLowerCase("HOGE;FUGA")} must be hoge;fuga</div>
  <div>${fn:toLowerCase("hoge;fuga")} must be hoge;fuga</div>

  <h2> fn:toUpperCase</h2>
  <div>${fn:toUpperCase("HOGE;FUGA")} must be HOGE;FUGA</div>
  <div>${fn:toUpperCase("hoge;fuga")} must be HOGE;FUGA</div>

  <h2> fn:trim</h2>
  <div>"${fn:trim("  HOGE FUGA  ")}" must be HOGE FUGA</div>

  <h2>parameter</h2><%-- literal pattern --%>
  <div>${fn:contains("hogefuga", "hoge")} must be true</div>
  <div>${fn:contains('hogefuga', 'hoge')} must be true</div>
  <div>${fn:contains("hogefuga", 'hoge')} must be true</div>
  <div>${fn:contains('hogefuga', "hoge")} must be true</div>

  </jsp:attribute>
</t:page_template>

<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <%/* --> <script src="js/devtool.js"></script><meta charset="utf-8"><body> <!-- */%> -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ taglib prefix="tab" tagdir="/WEB-INF/tags/widget/tab" %>
<%@ taglib prefix="table" tagdir="/WEB-INF/tags/widget/table" %>
<%@ taglib prefix="column" tagdir="/WEB-INF/tags/widget/column" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%

  List<Map<String, String>> params = new ArrayList<Map<String, String>>();
  Enumeration names = request.getParameterNames();
  while (names.hasMoreElements()) {
    String key = (String) names.nextElement();
    String value = Arrays.toString(request.getParameterValues(key));
    Map<String, String> param = new HashMap<String, String>();
    param.put("key", key);
    param.put("value", value);
    params.add(param);
  }
  request.setAttribute("params", params);
%>

<t:ui_test_template
    suite="テーブル"
    title="サーバに送信された値を確認する画面">

  <jsp:attribute name="contentHtml">
    <table:plain title="サーバに送信された値" resultSetName="params">
      <column:label key="key" title="パラメータ名">
      </column:label>
      <column:label key="value" title="パラメータ値">
      </column:label>
    </table:plain>

    <n:form>
      <button:block>
        <button:back uri="./カラムウィジェット_チェックボックス.jsp">
        </button:back>
      </button:block>
    </n:form>
  </jsp:attribute>


</t:ui_test_template>

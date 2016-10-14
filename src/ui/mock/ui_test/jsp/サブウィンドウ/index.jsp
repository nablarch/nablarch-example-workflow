<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <%/* --> <script src="js/devtool.js"></script><meta charset="utf-8"><body> <!-- */%> -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ taglib prefix="link" tagdir="/WEB-INF/tags/widget/link" %>
<%@ taglib prefix="box" tagdir="/WEB-INF/tags/widget/box" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<t:ui_test_template title="サブウィンドウ">
  <jsp:attribute name="contentHtml">
  <n:form>
    <box:content>
      本機能のテストでは、子画面テンプレートのテストを実施するため子画面側ではui_test_templateは使用しない。

      <ul>
        <li>
          <link:popup label="子画面を開く" uri="./子画面.jsp" dummyUri="./子画面.jsp">
          </link:popup>
        </li>
      </ul>
    </box:content>
  </n:form>
  </jsp:attribute>
</t:ui_test_template>

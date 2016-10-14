<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <%/* --> <script src="js/devtool.js"></script><meta charset="utf-8"><body> <!-- */%> -->
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ taglib prefix="spec" tagdir="/WEB-INF/tags/widget/spec" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<t:ui_test_template title="存在しない属性を指定した場合">
  <jsp:attribute name="contentHtml">
    <field:block>
      <field:text
        title="コードIDなんてないよ。"
        name="copy.miss"
        codeId="000000000001"></field:text>
    </field:block>
    <field:block />
  </jsp:attribute>
</t:ui_test_template>
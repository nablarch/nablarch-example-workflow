<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <%/* --> <script src="js/devtool.js"></script><meta charset="utf-8"><body> <!-- */%> -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ taglib prefix="link" tagdir="/WEB-INF/tags/widget/link" %>
<%@ taglib prefix="spec" tagdir="/WEB-INF/tags/widget/spec" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<t:ui_test_template title="スペックツール用タグの確認">
  <jsp:attribute name="contentHtml">
  <spec:author>spec</spec:author>
  <spec:created_date>spec</spec:created_date>
  <spec:updated_by>spec</spec:updated_by>
  <spec:updated_by>spec</spec:updated_by>
  <spec:condition name="All" comment="コメント" when=""></spec:condition>
  <n:form>
    <spec:layout>
    <spec:desc></spec:desc>
     <span class="test-case">SPECタグがサーバーサイドで動作しないことの確認</span>
     <field:block title="レイアウトの中に配置する">
       <field:hint>レイアウト中に配備しています。</field:hint>
     </field:block>
    </spec:layout>
  </n:form>
  </jsp:attribute>
</t:ui_test_template>

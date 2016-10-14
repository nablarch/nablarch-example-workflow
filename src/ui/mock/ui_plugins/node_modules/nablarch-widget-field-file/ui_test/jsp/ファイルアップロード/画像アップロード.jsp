<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <%/* --> <script src="js/devtool.js"></script><meta charset="utf-8"><body> <!-- */%> -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<t:ui_test_template title="ファイルアップロード">
  <jsp:attribute name="contentHtml">
  <n:form enctype="multipart/form-data">

    <field:block title="画像アップロード">
      <field:file title="ファイル" name="uploadFile"></field:file>
    </field:block>

    <button:block>
      <button:submit label="アップロード" uri="./index.jsp">
      </button:submit>
    </button:block>

  </n:form>
  </jsp:attribute>
</t:ui_test_template>

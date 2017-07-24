<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <%/* --> <script src="js/devtool.js"></script><meta charset="utf-8"><body> <!-- */%> -->
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/widget/layout" %>
<%@taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<t:page_template
    title="ログイン"
    noMenu="true">

  <jsp:attribute name="contentHtml">
    <n:form>
      <field:block title="ログインユーザ選択">
        <layout:row>
        <layout:cell gridSize="10"></layout:cell>
        <field:pulldown
          elementValueProperty="userId"
          elementLabelProperty="kanjiName"
          listName="userList"
          title="ユーザ"
          name="userId"
          titleSize="5"
          inputSize="15"
          sample="太郎|次郎|[三郎]">
        </field:pulldown>
        </layout:row>
      </field:block>
      <button:block>
        <button:submit
          uri="/action/ss11AA/W11AA01Action/RW11AA0102"
          label="ログイン"
          icon="fa fa-sign-in"
          size="15">
        </button:submit>
      </button:block>
    </n:form>
  </jsp:attribute>
</t:page_template>
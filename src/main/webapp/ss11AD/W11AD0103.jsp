<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <%/* --> <script src="js/devtool.js"></script><meta charset="utf-8"><body> <!-- */%> -->
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/widget/layout" %>
<%@taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@taglib prefix="tab" tagdir="/WEB-INF/tags/widget/tab" %>
<t:page_template
    title="交通費申請登録完了">

  <jsp:attribute name="contentHtml">
    <n:form windowScopePrefixes="user">
      <field:block title="処理内容">
        <layout:row>
          <layout:cell gridSize="15"></layout:cell>
          <layout:cell>登録が完了しました。</layout:cell>
        </layout:row>
      </field:block>

      <layout:row>
        <layout:cell gridSize="15"></layout:cell>
        <button:submit
            label="メニュー画面へ戻る"
            uri="/action/ss11AB/W11AB01Action/RW11AB0101"
            size="10"></button:submit>
      </layout:row>
    </n:form>

  </jsp:attribute>
</t:page_template>
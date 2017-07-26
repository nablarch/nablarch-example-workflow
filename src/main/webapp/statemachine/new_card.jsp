<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/widget/layout" %>
<%@taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@taglib prefix="tab" tagdir="/WEB-INF/tags/widget/tab" %>
<t:page_template
    title="カード申し込み"
    confirmationPageTitle="カード申し込み確認">
  
  <jsp:attribute name="localJs">
      $('#saveNewCard').on('click', function(e) {
        return confirm('カード申し込みを行いますか？')
      });
  </jsp:attribute>
  
  <jsp:attribute name="contentHtml">
    <n:form windowScopePrefixes="card">
      <field:block title="カード申し込み">
        <layout:row>
          <field:text title="名前" name="card.name" required="true" titleSize="10" />
        </layout:row>
        <layout:row>
          <field:text title="年収(単位:万円)" name="card.annualIncome" required="true" titleSize="10" />
        </layout:row>
      </field:block>
      
      <layout:row>
        <n:forInputPage>
          <layout:cell gridSize="15" />
          <button:confirm
              id="saveNewCard"
              label="申し込み"
              uri="/action/statemachine/CardAction/saveNewCard"
              size="10" />
        </n:forInputPage>
      </layout:row>
    </n:form>
    
  </jsp:attribute>
</t:page_template>


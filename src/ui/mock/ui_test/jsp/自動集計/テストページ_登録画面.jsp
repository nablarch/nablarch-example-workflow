<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

  <n:form windowScopePrefixes="formdata">
      
    <field:block title="自動集計サンプル1">
    
      <field:text
        title="加算項目1"
        name="formdata.amount11"
        id="amount1_1"
        maxlength="20"
        cssClass="AutoSum_target1">
      </field:text>
    
      <field:text
        title="加算項目2"  
        name="formdata.amount12"
        id="amount1_2"
        maxlength="20"
        cssClass="AutoSum_target1">
      </field:text>
      
      <field:text
        title="加算項目3"
        name="formdata.amount13"
        id="amount1_3"
        maxlength="20"
        cssClass="AutoSum_target1">
      </field:text>
      
      <field:label
        title="合計欄1"  
        cssClass="nablarch_AutoSum -target target1"
        id="autoSum1"
        name="formdata.totalAmount1"
        valueFormat="decimal{#,###.##}">
      </field:label>
   </field:block> 
     
   <field:block
     title="サンプル2">
      <field:text
        title="加算項目"  
        name="formdata.amount21"
        id="amount2_1"
        maxlength="20"
        cssClass="AutoSum_target2">
      </field:text>
      
      <field:pulldown
        title="減算項目"  
        name="formdata.amount22"
        listName="listBox"
        elementValueProperty="value"
        elementLabelProperty="key"        
        elementLabelPattern="$LABEL$"
        id="amount2_2"
        cssClass="AutoSum_target2_negative">
      </field:pulldown>
      
      <field:text
        title="減算項目(disabled:集計外)"
        name="formdata.amount31"
        id="amount3_1"
        disabled="true"
        cssClass="AutoSum_target2_negative">
      </field:text>
      
      <field:text
        title="加算項目(readonly:集計対象)"
        name="formdata.amount32"
        id="amount3_2"
        readonly="true"
        cssClass="AutoSum_target2">
      </field:text>
            
      <field:text
        title="合計欄2"  
        id="autoSum2"
        cssClass="nablarch_AutoSum -target target2"
        name="formdata.totalAmount2"
        valueFormat="decimal{#,###.##}"
        readonly="true">
      </field:text>
      
    </field:block>
<%--
    <button:block>
      <n:forInputPage>
        <button:check id="check" uri="./確認画面.jsp" />
      </n:forInputPage>
      <n:forConfirmationPage>
        <button:cancel  id="check"   uri="./登録画面.jsp" />
        <button:confirm id="confirm" uri="./完了画面.jsp" />
      </n:forConfirmationPage>
    </button:block>
--%>
  </n:form>

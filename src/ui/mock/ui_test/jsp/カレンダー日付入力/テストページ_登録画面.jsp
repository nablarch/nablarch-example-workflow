<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<n:form windowScopePrefixes="formdata">

  <field:block title="権限情報">

    <field:calendar
      title="適用開始日"
      required="true"
      format=""
      name="formdata.effectiveDate"
      example="2013/04/01"
      locale="ja">
    </field:calendar>
    
    <field:calendar
      title="適用終了日"
      id="lastEffectiveDate"
      required="true"
      name="formdata.lastEffectiveDate"
      locale="ja"
      hint="入力例 ： 2013/05/12">
    </field:calendar>

    <field:calendar
      title="別フォーマット・ロケール"
      id="anotherLocaleSample"
      name="formdata.anotherLocaleSample"
      format="M.d,yy" 
      maxlength="8"
      locale="en"
      hint="example: 5.12,13">
    </field:calendar>   
    
  </field:block>

  <button:block>
    <n:forInputPage>
      <button:check  id="check" uri="./確認画面.jsp">
      </button:check>
    </n:forInputPage>
      
    <n:forConfirmationPage>
      <button:cancel id="cancel" uri="./登録画面.jsp">
      </button:cancel>
    </n:forConfirmationPage>
  </button:block>

</n:form>

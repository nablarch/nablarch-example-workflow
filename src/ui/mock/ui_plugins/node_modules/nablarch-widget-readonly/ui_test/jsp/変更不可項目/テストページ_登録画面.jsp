<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<n:form windowScopePrefixes="formdata">
 
  <field:block title="座席予約">    
    
    <field:calendar
      title="搭乗予定日"
      id="flightDate"
      name="formdata.flightDate"
      readonly="true"
      format="yyyy/MM/dd"
      locale="ja"
      sample="2013/10/04"
      hint="入力例 ： 2012/05/12">
    </field:calendar>
    
    <field:radio
      title="座席クラス"
      name="formdata.sheetGrade"
      cssClass="sheetGrade"
      readonly="true"
      listName="sheetGrades"
      elementLabelPattern="$LABEL$"
      elementLabelProperty="name"
      elementValueProperty="id"
      sample="エコノミークラス|ビジネスクラス|[ファーストクラス]">
    </field:radio>
    
    <field:pulldown
      title="出発時刻"
      name="formdata.departureTime"
      readonly="true"
      cssClass="departureTime"
      listName="departureTimes"
      elementLabelPattern="$LABEL$"
      elementLabelProperty="name"
      elementValueProperty="id"
      size="4">
    </field:pulldown>
    
    <field:checkbox
      title="レンタカーを利用"
      name="formdata.useRentalCar"
      cssClass="useRentalCar"
      readonly="true"
      listName="useRentalCar"
      elementLabelPattern=""
      elementLabelProperty="name"
      elementValueProperty="id"
      sample="[使用する]">
    </field:checkbox>

    <field:code_checkbox
        title="コード値（チェックボックス）"
        name="formdata.codeCheckSample"
        cssClass="codeCheckSample"
        readonly="true"
        labelPattern="$NAME$"
        listFormat="br"
        codeId="code1"
        sample="[s1]|s2|s3"
        >
    </field:code_checkbox>

    <field:code_radio
      title="コード値（ラジオボタン）"
      name="formdata.codeRadioSample"
      cssClass="codeRadioSample"
      readonly="true"
      labelPattern="$NAME$ : $VALUE$"
      listFormat="br"
      codeId="code2"
      sample="n1 : v1|n2 : v2">
    </field:code_radio>
    
    <field:checkbox
      title="利用航空会社"
      name="formdata.company"
      cssClass="company"
      readonly="true"
      listName="companies"
      elementLabelPattern="$LABEL$"
      elementLabelProperty="name"
      elementValueProperty="id"
      sample="[XX航空]|YY航空"
        >
    </field:checkbox>
  </field:block>

  <button:block>
    <n:forInputPage>
      <button:submit id="changeClass" uri="./登録画面.jsp" label="変更する">
      </button:submit>
      <button:check  id="check" uri="./確認画面.jsp" dummyUri="確認画面.jsp">
      </button:check>
    </n:forInputPage>
      
    <n:forConfirmationPage>
      <button:cancel id="cancel" uri="./登録画面.jsp" dummyUri="登録画面.jsp">
      </button:cancel>
    </n:forConfirmationPage>
  </button:block>
</n:form>

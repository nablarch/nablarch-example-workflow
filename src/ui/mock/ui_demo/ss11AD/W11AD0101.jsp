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
    title="交通費申請登録"
    confirmationPageTitle="交通費申請登録確認">

  <jsp:attribute name="contentHtml">
    <n:form windowScopePrefixes="user">
      <n:set var="titleSize" value="10"></n:set>
      <n:set var="inputSize" value="20"></n:set>
      <field:block title="申請情報">
        <layout:row>
          <field:code_pulldown
              title="移動種類"
              name="transDeviceCd"
              codeId="C1100001"
              required="true"
              titleSize="10"
              inputSize="20"
              domain="TRANS_DEVICE_CD"
              sample="バス|[電車]|タクシー">
          </field:code_pulldown>
        </layout:row>
        <layout:row>
          <field:text
              title="出発地"
              name="departure"
              required="true"
              titleSize="10"
              inputSize="20"
              domain="移動場所名"
              sample="茅場町駅">
          </field:text>
        </layout:row>
        <layout:row>
          <field:text
              title="目的地"
              name="destination"
              required="true"
              titleSize="10"
              inputSize="20"
              domain="移動場所名"
              sample="西新宿駅">
          </field:text>
        </layout:row>
        <layout:row>
          <field:text
            title="交通費"
            name="transExpense"
            required="true"
            titleSize="10"
            inputSize="20"
            unit="円"
            domain="交通費"
            sample="200">
          </field:text>
        </layout:row>
      </field:block>
      
      <field:block title="承認情報">
        <layout:row>
          <field:pulldown
              title="確認者"
              name="confirmUserId"
              elementLabelProperty="kanjiName"
              elementValueProperty="userId"
              listName="confirmUserList"
              titleSize="10"
              inputSize="20"
              domain="ユーザID"
              sample="佐藤|[竹内]|宮本">
          </field:pulldown>
        </layout:row>
        <layout:row>
          <field:pulldown
              title="承認者"
              name="authorizeUserId"
              elementLabelProperty="kanjiName"
              elementValueProperty="userId"
              listName="authorizeUserList"
              titleSize="10"
              inputSize="20"
              domain="ユーザID"
              sample="[佐藤]|竹内|宮本">
          </field:pulldown>
        </layout:row>
      </field:block>

      <layout:row>
        <n:forInputPage>
          <button:back
              uri="/action/ss11AB/W11AB01Action/RW11AB0103"
              size="10"></button:back>
          <layout:cell gridSize="25"></layout:cell>
          <button:check
              uri="/action/ss11AD/W11AD01Action/RW11AD0102"
              size="10"
              dummyUri="./W11AD0102.jsp"></button:check>
        </n:forInputPage>
        <n:forConfirmationPage>
          <button:back
              uri="/action/ss11AD/W11AD01Action/RW11AD0104"
              size="10"></button:back>
          <layout:cell gridSize="25"></layout:cell>
          <button:confirm
              uri="/action/ss11AD/W11AD01Action/RW11AD0103"
              size="10"
              dummyUri="./W11AD0102.jsp"></button:confirm>
        </n:forConfirmationPage>
      </layout:row>
    </n:form>

  </jsp:attribute>
</t:page_template>
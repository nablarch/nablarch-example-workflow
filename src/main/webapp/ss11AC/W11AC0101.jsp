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
    title="ローン申請登録"
    confirmationPageTitle="ローン申請登録確認">

  <jsp:attribute name="contentHtml">
    <n:form windowScopePrefixes="W11AC01">
      <n:set var="titleSize" value="15"></n:set>
      <n:set var="inputSize" value="25"></n:set>
      <field:block title="お客様情報">
        <layout:row>
          <field:text
              title="勤務先"
              name="W11AC01.company"
              required="true"
              titleSize="${titleSize}"
              inputSize="${inputSize}"
              maxlength="100"
              sample="TIS株式会社">
          </field:text>
        </layout:row>
        <layout:row>
          <field:text
              title="年収"
              name="W11AC01.annualSalary"
              required="true"
              titleSize="${titleSize}"
              inputSize="${inputSize}"
              valueFormat="decimal{#,###}"
              maxlength="7"
              unit="万"
              sample="1000">
          </field:text>
        </layout:row>
      </field:block>

      <field:block title="申し込み情報">
        <layout:row>
          <field:text
              title="ローン申請額"
              name="W11AC01.loanAmount"
              required="true"
              titleSize="${titleSize}"
              inputSize="${inputSize}"
              valueFormat="decimal{#,###}"
              maxlength="5"
              unit="万"
              sample="200">
          </field:text>
        </layout:row>
        <layout:row>
          <field:calendar
              title="振込日"
              name="W11AC01.transferDate"
              required="true"
              maxlength="10"
              sample="2014/12/20">
          </field:calendar>
        </layout:row>
      </field:block>

      <!-- 申請画面用ボタン -->
      <layout:row>
        <n:forInputPage>
          <layout:cell gridSize="15">
          </layout:cell>
          <button:check
              uri="/action/ss11AC/W11AC01Action/RW11AC0102"
              size="10"
              dummyUri="./W11AC0102.jsp">
          </button:check>
        </n:forInputPage>
        <n:forConfirmationPage>
          <button:back
              uri="/action/ss11AC/W11AC01Action/RW11AC0103"
              size="10"
              dummyUri="./W11AC0101.jsp">
          </button:back>
          <layout:cell gridSize="25">
          </layout:cell>
          <button:confirm
              uri="/action/ss11AC/W11AC01Action/RW11AC0104"
              size="10"
              dummyUri="./W11AC0103.jsp">
          </button:confirm>
        </n:forConfirmationPage>
      </layout:row>
    </n:form>

  </jsp:attribute>
</t:page_template>
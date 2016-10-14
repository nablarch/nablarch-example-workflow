<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <%/* --> <script src="js/devtool.js"></script><meta charset="utf-8"><body> <!-- */%> -->
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/widget/layout" %>
<%@taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@taglib prefix="tab" tagdir="/WEB-INF/tags/widget/tab" %>
<%@taglib prefix="table" tagdir="/WEB-INF/tags/widget/table" %>
<%@taglib prefix="column" tagdir="/WEB-INF/tags/widget/column" %>
<%@taglib prefix="event" tagdir="/WEB-INF/tags/widget/event" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<n:set var="pageTitle" value="" scope="page" />
<c:if test="${surveyTask}">
  <n:set var="pageTitle" value="調査" scope="page" />
</c:if>
<c:if test="${judgingTask}">
  <n:set var="pageTitle" value="判定" scope="page" />
</c:if>
<c:if test="${upperLevelJudgingTask}">
  <n:set var="pageTitle" value="上位判定" scope="page" />
</c:if>
<c:if test="${executeTask}">
  <n:set var="pageTitle" value="実行" scope="page" />
</c:if>
<t:page_template
    title="ローン申請（${pageTitle}）">

<jsp:attribute name="contentHtml">
    <n:form windowScopePrefixes="W11AC02,condition">
    <n:set var="titleSize" value="10"></n:set>
    <n:set var="inputSize" value="25"></n:set>
    <field:block title="お客様情報">
      <layout:row>
        <field:label
            title="勤務先"
            name="loanApplication.company"
            titleSize="${titleSize}"
            inputSize="${inputSize}"
            sample="TIS株式会社">
        </field:label>
      </layout:row>
      <n:write name="value" />
      <layout:row>
        <field:label
            title="年収"
            name="loanApplication.annualSalary"
            titleSize="${titleSize}"
            inputSize="${inputSize}"
            valueFormat="decimal{#,###}"
            unit="万"
            sample="1000">
        </field:label>
      </layout:row>
    </field:block>

    <n:write name="value" />
    <field:block title="申し込み情報">
      <layout:row>
        <field:label
            title="ローン申請額"
            name="loanApplication.loanAmount"
            titleSize="${titleSize}"
            inputSize="${inputSize}"
            valueFormat="decimal{#,###}"
            unit="万"
            sample="200">
        </field:label>
      </layout:row>
      <layout:row>
        <field:label
            title="振込日"
            name="loanApplication.transferDate"
            valueFormat="yyyymmdd{yyyy/MM/dd}"
            sample="2014/12/20">
        </field:label>
      </layout:row>
    </field:block>

    <!-- 調査用入力項目 -->
    <field:block title="調査結果">
      <layout:row>
        <c:if test="${surveyTask}">
          <field:textarea
              title="調査結果"
              name="W11AC02.surveyContent"
              required="true"
              titleSize="${titleSize}"
              inputSize="${inputSize}"
              maxlength="100"
              sample="OKでーす。">
          </field:textarea>
        </c:if>
        <c:if test="${not surveyTask}">
          <field:label
              name="loanApplication.surveyContent"
              title="調査結果">
          </field:label>
        </c:if>
      </layout:row>
    </field:block>

    <!-- ワークフロー用入力項目 -->
    <field:block title="コメント">
      <layout:row>
        <field:textarea
            title="コメント"
            name="W11AC02.historyComment"
            titleSize="${titleSize}"
            inputSize="${inputSize}"
            maxlength="100"
            sample="住所が存在しないらしいので却下します。">
        </field:textarea>
      </layout:row>
    </field:block>
    <!-- 承認履歴 -->
    <table:plain
        title="承認履歴"
        resultSetName="history"
        sampleResults="1">

      <column:label
          key="executionDateTime"
          title="日時"
          width="140px"
          valueFormat="dateTime{yyyy/MM/dd HH:mm:ss}">
      </column:label>

      <column:code
          title="処理内容"
          codeId="C1100006"
          optionColumnName="OPTION01"
          labelPattern="$OPTIONALNAME$"
          key="loanAppliActionCd"
          sample="調査">
      </column:code>

      <column:label
          key="kanjiName"
          title="担当者"
          sample="安里">
      </column:label>

      <column:code
          codeId="C1100007"
          key="loanAppliResultCd"
          title="処理結果"
          sample="却下">
      </column:code>

      <column:label
          key="historyComment"
          title="コメント"
          sample="記入されている住所が存在しません。正しい住所を確認後に、再度申請をお願いします。">
      </column:label>

    </table:plain>

    <event:listen event=".confirmWorkflow click">
      <event:confirm
          message="処理を進めます。よろしいでしょうか？">
      </event:confirm>
    </event:listen>

    <!-- 申請画面用ボタン -->
    <layout:row>
      <button:back
          uri="/action/ss11AB/W11AB01Action/RW11AB0102"
          size="10"
          dummyUri="./メニュー画面_ページ.jsp">
      </button:back>
      <layout:cell gridSize="${judgingTask ? '5' : executeTask ? '25' :'15'}">
      </layout:cell>
      <c:if test="${surveyTask}">
        <button:submit
            uri="/action/ss11AC/W11AC02Action/RW11AC0203"
            label="却下"
            size="10"
            icon="fa fa-trash-o"
            cssClass="confirmWorkflow"
            dummyUri="./W11AC0102.jsp">
        </button:submit>
        <button:check
            uri="/action/ss11AC/W11AC02Action/RW11AC0202"
            label="調査実行"
            size="10"
            cssClass="confirmWorkflow"
            dummyUri="./W11AC0102.jsp">
        </button:check>
      </c:if>

      <c:if test="${judgingTask}">
        <button:submit
            uri="/action/ss11AC/W11AC02Action/RW11AC0206"
            label="却下"
            size="10"
            icon="fa fa-trash-o"
            cssClass="confirmWorkflow"
            dummyUri="./W11AC0102.jsp">
        </button:submit>
        <button:submit
            uri="/action/ss11AC/W11AC02Action/RW11AC0205"
            label="差し戻し"
            icon="fa fa-repeat"
            size="10"
            cssClass="confirmWorkflow"
            dummyUri="./W11AC0101.jsp">
        </button:submit>
        <button:check
            uri="/action/ss11AC/W11AC02Action/RW11AC0204"
            label="判定実行"
            size="10"
            cssClass="confirmWorkflow"
            dummyUri="./W11AC0102.jsp">
        </button:check>
      </c:if>
      <c:if test="${upperLevelJudgingTask}">
        <button:submit
            uri="/action/ss11AC/W11AC02Action/RW11AC0208"
            label="却下"
            size="10"
            icon="fa fa-trash-o"
            cssClass="confirmWorkflow"
            dummyUri="./W11AC0102.jsp">
        </button:submit>
        <button:check
            uri="/action/ss11AC/W11AC02Action/RW11AC0207"
            label="上位判定実行"
            size="10"
            cssClass="confirmWorkflow"
            dummyUri="./W11AC0102.jsp">
        </button:check>
      </c:if>
      <c:if test="${executeTask}">
        <button:check
            uri="/action/ss11AC/W11AC02Action/RW11AC0209"
            label="ローン実行"
            size="10"
            cssClass="confirmWorkflow"
            dummyUri="./W11AC0102.jsp">
        </button:check>
      </c:if>
    </layout:row>
    </n:form>

  </jsp:attribute>
</t:page_template>
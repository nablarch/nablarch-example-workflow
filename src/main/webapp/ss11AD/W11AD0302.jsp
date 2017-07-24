<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <%/* --> <script src="js/devtool.js"></script><meta charset="utf-8"><body> <!-- */%> -->
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/widget/layout" %>
<%@taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@taglib prefix="tab" tagdir="/WEB-INF/tags/widget/tab" %>
<%@taglib prefix="event" tagdir="/WEB-INF/tags/widget/event" %>
<%@taglib prefix="column" tagdir="/WEB-INF/tags/widget/column" %>
<%@taglib prefix="table" tagdir="/WEB-INF/tags/widget/table" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- アクティブタスクによる表示制御 --%>
<c:if test="${confirmTask}"><%-- 確認待ち --%>
  <n:set var="nextButtonName" value="引戻し"/>
  <n:set var="nextUri" value="/action/ss11AD/W11AD02Action/RW11AD0209"/>
  <n:set var="nextButtonCss" value="confirmWorkflow"/>
</c:if>
<c:if test="${reapplicationTask}"><%-- 修正待ち --%>
  <n:set var="nextButtonName" value="修正"/>
  <n:set var="nextUri" value="/action/ss11AD/W11AD02Action/RW11AD0211"/>
  <n:set var="nextButtonCss" value=""/>
</c:if>

<t:page_template
    title="交通費申請詳細">

  <jsp:attribute name="contentHtml">
    <n:form windowScopePrefixes="W11AD03">
      <n:set var="titleSize" value="10"></n:set>
      <n:set var="inputSize" value="20"></n:set>
      <field:block title="申請情報">
        <layout:row>
          <field:label_code
              title="移動種類"
              name="detail.transDeviceCd"
              codeId="C1100001"
              titleSize="${titleSize}"
              inputSize="${inputSize}"
              sample="バス|[電車]|タクシー">
          </field:label_code>
        </layout:row>
        <layout:row>
          <field:label
              title="出発地"
              name="detail.departure"
              titleSize="${titleSize}"
              inputSize="${inputSize}"
              sample="茅場町駅">
          </field:label>
        </layout:row>
        <layout:row>
          <field:label
              title="目的地"
              name="detail.destination"
              titleSize="${titleSize}"
              inputSize="${inputSize}"
              sample="西新宿駅">
          </field:label>
        </layout:row>
        <layout:row>
          <field:label
            title="交通費"
            name="detail.transExpense"
            titleSize="${titleSize}"
            inputSize="${inputSize}"
            sample="200"
            valueFormat="decimal{#,###}">
          </field:label>
        </layout:row>
      </field:block>
      
      <field:block title="承認情報">
        <layout:row>
          <field:label
              title="確認者"
              name="detail.confirmUserKanjiName"
              titleSize="${titleSize}"
              inputSize="${inputSize}"
              sample="宮本">
          </field:label>
        </layout:row>
        <layout:row>
          <field:label
              title="承認者"
              name="detail.authorizeUserKanjiName"
              titleSize="${titleSize}"
              inputSize="${inputSize}"
              sample="佐藤">
          </field:label>
        </layout:row>
      </field:block>
      
      <!-- 承認履歴 -->
      <table:plain
        title = "承認履歴"
        resultSetName="historyList"
        sampleResults = "1">
        
        <column:label
          title = "日時"
          key="executionDateTime"
          sample = "2014/12/13 10:12:14"
          valueFormat="dateTime{yyyy/MM/dd HH:mm:ss}">
        </column:label>
        
        <column:code
          title = "処理内容"
          codeId="C1100004"
          optionColumnName="OPTION01"
          labelPattern="$OPTIONALNAME$"
          key="transExpeAppliActionCd"
          sample = "調査">
        </column:code>
        
        <column:label
          title = "担当者"
          key="executionerKanjiName"
          sample = "安里">
        </column:label>
        
        <column:code
          title = "処理結果"
          codeId="C1100005"
          key="transExpeAppliResultCd"
          sample = "却下">
        </column:code>
        
        <column:label
          title = "コメント"
          key="historyComment"
          sample = "記入されている住所が存在しません。正しい住所を確認後に、再度申請をお願いします。">
        </column:label>
        
      </table:plain>

      <event:listen event=".confirmWorkflow click">
        <event:confirm
          message="処理を進めます。よろしいでしょうか？">
        </event:confirm>
      </event:listen>

      <layout:row>
        <button:back
            uri="/action/ss11AD/W11AD03Action/RW11AD0302"
            size="10"
            dummyUri=""></button:back>
        <c:if test="${not empty nextUri}">
          <layout:cell gridSize="25"></layout:cell>
          <button:check
              uri="${nextUri}"
              label="${nextButtonName}"
              size="10"
              cssClass="${nextButtonCss}"
              dummyUri="">
              <n:param paramName="W11AD02.applicationId" name="detail.transExpeAppliId"/>
          </button:check>
        </c:if>
      </layout:row>
    </n:form>

  </jsp:attribute>
</t:page_template>
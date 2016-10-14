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
<t:page_template
    title="交通費再申請">

  <jsp:attribute name="contentHtml">
    <n:form windowScopePrefixes="W11AB01,W11AD02,W11AD03">
      <n:set var="titleSize" value="10"></n:set>
      <n:set var="inputSize" value="20"></n:set>
      <field:block title="申請情報">
        <layout:row>
          <field:code_pulldown
              title="移動種類"
              name="W11AD02.transDeviceCd"
              codeId="C1100001"
              required="true"
              titleSize="${titleSize}"
              inputSize="${inputSize}"
              domain="移動種類コード"
              sample="バス|[電車]|タクシー">
          </field:code_pulldown>
        </layout:row>
        <layout:row>
          <field:text
              title="出発地"
              name="W11AD02.departure"
              required="true"
              maxlength="30"
              titleSize="${titleSize}"
              inputSize="${inputSize}"
              domain="移動場所名"
              sample="茅場町駅">
          </field:text>
        </layout:row>
        <layout:row>
          <field:text
              title="目的地"
              name="W11AD02.destination"
              required="true"
              maxlength="30"
              titleSize="${titleSize}"
              inputSize="${inputSize}"
              domain="移動場所名"
              sample="西新宿駅">
          </field:text>
        </layout:row>
        <layout:row>
          <field:text
            title="交通費"
            name="W11AD02.transExpense"
            required="true"
            maxlength="8"
            titleSize="${titleSize}"
            inputSize="${inputSize}"
            domain="交通費"
            sample="200">
          </field:text>
        </layout:row>
      </field:block>
      
      <field:block title="承認情報">
        <layout:row>
          <field:pulldown
              title="確認者"
              name="W11AD02.confirmUserId"
              elementLabelProperty="kanjiName"
              elementValueProperty="userId"
              listName="confirmUserList"
              titleSize="${titleSize}"
              inputSize="${inputSize}"
              domain="ユーザID"
              sample="佐藤|[竹内]|宮本">
          </field:pulldown>
        </layout:row>
        <layout:row>
          <field:pulldown
              title="承認者"
              name="W11AD02.authorizeUserId"
              elementLabelProperty="kanjiName"
              elementValueProperty="userId"
              listName="authorizeUserList"
              titleSize="${titleSize}"
              inputSize="${inputSize}"
              domain="ユーザID"
              sample="[佐藤]|竹内|宮本">
          </field:pulldown>
        </layout:row>
      </field:block>

      <!-- ワークフロー用入力項目 -->
      <field:block title="コメント">
        <layout:row>
          <field:textarea
            title="コメント"
            name="W11AD02.historyComment"
            titleSize="${titleSize}"
            inputSize="${inputSize}"
            maxlength="100"
            sample="">
          </field:textarea>
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

      <n:hidden name="W11AD02.returnUri"/>
      <n:set var="returnUri" name="W11AD02.returnUri"/>
      <layout:row>
        <button:back
            uri="${returnUri}"
            size="10"
            dummyUri=""></button:back>
        <layout:cell gridSize="25"></layout:cell>
        <button:check
            uri="/action/ss11AD/W11AD02Action/RW11AD0208"
            label="再申請"
            size="10"
            cssClass="confirmWorkflow"
            dummyUri="">
        </button:check>
      </layout:row>
    </n:form>

  </jsp:attribute>
</t:page_template>
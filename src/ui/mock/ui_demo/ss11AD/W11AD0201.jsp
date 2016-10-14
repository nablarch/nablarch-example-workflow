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
<t:page_template
    title="交通費申請確認">

  <jsp:attribute name="contentHtml">
    <n:form windowScopePrefixes="user">
      <n:set var="titleSize" value="10"></n:set>
      <n:set var="inputSize" value="20"></n:set>
      <field:block title="申請情報">
        <layout:row>
          <field:label_code
              title="移動種類"
              name="transDeviceCd"
              codeId="C1100001"
              titleSize="${titleSize}"
              inputSize="${inputSize}"
              sample="バス|[電車]|タクシー">
          </field:label_code>
        </layout:row>
        <layout:row>
          <field:label
              title="出発地"
              name="departure"
              titleSize="${titleSize}"
              inputSize="${inputSize}"
              sample="茅場町駅">
          </field:label>
        </layout:row>
        <layout:row>
          <field:label
              title="目的地"
              name="destination"
              titleSize="${titleSize}"
              inputSize="${inputSize}"
              sample="西新宿駅">
          </field:label>
        </layout:row>
        <layout:row>
          <field:label
            title="交通費"
            name="transExpense"
            titleSize="${titleSize}"
            inputSize="${inputSize}"
            unit="円"
            sample="200">
          </field:label>
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
              titleSize="${titleSize}"
              inputSize="${inputSize}"
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
              titleSize="${titleSize}"
              inputSize="${inputSize}"
              sample="[佐藤]|竹内|宮本">
          </field:pulldown>
        </layout:row>
      </field:block>

      <!-- ワークフロー用入力項目 -->
      <field:block title="コメント">
        <layout:row>
          <field:textarea
            title="コメント"
            name="historyComment"
            titleSize="${titleSize}"
            inputSize="${inputSize}"
            maxlength="50"
            sample="">
          </field:textarea>
        </layout:row>
      </field:block>
      
      <!-- 承認履歴 -->
      <table:plain
        title = "承認履歴"
        sampleResults = "1">
        
        <column:label
          title = "日時"
          key=""
          sample = "2014/12/13 10:12:14"
          valueFormat="yyyy/MM/dd hh:MM:ss">
        </column:label>
        
        <column:label
          title = "処理内容"
          key=""
          sample = "調査">
        </column:label>
        
        <column:label
          title = "担当者"
          key=""
          sample = "安里">
        </column:label>
        
        <column:label
          title = "処理結果"
          key=""
          sample = "却下">
        </column:label>
        
        <column:label
          title = "コメント"
          key=""
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
            uri=""
            size="10"
            dummyUri="./メニュー画面_ページ.jsp"></button:back>
        <layout:cell gridSize="15"></layout:cell>
        <button:check
            uri=""
            label="却下"
            size="10"
            cssClass="confirmWorkflow"
            dummyUri="./W11AD0102.jsp"></button:check>
        <button:check
            uri=""
            label="承認"
            size="10"
            cssClass="confirmWorkflow"
            dummyUri="./W11AD0102.jsp"></button:check>
      </layout:row>
    </n:form>

  </jsp:attribute>
</t:page_template>
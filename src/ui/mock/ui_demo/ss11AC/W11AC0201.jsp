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
<t:page_template
    title="ローン申請登録"
    confirmationPageTitle="ローン申請登録確認">

  <jsp:attribute name="contentHtml">
    <n:form windowScopePrefixes="user">
      <n:set var="titleSize" value="10"></n:set>
      <n:set var="inputSize" value="25"></n:set>
      <field:block title="お客様情報">
        <layout:row>
          <field:label
              title="勤務先"
              name="company"
              titleSize="${titleSize}"
              inputSize="${inputSize}"
              sample="TIS株式会社">
          </field:label>
        </layout:row>
        <layout:row>
          <field:label
            title="年収"
            name="annualSalary"
            titleSize="${titleSize}"
            inputSize="${inputSize}"
            unit="百万"
            sample="1000">
          </field:label>
        </layout:row>
      </field:block>

      <field:block title="申し込み情報">
        <layout:row>
          <field:label
            title="希望する利用限度額"
            name="loanLimit"
            titleSize="${titleSize}"
            inputSize="${inputSize}"
            unit="万"
            sample="200">
          </field:label>
        </layout:row>
        <layout:row>
          <field:label
            title="希望する利用開始日"
            name="startDate"
            sample="2014/12/20">
          </field:label>
        </layout:row>
      </field:block>
      
      <!-- 調査用入力項目 -->
      <field:block title="調査結果">
        <layout:row>
          <field:textarea
            title="調査結果"
            name="surveyContent"
            required="true"
            titleSize="${titleSize}"
            inputSize="${inputSize}"
            maxlength="50"
            sample="OKでーす。">
          </field:textarea>
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
            sample="住所が存在しないらしいので却下します。">
          </field:textarea>
        </layout:row>
      </field:block>
      
      <!-- 承認履歴 -->
      <table:plain
        title = "承認履歴"
        sampleResults = "1">
        
        <column:label
          key=""
          title = "日時"
          sample = "2014/12/13 10:12:14"
          valueFormat="yyyy/MM/dd hh:MM:ss">
        </column:label>
        
        <column:label
          key=""
          title = "処理内容"
          sample = "調査">
        </column:label>
        
        <column:label
          key=""
          title = "担当者"
          sample = "安里">
        </column:label>
        
        <column:label
          key=""
          title = "処理結果"
          sample = "却下">
        </column:label>
        
        <column:label
          key=""
          title = "コメント"
          sample = "記入されている住所が存在しません。正しい住所を確認後に、再度申請をお願いします。">
        </column:label>
        
      </table:plain>
      
      <event:listen event=".confirmWorkflow click">
        <event:confirm
          message="処理を進めます。よろしいでしょうか？">
        </event:confirm>
      </event:listen>

      <!-- 申請画面用ボタン -->
      <layout:row>
        <n:forInputPage>
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
              dummyUri="./W11AC0102.jsp"></button:check>
          <button:check
              uri=""
              label="承認"
              size="10"
              cssClass="confirmWorkflow"
              dummyUri="./W11AC0102.jsp"></button:check>
        </n:forInputPage>
        <n:forConfirmationPage>
          <button:back
              uri=""
              size="10"
              dummyUri="./W11AC0101.jsp"></button:back>
          <layout:cell gridSize="25"></layout:cell>
          <button:confirm
              uri=""
              size="10"
              dummyUri="./W11AC0103.jsp"></button:confirm>
        </n:forConfirmationPage>
      </layout:row>
    </n:form>

  </jsp:attribute>
</t:page_template>
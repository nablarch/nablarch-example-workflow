<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <%/* --> <script src="js/devtool.js"></script><meta charset="utf-8"><body> <!-- */%> -->
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/widget/layout" %>
<%@taglib prefix="table" tagdir="/WEB-INF/tags/widget/table" %>
<%@taglib prefix="column" tagdir="/WEB-INF/tags/widget/column" %>
<%@taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<t:page_template
    title="交通費申請一覧">

  <jsp:attribute name="contentHtml">
    <!-- 条件 -->
    <n:form windowScopePrefixes="W11AD03">
      <field:block title="検索条件">
        <layout:row>
          <field:code_pulldown
              title="承認状況"
              name="W11AD03.statusCd"
              codeId="C1100002"
              titleSize="10"
              inputSize="20"
              withNoneOption="true"
              sample="確認待ち|再申請待ち（確認取消）|再申請待ち（差戻し）|[完了]|却下">
          </field:code_pulldown>
        </layout:row>
        <layout:row>
          <field:code_pulldown
              title="移動種類"
              name="W11AD03.deviceCd"
              codeId="C1100001"
              titleSize="10"
              inputSize="20"
              withNoneOption="true"
              sample="[バス]|電車|タクシー">
          </field:code_pulldown>
        </layout:row>
        <layout:row>
          <layout:cell gridSize="35"></layout:cell>
          <button:search
              label="検索"
              uri="/action/ss11AD/W11AD03Action/RW11AD0302"
              size="10">
              <n:param paramName="W11AD03.pageNumber" value="1"/>
              </button:search>
        </layout:row>
      </field:block>
    </n:form>
    
    <!-- 結果 -->
    <n:form windowScopePrefixes="W11AD03">
      <table:search_result
        title = "検索結果"
        searchUri = "/action/ss11AD/W11AD03Action/RW11AD0302"
        listSearchInfoName="W11AD03"
        resultSetName="applicationList"
        sampleResults = "3">
        
        <column:link
          title = "申請ID"
          key = "applicationId"
          uri = "/action/ss11AD/W11AD03Action/RW11AD0303"
          sample = "電車|タクシー|バス">
          <n:param paramName="W11AD03.applicationId" name="row.applicationId"/>
        </column:link>
        
        <column:code
          title = "移動種類"
          key="transDeviceCd"
          codeId="C1100001"
          sample = "電車|タクシー|バス">
        </column:code>
        
        <column:label
          key="departure"
          title = "出発地"
          sample = "茅場町|西新宿|第三センター">
        </column:label>
        
        <column:label
          key="destination"
          title = "到着地"
          sample = "西新宿|浦安|西新宿">
        </column:label>
        
        <column:label
          key="insertDateTime"
          title = "申請日"
          sample = "2013/12/13|2014/01/13|2014/02/13"
          valueFormat="dateTime{yyyy/MM/dd HH:mm:ss}">
        </column:label>
        
        <column:code
          key="transExpeAppliStatusCd"
          title = "承認状況"
          codeId="C1100002"
          labelPattern="$OPTIONALNAME$"
          optionColumnName="OPTION02"
          sample = "承認待ち|修正待ち（差戻し）|完了">
        </column:code>
        
      </table:search_result>
    </n:form>
  </jsp:attribute>
</t:page_template>
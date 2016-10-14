<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <%/* --> <script src="js/devtool.js"></script><meta charset="utf-8"><body> <!-- */%> -->
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/widget/layout" %>
<%@taglib prefix="column" tagdir="/WEB-INF/tags/widget/column" %>
<%@taglib prefix="table" tagdir="/WEB-INF/tags/widget/table" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<t:page_template
    title="承認一覧">

  <jsp:attribute name="contentHtml">
    <!-- 条件 -->
    <n:form windowScopePrefixes="user">
      <field:block title="検索条件">
        <layout:row>
          <field:code_pulldown
              title="業務種類"
              name="user.businessType"
              codeId=""
              titleSize="10"
              inputSize="20"
              sample="[ローン申請]|交通費申請">
          </field:code_pulldown>
        </layout:row>
        <layout:row>
          <field:pulldown
              title="申請者"
              name="user.applicant"
              elementValueProperty=""
              elementLabelProperty=""
              listName="applicantList"
              titleSize="10"
              inputSize="20"
              sample="[安里]|田呂丸|佐藤">
          </field:pulldown>
        </layout:row>
        <layout:row>
          <layout:cell gridSize="35"></layout:cell>
          <button:search
              label="検索"
              uri="/action/ss11AA/W11AB01Action/RW11AB0102"
              size="10">
          </button:search>
        </layout:row>
      </field:block>
    </n:form>
    
    <!-- 結果 -->
    <n:form windowScopePrefixes="user">
      <table:search_result
        title = "検索結果"
        listSearchInfoName=""
        sampleResults = "3">
        
        <column:link
          title = "業務種類"
          value=""
          uri=""
          sample=" | | ">
          <!--
          <n:code
            name="row.workfrowId"
            codeId="w11">
          </n:code>
          -->
          test
        </column:link>
        
        <column:label
          title = "申請日"
          key = ""
          valueFormat="yyyy/MM/dd"
          sample = "2013/12/13|2014/01/13|2014/02/13">
        </column:label>
        
        <column:label
          title = "申請者"
          key=""
          sample = "安里|田呂丸|田中">
        </column:label>
        
        <column:code
          key=""
          codeId=""
          title = "承認状況"
          sample = "調査待ち|再申請待ち|上位判定待ち">
        </column:code>
        
      </table:search_result>
    </n:form>
  </jsp:attribute>
</t:page_template>
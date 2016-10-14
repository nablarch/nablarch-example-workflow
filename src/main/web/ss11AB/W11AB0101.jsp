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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:page_template
    title="承認一覧">

  <jsp:attribute name="contentHtml">
    <!-- 条件 -->
    <n:form windowScopePrefixes="W11AB01">
      <field:block title="検索条件">
        <layout:row>
          <field:code_pulldown
              title="業務種類"
              name="W11AB01.businessType"
              codeId="C1100008"
              titleSize="10"
              inputSize="20"
              withNoneOption="true"
              sample="[ローン申請]|交通費申請">
          </field:code_pulldown>
        </layout:row>
        <layout:row>
          <field:pulldown
              title="申請者"
              name="W11AB01.applicationUserId"
              elementValueProperty="userId"
              elementLabelProperty="kanjiName"
              listName="applicationUserList"
              titleSize="10"
              inputSize="20"
              withNoneOption="true"
              sample="[安里]|田呂丸|佐藤">
          </field:pulldown>
        </layout:row>
        <layout:row>
          <layout:cell gridSize="35"></layout:cell>
          <button:search
              label="検索"
              uri="/action/ss11AB/W11AB01Action/RW11AB0102"
              size="10">
            <n:param paramName="W11AB01.pageNumber" value="1" />
          </button:search>
        </layout:row>
      </field:block>
    </n:form>
    
    <!-- 結果 -->
    <n:form windowScopePrefixes="W11AB01">
      <table:search_result
          title="検索結果"
          searchUri = "/action/ss11AB/W11AB01Action/RW11AB0102"
          listSearchInfoName="W11AB01"
          resultSetName="applicationList"
          sampleResults="3">

        <%-- 承認状況のコードIDと遷移先URLの設定 --%>
        <n:set var="businessTypeValue" name="row.businessType" />
        <n:set var="statusCd" name="row.statusCd" />
        <c:if test="${businessTypeValue eq 1}"><%-- ローン申請 --%>
          <n:set var="statusCdId" value="C1100003" />
          <n:set var="nextUri" value="/action/ss11AC/W11AC02Action/RW11AC0201" />
        </c:if>
        <c:if test="${businessTypeValue eq 2}"><%-- 交通費申請 --%>
          <n:set var="statusCdId" value="C1100002" />
          <n:set var="nextUri" value="/action/ss11AD/W11AD02Action/RW11AD0201" />
        </c:if>

        <column:link
            title="申請ID"
            key="applicationId"
            uri="${nextUri}"
            sample=" | | ">
          <c:if test="${businessTypeValue eq 1}"><%-- ローン申請 --%>
            <n:param paramName="W11AC02.loanAppliId" name="row.applicationId" />
          </c:if>
          <c:if test="${businessTypeValue eq 2}"><%-- 交通費申請 --%>
            <n:param paramName="W11AD02.applicationId" name="row.applicationId" />
          </c:if>
        </column:link>

        <column:code
            codeId="C1100008"
            title="業務種類"
            key="businessType"
            sample=" | | ">
        </column:code>

        <column:label
            title="申請日"
            key="applicationDate"
            valueFormat="dateTime{yyyy/MM/dd}"
            sample="2013/12/13|2014/01/13|2014/02/13">
        </column:label>

        <column:label
            title="申請者"
            key="applicationUserName"
            sample="安里|田呂丸|田中">
        </column:label>

        <column:code
            key="statusCd"
            codeId="${statusCdId}"
            title="承認状況"
            sample="調査待ち|再申請待ち|上位判定待ち">
        </column:code>

      </table:search_result>
    </n:form>
  </jsp:attribute>
</t:page_template>
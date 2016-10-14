<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <%/* --> <script src="js/devtool.js"></script><meta charset="utf-8"><body> <!-- */%> -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ taglib prefix="field"  tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="table"  tagdir="/WEB-INF/tags/widget/table" %>
<%@ taglib prefix="column" tagdir="/WEB-INF/tags/widget/column" %>
<%@ taglib prefix="spec" tagdir="/WEB-INF/tags/widget/spec" %>
<%@ taglib prefix="event" tagdir="/WEB-INF/tags/widget/event" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<t:page_template title="ソート条件">

  <jsp:attribute name="contentHtml">
    <n:form>
    <spec:layout name="ソート条件属性なし">
    <table:search_result
      title="ソート条件属性なし"
      sampleResults="4"
      resultSetName="論理名"
      listSearchInfoName="">
      <column:label
        title="ラベル"
        key="label1"
        sample="ラベル|data"
        sortable="true">
      </column:label>
      <column:checkbox
        name=""
        title="選択"
        key="checkbox1">
      </column:checkbox>
      <column:radio
          name=""
          title="選択２"
          key="radio1">
      </column:radio>
    </table:search_result>
    </spec:layout>

    <spec:layout name="ソート条件属性ブランク">
    <table:search_result
      title="ソート条件属性ブランク"
      sampleResults="4"
      resultSetName="論理名"
      sortCondition=""
      listSearchInfoName="">
      <column:label
        title="ラベル"
        key="label1"
        sample="ラベル|data"
        sortable="true">
      </column:label>
      <column:checkbox
        name=""
        title="選択"
        key="checkbox1">
      </column:checkbox>
      <column:radio
          name=""
          title="選択２"
          key="radio1">
      </column:radio>
    </table:search_result>
    </spec:layout>

    <spec:layout name="ソート条件属性指定有">
    <table:search_result
      title="ソート条件属性指定あり"
      sampleResults="4"
      resultSetName="論理名"
      sortCondition="初回検索 "
      listSearchInfoName="">
      <column:label
        title="ラベル"
        key=""
        sample="|"
        sortable="true">
      </column:label>
      <column:label
        title="ラベル"
        key="key"
        sample="data1|data2"
        sortable="true">
      </column:label>
      <column:checkbox
        name=""
        title="選択"
        key="checkbox1">
      </column:checkbox>
      <column:radio
          name=""
          title="選択２"
          key="radio1">
      </column:radio>
    </table:search_result>
    </spec:layout>
    </n:form>
  </jsp:attribute>
</t:page_template>

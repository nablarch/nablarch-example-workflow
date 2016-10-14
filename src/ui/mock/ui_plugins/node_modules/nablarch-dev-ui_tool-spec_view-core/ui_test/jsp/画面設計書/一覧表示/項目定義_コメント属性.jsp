<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <%/* --> <script src="js/devtool.js"></script><meta charset="utf-8"><body> <!-- */%> -->
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ taglib prefix="field"  tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="table"  tagdir="/WEB-INF/tags/widget/table" %>
<%@ taglib prefix="column" tagdir="/WEB-INF/tags/widget/column" %>
<%@ taglib prefix="spec" tagdir="/WEB-INF/tags/widget/spec" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<t:page_template title="コメント属性">

  <jsp:attribute name="contentHtml">
    <n:form>
    <spec:layout name="コメント属性なし">
    <table:search_result
      sampleResults="4"
      resultSetName="論理名"
      title="コメント属性なし"
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
    </table:search_result>
    </spec:layout>

    <spec:layout name="コメント属性ブランク">
    <table:search_result
      title="コメント属性ブランク"
      comment=""
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

    <spec:layout name="コメント属性指定有">
    <table:search_result
      title="コメント属性指定あり"
      comment="コメント属性を指定"
      sampleResults="4"
      resultSetName="論理名"
      listSearchInfoName="">
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

    <spec:layout name="コメント属性&ページングなし">
    <table:search_result
      title="コメント属性指定あり&ページングなし"
      sampleResults="4"
      resultSetName="論理名"
      comment="コメント属性を指定"
      usePaging="false"
      listSearchInfoName="">
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
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <%/* --> <script src="js/devtool.js"></script><meta charset="utf-8"><body> <!-- */%> -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="table" tagdir="/WEB-INF/tags/widget/table" %>
<%@ taglib prefix="column" tagdir="/WEB-INF/tags/widget/column" %>
<%@ taglib prefix="spec" tagdir="/WEB-INF/tags/widget/spec" %>
<%@ taglib prefix="event" tagdir="/WEB-INF/tags/widget/event" %>

<t:page_template title="ページング属性">

  <jsp:attribute name="contentHtml">
    <n:form>
      <spec:layout name="ページング属性指定なし">
        <table:search_result
            title="ページング属性指定なしの場合設計書には「ページングあり」"
            id="usePaging_none"
            sampleResults="4"
            listSearchInfoName=""
            resultSetName="論理名">
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
      <spec:layout name="ページング属性ブランク">
        <table:search_result
            title="ページング属性ブランクの場合設計書には「ページングあり」"
            id="usePaging_blank"
            sampleResults="4"
            usePaging=""
            listSearchInfoName=""
            resultSetName="論理名">
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
      <spec:layout name="ページング属性true">
        <table:search_result
            title="ページング属性がtrueの場合設計書には「ページングあり」"
            id="usePaging_true"
            sampleResults="4"
            usePaging="true"
            listSearchInfoName=""
            resultSetName="論理名">
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
      <spec:layout name="ページング属性false">
        <table:search_result
            title="ページング属性がfalseの場合設計書には「ページングなし」"
            id="usePaging_false"
            sampleResults="4"
            usePaging="false"
            listSearchInfoName=""
            resultSetName="論理名">
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
      <spec:layout name="一覧表示ウィジェット">
        <table:plain
            title="一覧表示ウィジェットの場合には「ページングなし」"
            id="usePaging_false"
            sampleResults="4"
            resultSetName="論理名">
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
        </table:plain>
      </spec:layout>
    </n:form>
  </jsp:attribute>
</t:page_template>

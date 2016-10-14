<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/widget/layout" %>
<%@ taglib prefix="table" tagdir="/WEB-INF/tags/widget/table" %>
<%@ taglib prefix="column" tagdir="/WEB-INF/tags/widget/column" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<n:form windowScopePrefixes="search">

  <field:block title="検索条件">
    <layout:row>
      <field:text
          title="漢字氏名"
          name="search.kanjiName"
          titleSize="7"
          inputSize="9">
      </field:text>

      <field:text
          title="カナ氏名"
          name="search.kanaName"
          titleSize="10"
          inputSize="9">
      </field:text>

      <field:pulldown
          title="性別"
          name="search.sex"
          listName="sexList"
          elementLabelProperty="name"
          elementValueProperty="cd"
          withNoneOption="true"
          titleSize="5"
          inputSize="5"
          >
      </field:pulldown>
    </layout:row>

    <layout:row>
      <field:calendar
          title="生年月日"
          name="search.birthday"
          titleSize="7"
          inputSize="9">
      </field:calendar>

      <field:text
          title="メールアドレス"
          name="search.mail"
          titleSize="10"
          inputSize="19">
      </field:text>
    </layout:row>

    <layout:row>
      <field:text
          title="住所"
          name="search.address"
          titleSize="7"
          inputSize="30">
      </field:text>
      <layout:cell gridSize="1" />
      <button:search
          uri="./検索画面.jsp"
          size="7">
      </button:search>
    </layout:row>
  </field:block>

  <table:plain
      title="検索結果"
      resultSetName="searchResult"
      sampleResults="2">
    <column:label key="kanjiName" title="漢字名" sample="漢字1|漢字2"/>
    <column:label key="kanaName" title="カナ名" sample="カナ1|カナ2"/>
    <column:label key="birthday" title="生年月日" sample="2014年05月31日|2014年06月01日"/>
  </table:plain>
</n:form>


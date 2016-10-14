<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <%/* --> <script src="js/devtool.js"></script><meta charset="utf-8"><body> <!-- */%> -->
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ taglib prefix="field"  tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button"  tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="column" tagdir="/WEB-INF/tags/widget/column" %>
<%@ taglib prefix="table" tagdir="/WEB-INF/tags/widget/table" %>
<%@ taglib prefix="spec" tagdir="/WEB-INF/tags/widget/spec" %>
<%@ taglib prefix="event" tagdir="/WEB-INF/tags/widget/event" %>
<%@ taglib prefix="link" tagdir="/WEB-INF/tags/widget/link" %>
<%@ taglib prefix="box" tagdir="/WEB-INF/tags/widget/box" %>
<%@ taglib prefix="tab" tagdir="/WEB-INF/tags/widget/tab" %>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<t:page_template title="情報取得元（コード）">
<spec:author>作成者</spec:author>
  <jsp:attribute name="contentHtml">
    <n:form>
    <spec:layout name="コードカラム">
      <table:plain title="カラムコード" sampleResults="2" resultSetName="name" >
        <column:code title="ブランク" codeId="" key="code_label" sample="AAA|AAAA"></column:code>
        <column:code title="指定有" codeId="C0000001" key="code_label" sample="AAA|AAAA"></column:code>
        <column:code title="指定間違い" codeId="_0000001" key="code_label" sample="AAA|AAAA"></column:code>
        <column:code title="dataFrom指定" codeId="C0000001" key="code_label" sample="AAA|AAAA" dataFrom="USERS.KANJI_NAME"></column:code>
      </table:plain>
    </spec:layout>
    <spec:layout name="コードチェックボックス">
      <field:block title="コードチェックボックス" collapsible="true" value="field_code_checkbox" collapsed="true" name="code_checkbox">
        <field:code_checkbox title="ブランク" name="code_checkbox" codeId=""></field:code_checkbox>
        <field:code_checkbox title="指定有" name="code_checkbox" codeId="C0000001"></field:code_checkbox>
        <field:code_checkbox title="不正" name="code_checkbox" codeId="_0000001"></field:code_checkbox>
      </field:block>
    </spec:layout>
    <spec:layout name="コードラジオ">
      <field:block title="コードラジオ" collapsible="true" value="field_code_radio" collapsed="true" name="code_radio">
        <field:code_radio title="ブランク" name="code_radio" codeId=""></field:code_radio>
        <field:code_radio title="指定有" name="code_radio" codeId="C0000001"></field:code_radio>
        <field:code_radio title="不正" name="code_radio" codeId="_0000001"></field:code_radio>
      </field:block>
    </spec:layout>
    <spec:layout name="コードプルダウン(コードIDの指定は必須なので割愛。)">
      <field:block title="コードプルダウン" collapsible="true" value="field_code_pulldown" collapsed="true" name="code_pulldown">
        <field:code_pulldown title="ブランク" name="code_pulldown" codeId=""></field:code_pulldown>
        <field:code_pulldown title="指定有" name="code_pulldown" codeId="C0000001"></field:code_pulldown>
        <field:code_pulldown title="不正" name="code_pulldown" codeId="_0000001"></field:code_pulldown>
      </field:block>
    </spec:layout>
    <spec:layout name="コードラベル(コードIDの指定は必須なので割愛。)">
      <field:block title="コードラベル" collapsible="true" value="field_code_label" collapsed="true" name="code_label">
        <field:label_code title="ブランク" name="label_code" codeId=""></field:label_code>
        <field:label_code title="指定有" name="label_code" codeId="C0000001"></field:label_code>
        <field:label_code title="不正" name="label_code" codeId="_0000001"></field:label_code>
      </field:block>
    </spec:layout>
    </n:form>
  </jsp:attribute>
</t:page_template>

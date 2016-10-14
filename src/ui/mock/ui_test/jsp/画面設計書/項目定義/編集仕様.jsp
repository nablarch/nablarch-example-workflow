<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <%/* --> <script src="js/devtool.js"></script><meta charset="utf-8"><body> <!-- */%> -->
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="column" tagdir="/WEB-INF/tags/widget/column" %>
<%@ taglib prefix="table" tagdir="/WEB-INF/tags/widget/table" %>
<%@ taglib prefix="spec" tagdir="/WEB-INF/tags/widget/spec" %>
<%@ taglib prefix="event" tagdir="/WEB-INF/tags/widget/event" %>
<%@ taglib prefix="link" tagdir="/WEB-INF/tags/widget/link" %>
<%@ taglib prefix="box" tagdir="/WEB-INF/tags/widget/box" %>
<%@ taglib prefix="tab" tagdir="/WEB-INF/tags/widget/tab" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<t:page_template title="編集仕様">
  <spec:author>作成者</spec:author>

  <jsp:attribute name="contentHtml">
    <n:form>
      <spec:layout name="テキスト入力項目の編集仕様のテスト（fomatSpec属性）">
        <field:block title="単行テキスト入力（field:text）" collapsible="true" value="field_text" collapsed="true" name="field_text">
          <field:text name="field_text_format_none" title="フォーマット指定なし"></field:text>
          <field:text name="field_text_format_blank" title="フォーマット指定ブランク" formatSpec=""></field:text>
          <field:text name="field_text_format" title="フォーマット指定あり" formatSpec="カラム名1[半角スペース]カラム名2"></field:text>
        </field:block>
      </spec:layout>
      <spec:layout name="ラベル表示の編集仕様のテスト（formatSpec属性）">
        <field:block title="ラベル表示（field:label）" collapsible="true" value="field_label" collapsed="true" name="field_label">
          <field:label name="field_label_format_none" title="フォーマット指定なし"></field:label>
          <field:label name="field_label_format_blank" title="フォーマット指定ブランク" formatSpec=""></field:label>
          <field:label name="field_label_format" title="フォーマット指定あり" formatSpec="カラム名1[半角スペース]カラム名2"></field:label>
        </field:block>
      </spec:layout>
      <spec:layout name="ラベル表示列の編集仕様のテスト（formatSpec属性）">
        <table:plain title="ラベル表示列（column:label）" resultSetName="resultset" sampleResults="2">
          <column:label title="フォーマット指定なし" key=""></column:label>
          <column:label title="フォーマット指定ブランク" formatSpec="" key=""></column:label>
          <column:label title="フォーマット指定あり" formatSpec="カラム名1[半角スペース]カラム名2" key=""></column:label>
        </table:plain>
      </spec:layout>
      <spec:layout name="カレンダーの編集仕様のテスト（format属性）">
        <field:block title="カレンダー" collapsible="true" value="field_calendar" collapsed="true" name="calendar">
          <field:calendar name="calendar_format_none" title="フォーマット指定なし" ></field:calendar>
          <field:calendar name="calendar_format_blank" title="フォーマット指定ブランク"></field:calendar>
          <field:calendar name="calendar_format" title="フォーマット指定あり" format="yyyy年MM月dd日"></field:calendar>
        </field:block>
      </spec:layout>
    </n:form>
  </jsp:attribute>
</t:page_template>

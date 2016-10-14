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

<t:page_template title="情報取得元(外部インターフェース)">
<spec:author>作成者</spec:author>
  <jsp:attribute name="contentHtml">
    <n:form>
    <spec:layout name="単行テキスト">
      <field:block title="単行テキストを代表して利用する" collapsible="true" value="field_text" name="text">
        <field:text name="text" title="正常系" dataFrom="N21AA001.User.userId"></field:text>
        <field:text name="text" title="電文IDのみ指定" dataFrom="N21AA001"></field:text>
        <field:text name="text" title="項目名が足りない" dataFrom="N21AA001.User"></field:text>
        <field:text name="text" title="外部I/Fを複数指定" dataFrom="N21AA001.User.userId|N21AA001.User.userKbn"></field:text>
        <field:text name="text" title="テーブル定義と外部I/Fを複数指定" dataFrom="USERS.KANJI_NAME|N21AA001.User.userId"></field:text>
      </field:block>
    </spec:layout>
    </n:form>
  </jsp:attribute>
</t:page_template>

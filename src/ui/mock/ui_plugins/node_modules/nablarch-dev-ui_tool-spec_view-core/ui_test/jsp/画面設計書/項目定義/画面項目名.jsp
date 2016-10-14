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

<t:page_template title="画面項目名">
<spec:author>作成者</spec:author>
  <jsp:attribute name="contentHtml">
    <n:form>
      <button:block>
        <button:back uri="" dummyUri="./画面項目名.jsp" comment="A画面に遷移"></button:back>
        <button:cancel uri="" dummyUri="./画面項目名.jsp" comment="C画面に遷移"></button:cancel>
        <button:check uri="" dummyUri="./画面項目名.jsp" comment="D画面に遷移"></button:check>
        <button:confirm uri="" dummyUri="./画面項目名.jsp" comment="E画面に遷移"></button:confirm>
        <button:delete uri="" dummyUri="./画面項目名.jsp" comment="F画面に遷移"></button:delete>
        <button:download uri="" dummyUri="./画面項目名.jsp" comment="G画面に遷移" label="PDFで参照"></button:download>
        <button:popup uri="" dummyUri="./画面項目名.jsp" comment="H画面に遷移" label="参照"></button:popup>
        <button:search uri="" dummyUri="./画面項目名.jsp" comment="I画面に遷移"></button:search>
        <button:submit uri="" dummyUri="./画面項目名.jsp" comment="J画面に遷移" label="送信"></button:submit>
        <button:update uri="" dummyUri="./画面項目名.jsp" comment="K画面に遷移"></button:update>
        <button:close disabled="true" comment="閉じてしまうので非活性。"></button:close>
      </button:block>
    <spec:layout name="テーブル名">
      <table:plain title="カラム項目の確認" sampleResults="2" resultSetName="name">
        <column:checkbox name="" title="選択" key="checkbox" ></column:checkbox>
        <column:checkbox name="" title="一括" key="batch" toggle="true"></column:checkbox>
      </table:plain>
      <table:search_result title="カラム項目の確認(ページング)" sampleResults="2" resultSetName="result" listSearchInfoName="">
        <column:label title="ラベル" value="項目" key=""></column:label>
      </table:search_result>
      <table:treelist title="カラム項目の確認(ツリー)" sampleResults="3" resultSetName="tree" hierarchy="chars:1|2" key="" name="">
        <column:code title="コード" codeId="C0000001" key="no_use" sample="AAA|AAAA"></column:code>
        <column:link title="カラム" dummyUri="./画面項目名.jsp" value="値" comment="テーブルに埋め込まれたリンク" uri="#"></column:link>
      </table:treelist>
    </spec:layout>
    <spec:layout name="レイアウト：フィールド">
      <field:block title="ブロック：フィールドの項目名" collapsible="true" value="forCollapsible" collapsed="true">
        <field:text name="text" title="テキスト" hint="hint"></field:text>
        <field:calendar name="calendar" title="カレンダー"></field:calendar>
        <field:checkbox name="checkbox" title="チェックボックス"
                        elementLabelProperty="" elementValueProperty="" listName=""></field:checkbox>
        <field:code_checkbox name="code_checkbox" title="コードチェックボックス" codeId="C0000001"></field:code_checkbox>
        <field:code_pulldown name="code_pulldown" title="コードプルダウン" codeId="C0000001"></field:code_pulldown>
        <field:code_radio name="code_radio" title="コードラジオ" codeId="C0000001"></field:code_radio>
        <field:file name="name" title="ファイル"></field:file>
        <field:hint>ヒント</field:hint>
        <field:label name="label" title="ラベル" sample="ラベル"></field:label>
        <field:label_block title="ラベルブロック">this is label block</field:label_block>
        <field:label_code title="ラベルコード" name="label_code" codeId="C0000001"></field:label_code>
        <field:label_id_value idName="" valueName="" title="IDラベル" sample="VALUE"></field:label_id_value>
        <field:listbuilder name="" id="" title="リストビルダー" sample="日本|中国|シンガポール|複数項目"
                           elementLabelProperty="" elementValueProperty=""  listName=""></field:listbuilder>
        <field:password name="" title="パスワード"></field:password>
        <field:pulldown title="プルダウン" name="" sample="日本|中国|シンガポール|複数項目" multiple="true"
                        elementLabelProperty="" elementValueProperty="" listName=""></field:pulldown>
        <field:radio name="" title="ラジオ"  elementLabelProperty="" elementValueProperty="" listName=""></field:radio>
        <field:text name="" title="テキスト"></field:text>
        <field:textarea name="" title="テキストエリア"></field:textarea>
      </field:block>
    </spec:layout>
    <field:block title="ブロック：リンク">
      <box:content>
        <link:submit label="詳しくはこちら" dummyUri="./画面項目.jsp" uri="#"></link:submit>
      </box:content>
    </field:block>
    <spec:layout name="タブ">
    <tab:group name="タブ">
      <spec:layout name="タブコンテンツ1">
      <tab:content value="" title="コンテンツ1">
      </tab:content>
      </spec:layout>
      <spec:layout name="タブコンテンツ2">
      <tab:content value="" title="コンテンツ2">
      </tab:content>
      </spec:layout>
    </tab:group>
    </spec:layout>
    </n:form>
  </jsp:attribute>
</t:page_template>

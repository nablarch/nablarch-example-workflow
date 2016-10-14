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

<t:page_template title="情報取得元">
<spec:author>作成者</spec:author>
  <jsp:attribute name="contentHtml">
    <n:form>
    <spec:layout name="チェックボックスカラム">
      <table:plain title="カラムチェックボックス" sampleResults="2" resultSetName="name" >
        <column:checkbox name="" key="checkbox" title="属性なし" ></column:checkbox>
        <column:checkbox name="" key="checkbox" title="ブランク" dataFrom=""></column:checkbox>
        <column:checkbox name="" key="checkbox" title="正常系" dataFrom="USERS.KANJI_NAME"></column:checkbox>
        <column:checkbox name="" key="checkbox" title="論理名をべた書き" dataFrom="ユーザ管理テーブル(User)"></column:checkbox>
        <column:checkbox name="" key="checkbox" title="取得元のみ記載" dataFrom="USERS"></column:checkbox>
        <column:checkbox name="" key="checkbox" title="表示項目名が不正" dataFrom="USERS.kanjiName"></column:checkbox>
        <column:checkbox name="" key="checkbox" title="取得元が不正" dataFrom="User.KANJI_NAME"></column:checkbox>
        <column:checkbox name="" key="checkbox" title="他システムのAPI" dataFrom="N21AA001.User.recordKbn"></column:checkbox>
      </table:plain>
    </spec:layout>
    <spec:layout name="ラジオボタンカラム">
      <table:plain title="カラムラジオボタン" sampleResults="2" resultSetName="name" >
        <column:radio name="" key="radio" title="属性なし" ></column:radio>
        <column:radio name="" key="radio" title="ブランク" dataFrom=""></column:radio>
        <column:radio name="" key="radio" title="正常系" dataFrom="USERS.KANJI_NAME"></column:radio>
        <column:radio name="" key="radio" title="論理名をべた書き" dataFrom="ユーザ管理テーブル(User)"></column:radio>
        <column:radio name="" key="radio" title="取得元のみ記載" dataFrom="USERS"></column:radio>
        <column:radio name="" key="radio" title="表示項目名が不正" dataFrom="USERS.kanjiName"></column:radio>
        <column:radio name="" key="radio" title="取得元が不正" dataFrom="User.KANJI_NAME"></column:radio>
        <column:radio name="" key="radio" title="他システムのAPI" dataFrom="N21AA001.User.recordKbn"></column:radio>
      </table:plain>
    </spec:layout>
    <spec:layout name="ラベルカラム">
      <table:plain title="カラムラベル" sampleResults="2" resultSetName="name">
        <column:label title="属性なし" value="属性なし" key=""></column:label>
        <column:label value="ブランク" title="ブランク" dataFrom="" key=""></column:label>
        <column:label value="正常系" title="正常系" dataFrom="USERS.KANJI_NAME" key=""></column:label>
        <column:label value="論理名" title="論理名をべた書き" dataFrom="ユーザ管理テーブル(User)" key=""></column:label>
        <column:label value="取得元のみ" title="取得元のみ記載" dataFrom="USERS" key=""></column:label>
        <column:label value="TABLE" title="表示項目名が不正" dataFrom="User.KANJI_NAME" key=""></column:label>
        <column:label value="COLUMN" title="取得元が不正" dataFrom="USER.kanjiName" key=""></column:label>
        <column:label value="他システムのAPI" title="他システムのAPI" dataFrom="N21AA001.Header.fileId" key=""></column:label>
      </table:plain>
    </spec:layout>
    <spec:layout name="リンクカラム">
      <table:plain title="リンクカラム" sampleResults="2" resultSetName="name" >
        <column:link uri="" title="未指定" value="未指定"></column:link>
        <column:link uri="" title="ブランク" value="ブランク" dataFrom=""></column:link>
        <column:link uri="" title="正常系" value="正常系" dataFrom="USERS.KANJI_NAME"></column:link>
        <column:link uri="" value="論理名" title="論理名をべた書き" dataFrom="ユーザ管理テーブル(User)"></column:link>
        <column:link uri="" title="取得元のみ" value="取得元のみ" dataFrom="USERS"></column:link>
        <column:link uri="" title="取得元が不正" value="取得元が不正" dataFrom="USER.kanjiName"></column:link>
        <column:link uri="" title="表示項目名が不正" value="表示項目名が不正" dataFrom="User.KANJINAME"></column:link>
        <column:link uri="" title="他システムのAPI" value="他システムのAPI" dataFrom="N21AA001.Header.fileId"></column:link>
      </table:plain>
    </spec:layout>
    <spec:layout name="コンテンツカラム">
      <table:plain title="コンテンツカラム" sampleResults="2" resultSetName="name" showTitle="false" comment="仕様がわからない">
      </table:plain>
    </spec:layout>
    <spec:layout name="複数の情報項目の指定">
      <table:plain title="複数の表示項目名" sampleResults="2" resultSetName="name">
        <column:checkbox dataFrom="USERS.KANJI_NAME|USERS.KANA_NAME" title="チェックボックス" key="" name="check" ></column:checkbox>
        <column:label    dataFrom="USERS.KANJI_NAME|USERS.KANA_NAME" title="ラベル" value="ラベル" key="" ></column:label>
        <column:link     dataFrom="USERS.KANJI_NAME|USERS.KANA_NAME" title="リンク"  value="リンク" uri=""></column:link>
      </table:plain>
      <table:plain title="複数の取得元" sampleResults="2" resultSetName="name">
        <column:checkbox dataFrom="USERS.KANJI_NAME|SYSTEM_ACCOUNT.LOGIN_ID" title="チェックボックス" key="" name="check" ></column:checkbox>
        <column:label    dataFrom="USERS.KANJI_NAME|SYSTEM_ACCOUNT.LOGIN_ID" title="ラベル" value="ラベル" key=""></column:label>
        <column:link     dataFrom="USERS.KANJI_NAME|SYSTEM_ACCOUNT.LOGIN_ID" title="リンク"  value="リンク" uri="" ></column:link>
      </table:plain>
    </spec:layout>

    <spec:layout name="単行テキスト">
      <field:block title="単行テキスト" collapsible="true" value="field_text" collapsed="true" name="text">
        <field:text name="text" title="属性なし" ></field:text>
        <field:text name="text" title="ブランク" dataFrom=""></field:text>
        <field:text name="text" title="正常系" dataFrom="USERS.KANJI_NAME"></field:text>
        <field:text name="text" title="複数指定" dataFrom="USERS.KANJI_NAME|USERS.KANA_NAME"></field:text>
        <field:text name="text" title="複数指定" dataFrom="USERS.KANJI_NAME|SYSTEM_ACCOUNT.LOGIN_ID"></field:text>
        <field:text name="text" title="取得元のみ記載" dataFrom="USERS"></field:text>
        <field:text name="text" title="論理名べた書き" dataFrom="ユーザ管理テーブル(User)"></field:text>
        <field:text name="text" title="取得元が不正" dataFrom="User.KANJI_NAME"></field:text>
        <field:text name="text" title="表示項目名が不正" dataFrom="USERS.kanjiName"></field:text>
        <field:text name="text" title="他システム" dataFrom="N21AA001.User.recordKbn"></field:text>
      </field:block>
    </spec:layout>
    <spec:layout name="カレンダー">
      <field:block title="カレンダー" collapsible="true" value="field_calendar" collapsed="true" name="calendar">
        <field:calendar name="calendar" title="属性なし" ></field:calendar>
        <field:calendar name="calendar" title="ブランク" dataFrom=""></field:calendar>
        <field:calendar name="calendar" title="正常系" dataFrom="USERS.KANJI_NAME"></field:calendar>
        <field:calendar name="calendar" title="複数指定" dataFrom="USERS.KANJI_NAME|USERS.KANA_NAME"></field:calendar>
        <field:calendar name="calendar" title="複数指定" dataFrom="USERS.KANJI_NAME|SYSTEM_ACCOUNT.LOGIN_ID"></field:calendar>
        <field:calendar name="calendar" title="取得元のみ記載" dataFrom="USERS"></field:calendar>
        <field:calendar name="calendar" title="論理名べた書き" dataFrom="ユーザ管理テーブル(User)"></field:calendar>
        <field:calendar name="calendar" title="取得元が不正" dataFrom="User.KANJI_NAME"></field:calendar>
        <field:calendar name="calendar" title="表示項目名が不正" dataFrom="USERS.kanjiName"></field:calendar>
        <field:calendar name="calendar" title="他システム" dataFrom="N21AA001.Header.fileId"></field:calendar>
      </field:block>
    </spec:layout>
    <spec:layout name="チェックボックス">
      <field:block title="チェックボックス" collapsible="true" value="field_checkbox" collapsed="true" name="checkbox">
        <field:checkbox name="checkbox" title="属性なし"
                        elementLabelProperty="" elementValueProperty="" listName=""></field:checkbox>
        <field:checkbox name="checkbox" title="ブランク" dataFrom=""
                        elementLabelProperty="" elementValueProperty="" listName=""></field:checkbox>
        <field:checkbox name="checkbox" title="正常系" dataFrom="USERS.KANJI_NAME"
                        elementLabelProperty="" elementValueProperty="" listName=""></field:checkbox>
        <field:checkbox name="checkbox" title="複数指定" dataFrom="USERS.KANJI_NAME|USERS.KANA_NAME"
                        elementLabelProperty="" elementValueProperty="" listName=""></field:checkbox>
        <field:checkbox name="checkbox" title="複数指定" dataFrom="USERS.KANJI_NAME|SYSTEM_ACCOUNT.LOGIN_ID"
                        elementLabelProperty="" elementValueProperty="" listName=""></field:checkbox>
        <field:checkbox name="checkbox" title="取得元のみ記載" dataFrom="USERS"
                        elementLabelProperty="" elementValueProperty="" listName=""></field:checkbox>
        <field:checkbox name="checkbox" title="論理名べた書き" dataFrom="ユーザ管理テーブル(User)"
                        elementLabelProperty="" elementValueProperty="" listName=""></field:checkbox>
        <field:checkbox name="checkbox" title="取得元が不正" dataFrom="User.KANJI_NAME"
                        elementLabelProperty="" elementValueProperty="" listName=""></field:checkbox>
        <field:checkbox name="checkbox" title="表示項目名が不正" dataFrom="USERS.kanjiName"
                        elementLabelProperty="" elementValueProperty="" listName=""></field:checkbox>
        <field:checkbox name="checkbox" title="他システム" dataFrom="N21AA001.Header.fileId"
                        elementLabelProperty="" elementValueProperty="" listName=""></field:checkbox>
      </field:block>
    </spec:layout>
    <spec:layout name="ラベル">
      <field:block title="ラベル" collapsible="true" value="field_label" collapsed="true" name="label">
        <field:label name="label" title="属性なし" ></field:label>
        <field:label name="label" title="ブランク" dataFrom=""></field:label>
        <field:label name="label" title="正常系" dataFrom="USERS.KANJI_NAME"></field:label>
        <field:label name="label" title="複数指定" dataFrom="USERS.KANJI_NAME|USERS.KANA_NAME"></field:label>
        <field:label name="label" title="複数指定" dataFrom="USERS.KANJI_NAME|SYSTEM_ACCOUNT.LOGIN_ID"></field:label>
        <field:label name="label" title="取得元のみ記載" dataFrom="USERS"></field:label>
        <field:label name="label" title="論理名べた書き" dataFrom="ユーザ管理テーブル(User)"></field:label>
        <field:label name="label" title="取得元が不正" dataFrom="User.KANJI_NAME"></field:label>
        <field:label name="label" title="表示項目名が不正" dataFrom="USERS.kanjiName"></field:label>
        <field:label name="label" title="他システム" dataFrom="N21AA001.Header.fileId"></field:label>
      </field:block>
    </spec:layout>

    <spec:layout name="ラベル_ID_値">
      <field:block title="ラベル_ID_値" collapsible="true" value="field_label_id_value" collapsed="true" name="label_id_value">
        <field:label_id_value title="属性なし"
                              idName="" valueName=""></field:label_id_value>
        <field:label_id_value title="ブランク" dataFrom=""
                              idName="" valueName=""></field:label_id_value>
        <field:label_id_value title="正常系" dataFrom="USERS.KANJI_NAME"
                              idName="" valueName=""></field:label_id_value>
        <field:label_id_value title="複数指定" dataFrom="USERS.KANJI_NAME|USERS.KANA_NAME"
                              idName="" valueName=""></field:label_id_value>
        <field:label_id_value title="複数指定" dataFrom="USERS.KANJI_NAME|SYSTEM_ACCOUNT.LOGIN_ID"
                              idName="" valueName=""></field:label_id_value>
        <field:label_id_value title="取得元のみ記載" dataFrom="USERS"
                              idName="" valueName=""></field:label_id_value>
        <field:label_id_value title="論理名べた書き" dataFrom="ユーザ管理テーブル(User)"
                              idName="" valueName=""></field:label_id_value>
        <field:label_id_value title="取得元が不正" dataFrom="User.KANJI_NAME"
                              idName="" valueName=""></field:label_id_value>
        <field:label_id_value title="表示項目名が不正" dataFrom="USERS.kanjiName"
                              idName="" valueName=""></field:label_id_value>
        <field:label_id_value title="他システム" dataFrom="N21AA001.Header.fileId"
                              idName="" valueName=""></field:label_id_value>
      </field:block>
    </spec:layout>

    <spec:layout name="リストビルダー">
      <field:block title="リストビルダー" collapsible="true" value="field_listbuilder" collapsed="true" name="listbuilder">
        <field:listbuilder name="listbuilder" title="属性なし"
                           elementLabelProperty=""  elementValueProperty="" id="" listName=""></field:listbuilder>
        <field:listbuilder name="listbuilder" title="ブランク" dataFrom=""
                           elementLabelProperty=""  elementValueProperty="" id="" listName=""></field:listbuilder>
        <field:listbuilder name="listbuilder" title="正常系" dataFrom="USERS.KANJI_NAME"
                           elementLabelProperty=""  elementValueProperty="" id="" listName=""></field:listbuilder>
        <field:listbuilder name="listbuilder" title="複数指定" dataFrom="USERS.KANJI_NAME|USERS.KANA_NAME"
                           elementLabelProperty=""  elementValueProperty="" id="" listName=""></field:listbuilder>
        <field:listbuilder name="listbuilder" title="複数指定" dataFrom="USERS.KANJI_NAME|SYSTEM_ACCOUNT.LOGIN_ID"
                           elementLabelProperty=""  elementValueProperty="" id="" listName=""></field:listbuilder>
        <field:listbuilder name="listbuilder" title="取得元のみ記載" dataFrom="USERS"
                           elementLabelProperty=""  elementValueProperty="" id="" listName=""></field:listbuilder>
        <field:listbuilder name="listbuilder" title="論理名べた書き" dataFrom="ユーザ管理テーブル(User)"
                           elementLabelProperty=""  elementValueProperty="" id="" listName=""></field:listbuilder>
        <field:listbuilder name="listbuilder" title="取得元が不正" dataFrom="User.KANJI_NAME"
                           elementLabelProperty=""  elementValueProperty="" id="" listName=""></field:listbuilder>
        <field:listbuilder name="listbuilder" title="表示項目名が不正" dataFrom="USERS.kanjiName"
                           elementLabelProperty=""  elementValueProperty="" id="" listName=""></field:listbuilder>
        <field:listbuilder name="listbuilder" title="他システム" dataFrom="N21AA001.Header.fileId"
                           elementLabelProperty=""  elementValueProperty="" id="" listName=""></field:listbuilder>
      </field:block>
    </spec:layout>
    <spec:layout name="パスワード">
      <field:block title="パスワード" collapsible="true" value="field_password" collapsed="true" name="password">
        <field:password name="password" title="属性なし" ></field:password>
        <field:password name="password" title="ブランク" dataFrom=""></field:password>
        <field:password name="password" title="正常系" dataFrom="USERS.KANJI_NAME"></field:password>
        <field:password name="password" title="複数指定" dataFrom="USERS.KANJI_NAME|USERS.KANA_NAME"></field:password>
        <field:password name="password" title="複数指定" dataFrom="USERS.KANJI_NAME|SYSTEM_ACCOUNT.LOGIN_ID"></field:password>
        <field:password name="password" title="取得元のみ記載" dataFrom="USERS"></field:password>
        <field:password name="password" title="論理名べた書き" dataFrom="ユーザ管理テーブル(User)"></field:password>
        <field:password name="password" title="取得元が不正" dataFrom="User.KANJI_NAME"></field:password>
        <field:password name="password" title="表示項目名が不正" dataFrom="USERS.kanjiName"></field:password>
        <field:password name="password" title="他システム" dataFrom="N21AA001.Header.fileId"></field:password>
      </field:block>
    </spec:layout>
    <spec:layout name="プルダウン">
      <field:block title="プルダウン" collapsible="true" value="field_pulldown" collapsed="true" name="pulldown">
        <field:pulldown name="pulldown" title="属性なし"
                        elementLabelProperty="" elementValueProperty="" listName=""></field:pulldown>
        <field:pulldown name="pulldown" title="ブランク" dataFrom=""
                        elementLabelProperty="" elementValueProperty="" listName=""></field:pulldown>
        <field:pulldown name="pulldown" title="正常系" dataFrom="USERS.KANJI_NAME"
                        elementLabelProperty="" elementValueProperty="" listName=""></field:pulldown>
        <field:pulldown name="pulldown" title="複数指定" dataFrom="USERS.KANJI_NAME|USERS.KANA_NAME"
                        elementLabelProperty="" elementValueProperty="" listName=""></field:pulldown>
        <field:pulldown name="pulldown" title="取得元のみ記載" dataFrom="USERS"
                        elementLabelProperty="" elementValueProperty="" listName=""></field:pulldown>
        <field:pulldown name="pulldown" title="複数指定" dataFrom="USERS.KANJI_NAME|SYSTEM_ACCOUNT.LOGIN_ID"
                        elementLabelProperty="" elementValueProperty="" listName=""></field:pulldown>
        <field:pulldown name="pulldown" title="論理名べた書き" dataFrom="ユーザ管理テーブル(User)"
                        elementLabelProperty="" elementValueProperty="" listName=""></field:pulldown>
        <field:pulldown name="pulldown" title="取得元が不正" dataFrom="User.KANJI_NAME"
                        elementLabelProperty="" elementValueProperty="" listName=""></field:pulldown>
        <field:pulldown name="pulldown" title="表示項目名が不正" dataFrom="USERS.kanjiName"
                        elementLabelProperty="" elementValueProperty="" listName=""></field:pulldown>
        <field:pulldown name="pulldown" title="他システム" dataFrom="N21AA001.Header.fileId"
                        elementLabelProperty="" elementValueProperty="" listName=""></field:pulldown>
      </field:block>
    </spec:layout>
    <spec:layout name="ラジオ">
      <field:block title="ラジオ" collapsible="true" value="field_radio" collapsed="true" name="radio">
        <field:radio name="radio" title="属性なし"
                     elementLabelProperty="" elementValueProperty="" listName=""></field:radio>
        <field:radio name="radio" title="ブランク" dataFrom=""
                     elementLabelProperty="" elementValueProperty="" listName=""></field:radio>
        <field:radio name="radio" title="正常系" dataFrom="User.kanjiName"
                     elementLabelProperty="" elementValueProperty="" listName=""></field:radio>
        <field:radio name="radio" title="複数指定" dataFrom="USERS.KANJI_NAME|USERS.KANA_NAME"
                     elementLabelProperty="" elementValueProperty="" listName=""></field:radio>
        <field:radio name="radio" title="複数指定" dataFrom="USERS.KANJI_NAME|SYSTEM_ACCOUNT.LOGIN_ID"
                     elementLabelProperty="" elementValueProperty="" listName=""></field:radio>
        <field:radio name="radio" title="取得元のみ記載" dataFrom="USERS"
                     elementLabelProperty="" elementValueProperty="" listName=""></field:radio>
        <field:radio name="radio" title="論理名べた書き" dataFrom="ユーザ管理テーブル(User)"
                     elementLabelProperty="" elementValueProperty="" listName=""></field:radio>
        <field:radio name="radio" title="取得元が不正" dataFrom="USER.kanjiName"
                     elementLabelProperty="" elementValueProperty="" listName=""></field:radio>
        <field:radio name="radio" title="表示項目名が不正" dataFrom="User.KANJI_NAME"
                     elementLabelProperty="" elementValueProperty="" listName=""></field:radio>
        <field:radio name="radio" title="他システム" dataFrom="N21AA001.Header.fileId"
                     elementLabelProperty="" elementValueProperty="" listName=""></field:radio>
      </field:block>
    </spec:layout>
    <spec:layout name="テキストエリア">
      <field:block title="テキストエリア" collapsible="true" value="field_textarea" collapsed="true" name="textarea">
        <field:textarea name="textarea" title="属性なし" ></field:textarea>
        <field:textarea name="textarea" title="ブランク" dataFrom=""></field:textarea>
        <field:textarea name="textarea" title="正常系" dataFrom="User.kanjiName"></field:textarea>
        <field:textarea name="textarea" title="複数指定" dataFrom="USERS.KANJI_NAME|USERS.KANA_NAME"></field:textarea>
        <field:textarea name="textarea" title="複数指定" dataFrom="USERS.KANJI_NAME|SYSTEM_ACCOUNT.LOGIN_ID"></field:textarea>
        <field:textarea name="textarea" title="取得元のみ記載" dataFrom="USERS"></field:textarea>
        <field:textarea name="textarea" title="論理名べた書き" dataFrom="ユーザ管理テーブル(User)"></field:textarea>
        <field:textarea name="textarea" title="取得元が不正" dataFrom="User.KANJI_NAME"></field:textarea>
        <field:textarea name="textarea" title="表示項目名が不正" dataFrom="USERS.kanjiName"></field:textarea>
        <field:textarea name="textarea" title="他システム" dataFrom="N21AA001.Header.fileId"></field:textarea>
      </field:block>
    </spec:layout>
    <spec:layout name="dataFromにテーブル名のみ指定する。">
      <field:block title="テーブル名のみのdataFrom" collapsible="true" value="dataFrom_tableOnly" collapsed="true" name="dataFrom_tableOnly">
        <field:textarea name="textarea" title="テーブル名のみ" dataFrom="USERS"></field:textarea>
      </field:block>
    </spec:layout>
    </n:form>
  </jsp:attribute>
</t:page_template>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="link" tagdir="/WEB-INF/tags/widget/link" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ taglib prefix="tab" tagdir="/WEB-INF/tags/widget/tab" %>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/widget/layout" %>
<%@ taglib prefix="table" tagdir="/WEB-INF/tags/widget/table" %>
<%@ taglib prefix="column" tagdir="/WEB-INF/tags/widget/column" %>
<%@ taglib prefix="box" tagdir="/WEB-INF/tags/widget/box" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<n:form windowScopePrefixes="formdata">

  <field:block title="ブロックその１">

    <%--****************************************
    1行目
    ****************************************--%>
    <layout:row>
      <layout:cell gridSize="15">
        <box:content>
          単行テキストとカレンダーの2つの項目が表示されること
        </box:content>
      </layout:cell>
      <field:text
          title="単行テキスト"
          titleSize="10"
          inputSize="5"
          name="input.text"
          hint="ヒント表示領域"/>
      <field:calendar
          title="カレンダー"
          name="calendar"
          titleSize="8"
          inputSize="7"
          hint="カレンダーのボタンが表示される"/>
    </layout:row>

    <%--****************************************
    2行目
    ****************************************--%>
    <layout:row>
      <layout:cell gridSize="10">
        <box:content>
          チェックボックスと単行テキストを並べて表示
        </box:content>
      </layout:cell>

      <layout:cell gridSize="20">
        <layout:row>
          <field:text title="姓" name="text1" titleSize="8" inputSize="12" required="true" />
          <field:text title="名" name="text2" titleSize="8" inputSize="12" required="true"/>
        </layout:row>
      </layout:cell>

      <field:checkbox
          title="性別"
          name="input.checkbox"
          listName="list"
          listFormat="ul"
          elementLabelProperty="name"
          elementValueProperty="value"
          titleSize="5"
          inputSize="10"
          required="true"
          sample="男|女|法人"
          hint="一つだけチェックしてください"
          >
      </field:checkbox>
    </layout:row>

    <%--****************************************
    3行目
    ****************************************--%>
    <box:title >
      ここにタイトルが表示される
    </box:title>
    <layout:row>
      <field:textarea
          title="メモ"
          name="input.textarea"
          titleSize="4"
          inputSize="16">
      </field:textarea>

      <field:code_checkbox
          title="コード"
          name="input.codecheckbox"
          codeId="code1"
          sample="コード1|コード2"
          listFormat="br"
          titleSize="5"
          inputSize="10"
          hint="複数選択可">
      </field:code_checkbox>

      <field:password
          title="パスワード"
          name="input.password"
          required="true"
          titleSize="7"
          inputSize="3"
          hint="パスワードを入力する場所です。">
      </field:password>
    </layout:row>

    <%--****************************************
    4行目
    ****************************************--%>
    <layout:row>
      <field:radio
          title="性別"
          name="input.radio"
          listName="list"
          elementLabelProperty="name"
          elementValueProperty="value"
          listFormat="div"
          hint="ラジオボタン"
          titleSize="4"
          inputSize="10">
      </field:radio>
      
      <field:pulldown
          title="性別"
          name="input.pulldown"
          listName="list"
          elementLabelProperty="name"
          elementValueProperty="value"
          hint="プルダウン"
          withNoneOption="true"
          titleSize="4"
          inputSize="9">
      </field:pulldown>

      <field:code_radio
          title="code_radio"
          codeId="code1"
          name="input.code_radio"
          hint="コードラジオ"
          titleSize="8"
          inputSize="10">
      </field:code_radio>
    </layout:row>

    <%--****************************************
    5行目
    ****************************************--%>
    <layout:row>
      <field:code_pulldown
          title="code_pulldown"
          name="input.code_pulldown"
          codeId="code1"
          titleSize="10"
          inputSize="15">
      </field:code_pulldown>

      <field:label
          title="ラベル表示"
          name="input.label"
          titleSize="7"
          inputSize="13">
      </field:label>
    </layout:row>

    <%--****************************************
    6行目
    ****************************************--%>
    <layout:row>
      <field:label_block
          title="フィールドブロック"
          titleSize="11"
          inputSize="15">
        いろんなものが出力できる領域
        <ul>
          <li>hoge</li>
          <li>fuga</li>
        </ul>
      </field:label_block>
      
      <field:label_code
          title="label_code"
          name="input.label_code"
          codeId="code1"
          titleSize="10"
          inputSize="9">
      </field:label_code>
    </layout:row>

    <%--****************************************
    7行目
    ****************************************--%>
    <layout:row>
      <field:label_id_value
          title="label_id_value"
          idName="input.id"
          valueName="input.value"
          titleSize="15"
          inputSize="5">
      </field:label_id_value>
      <field:file
          title="ファイルアップロード"
          name="input.file"
          titleSize="12"
          inputSize="13">
      </field:file>
    </layout:row>

    <%--****************************************
    8行目
    ****************************************--%>
    <layout:row>
      <layout:cell gridSize="10">
        <box:img
            id="multicol-test-png"
            file="multicol-test.png">
        </box:img>
      </layout:cell>
      <field:hint gridSize="4">
        ヒントを単独で使う
      </field:hint>
      <field:listbuilder
          title="listbuilder"
          name="input.listbuilder"
          id="list"
          listName="list"
          elementLabelProperty="name"
          elementValueProperty="value"
          titleSize="10">
      </field:listbuilder>
    </layout:row>

    <%--****************************************
    9行目(テーブル)
    ****************************************--%>
    <table:plain title="検索結果（横幅いっぱいに表示される）"
        resultSetName="resultSet">
      <column:label key="col1" title="カラム1">
      </column:label>
      <column:label key="col2" title="カラム2">
      </column:label>
    </table:plain>
  </field:block>

  <%--****************************************
  10行目
  ****************************************--%>
  <layout:row>
    <button:back uri="dummy" size="10" />
    <layout:cell gridSize="5">
      <p/>
    </layout:cell>
    <layout:cell gridSize="15">
      <link:submit label="リンク" uri="dummy"/>
    </layout:cell>
    <layout:cell gridSize="5">
      <p/>
    </layout:cell>
    <button:submit label="ぼたん" uri="dummy" size="10"/>
  </layout:row>
</n:form>


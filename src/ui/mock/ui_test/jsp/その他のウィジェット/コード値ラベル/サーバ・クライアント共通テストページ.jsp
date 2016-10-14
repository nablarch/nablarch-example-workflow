<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<n:form>
  <field:block title="sample属性">
    <span class="test-case sample-test">sample属性を指定しない場合、サーバ・クライアント共にcodeIdに指定されたコードのコード名称が出力されること</span>
    <field:label_code
        title="sample属性未指定"
        codeId="code1"
        listFormat="sp"
        name="server.not-exist">
    </field:label_code>
    <span class="test-case sample-test">sample属性にブランクを指定した場合、サーバ・クライアント共にcodeIdに指定されたコードのコード名称が出力されること</span>
    <field:label_code
        title="sample属性ブランク"
        codeId="code1"
        listFormat="sp"
        sample=""
        name="server.not-exist">
    </field:label_code>
    <span class="test-case sample-test">sample属性を指定した場合、クライアントではlistFormatで整形されたリストを表示すること。</span>
    <field:label_code
        title="sample属性指定"
        sample="値1|値2|値3"
        codeId="code1"
        listFormat="sp"
        name="server.not-exist">
    </field:label_code>
  </field:block>

  <field:block title="listFormat属性">
    <span class="test-case listFormat-test">listFormat属性を指定しない場合、sp区切りのリスト表示となること</span>
    <field:label_code
        title="listFormat属性未指定"
        codeId="code1"
        sample="[sp区切り1]|sp区切り2|[sp区切り3]"
        name="server.listFormat">
    </field:label_code>
    <span class="test-case listFormat-test">listFormat属性にブランクを指定した場合、sp区切りのリスト表示となること</span>
    <field:label_code
        title="listFormat属性ブランク"
        codeId="code1"
        sample="sp区切り1|sp区切り2|sp区切り3"
        listFormat=""
        name="server.listFormat">
    </field:label_code>
    <span class="test-case listFormat-test">listFormat属性を指定した場合、指定したフォーマット（ul）でのリスト表示となること</span>
    <field:label_code
        title="listFormat属性指定(ul区切りになる)"
        codeId="code1"
        listFormat="ul"
        sample="br区切り1|br区切り2|br区切り3"
        name="server.listFormat">
    </field:label_code>
  </field:block>

  <field:block title="タイトルのサイズと入力部のサイズ">
    <span class="test-case title-input-size">
      titleSizeとinputSizeが未指定の場合、タイトル部と入力部ともにgrid-col関連のクラスが設定されないこと
    </span>
    <field:label_code
        title="titleSizeとinputSize未指定"
        name="server.titleInputSize1"
        codeId="code1">
    </field:label_code>

    <span class="test-case title-input-size">
      titleSizeとinputSizeがブランクの場合、タイトル部と入力部ともにgrid-col関連のクラスが設定されないこと
    </span>
    <field:label_code
        title="titleSizeとinputSizeブランク指定"
        name="server.titleInputSize2"
        codeId="code1"
        titleSize=""
        inputSize="">
    </field:label_code>

    <span class="test-case title-input-size">
      titleSizeとinputSizeをともに指定<br/>

      タイトル部(label)には、指定したグリッドサイズから「:」部のグリッド数が減算された値が設定されること
      入力部(div.field-contentには、指定したグリッド数がそのまま設定されること
    </span>
    <field:label_code
        title="titleSizeとinputSize指定"
        name="server.titleInputSize3"
        codeId="code1"
        titleSize="15"
        inputSize="8">
    </field:label_code>
  </field:block>

  <field:block title="pattern属性">
    <span class="test-case pattern-test">
      pattern属性を指定しなかった場合、PATTERN01に対応するコードが表示されること。<br/>
      ローカル表示でも、codeId属性に指定されたコードの名称がソート順に従ってソートされて表示されること。
    </span>
    <field:label_code
        title="pattern属性未指定"
        name="server.pattern"
        codeId="code1"
        listFormat="br">
    </field:label_code>
    <span class="test-case pattern-test">pattern属性にブランクを指定した場合、PATTERN01に対応するコードが表示されること</span>
    <field:label_code
        title="pattern属性ブランク"
        name="server.pattern"
        codeId="code1"
        pattern=""
        listFormat="br">
    </field:label_code>
    <span class="test-case pattern-test">pattern属性を指定した場合、指定したパターン（PATTERN02）に対応するコードが表示されること</span>
    <field:label_code
        title="pattern属性指定"
        name="server.pattern"
        codeId="code1"
        pattern="PATTERN02"
        listFormat="br">
    </field:label_code>
  </field:block>

  <field:block title="optionColumnName属性">
    <span class="test-case optionColumnName-test">optionColumnName属性を指定しなかった場合、OPTION01に対応するコード名称が表示されること</span>
    <field:label_code
        title="optionColumnName属性未指定"
        name="server.dummy"
        codeId="code1"
        labelPattern="$OPTIONALNAME$"
        listFormat="br">
    </field:label_code>
    <span class="test-case optionColumnName-test">optionColumnName属性にブランクを指定した場合、OPTION01に対応するコード名称が表示されること</span>
    <field:label_code
        title="optionColumnName属性ブランク"
        name="server.dummy"
        codeId="code1"
        labelPattern="$OPTIONALNAME$"
        listFormat="br"
        optionColumnName="">
    </field:label_code>
    <span class="test-case optionColumnName-test">optionColumnName属性を指定した場合、指定したオプション名称（OPTION03）に対応するコード名称が表示されること</span>
    <field:label_code
        title="optionColumnName属性指定"
        name="server.dummy"
        codeId="code1"
        labelPattern="$OPTIONALNAME$"
        listFormat="br"
        optionColumnName="OPTION03">
    </field:label_code>
  </field:block>

  <field:block title="labelPattern属性">
    <span class="test-case labelPattern-test">labelPattern属性を指定しなかった場合、対応するコード名称が表示されること</span>
    <field:label_code
        title="labelPattern属性未指定"
        name="server.dummy"
        codeId="code1"
        listFormat="br">
    </field:label_code>
    <span class="test-case labelPattern-test">labelPattern属性にブランクを指定した場合、対応するコード名称が表示されること</span>
    <field:label_code
        title="labelPattern属性ブランク"
        name="server.dummy"
        codeId="code1"
        listFormat="br"
        labelPattern="">
    </field:label_code>
    <span class="test-case labelPattern-test">labelPattern属性を指定した場合、指定したプレースホルダ（$NAME$ - $SHORTNAME$ - $OPTIONALNAME$ - $VALUE$）に対応するコード名称が表示されること</span>
    <field:label_code
        title="labelPattern属性指定"
        name="server.dummy"
        codeId="code1"
        labelPattern="$NAME$ - $SHORTNAME$ - $OPTIONALNAME$ - $VALUE$"
        listFormat="br">
    </field:label_code>
  </field:block>

</n:form>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<n:form>
<n:forInputPage>
  <input name="input" type="hidden" value="1" />
</n:forInputPage>

<field:block title="required属性">
  <span class="test-case required-test">required属性を指定しない場合、必須マークが出力されないこと</span>
  <field:code_pulldown
      title="required未指定"
      name="server.required-none"
      codeId="code1"
      sample="値1|値2|[値3]">
  </field:code_pulldown>
  <span class="test-case required-test">required属性にブランクを指定した場合、必須マークが出力されないこと</span>
  <field:code_pulldown
      title="requiredブランク"
      name="server.required-blank"
      required=""
      codeId="code1"
      sample="値1|値2|[値3]">
  </field:code_pulldown>
  <span class="test-case required-test">required属性にfalseを指定した場合、必須マークが出力されないこと</span>
  <field:code_pulldown
      title="required[false]"
      name="server.required-false"
      required="false"
      codeId="code1"
      sample="値1|値2|[値3]">
  </field:code_pulldown>
  <span class="test-case required-test">required属性にtrueを指定した場合、入力画面では必須マークが出力されること（確認画面では表示されない）</span>
  <field:code_pulldown
      title="required[true](必須マークがタイトルの右側につくこと)"
      name="server.required-true"
      required="true"
      codeId="code1"
      sample="値1|値2|[値3]">
  </field:code_pulldown>
</field:block>

<field:block title="hint属性">
  <span class="test-case hint-test">hint属性を指定しない場合、hintは出力されないこと</span>
  <field:code_pulldown
      title="hint未指定"
      name="server.hint-none"
      codeId="code1"
      sample="値1|値2|[値3]">
  </field:code_pulldown>
  <span class="test-case hint-test">hint属性にブランクを指定した場合、hintは出力されないこと</span>
  <field:code_pulldown
      title="hintブランク"
      name="server.hint-blank"
      codeId="code1"
      sample="値1|値2|[値3]"
      hint="">
  </field:code_pulldown>
  <span class="test-case hint-test">hint属性を指定した場合、入力画面ではhintが出力されること（確認画面では表示されないこと）</span>
  <field:code_pulldown
      title="hint指定"
      name="server.hint-nonblank"
      codeId="code1"
      sample="値1|値2|[値3]"
      hint="ヒント">
  </field:code_pulldown>
  <span class="test-case viewonly">ラベルが折り返した場合でも、hint属性が入力エリアの直下に左揃えで出力されること。確認画面では出力されないこと。</span>
  <field:code_pulldown
      title="タイトル属性に長い文言を設定することで折り返す"
      name="server.hint-nonblank"
      codeId="code1"
      sample="値1|値2|[値3]"
      hint="ヒント">
  </field:code_pulldown>
</field:block>

<field:block title="readonly属性">
  <span class="test-case readonly-test">readonly属性を指定しない場合、編集可能になること</span>
  <field:code_pulldown
      title="readonly未指定"
      codeId="code1"
      sample="値1|値2|[値3]"
      name="server.readonly-none">
  </field:code_pulldown>
  <span class="test-case readonly-test">readonly属性が空文字列の場合、編集可能になること</span>
  <field:code_pulldown
      title="readonlyブランク"
      name="server.readonly-blank"
      codeId="code1"
      sample="値1|値2|[値3]"
      readonly="">
  </field:code_pulldown>
  <span class="test-case readonly-test">readonly属性にtrueを指定した場合、編集不可になること(値は送信され確認画面にラベル表示されること)</span>
  <field:code_pulldown
      title="readonly[true]"
      name="server.readonly-true"
      codeId="code1"
      sample="値1|値2|[値3]"
      readonly="true">
  </field:code_pulldown>
  <span class="test-case readonly-test">readonly属性にfalseを指定した場合、編集可能になること</span>
  <field:code_pulldown
      title="readonly[false]"
      name="server.readonly-false"
      codeId="code1"
      sample="値1|値2|[値3]"
      readonly="false">
  </field:code_pulldown>
</field:block>

<field:block title="disabled属性">
  <span class="test-case disabled-test">disabled属性を指定しない場合、編集可能となりサーバに値が送信されること</span>
  <field:code_pulldown
      title="disabled未指定"
      codeId="code1"
      sample="値1|値2|[値3]"
      name="server.disabled-none">
  </field:code_pulldown>
  <span class="test-case disabled-test">disabled属性が空文字列の場合、編集可能となりサーバに値が送信されること</span>
  <field:code_pulldown
      title="disabledブランク"
      name="server.disabled-blank"
      codeId="code1"
      sample="値1|値2|[値3]"
      disabled="">
  </field:code_pulldown>
  <span class="test-case disabled-test">disabled属性にtrueを指定した場合、サーバに値が送信されないこと（確認画面に表示されないこと）</span>
  <field:code_pulldown
      title="disabled[true]"
      name="server.disabled-true"
      codeId="code1"
      sample="値1|値2|[値3]"
      disabled="true">
  </field:code_pulldown>
  <span class="test-case disabled-test">disabled属性にfalseを指定した場合、編集可能となりサーバに値が送信されること</span>
  <field:code_pulldown
      title="disabled[false]"
      name="server.disabled-false"
      codeId="code1"
      sample="値1|値2|[値3]"
      disabled="false">
  </field:code_pulldown>
</field:block>

<field:block title="id属性">
  <span class="test-case id-test">id属性を指定しない場合、name属性がid属性に設定されること</span>
  <field:code_pulldown
      title="id属性未指定"
      name="server.id-none"
      codeId="code1"
      sample="値1|値2|[値3]">
  </field:code_pulldown>
  <span class="test-case id-test">id属性が空文字列の場合、name属性がid属性に設定されること</span>
  <field:code_pulldown
      title="id属性ブランク"
      name="server.id-blank"
      codeId="code1"
      sample="値1|値2|[値3]"
      id="">
  </field:code_pulldown>
  <span class="test-case id-test">id属性を指定した場合、そのidがid属性に設定されること</span>
  <field:code_pulldown
      title="id属性指定"
      name="server.id"
      codeId="code1"
      sample="値1|値2|[値3]"
      id="test-id">
  </field:code_pulldown>
</field:block>

<field:block title="cssClass属性">
  <span class="test-case cssClass-test">cssClass属性を指定しない場合、class属性がブランクとなること(ソースから確認)</span>
  <field:code_pulldown
      title="cssClass属性未指定"
      codeId="code1"
      sample="値1|値2|[値3]"
      name="server.cssClass-none">
  </field:code_pulldown>
  <span class="test-case cssClass-test">cssClass属性にブランクを指定した場合、class属性がブランクとなること(ソースから確認)</span>
  <field:code_pulldown
      title="cssClass属性ブランク"
      name="server.cssClass-blank"
      codeId="code1"
      sample="値1|値2|[値3]"
      cssClass="">
  </field:code_pulldown>
  <span class="test-case cssClass-test">cssClass属性を指定した場合、class属性に指定したcssClassが設定されること</span>
  <field:code_pulldown
      title="cssClass属性指定"
      name="server.cssClass-nonblank"
      codeId="code1"
      sample="値1|値2|[値3]"
      cssClass="cssClass-test">
  </field:code_pulldown>
</field:block>

<field:block title="sample属性">
  <span class="test-case sample-test">sample属性を指定しない場合、サーバ・クライアント共にcodeIdに指定されたコードのコード名称が出力されること</span>
  <field:code_pulldown
      title="sample属性未指定"
      required="true"
      codeId="code1"
      name="dummy">
  </field:code_pulldown>
  <span class="test-case sample-test">sample属性にブランクを指定した場合、サーバ・クライアント共にcodeIdに指定されたコードのコード名称が出力されること</span>
  <field:code_pulldown
      title="sample属性ブランク"
      required="true"
      codeId="code1"
      sample=""
      name="dummy">
  </field:code_pulldown>
  <span class="test-case sample-test">sample属性を指定した場合、クライアントではsample属性の値が出力され、[]で囲まれた値が選択状態となること。</span>
  <field:code_pulldown
      title="sample属性指定"
      required="true"
      sample="値1|値2|[値3]"
      codeId="code1"
      name="dummy">
  </field:code_pulldown>
</field:block>

<field:block title="withNoneOption属性">
  <span class="test-case withNoneOption-test">withNoneOptionを指定しない場合、「（選択しない）」の項目が表示されないこと</span>
  <field:code_pulldown
      title="withNoneOption属性未指定"
      name="server.noneOption-none"
      codeId="code1"
      sample="値1|値2|値3">
  </field:code_pulldown>
  <span class="test-case withNoneOption-test">withNoneOptionにブランクを指定した場合、「（選択しない）」の項目が表示されないこと</span>
  <field:code_pulldown
      title="withNoneOption属性ブランク"
      name="server.noneOption-blank"
      codeId="code1"
      withNoneOption=""
      sample="値1|値2|値3">
  </field:code_pulldown>
  <span class="test-case withNoneOption-test">withNoneOptionにtrueを指定した場合、「（選択しない）」の項目が表示されること</span>
  <field:code_pulldown
      title="withNoneOption[true]"
      name="server.noneOption-true"
      codeId="code1"
      withNoneOption="true"
      sample="値1|値2|値3">
  </field:code_pulldown>
  <span class="test-case withNoneOption-test">withNoneOptionにfalseを指定した場合、「（選択しない）」の項目が表示されないこと</span>
  <field:code_pulldown
      title="withNoneOption[false]"
      name="server.noneOption-false"
      codeId="code1"
      withNoneOption="false"
      sample="値1|値2|値3">
  </field:code_pulldown>
</field:block>

<field:block title="size属性">
  <span class="test-case size-test">sizeを指定しない場合、通常のプルダウン表示となること</span>
  <field:code_pulldown
      title="size属性未指定"
      name="server.pulldown-with-size-none"
      codeId="code1"
      sample="[a]|b|c|d|e|f|g">
  </field:code_pulldown>
  <span class="test-case size-test">sizeにブランクを指定した場合、通常のプルダウン表示となること</span>
  <field:code_pulldown
      title="size属性ブランク"
      name="server.pulldown-with-size-blank"
      codeId="code1"
      size=""
      sample="[a]|b|c|d|e|f|g">
  </field:code_pulldown>
  <span class="test-case size-test">sizeを指定した場合、HTMLのsize属性が使用できること</span>
  <field:code_pulldown
      title="size属性指定(=5)"
      name="server.pulldown-with-size"
      size="5"
      codeId="code1"
      sample="[a]|b|c|d|e|f|g">
  </field:code_pulldown>
</field:block>

<field:block title="multiple属性">
  <span class="test-case multiple-test">multipleを指定しない場合、複数選択できないこと</span>
  <field:code_pulldown
      title="multiple属性未指定"
      name="server.pulldown-with-multiple-none"
      size="5"
      codeId="code1"
      sample="[a]|b|c|d|e|f|g">
  </field:code_pulldown>
  <span class="test-case multiple-test">multipleにブランクを指定した場合、複数選択できないこと</span>
  <field:code_pulldown
      title="multiple属性ブランク"
      name="server.pulldown-with-multiple-blank"
      size="5"
      multiple=""
      codeId="code1"
      sample="a|b|[c]|d|e|f|g">
  </field:code_pulldown>
  <span class="test-case multiple-test">multipleにfalseを指定した場合、複数選択できないこと</span>
  <field:code_pulldown
      title="multiple属性指定(=false)"
      name="server.pulldown-with-multiple-false"
      size="5"
      multiple="false"
      codeId="code1"
      sample="a|b|[c]|d|e|f|g">
  </field:code_pulldown>
  <span class="test-case multiple-test">multipleにtrueを指定した場合、HTMLのmultiple属性が使用できること</span>
  <field:code_pulldown
      title="multiple属性指定(=true)"
      name="server.pulldown-with-multiple-true"
      size="5"
      multiple="true"
      codeId="code1"
      sample="[a]|b|[c]|d|[e]|f|[g]">
  </field:code_pulldown>
</field:block>

<field:block title="タイトルのサイズと入力部のサイズ">
  <span class="test-case title-input-size">
    titleSizeとinputSizeが未指定の場合、タイトル部と入力部ともにgrid-col関連のクラスが設定されないこと
  </span>
  <field:code_pulldown
      title="titleSizeとinputSize未指定"
      name="server.noneTitleInputSize"
      required="true"
      codeId="code1"
      sample="[a]|b|c|d|e|f|g">
  </field:code_pulldown>

  <span class="test-case title-input-size">
    titleSizeとinputSizeがブランクの場合、タイトル部と入力部ともにgrid-col関連のクラスが設定されないこと
  </span>
  <field:code_pulldown
      title="titleSizeとinputSizeブランク"
      name="server.emptyTitleInputSize"
      required="true"
      codeId="code1"
      sample="a|[b]|c|d|e|f|g"
      titleSize=""
      inputSize="">
  </field:code_pulldown>

  <span class="test-case title-input-size">
    titleSizeとinputSizeをともに指定<br/>

    タイトル部(label)には、指定したグリッドサイズから「:」部のグリッド数が減算された値が設定されること
    入力部(div.field-contentには、指定したグリッド数がそのまま設定されること
  </span>

  <field:code_pulldown
      title="titleSizeとinputSize指定"
      name="server.titleInputSize"
      required="true"
      codeId="code1"
      sample="a|[b]|c|d|e|f|g"
      titleSize="10"
      inputSize="20">
  </field:code_pulldown>

  <field:block title="pattern属性">
    <span class="test-case pattern-none">
      pattern属性を指定しなかった場合、PATTERN01に対応するコードが表示されること。<br/>
      ローカル表示でも、codeId属性に指定されたコードの名称がソート順に従ってソートされて表示されること。
    </span>
    <field:code_pulldown
        title="pattern属性未指定"
        name="server.pattern-none"
        codeId="code1">
    </field:code_pulldown>
    <span class="test-case pattern-blank">pattern属性にブランクを指定した場合、PATTERN01に対応するコードが表示されること</span>
    <field:code_pulldown
        title="pattern属性ブランク"
        name="server.pattern-blank"
        codeId="code1"
        pattern="">
    </field:code_pulldown>
    <span class="test-case pattern-not-blank">pattern属性を指定した場合、指定したパターン（PATTERN02）に対応するコードが表示されること</span>
    <field:code_pulldown
        title="pattern属性未指定"
        name="server.pattern"
        codeId="code1"
        pattern="PATTERN02">
    </field:code_pulldown>
  </field:block>

  <field:block title="optionColumnName属性">
    <span class="test-case option-none">optionColumnName属性を指定しなかった場合、OPTION01に対応するコード名称が表示されること</span>
    <field:code_pulldown
        title="optionColumnName属性未指定"
        name="server.optional-name-none"
        codeId="code1"
        labelPattern="$OPTIONALNAME$">
    </field:code_pulldown>
    <span class="test-case option-blank">optionColumnName属性にブランクを指定した場合、OPTION01に対応するコード名称が表示されること</span>
    <field:code_pulldown
        title="optionColumnName属性ブランク"
        name="server.optional-name-blank"
        codeId="code1"
        labelPattern="$OPTIONALNAME$"
        optionColumnName="">
    </field:code_pulldown>
    <span class="test-case option-not-blank">optionColumnName属性を指定した場合、指定したオプション名称（OPTION03）に対応するコード名称が表示されること</span>
    <field:code_pulldown
        title="optionColumnName属性指定"
        name="server.optional-name"
        codeId="code1"
        labelPattern="$OPTIONALNAME$"
        optionColumnName="OPTION03">
    </field:code_pulldown>
  </field:block>

  <field:block title="labelPattern属性">
    <span class="test-case labelPattern-none">labelPattern属性を指定しなかった場合、デフォルトのコード名称（$NAME$）が表示されること</span>
    <field:code_pulldown
        title="labelPattern属性未指定"
        name="server.label-pattern-none"
        codeId="code1">
    </field:code_pulldown>
    <span class="test-case labelPattern-blank">labelPattern属性にブランクを指定した場合、デフォルトのコード名称（$NAME$）が表示されること</span>
    <field:code_pulldown
        title="labelPattern属性ブランク"
        name="server.label-pattern-blank"
        codeId="code1"
        labelPattern="">
    </field:code_pulldown>
    <span class="test-case labelPattern-not-blank">labelPattern属性を指定した場合、指定したプレースホルダ（$NAME$ - $SHORTNAME$ - $OPTIONALNAME$ - $VALUE$）に対応するコード名称が表示されること</span>
    <field:code_pulldown
        title="labelPattern属性指定"
        name="server.label-pattern"
        codeId="code1"
        labelPattern="$NAME$ - $SHORTNAME$ - $OPTIONALNAME$ - $VALUE$"
        optionColumnName="OPTION03">
    </field:code_pulldown>
  </field:block>

</field:block>

<button:block>
  <n:forInputPage>
    <button:check
        uri="./サーバ・クライアント共通テストページ(確認).jsp"
        dummyUri="サーバ・クライアント共通テストページ(確認).jsp">
    </button:check>
  </n:forInputPage>
  <n:forConfirmationPage>
    <button:back
        uri="./サーバ・クライアント共通テストケース.jsp"
        dummyUri="サーバ・クライアント共通テストケース.jsp">
    </button:back>
  </n:forConfirmationPage>
</button:block>
</n:form>

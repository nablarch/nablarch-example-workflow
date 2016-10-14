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

<field:block title="打鍵動作確認">
  <span class="test-case">ラベルをクリックすることでコード値チェックボックスを選択状態にできること</span>
  <field:code_checkbox
      title="ラベルをクリック！"
      name="server.label-click"
      listFormat="sp"
      codeId="code1"
      sample="値1|値2|[値3]">
  </field:code_checkbox>
</field:block>

<field:block title="required属性">
  <span class="test-case required-test">required属性を指定しない場合、必須マークが出力されないこと</span>
  <field:code_checkbox
      title="required未指定"
      name="server.required-none"
      listFormat="sp"
      codeId="code1"
      sample="値1|値2|[値3]">
  </field:code_checkbox>
  <span class="test-case required-test">required属性にブランクを指定した場合、必須マークが出力されないこと</span>
  <field:code_checkbox
      title="requiredブランク"
      name="server.required-blank"
      required=""
      codeId="code1"
      listFormat="sp"
      sample="値1|値2|[値3]">
  </field:code_checkbox>
  <span class="test-case required-test">required属性にfalseを指定した場合、必須マークが出力されないこと</span>
  <field:code_checkbox
      title="required[false]"
      name="server.required-false"
      required="false"
      listFormat="sp"
      codeId="code1"
      sample="値1|値2|[値3]">
  </field:code_checkbox>
  <span class="test-case required-test">required属性にtrueを指定した場合、入力画面では必須マークが出力されること（確認画面では表示されない）</span>
  <field:code_checkbox
      title="required[true](必須マークがタイトルの右側につくこと)"
      name="server.required-true"
      required="true"
      listFormat="sp"
      codeId="code1"
      sample="値1|値2|[値3]">
  </field:code_checkbox>
</field:block>

<field:block title="hint属性">
  <span class="test-case hint-test">hint属性を指定しない場合、hintは出力されないこと</span>
  <field:code_checkbox
      title="hint未指定"
      name="server.hint-none"
      listFormat="sp"
      codeId="code1"
      sample="値1|値2|[値3]">
  </field:code_checkbox>
  <span class="test-case hint-test">hint属性にブランクを指定した場合、hintは出力されないこと</span>
  <field:code_checkbox
      title="hintブランク"
      name="server.hint-blank"
      codeId="code1"
      listFormat="sp"
      sample="値1|値2|[値3]"
      hint="">
  </field:code_checkbox>
  <span class="test-case hint-test">hint属性を指定した場合、入力画面ではhintが出力されること（確認画面では表示されないこと）</span>
  <field:code_checkbox
      title="hint指定"
      name="server.hint-nonblank"
      codeId="code1"
      listFormat="sp"
      sample="値1|値2|[値3]"
      hint="ヒント">
  </field:code_checkbox>
  <span class="test-case viewonly">ラベルが折り返した場合でも、hint属性が入力エリアの直下に左揃えで出力されること。確認画面では出力されないこと。</span>
  <field:code_checkbox
      title="目的はエラー項目の位置までタイトルを表示することなので長いタイトル属性を設定する。"
      name="server.hint-nonblank"
      codeId="code1"
      listFormat="sp"
      sample="値1|値2|[値3]"
      hint="ヒント">
  </field:code_checkbox>
</field:block>

<field:block title="readonly属性">
  <span class="test-case readonly-test">readonly属性を指定しない場合、編集可能になること</span>
  <field:code_checkbox
      title="readonly未指定"
      codeId="code1"
      listFormat="sp"
      sample="値1|値2|[値3]"
      name="server.readonly-none">
  </field:code_checkbox>
  <span class="test-case readonly-test">readonly属性が空文字列の場合、編集可能になること</span>
  <field:code_checkbox
      title="readonlyブランク"
      name="server.readonly-blank"
      codeId="code1"
      listFormat="sp"
      sample="値1|値2|[値3]"
      readonly="">
  </field:code_checkbox>
  <span class="test-case readonly-test">readonly属性にtrueを指定した場合、編集不可になること(値は送信され確認画面にラベル表示されること)</span>
  <field:code_checkbox
      title="readonly[true]"
      name="server.readonly-true"
      codeId="code1"
      listFormat="sp"
      sample="値1|値2|[値3]"
      readonly="true">
  </field:code_checkbox>
  <span class="test-case readonly-test">readonly属性にfalseを指定した場合、編集可能になること</span>
  <field:code_checkbox
      title="readonly[false]"
      name="server.readonly-false"
      codeId="code1"
      listFormat="sp"
      sample="値1|値2|[値3]"
      readonly="false">
  </field:code_checkbox>
</field:block>

<field:block title="disabled属性">
  <span class="test-case disabled-test">disabled属性を指定しない場合、編集可能となりサーバに値が送信されること</span>
  <field:code_checkbox
      title="disabled未指定"
      codeId="code1"
      listFormat="sp"
      sample="値1|値2|[値3]"
      name="server.disabled-none">
  </field:code_checkbox>
  <span class="test-case disabled-test">disabled属性が空文字列の場合、編集可能となりサーバに値が送信されること</span>
  <field:code_checkbox
      title="disabledブランク"
      name="server.disabled-blank"
      codeId="code1"
      listFormat="sp"
      sample="値1|値2|[値3]"
      disabled="">
  </field:code_checkbox>
  <span class="test-case disabled-test">disabled属性にtrueを指定した場合、サーバに値が送信されないこと（確認画面に表示されないこと）</span>
  <field:code_checkbox
      title="disabled[true]"
      name="server.disabled-true"
      codeId="code1"
      listFormat="sp"
      sample="値1|値2|[値3]"
      disabled="true">
  </field:code_checkbox>
  <span class="test-case disabled-test">disabled属性にfalseを指定した場合、編集可能となりサーバに値が送信されること</span>
  <field:code_checkbox
      title="disabled[false]"
      name="server.disabled-false"
      codeId="code1"
      listFormat="sp"
      sample="値1|値2|[値3]"
      disabled="false">
  </field:code_checkbox>
</field:block>

<field:block title="cssClass属性">
  <span class="test-case cssClass-test">cssClass属性を指定しない場合、class属性がブランクとなること(ソースから確認)</span>
  <field:code_checkbox
      title="cssClass属性未指定"
      codeId="code1"
      listFormat="sp"
      sample="値1|値2|[値3]"
      name="server.cssClass-none">
  </field:code_checkbox>
  <span class="test-case cssClass-test">cssClass属性にブランクを指定した場合、class属性がブランクとなること(ソースから確認)</span>
  <field:code_checkbox
      title="cssClass属性ブランク"
      name="server.cssClass-blank"
      codeId="code1"
      listFormat="sp"
      sample="値1|値2|[値3]"
      cssClass="">
  </field:code_checkbox>
  <span class="test-case cssClass-test">cssClass属性を指定した場合、class属性に指定したcssClassが設定されること</span>
  <field:code_checkbox
      title="cssClass属性指定"
      name="server.cssClass-nonblank"
      codeId="code1"
      listFormat="sp"
      sample="値1|値2|[値3]"
      cssClass="cssClass-test">
  </field:code_checkbox>
</field:block>

<field:block title="sample属性">
  <span class="test-case sample-test">sample属性を指定しない場合、サーバ・クライアント共にcodeIdに指定されたコードのコード名称が出力されること</span>
  <field:code_checkbox
      title="sample属性未指定"
      required="true"
      codeId="code1"
      listFormat="sp"
      name="dummy">
  </field:code_checkbox>
  <span class="test-case sample-test">sample属性にブランクを指定した場合、サーバ・クライアント共にcodeIdに指定されたコードのコード名称が出力されること</span>
  <field:code_checkbox
      title="sample属性ブランク"
      required="true"
      codeId="code1"
      listFormat="sp"
      sample=""
      name="dummy">
  </field:code_checkbox>
  <span class="test-case sample-test">sample属性を指定した場合、クライアントではsample属性の値が出力され、[]で囲まれた値が選択状態となること。</span>
  <field:code_checkbox
      title="sample属性指定"
      required="true"
      sample="値1|値2|[値3]"
      codeId="code1"
      listFormat="sp"
      name="dummy">
  </field:code_checkbox>
  <span class="test-case sample-test">複数項目を[]で囲むと、囲まれた値が全て選択状態となること。</span>
  <field:code_checkbox
      title="sample属性指定"
      required="true"
      sample="値1|[値2]|[値3]"
      codeId="code1"
      listFormat="sp"
      name="dummy">
  </field:code_checkbox>
</field:block>

<field:block title="listFormat属性">
  <span class="test-case listFormat-test">listFormat属性を指定しない場合、span区切りのリスト表示となること</span>
  <field:code_checkbox
      title="listFormat属性未指定"
      required="true"
      codeId="code1"
      sample="[デフォルト区切り1]|[デフォルト区切り2]|[デフォルト区切り3]"
      name="server.listformat-none">
  </field:code_checkbox>
  <span class="test-case listFormat-test">listFormat属性にブランクを指定した場合、span区切りのリスト表示となること</span>
  <field:code_checkbox
      title="listFormat属性未指定"
      required="true"
      codeId="code1"
      sample="[デフォルト区切り1]|[デフォルト区切り2]|[デフォルト区切り3]"
      listFormat=""
      name="server.listformat-none">
  </field:code_checkbox>
  <span class="test-case listFormat-test">listFormat属性を指定した場合、指定したフォーマット（br）でのリスト表示となること</span>
  <field:code_checkbox
      title="listFormat属性指定(br)"
      required="true"
      codeId="code1"
      listFormat="br"
      sample="[br区切り1]|[br区切り2]|[br区切り3]"
      name="server.listformat">
  </field:code_checkbox>
  <span class="test-case listFormat-test">listFormat属性を指定した場合、指定したフォーマット（div）でのリスト表示となること</span>
  <field:code_checkbox
      title="listFormat属性指定(div)"
      required="true"
      codeId="code1"
      listFormat="div"
      sample="[div区切り1]|[div区切り2]|[div区切り3]"
      name="server.listformat-div">
  </field:code_checkbox>

  <span class="test-case listFormat-test">listFormat属性を指定した場合、指定したフォーマット（ul）でのリスト表示となること</span>
  <field:code_checkbox
      title="listFormat属性指定(ul)"
      required="true"
      codeId="code1"
      listFormat="ul"
      sample="[ul区切り1]|[ul区切り2]|[ul区切り3]"
      name="server.listformat-ul">
  </field:code_checkbox>

  <span class="test-case listFormat-test">listFormat属性を指定した場合、指定したフォーマット（ol）でのリスト表示となること</span>
  <field:code_checkbox
      title="listFormat属性指定(ol)"
      required="true"
      codeId="code1"
      listFormat="ol"
      sample="[ol区切り1]|[ol区切り2]|[ol区切り3]"
      name="server.listformat-ol">
  </field:code_checkbox>

  <span class="test-case listFormat-test">listFormat属性を指定した場合、指定したフォーマット（span）でのリスト表示となること</span>
  <field:code_checkbox
      title="listFormat属性指定(span)"
      required="true"
      codeId="code1"
      listFormat="span"
      sample="[span区切り1]|[span区切り2]|[span区切り3]"
      name="server.listformat-span">
  </field:code_checkbox>

  <span class="test-case listFormat-test">listFormat属性を指定した場合、指定したフォーマット（sp）でのリスト表示となること</span>
  <field:code_checkbox
      title="listFormat属性指定(sp)"
      required="true"
      codeId="code1"
      listFormat="sp"
      sample="[sp区切り1]|[sp区切り2]|[sp区切り3]"
      name="server.listformat-sp">
  </field:code_checkbox>
</field:block>

<field:block title="size属性のテスト">
  <span class="test-case size-test">
    size属性が未指定の場合、タイトル部と入力部ともにgrid-col関連のクラスが設定されないこと
  </span>
  <field:code_checkbox
      title="size属性未指定"
      required="true"
      codeId="code1"
      listFormat="sp"
      sample="[sp区切り1]|[sp区切り2]|[sp区切り3]"
      name="server.dummy">
  </field:code_checkbox>

  <span class="test-case size-test">
    size属性がブランクの場合、タイトル部と入力部ともにgrid-col関連のクラスが設定されないこと
  </span>
  <field:code_checkbox
      title="size属性ブランク"
      required="true"
      codeId="code1"
      listFormat="sp"
      sample="[sp区切り1]|[sp区切り2]|[sp区切り3]"
      name="server.dummy"
      titleSize=""
      inputSize="">
  </field:code_checkbox>

  <span class="test-case size-test">
    titleSizeとinputSizeをともに指定<br/>

    タイトル部(label)には、指定したグリッドサイズから「:」部のグリッド数が減算された値が設定されること
    入力部(div.field-contentには、指定したグリッド数がそのまま設定されること
  </span>

  <field:code_checkbox
      title="size属性指定"
      required="true"
      codeId="code1"
      listFormat="sp"
      sample="[sp区切り1]|[sp区切り2]|[sp区切り3]"
      name="server.dummy"
      titleSize="10"
      inputSize="12">
  </field:code_checkbox>

  <field:block title="pattern属性">
    <span class="test-case pattern-none">
      pattern属性を指定しなかった場合、PATTERN01に対応するコードが表示されること。<br/>
      ローカル表示でも、codeId属性に指定されたコードの名称がソート順に従ってソートされて表示されること。
    </span>
    <field:code_checkbox
        title="pattern属性未指定"
        name="server.pattern-none"
        codeId="code1"
        listFormat="br">
    </field:code_checkbox>
    <span class="test-case pattern-blank">pattern属性にブランクを指定した場合、PATTERN01に対応するコードが表示されること</span>
    <field:code_checkbox
        title="pattern属性未指定"
        name="server.pattern-blank"
        codeId="code1"
        pattern=""
        listFormat="br">
    </field:code_checkbox>
    <span class="test-case pattern-not-blank">pattern属性を指定した場合、指定したパターン（PATTERN02）に対応するコードが表示されること</span>
    <field:code_checkbox
        title="pattern属性指定"
        name="server.pattern-nonblank"
        codeId="code1"
        pattern="PATTERN02"
        listFormat="br">
    </field:code_checkbox>
  </field:block>

  <field:block title="optionColumnName属性">
    <span class="test-case option-none">optionColumnName属性を指定しなかった場合、OPTION01に対応するコード名称が表示されること</span>
    <field:code_checkbox
        title="optionColumnName属性未指定"
        name="server.optional-name-none"
        codeId="code1"
        labelPattern="$OPTIONALNAME$"
        listFormat="br">
    </field:code_checkbox>
    <span class="test-case option-blank">optionColumnName属性にブランクを指定した場合、OPTION01に対応するコード名称が表示されること</span>
    <field:code_checkbox
        title="optionColumnName属性ブランク"
        name="server.optional-name-blank"
        codeId="code1"
        labelPattern="$OPTIONALNAME$"
        listFormat="br"
        optionColumnName="">
    </field:code_checkbox>
    <span class="test-case option-not-blank">optionColumnName属性を指定した場合、指定したオプション名称（OPTION03）に対応するコード名称が表示されること</span>
    <field:code_checkbox
        title="optionColumnName属性指定"
        name="server.optional-name-nonblank"
        codeId="code1"
        labelPattern="$OPTIONALNAME$"
        listFormat="br"
        optionColumnName="OPTION03">
    </field:code_checkbox>
  </field:block>

  <field:block title="labelPattern属性">
    <span class="test-case labelPattern-none">labelPattern属性を指定しなかった場合、対応するコード名称が表示されること</span>
    <field:code_checkbox
        title="labelPattern属性未指定"
        name="server.label-pattern-none"
        codeId="code1"
        listFormat="br">
    </field:code_checkbox>
    <span class="test-case labelPattern-blank">labelPattern属性にブランクを指定した場合、対応するコード名称が表示されること</span>
    <field:code_checkbox
        title="labelPattern属性ブランク"
        name="server.label-pattern-blank"
        codeId="code1"
        listFormat="br"
        labelPattern="">
    </field:code_checkbox>
    <span class="test-case labelPattern-not-blank">labelPattern属性を指定した場合、指定したプレースホルダ（$NAME$ - $SHORTNAME$ - $OPTIONALNAME$ - $VALUE$）に対応するコード名称が表示されること</span>
    <field:code_checkbox
        title="labelPattern属性指定"
        name="server.label-pattern"
        codeId="code1"
        labelPattern="$NAME$ - $SHORTNAME$ - $OPTIONALNAME$ - $VALUE$"
        optionColumnName="OPTION03"
        listFormat="br">
    </field:code_checkbox>
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

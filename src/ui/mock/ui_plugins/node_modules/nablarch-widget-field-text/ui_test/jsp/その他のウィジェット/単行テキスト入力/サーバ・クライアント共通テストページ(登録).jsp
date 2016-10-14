<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<n:form>
<field:block title="required属性">
  <n:forInputPage>
    <input type="hidden" value="1" name="confirm">
  </n:forInputPage>
  <span class="test-case required-test">required属性を指定しない場合、必須マークが出力されないこと</span>
  <field:text
      title="required未指定"
      name="server.required-none"
      sample="１２３４５">
  </field:text>
  <span class="test-case required-test">required属性にブランクを指定した場合、必須マークが出力されないこと</span>
  <field:text
      title="requiredブランク"
      name="server.required-blank"
      required=""
      sample="あいうえお">
  </field:text>
  <span class="test-case required-test">required属性にfalseを指定した場合、必須マークが出力されないこと</span>
  <field:text
      title="required[false]"
      name="server.required-false"
      required="false"
      sample="abcdefg">
  </field:text>
  <span class="test-case required-test">required属性にtrueを指定した場合、入力画面では必須マークが出力されること（確認画面では表示されない）</span>
  <field:text
      title="required[true](必須マークがタイトルの右側につくこと)"
      name="server.required-true"
      required="true"
      sample="03-1234-1234">
  </field:text>
</field:block>

<field:block title="hint属性">
  <span class="test-case hint-test">hint属性を指定しない場合、hintは出力されないこと</span>
  <field:text
      title="hint未指定"
      name="server.hint-none">
  </field:text>
  <span class="test-case hint-test">hint属性にブランクを指定した場合、hintは出力されないこと</span>
  <field:text
      title="hintブランク"
      name="server.hint-blank"
      hint="">
  </field:text>
  <span class="test-case hint-test">入力画面では、hint属性に指定した値が出力されること。確認画面では出力されないこと。</span>
  <field:text
      title="hint指定"
      name="server.hint-nonblank"
      hint="ヒント">
  </field:text>
  <span class="test-case viewonly">ラベルが折り返した場合でも、hint属性が入力エリアの直下に左揃えで出力されること。確認画面では出力されないこと。</span>
  <field:text
      title="タイトル属性に長い文言を設定することで折り返す"
      name="server.hint-long-label"
      hint="ヒント">
  </field:text>
</field:block>

<field:block title="readonly属性">
  <span class="test-case readonly-test">readonly属性を指定しない場合、編集可能になること</span>
  <field:text
      title="readonly未指定"
      name="server.readonly-none">
  </field:text>
  <span class="test-case readonly-test">readonly属性が空文字列の場合、編集可能になること</span>
  <field:text
      title="readonlyブランク"
      name="server.readonly-blank"
      readonly="">
  </field:text>
  <span class="test-case readonly-test">readonly属性にtrueを指定した場合、編集不可になること(値は送信され確認画面にラベル表示されること)</span>
  <field:text
      title="readonly[true]"
      name="server.readonly-true"
      readonly="true">
  </field:text>
  <span class="test-case readonly-test">readonly属性にfalseを指定した場合、編集可能になること</span>
  <field:text
      title="readonly[false]"
      name="server.readonly-false"
      readonly="false">
  </field:text>
</field:block>

<field:block title="disabled属性">
  <span class="test-case disabled-test">disabled属性を指定しない場合、編集可能となりサーバに値が送信されること</span>
  <field:text
      title="disabled未指定"
      name="server.disabled-none">
  </field:text>
  <span class="test-case disabled-test">disabled属性が空文字列の場合、編集可能となりサーバに値が送信されること</span>
  <field:text
      title="disabledブランク"
      name="server.disabled-blank"
      disabled="">
  </field:text>
  <span class="test-case disabled-test">disabled属性にtrueを指定した場合、サーバに値が送信されないこと（確認画面に表示されないこと）</span>
  <field:text
      title="disabled[true]"
      name="server.disabled-true"
      disabled="true">
  </field:text>
  <span class="test-case disabled-test">disabled属性にfalseを指定した場合、編集可能となりサーバに値が送信されること</span>
  <field:text
      title="disabled[false]"
      name="server.disabled-false"
      disabled="false">
  </field:text>
</field:block>
<field:block title="id属性">
  <span class="test-case id-test">id属性を指定しない場合、name属性がid属性に設定されること</span>
  <field:text
      title="id属性未指定"
      name="server.id-none">
  </field:text>
  <span class="test-case id-test">id属性が空文字列の場合、name属性がid属性に設定されること</span>
  <field:text
      title="id属性ブランク"
      name="server.id-blank"
      id="">
  </field:text>
  <span class="test-case id-test">id属性を指定した場合、そのidがid属性に設定されること</span>
  <field:text
      title="id属性指定"
      name="server.id-nonblank"
      id="test-id">
  </field:text>
</field:block>

<field:block title="cssClass属性">
  <span class="test-case cssClass-test">cssClass属性を指定しない場合、class属性がブランクとなること(ソースから確認)</span>
  <field:text
      title="cssClass属性未指定"
      name="server.cssClass-none">
  </field:text>
  <span class="test-case cssClass-test">cssClass属性にブランクを指定した場合、class属性がブランクとなること(ソースから確認)</span>
  <field:text
      title="cssClass属性ブランク"
      name="server.cssClass-blank"
      cssClass="">
  </field:text>
  <span class="test-case cssClass-test">cssClass属性を指定した場合、class属性に指定したcssClassが設定されること</span>
  <field:text
      title="cssClass属性指定"
      name="server.cssClass-nonblank"
      cssClass="cssClass-test">
  </field:text>
</field:block>

<field:block title="maxlength属性">
  <span class="test-case maxlength-test">maxlength属性を指定しない場合、maxlength属性が出力されないこと(ソースから確認）</span>
  <field:text
      title="maxlength属性未指定"
      name="server.maxlength-none">
  </field:text>
  <span class="test-case maxlength-test">maxlength属性にブランクを指定した場合、maxlength属性が出力されないこと(ソースから確認）</span>
  <field:text
      title="maxlength属性ブランク"
      name="server.maxlength-blank"
      maxlength="">
  </field:text>
  <span class="test-case maxlength-test">maxlength属性を指定した場合、maxlength属性に指定した値が設定されること</span>
  <field:text
      title="maxlength属性指定"
      name="server.maxlength-nonblank"
      maxlength="5">
  </field:text>
</field:block>

<field:block title="example属性">
  <span class="test-case example-test">example属性を指定しない場合、プレースホルダとして何も表示されないこと</span>
  <field:text
      title="example属性未指定"
      name="server.example-none">
  </field:text>
  <span class="test-case example-test">example属性にブランクを指定した場合、プレースホルダとして何も表示されないこと</span>
  <field:text
      title="example属性ブランク"
      name="server.example-blank"
      example="">
  </field:text>
  <span class="test-case example-test">example属性を指定した場合、プレースホルダとしてその値が表示されること</span>
  <field:text
      title="example属性指定"
      name="server.example-nonblank"
      example="サンプル">
  </field:text>
</field:block>

<field:block title="valueFormat属性">
  <span class="test-case valueFormat-test">valueFormat属性を指定しない場合、フォーマットされずに値が出力されること</span>
  <field:text
      title="valueFormat属性未指定"
      name="server.valueFormat-none">
  </field:text>
  <span class="test-case valueFormat-test">valueFormat属性にブランクを指定した場合、フォーマットされずに値が出力されること</span>
  <field:text
      title="valueFormat属性ブランク"
      name="server.valueFormat-blank"
      valueFormat="">
  </field:text>
  <span class="test-case valueFormat-test">valueFormat属性を指定した場合、そのフォーマットに従い値がフォーマットされて出力されること</span>
  <field:text
      title="valueFormat属性指定"
      name="server.valueFormat-nonblank"
      maxlength="11"
      valueFormat="yyyymmdd{yyyy年MM月dd日}"
      hint="format解除後確認画面に遷移しても再フォーマットされること">
  </field:text>
</field:block>

<field:block title="sample属性">
  <span class="test-case sample-test">sample属性を指定しない場合、サーバ・クライアント共にサンプル値が出力されないこと</span>
  <field:text
      title="sample属性未指定"
      maxlength="10"
      required="true"
      example="sample"
      name="dummy">
  </field:text>
  <span class="test-case sample-test">sample属性にブランクを指定した場合、サーバ・クライアント共にサンプル値が出力されないこと</span>
  <field:text
      title="sample属性ブランク"
      maxlength="10"
      required="true"
      example="sample"
      sample=""
      name="dummy">
  </field:text>
  <span class="test-case sample-test">sample属性を指定した場合、クライアントではサンプル値が出力されること</span>
  <field:text
      title="sample属性指定"
      maxlength="10"
      required="true"
      example="sample"
      sample="サンプル値"
      name="dummy">
  </field:text>
</field:block>
<field:block title="unit属性のテスト">

  <span class="test-case unit-test">unit属性を指定しない場合、テキストボックスの右側に単位は出力されないこと</span>
  <field:text
      title="unit属性指定なし"
      name="server.unit_none"
      sample="1">
  </field:text>

  <span class="test-case unit-test">unit属性にブランクを指定した場合、テキストボックスの右側に単位は出力されないこと</span>
  <field:text
      title="unit属性ブランク指定"
      name="server.unit_blank"
      sample="10">
  </field:text>

  <span class="test-case unit-test">
    unit属性を指定した場合、その値がテキストボックスの右側に出力されること<br/>
    <br/>
    ※valueFormatおよびmaxlengthの指定はなし
  </span>
  <field:text
      title="unit属性指定"
      name="server.unit1"
      unit="円"
      sample="100">
  </field:text>

  <span class="test-case unit-test">
    unit属性を指定した場合、その値がテキストボックスの右側に出力されること<br/>
    <br/>
    ※valueFormat属性も同時に指定
  </span>
  <field:text
      title="unit属性指定"
      name="server.unit2"
      valueFormat="decimal{###,###}"
      unit="千円"
      sample="1000">
  </field:text>

  <span class="test-case unit-test">
    unit属性を指定した場合、その値がテキストボックスの右側に出力されること<br/>
    <br/>
    ※maxlength属性も同時に指定
  </span>
  <field:text
      title="unit属性指定"
      name="server.unit3"
      maxlength="10"
      unit="万円"
      sample="10000">
  </field:text>

  <span class="test-case unit-test">
    unit属性を指定した場合、その値がテキストボックスの右側に出力されること<br/>
    <br/>
    ※valueFormatとmaxlength属性も同時に指定
  </span>
  <field:text
      title="unit属性指定"
      name="server.unit4"
      maxlength="10"
      valueFormat="decimal{###,###}"
      unit="百万円"
    sample="100000">
  </field:text>

  <span class="test-case unit-test">
    unit属性を指定した場合でも、値が未入力の場合確認画面で単位は出力されないこと
  </span>
  <field:text
      title="unit属性指定"
      name="server.unit_value_empty"
      maxlength="10"
      unit="万円">
  </field:text>
</field:block>

<field:block title="titleSize及びinputSizeのテスト">
  <span class="test-case size-test">
    titleSizeとinputSizeはともに未指定
  </span>
  <field:text
      title="サイズは未指定"
      name="server.size-none">
  </field:text>

  <span class="test-case size-test">
    titleSizeとinputSizeともにブランク指定
  </span>
  <field:text
      title="サイズはブランク指定"
      name="server.size-empty"
      titleSize=""
      inputSize="">
  </field:text>

  <span class="test-case size-test">
    titleSizeとinputSizeをともに指定<br/>

    タイトル部(label)には、指定したグリッドサイズから「:」部のグリッド数が減算された値が設定されること
    入力部(div.field-contentには、指定したグリッド数がそのまま設定されること
  </span>
  <field:text
      title="サイズを指定"
      name="server.size"
      titleSize="15"
      inputSize="20">
  </field:text>
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

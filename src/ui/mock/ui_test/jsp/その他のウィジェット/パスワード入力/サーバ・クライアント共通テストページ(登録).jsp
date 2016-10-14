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

<field:block title="マスキング">
  <span class="test-case masking-test">
    入力画面でパスワード入力欄に入力された文字はマスキングされること。<br>
    確認画面では、パスワードがマスキングされて表示されること。
  </span>
  <field:password
      title="マスキング確認"
      name="server.mask"
      maxlength="10"
      sample="password">
  </field:password>
</field:block>
<field:block title="required属性">
  <span class="test-case required-test">required属性を指定しない場合、必須マークが出力されないこと</span>
  <field:password
      title="required未指定"
      name="server.required-none"
      sample="１２３４５">
  </field:password>
  <span class="test-case required-test">required属性にブランクを指定した場合、必須マークが出力されないこと</span>
  <field:password
      title="requiredブランク"
      name="server.required-blank"
      required=""
      sample="あいうえお">
  </field:password>
  <span class="test-case required-test">required属性にfalseを指定した場合、必須マークが出力されないこと</span>
  <field:password
      title="required[false]"
      name="server.required-false"
      required="false"
      sample="abcdefg">
  </field:password>
  <span class="test-case required-test">required属性にtrueを指定した場合、入力画面では必須マークが出力されること（確認画面では表示されない）</span>
  <field:password
      title="required[true](必須マークがタイトルの右側につくこと)"
      name="server.required-true"
      required="true"
      sample="03-1234-1234">
  </field:password>
</field:block>

<field:block title="hint属性">
  <span class="test-case hint-test">hint属性を指定しない場合、hintは出力されないこと</span>
  <field:password
      title="hint未指定"
      name="server.hint-none">
  </field:password>
  <span class="test-case hint-test">hint属性にブランクを指定した場合、hintは出力されないこと</span>
  <field:password
      title="hintブランク"
      name="server.hint-blank"
      hint="">
  </field:password>
  <span class="test-case hint-test">入力画面では、hint属性に指定した値が出力されること。確認画面では出力されないこと。</span>
  <field:password
      title="hint指定"
      name="server.hint-nonblank"
      hint="ヒント">
  </field:password>
  <span class="test-case viewonly">ラベルが折り返した場合でも、hint属性が入力エリアの直下に左揃えで出力されること。確認画面では出力されないこと。</span>
  <field:password
      title="タイトル属性に長い文言を設定することで折り返す"
      name="server.hint-nonblank"
      hint="ヒント">
  </field:password>
</field:block>

<field:block title="readonly属性">
  <span class="test-case readonly-test">readonly属性を指定しない場合、編集可能になること</span>
  <field:password
      title="readonly未指定"
      maxlength="10"
      name="server.readonly-none">
  </field:password>
  <span class="test-case readonly-test">readonly属性が空文字列の場合、編集可能になること</span>
  <field:password
      title="readonlyブランク"
      maxlength="10"
      name="server.readonly-blank"
      readonly="">
  </field:password>
  <span class="test-case readonly-test">readonly属性にtrueを指定した場合、編集不可になること</span>
  <field:password
      title="readonly[true]"
      maxlength="10"
      name="server.readonly-true"
      readonly="true">
  </field:password>
  <span class="test-case readonly-test">readonly属性にfalseを指定した場合、編集可能になること</span>
  <field:password
      title="readonly[false]"
      maxlength="10"
      name="server.readonly-false"
      readonly="false">
  </field:password>
</field:block>

<field:block title="disabled属性">
  <span class="test-case disabled-test">disabled属性を指定しない場合、編集可能となりサーバに値が送信されること</span>
  <field:password
      title="disabled未指定"
      maxlength="10"
      name="server.disabled-none">
  </field:password>
  <span class="test-case disabled-test">disabled属性が空文字列の場合、編集可能となりサーバに値が送信されること</span>
  <field:password
      title="disabledブランク"
      maxlength="10"
      name="server.disabled-blank"
      disabled="">
  </field:password>
  <span class="test-case disabled-test">disabled属性にtrueを指定した場合、編集不可となっていること。</span>
  <field:password
      title="disabled[true]"
      maxlength="10"
      name="server.disabled-true"
      disabled="true">
  </field:password>
  <span class="test-case disabled-test">disabled属性にfalseを指定した場合、編集可能となりサーバに値が送信されること</span>
  <field:password
      title="disabled[false]"
      maxlength="10"
      name="server.disabled-false"
      disabled="false">
  </field:password>

  <field:block title="id属性">
    <span class="test-case id-test">id属性を指定しない場合、name属性がid属性に設定されること</span>
    <field:password
        title="id属性未指定"
        name="server.id-none">
    </field:password>
    <span class="test-case id-test">id属性が空文字列の場合、name属性がid属性に設定されること</span>
    <field:password
        title="id属性ブランク"
        name="server.id-blank"
        id="">
    </field:password>
    <span class="test-case id-test">id属性を指定した場合、そのidがid属性に設定されること</span>
    <field:password
        title="id属性指定"
        name="server.id-nonblank"
        id="test-id">
    </field:password>
  </field:block>

  <field:block title="cssClass属性">
    <span class="test-case cssClass-test">cssClass属性を指定しない場合、class属性がブランクとなること(ソースから確認)</span>
    <field:password
        title="cssClass属性未指定"
        name="server.cssClass-none">
    </field:password>
    <span class="test-case cssClass-test">cssClass属性にブランクを指定した場合、class属性がブランクとなること(ソースから確認)</span>
    <field:password
        title="cssClass属性ブランク"
        name="server.cssClass-blank"
        cssClass="">
    </field:password>
    <span class="test-case cssClass-test">cssClass属性を指定した場合、class属性に指定したcssClassが設定されること</span>
    <field:password
        title="cssClass属性指定"
        name="server.cssClass-nonblank"
        cssClass="cssClass-test">
    </field:password>
  </field:block>

  <field:block title="maxlength属性">
    <span class="test-case maxlength-test">maxlength属性を指定しない場合、maxlength属性が出力されないこと(ソースから確認）</span>
    <field:password
        title="maxlength属性未指定"
        name="server.maxlength-none">
    </field:password>
    <span class="test-case maxlength-test">maxlength属性にブランクを指定した場合、maxlength属性が出力されないこと(ソースから確認）</span>
    <field:password
        title="maxlength属性ブランク"
        name="server.maxlength-blank"
        maxlength="">
    </field:password>
    <span class="test-case maxlength-test">maxlength属性を指定した場合、maxlength属性に指定した値(「5])が設定されること</span>
    <field:password
        title="maxlength属性指定"
        name="server.maxlength-nonblank"
        maxlength="5">
    </field:password>
  </field:block>

  <field:block title="example属性">
    <span class="test-case example-test">example属性を指定しない場合、プレースホルダとして何も表示されないこと</span>
    <field:password
        title="example属性未指定"
        name="server.example-none">
    </field:password>
    <span class="test-case example-test">example属性にブランクを指定した場合、プレースホルダとして何も表示されないこと</span>
    <field:password
        title="example属性ブランク"
        name="server.example-blank"
        example="">
    </field:password>
    <span class="test-case example-test">example属性を指定した場合、プレースホルダとしてその値が表示されること（placeholderに対応していないブラウザを除く）</span>
    <field:password
        title="example属性指定"
        name="server.example-nonblank"
        example="サンプル">
    </field:password>
  </field:block>

  <field:block title="sample属性">
    <span class="test-case sample-test">sample属性を指定しない場合、サーバ・クライアント共にサンプル値が出力されないこと</span>
    <field:password
        title="sample属性未指定"
        maxlength="10"
        required="true"
        example="sample"
        name="dummy">
    </field:password>
    <span class="test-case sample-test">sample属性にブランクを指定した場合、サーバ・クライアント共にサンプル値が出力されないこと</span>
    <field:password
        title="sample属性ブランク"
        maxlength="10"
        required="true"
        example="sample"
        sample=""
        name="dummy">
    </field:password>
    <span class="test-case sample-test">sample属性を指定した場合、クライアントではサンプル値がマスキングされて出力されること</span>
    <field:password
        title="sample属性指定"
        maxlength="10"
        required="true"
        example="sample"
        sample="サンプル値"
        name="dummy">
    </field:password>
  </field:block>
</field:block>

<field:block title="size属性">
  <span class="test-case size-test">
    size属性が未指定の場合、タイトル部と入力部ともにgrid-col関連のクラスが設定されないこと
  </span>
  <field:password
      title="size属性未指定"
      maxlength="10"
      required="true"
      example="sample"
      sample="sample"
      name="dummy">
  </field:password>

  <span class="test-case size-test">
    size属性がブランクの場合、タイトル部と入力部ともにgrid-col関連のクラスが設定されないこと
  </span>
  <field:password
      title="size属性ブランク指定"
      maxlength="10"
      required="true"
      example="sample"
      sample="sample"
      name="dummy"
      titleSize=""
      inputSize="">
  </field:password>

  <span class="test-case size-test">
    titleSizeとinputSizeをともに指定<br/>

    タイトル部(label)には、指定したグリッドサイズから「:」部のグリッド数が減算された値が設定されること
    入力部(div.field-contentには、指定したグリッド数がそのまま設定されること
  </span>
  <field:password
      title="size属性指定"
      maxlength="10"
      required="true"
      example="sample"
      sample="sample"
      name="dummy"
      titleSize="10"
      inputSize="12">
  </field:password>
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
